Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D902D691822
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 06:54:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCjcZ55v0z3f5s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 16:54:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NObTTh+7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCjbh5HWDz3bTK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 16:54:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NObTTh+7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PCjbh1cKvz4y0Z;
	Fri, 10 Feb 2023 16:54:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676008448;
	bh=rIX03P72u35Uxe05IJNhmS/NECsV0SF+1IiW3aVJS9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NObTTh+7aaB6WQ4UriwuGltSQwMSed/X59b4sK3AQD8hL9nbxxwvvtYdwVQZtCf1k
	 TJp6eR6A1da6O/7Q48SVC47efPnlKvFie8KR5HxdL/nWv1Iv+qUZ5lcdIn+09qkd9R
	 XivsNr3wwpdwmueM3Odig/1/KzC/mVbgy89NQdCfVRW3XliD00ZHEwHHN/HDEtxH4/
	 4CbWUuWd17y3cCoxdwvxmcrMos9r5JMXTF+qc+/p7/vg3pAGcfPLugXivXS3MsO9D3
	 jo/vtGsaHa9pOE4pLl14wRh/Koh9ymht0J255oewPV+XwtQH0EJJxqtl0TFolDUJOE
	 1/Lb5wIEIJG+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Lynch via B4 Submission
 Endpoint <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Kajol
 Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 01/19] powerpc/rtas: handle extended delays safely in
 early boot
In-Reply-To: <87wn4snvsf.fsf@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-1-9aa6bd058063@linux.ibm.com>
 <87ttzwwgh4.fsf@mpe.ellerman.id.au> <87wn4snvsf.fsf@linux.ibm.com>
Date: Fri, 10 Feb 2023 16:54:05 +1100
Message-ID: <87a61mvzeq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch via B4 Submission Endpoint <devnull+nathanl.linux.ibm.com@kernel.org> writes:
>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>
>>> Some code that runs early in boot calls RTAS functions that can return
>>> -2 or 990x statuses, which mean the caller should retry. An example is
>>> pSeries_cmo_feature_init(), which invokes ibm,get-system-parameter but
>>> treats these benign statuses as errors instead of retrying.
>>>
>>> pSeries_cmo_feature_init() and similar code should be made to retry
>>> until they succeed or receive a real error, using the usual pattern:
>>>
>>> 	do {
>>> 		rc = rtas_call(token, etc...);
>>> 	} while (rtas_busy_delay(rc));
>>>
>>> But rtas_busy_delay() will perform a timed sleep on any 990x
>>> status. This isn't safe so early in boot, before the CPU scheduler and
>>> timer subsystem have initialized.
>>>
>>> The -2 RTAS status is much more likely to occur during single-threaded
>>> boot than 990x in practice, at least on PowerVM. This is because -2
>>> usually means that RTAS made progress but exhausted its self-imposed
>>> timeslice, while 990x is associated with concurrent requests from the
>>> OS causing internal contention. Regardless, according to the language
>>> in PAPR, the OS should be prepared to handle either type of status at
>>> any time.
>>>
>>> Add a fallback path to rtas_busy_delay() to handle this as safely as
>>> possible, performing a small delay on 990x. Include a counter to
>>> detect retry loops that aren't making progress and bail out.
>>>
>>> This was found by inspection and I'm not aware of any real
>>> failures. However, the implementation of rtas_busy_delay() before
>>> commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
>>> was not susceptible to this problem, so let's treat this as a
>>> regression.
>>>
>>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>>> Fixes: 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
>>> ---
>>>  arch/powerpc/kernel/rtas.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 47 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>> index 795225d7f138..ec2df09a70cf 100644
>>> --- a/arch/powerpc/kernel/rtas.c
>>> +++ b/arch/powerpc/kernel/rtas.c
>>> @@ -606,6 +606,46 @@ unsigned int rtas_busy_delay_time(int status)
>>>  	return ms;
>>>  }
>>>  
>>> +/*
>>> + * Early boot fallback for rtas_busy_delay().
>>> + */
>>> +static bool __init rtas_busy_delay_early(int status)
>>> +{
>>> +	static size_t successive_ext_delays __initdata;
>>> +	bool ret;
>>
>> I think the logic would be easier to read if this was called "wait", but
>> maybe that's just me.
>
> Maybe "retry"? That communicates what the function is telling callers to do.

Yeah, that's even better.

cheers
