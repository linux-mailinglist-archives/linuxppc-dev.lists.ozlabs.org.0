Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366F22B915
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 00:01:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCR9T52CVzDrfJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 08:01:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SDqTC81G; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SDqTC81G; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCR741JGJzDrK5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 07:58:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595541532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3T05BblW5qcrnE9EzvsH5COWPH3G8n5S+3dyvDj4j8=;
 b=SDqTC81GNcPZ44vKLAlYZJdE6NGWxCHtbQrn3KgfYiafGtnssxGH7vJC35duf8iiYU80fo
 kNnqqqkkf8XrwARrYbQiJeZcei2a0DahWMTCnpIIGUjQkr0edvRKgPyGVo/VcA5D7geKTf
 5tpIvIf/jJoeLZNxRJA19ppptc9G7hY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595541532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3T05BblW5qcrnE9EzvsH5COWPH3G8n5S+3dyvDj4j8=;
 b=SDqTC81GNcPZ44vKLAlYZJdE6NGWxCHtbQrn3KgfYiafGtnssxGH7vJC35duf8iiYU80fo
 kNnqqqkkf8XrwARrYbQiJeZcei2a0DahWMTCnpIIGUjQkr0edvRKgPyGVo/VcA5D7geKTf
 5tpIvIf/jJoeLZNxRJA19ppptc9G7hY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-1wwkHWrOOpOP_vwI3YSGQw-1; Thu, 23 Jul 2020 17:58:47 -0400
X-MC-Unique: 1wwkHWrOOpOP_vwI3YSGQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6195D80183C;
 Thu, 23 Jul 2020 21:58:45 +0000 (UTC)
Received: from llong.remote.csb (ovpn-119-128.rdu2.redhat.com [10.10.119.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6E245C1D3;
 Thu, 23 Jul 2020 21:58:43 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: peterz@infradead.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <6d6279ad-7432-63c1-14c3-18c4cff30bf8@redhat.com>
 <20200723195855.GU119549@hirez.programming.kicks-ass.net>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <4fbe47a5-dbc9-427a-5b21-b31b37bc751a@redhat.com>
Date: Thu, 23 Jul 2020 17:58:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200723195855.GU119549@hirez.programming.kicks-ass.net>
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
Cc: linux-arch@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/23/20 3:58 PM, peterz@infradead.org wrote:
> On Thu, Jul 23, 2020 at 03:04:13PM -0400, Waiman Long wrote:
>> On 7/23/20 2:47 PM, peterz@infradead.org wrote:
>>> On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
>>>> BTW, do you have any comment on my v2 lock holder cpu info qspinlock patch?
>>>> I will have to update the patch to fix the reported 0-day test problem, but
>>>> I want to collect other feedback before sending out v3.
>>> I want to say I hate it all, it adds instructions to a path we spend an
>>> aweful lot of time optimizing without really getting anything back for
>>> it.
>> It does add some extra instruction that may slow it down slightly, but I
>> don't agree that it gives nothing back. The cpu lock holder information can
>> be useful in analyzing crash dumps and in some debugging situation. I think
>> it can be useful in RHEL for this readon. How about an x86 config option to
>> allow distros to decide if they want to have it enabled? I will make sure
>> that it will have no performance degradation if the option is not enabled.
> Config knobs suck too; they create a maintenance burden (we get to make
> sure all the permutations works/build/etc..) and effectively nobody uses
> them, since world+dog uses what distros pick.
>
> Anyway, instead of adding a second per-cpu variable, can you see how
> horrible something like this is:
>
> unsigned char adds(unsigned char var, unsigned char val)
> {
> 	unsigned short sat = 0xff, tmp = var;
>
> 	asm ("addb	%[val], %b[var];"
> 	     "cmovc	%[sat], %[var];"
> 	     : [var] "+r" (tmp)
> 	     : [val] "ir" (val), [sat] "r" (sat)
> 	     );
>
> 	return tmp;
> }
>
> Another thing to try is, instead of threading that lockval throughout
> the thing, simply:
>
> #define _Q_LOCKED_VAL	this_cpu_read_stable(cpu_sat)
>
> or combined with the above
>
> #define _Q_LOCKED_VAL	adds(this_cpu_read_stable(cpu_number), 2)
>
> and see if the compiler really makes a mess of things.
>
Thanks for the suggestion. I will try that out.

Cheers,
Longman

