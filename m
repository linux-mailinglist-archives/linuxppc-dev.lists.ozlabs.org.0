Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC622B5C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 20:35:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCLbv1nXTzDrRd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 04:35:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RX2R9Pqj; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RX2R9Pqj; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCLYD70DxzDrQx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 04:32:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595529163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKozQ0KnMZ6/jFMcku3oZ38jLyvLbmaFhh4u3SNBWFc=;
 b=RX2R9PqjrX1zilcg/rv5ZtXP9S82wn7dZs+EEA3+C8yM9PChG4fqNRrH2DdGKSd/s8iLFV
 suVhObAwBv8I3mYu0INs/Awhwig0jXUQzWuFmisJ19h9zqC1EfwguPdZL1HaNdgW8zzpHk
 6PJgdd/m/W1AuhSKi8R1ciPY+Cs68pc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595529163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKozQ0KnMZ6/jFMcku3oZ38jLyvLbmaFhh4u3SNBWFc=;
 b=RX2R9PqjrX1zilcg/rv5ZtXP9S82wn7dZs+EEA3+C8yM9PChG4fqNRrH2DdGKSd/s8iLFV
 suVhObAwBv8I3mYu0INs/Awhwig0jXUQzWuFmisJ19h9zqC1EfwguPdZL1HaNdgW8zzpHk
 6PJgdd/m/W1AuhSKi8R1ciPY+Cs68pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-a7YRzGORP6i5sZOBhCiJ6Q-1; Thu, 23 Jul 2020 14:32:40 -0400
X-MC-Unique: a7YRzGORP6i5sZOBhCiJ6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A501005510;
 Thu, 23 Jul 2020 18:32:38 +0000 (UTC)
Received: from llong.remote.csb (ovpn-119-128.rdu2.redhat.com [10.10.119.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 209FA19D7E;
 Thu, 23 Jul 2020 18:32:37 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <845de183-56f5-2958-3159-faa131d46401@redhat.com>
Date: Thu, 23 Jul 2020 14:32:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200723140011.GR5523@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On 7/23/20 10:00 AM, Peter Zijlstra wrote:
> On Thu, Jul 09, 2020 at 12:06:13PM -0400, Waiman Long wrote:
>> We don't really need to do a pv_spinlocks_init() if pv_kick() isn't
>> supported.
> Waiman, if you cannot explain how not having kick is a sane thing, what
> are you saying here?
>
The current PPC paravirt spinlock code doesn't do any cpu kick. It does 
an equivalence of pv_wait by yielding the cpu to the lock holder only. 
The pv_spinlocks_init() is for setting up the hash table for doing 
pv_kick. If we don't need to do pv_kick, we don't need the hash table.

I am not saying that pv_kick is not needed for the PPC environment. I 
was just trying to adapt the pvqspinlock code to such an environment 
first. Further investigation on how to implement some kind of pv_kick 
will be something that we may want to do as a follow on.

BTW, do you have any comment on my v2 lock holder cpu info qspinlock 
patch? I will have to update the patch to fix the reported 0-day test 
problem, but I want to collect other feedback before sending out v3.

Cheers,
Longman

