Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1E22D41A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 05:05:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD9tJ6WhLzF0yj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 13:05:28 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=URizxht5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=URizxht5; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD9qf2c7pzF1Sc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 13:03:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595646185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJKlmgtXl7uNqK+gi01GLPol8dXOhIFF+vRj8dKFHJ4=;
 b=URizxht54as81zYfJsZ6OQ5kEj1I2VZBAMAUaHaDc6sQOAnhmB9V9D5veegmbbXpnI3UxQ
 rEIEUVfjjZRZl/eDd4+Jnt1jd4bAvqByO2HDTO3XGfnz0sdfZO5iwes2xPyIIBY04sTUGh
 ejnj8l2blnl60iCc8m5Adn1SBH4bjAY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595646185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJKlmgtXl7uNqK+gi01GLPol8dXOhIFF+vRj8dKFHJ4=;
 b=URizxht54as81zYfJsZ6OQ5kEj1I2VZBAMAUaHaDc6sQOAnhmB9V9D5veegmbbXpnI3UxQ
 rEIEUVfjjZRZl/eDd4+Jnt1jd4bAvqByO2HDTO3XGfnz0sdfZO5iwes2xPyIIBY04sTUGh
 ejnj8l2blnl60iCc8m5Adn1SBH4bjAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-taJbuqtoOr-9IUyajzXA8A-1; Fri, 24 Jul 2020 23:03:02 -0400
X-MC-Unique: taJbuqtoOr-9IUyajzXA8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6B958;
 Sat, 25 Jul 2020 03:03:00 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B17D18FA2A;
 Sat, 25 Jul 2020 03:02:58 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
From: Waiman Long <longman@redhat.com>
To: Will Deacon <will@kernel.org>, peterz@infradead.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <20200724081647.GA16642@willie-the-truck>
 <8532332b-85dd-661b-cf72-81a8ceb70747@redhat.com>
Organization: Red Hat
Message-ID: <ccf0c6a6-b7c3-8909-cc8f-0c5e7434c372@redhat.com>
Date: Fri, 24 Jul 2020 23:02:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8532332b-85dd-661b-cf72-81a8ceb70747@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/24/20 3:10 PM, Waiman Long wrote:
> On 7/24/20 4:16 AM, Will Deacon wrote:
>> On Thu, Jul 23, 2020 at 08:47:59PM +0200, peterz@infradead.org wrote:
>>> On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
>>>> BTW, do you have any comment on my v2 lock holder cpu info 
>>>> qspinlock patch?
>>>> I will have to update the patch to fix the reported 0-day test 
>>>> problem, but
>>>> I want to collect other feedback before sending out v3.
>>> I want to say I hate it all, it adds instructions to a path we spend an
>>> aweful lot of time optimizing without really getting anything back for
>>> it.
>>>
>>> Will, how do you feel about it?
>> I can see it potentially being useful for debugging, but I hate the
>> limitation to 256 CPUs. Even arm64 is hitting that now.
>
> After thinking more about that, I think we can use all the remaining 
> bits in the 16-bit locked_pending. Reserving 1 bit for locked and 1 
> bit for pending, there are 14 bits left. So as long as NR_CPUS < 16k 
> (requirement for 16-bit locked_pending), we can put all possible cpu 
> numbers into the lock. We can also just use smp_processor_id() without 
> additional percpu data. 

Sorry, that doesn't work. The extra bits in the pending byte won't get 
cleared on unlock. That will have noticeable performance impact. 
Clearing the pending byte on unlock will cause other performance 
problem. So I guess we will have to limit the cpu number in the locked byte.

Regards,
Longman

