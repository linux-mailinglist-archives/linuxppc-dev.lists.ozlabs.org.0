Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE1622CE81
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 21:12:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCzNp0Zh2zF1Ss
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 05:12:42 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=grrxCMiu; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=grrxCMiu; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCzM36xgpzF1Nq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 05:11:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595617866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IKeY6oErXCv4WxvHD12K0X54wE8JqQGDnTdTiMdbbI=;
 b=grrxCMiujjghWcd/04JA7VVgbUGCG7H7wYQeLoCJmWSz84QLQ2Iac7cWPsGIuXqU95ZsJI
 SfSEkT4JL901YqhUespBovPX9t4s+BvY/a4Ay2JBsganGevHhjSdSJV9EmrUQuKCecLBek
 RyMTDkAAQeOWIOfwGbYjjb3xQQhdWFM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595617866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IKeY6oErXCv4WxvHD12K0X54wE8JqQGDnTdTiMdbbI=;
 b=grrxCMiujjghWcd/04JA7VVgbUGCG7H7wYQeLoCJmWSz84QLQ2Iac7cWPsGIuXqU95ZsJI
 SfSEkT4JL901YqhUespBovPX9t4s+BvY/a4Ay2JBsganGevHhjSdSJV9EmrUQuKCecLBek
 RyMTDkAAQeOWIOfwGbYjjb3xQQhdWFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-KSQWmsA2MWyLHLlGSd4LFQ-1; Fri, 24 Jul 2020 15:11:03 -0400
X-MC-Unique: KSQWmsA2MWyLHLlGSd4LFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0ADD8015F4;
 Fri, 24 Jul 2020 19:11:01 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 572FD1A835;
 Fri, 24 Jul 2020 19:11:00 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Will Deacon <will@kernel.org>, peterz@infradead.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <20200724081647.GA16642@willie-the-truck>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <8532332b-85dd-661b-cf72-81a8ceb70747@redhat.com>
Date: Fri, 24 Jul 2020 15:10:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200724081647.GA16642@willie-the-truck>
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
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/24/20 4:16 AM, Will Deacon wrote:
> On Thu, Jul 23, 2020 at 08:47:59PM +0200, peterz@infradead.org wrote:
>> On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
>>> BTW, do you have any comment on my v2 lock holder cpu info qspinlock patch?
>>> I will have to update the patch to fix the reported 0-day test problem, but
>>> I want to collect other feedback before sending out v3.
>> I want to say I hate it all, it adds instructions to a path we spend an
>> aweful lot of time optimizing without really getting anything back for
>> it.
>>
>> Will, how do you feel about it?
> I can see it potentially being useful for debugging, but I hate the
> limitation to 256 CPUs. Even arm64 is hitting that now.

After thinking more about that, I think we can use all the remaining 
bits in the 16-bit locked_pending. Reserving 1 bit for locked and 1 bit 
for pending, there are 14 bits left. So as long as NR_CPUS < 16k 
(requirement for 16-bit locked_pending), we can put all possible cpu 
numbers into the lock. We can also just use smp_processor_id() without 
additional percpu data.

>
> Also, you're talking ~1% gains here. I think our collective time would
> be better spent off reviewing the CNA series and trying to make it more
> deterministic.

I thought you guys are not interested in CNA. I do want to get CNA 
merged, if possible. Let review the current version again and see if 
there are ways we can further improve it.

Cheers,
Longman

