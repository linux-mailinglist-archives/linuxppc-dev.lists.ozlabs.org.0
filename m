Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E097622B167
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 16:32:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCFD769fHzDrRP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 00:32:39 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=aZZsczyB; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZZsczyB; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCF8B3lrGzDrPq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 00:29:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595514551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjWrHb3Ks2HmLwSk4IBKGBOeRlTKPDTsa4ryyXU2kGA=;
 b=aZZsczyB1qLsbJaDrIbQLsAqW8JmW5YCkCHMWHnHJoobAmgRkCYH6Oz/0whDbf3rQxbE5G
 tQaWF3xdURFyYhXsmwVI5SDALg+0JEtkDCCW0TfNSSQs+4fzA4ilZzwgTNu9MS6DnuOzr+
 SJXPluRN/nxF6JkgOgJnuzUtqSQchLg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595514551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjWrHb3Ks2HmLwSk4IBKGBOeRlTKPDTsa4ryyXU2kGA=;
 b=aZZsczyB1qLsbJaDrIbQLsAqW8JmW5YCkCHMWHnHJoobAmgRkCYH6Oz/0whDbf3rQxbE5G
 tQaWF3xdURFyYhXsmwVI5SDALg+0JEtkDCCW0TfNSSQs+4fzA4ilZzwgTNu9MS6DnuOzr+
 SJXPluRN/nxF6JkgOgJnuzUtqSQchLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-WWW-soEHN2WBpuXa82lQDw-1; Thu, 23 Jul 2020 10:29:08 -0400
X-MC-Unique: WWW-soEHN2WBpuXa82lQDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F11818C63C6;
 Thu, 23 Jul 2020 14:29:06 +0000 (UTC)
Received: from llong.remote.csb (ovpn-119-128.rdu2.redhat.com [10.10.119.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FEA15FC3B;
 Thu, 23 Jul 2020 14:29:05 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <1595327263.lk78cqolxm.astroid@bobo.none>
 <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
 <1595510571.u39qfc8d1o.astroid@bobo.none>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <af825bce-ecf3-66e4-ad63-a844dbd2e775@redhat.com>
Date: Thu, 23 Jul 2020 10:29:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1595510571.u39qfc8d1o.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/23/20 9:30 AM, Nicholas Piggin wrote:
>> I would prefer to extract out the pending bit handling code out into a
>> separate helper function which can be overridden by the arch code
>> instead of breaking the slowpath into 2 pieces.
> You mean have the arch provide a queued_spin_lock_slowpath_pending
> function that the slow path calls?
>
> I would actually prefer the pending handling can be made inline in
> the queued_spin_lock function, especially with out-of-line locks it
> makes sense to put it there.
>
> We could ifdef out queued_spin_lock_slowpath_queue if it's not used,
> then __queued_spin_lock_slowpath_queue would be inlined into the
> caller so there would be no split?

The pending code is an optimization for lightly contended locks. That is 
why I think it is appropriate to extract it into a helper function and 
mark it as such.

You can certainly put the code in the arch's spin_lock code, you just 
has to override the generic pending code by a null function.

Cheers,
Longman

