Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2957213081
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 02:38:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ybfF6qPyzDrC7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 10:37:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KwYbdzMu; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KwYbdzMu; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ybcQ073xzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 10:36:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593736576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H02gDnpUqaBFoqy+Gmqb6/mcQ7fzguEDru28MyLbZRk=;
 b=KwYbdzMuHfGThnJk3mZIZlUbBPa3hOlm+GJYHwyvg4yzkPHC8matSJ0yJW2Wkxj0NDVd2q
 wVOMfmBThh8p2MhrwKt2xBq6YJe8gj4Rwns/s/YXfJoON/oVC/at/+gyiP3Cs+q4glm1kC
 OSsIQv27Y+lXngD38ONetuj7dihTnOo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593736576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H02gDnpUqaBFoqy+Gmqb6/mcQ7fzguEDru28MyLbZRk=;
 b=KwYbdzMuHfGThnJk3mZIZlUbBPa3hOlm+GJYHwyvg4yzkPHC8matSJ0yJW2Wkxj0NDVd2q
 wVOMfmBThh8p2MhrwKt2xBq6YJe8gj4Rwns/s/YXfJoON/oVC/at/+gyiP3Cs+q4glm1kC
 OSsIQv27Y+lXngD38ONetuj7dihTnOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-GreJcrfjNq-bNoQeshMd9Q-1; Thu, 02 Jul 2020 20:36:11 -0400
X-MC-Unique: GreJcrfjNq-bNoQeshMd9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9851D1009616;
 Fri,  3 Jul 2020 00:36:09 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-121.rdu2.redhat.com [10.10.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EAD779256;
 Fri,  3 Jul 2020 00:36:07 +0000 (UTC)
Subject: Re: [PATCH 6/8] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200702074839.1057733-7-npiggin@gmail.com>
 <202007030059.nT5quxzB%lkp@intel.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <3730577a-1e14-0e3e-7f7b-0c6cb68fb1f2@redhat.com>
Date: Thu, 2 Jul 2020 20:36:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <202007030059.nT5quxzB%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/2/20 12:15 PM, kernel test robot wrote:
> Hi Nicholas,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on tip/locking/core v5.8-rc3 next-20200702]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-queued-spinlocks-and-rwlocks/20200702-155158
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     kernel/locking/lock_events.c:61:16: warning: no previous prototype for 'lockevent_read' [-Wmissing-prototypes]
>        61 | ssize_t __weak lockevent_read(struct file *file, char __user *user_buf,
>           |                ^~~~~~~~~~~~~~
>     kernel/locking/lock_events.c: In function 'skip_lockevent':
>>> kernel/locking/lock_events.c:126:12: error: implicit declaration of function 'pv_is_native_spin_unlock' [-Werror=implicit-function-declaration]
>       126 |   pv_on = !pv_is_native_spin_unlock();
>           |            ^~~~~~~~~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
>
> vim +/pv_is_native_spin_unlock +126 kernel/locking/lock_events.c

I think you will need to add the following into 
arch/powerpc/include/asm/qspinlock_paravirt.h:

static inline pv_is_native_spin_unlock(void)
{
     return !is_shared_processor();
}

Cheers,
Longman

