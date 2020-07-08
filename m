Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 702BD2194B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 01:54:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2GPZ2s76zDqsW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 09:54:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SKHrlWlH; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z9KU3zov; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2GMt68bmzDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 09:53:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594252391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMGK9tA8COwKvD1fQVNRk+JUOzHjOS5PJXHcnsRB2BQ=;
 b=SKHrlWlH984dyhbCGMTufwDsVV0n+ooPpmI4FMVk6tXovQmE2JHH4ax8AYDyDng3+gluqc
 off88dSwLAuZlzp1BC40rjN5Hih/PNUHZFwbKW4WbiQi3B+tefJ/YixhTqu5KVu0122S31
 zil26rBlPOttu6Etn3Y75M3MNfu4JSE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594252392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMGK9tA8COwKvD1fQVNRk+JUOzHjOS5PJXHcnsRB2BQ=;
 b=Z9KU3zovTYCTfHlzhHGTscdQEybWoz3LF0b4CVzqjR88yJda4jrOWQhZS3Gu0Jwlkz/feL
 Yq3i3jNM+Xs09sh8zjvMQJG8Jh0843gPlV2x59INhjZNdUMpS9/S7ttxSLjQSOy8ZEEidB
 u5nQZ23MDPPwOvlrRgVG/tMopufwAek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-PttZH5YuNPOhfnms_liwDg-1; Wed, 08 Jul 2020 19:53:08 -0400
X-MC-Unique: PttZH5YuNPOhfnms_liwDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B6F1082;
 Wed,  8 Jul 2020 23:53:06 +0000 (UTC)
Received: from llong.remote.csb (ovpn-116-205.rdu2.redhat.com [10.10.116.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6637F8A4;
 Wed,  8 Jul 2020 23:53:04 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
 <20200708083210.GD597537@hirez.programming.kicks-ass.net>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <72f7df33-ab58-2e58-7981-cf02b6638c5b@redhat.com>
Date: Wed, 8 Jul 2020 19:53:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200708083210.GD597537@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/8/20 4:32 AM, Peter Zijlstra wrote:
> On Tue, Jul 07, 2020 at 11:33:45PM -0400, Waiman Long wrote:
>>  From 5d7941a498935fb225b2c7a3108cbf590114c3db Mon Sep 17 00:00:00 2001
>> From: Waiman Long <longman@redhat.com>
>> Date: Tue, 7 Jul 2020 22:29:16 -0400
>> Subject: [PATCH 2/9] locking/pvqspinlock: Introduce
>>   CONFIG_PARAVIRT_QSPINLOCKS_LITE
>>
>> Add a new PARAVIRT_QSPINLOCKS_LITE config option that allows
>> architectures to use the PV qspinlock code without the need to use or
>> implement a pv_kick() function, thus eliminating the atomic unlock
>> overhead. The non-atomic queued_spin_unlock() can be used instead.
>> The pv_wait() function will still be needed, but it can be a dummy
>> function.
>>
>> With that option set, the hybrid PV queued/unfair locking code should
>> still be able to make it performant enough in a paravirtualized
> How is this supposed to work? If there is no kick, you have no control
> over who wakes up and fairness goes out the window entirely.
>
> You don't even begin to explain...
>
I don't have a full understanding of how the PPC hypervisor work myself. 
Apparently, a cpu kick may not be needed.

This is just a test patch to see if it yields better result. It is 
subjected to further modifcation.

Cheers,
Longman

