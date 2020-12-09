Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD62D3962
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 05:01:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrNdS2GfBzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 15:01:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrNbM0SS6zDqcv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 14:59:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Yt24v0LC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrNbK1Gwvz9sWC;
 Wed,  9 Dec 2020 14:59:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607486366;
 bh=83V+Va2FNLgnoBV3YAia+6UJv+qGMO3fTqLdZkCP+C4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Yt24v0LCtsKwWGXCurr8VaFtMo5RmrQKPnR9mW5NtbRlzdHpZ46yELwnVAisTASgG
 fITRNt534cteOwIkr8yluYbJwiwnNFssp0dnxIwDFak9yz/aOZeuoBSBqCAiESKgAL
 yfbZ5FkAPg1QOaUMqBeAUBjcyFFlcIEXVdnR7jG5H96Xpt6TO+9AyXhT5Nl+7GR5vZ
 cTH3ovccMRffeawB3BFNwkIoE2KngtZBDjsrWioLXuhqlNLlIByayl6ltlnb4bkTe3
 e3r+1xg3XAKXlLy6GgnE4o7XbMPdRPDQS9JnPjoITklFF9OSifjZQ1xWXlYmuE6BDx
 jmWLAUp7V8rTg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Parse ibm,
 thread-groups with multiple properties
In-Reply-To: <20201208172540.GA14206@in.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-2-git-send-email-ego@linux.vnet.ibm.com>
 <20201207121042.GH528281@linux.vnet.ibm.com>
 <20201208172540.GA14206@in.ibm.com>
Date: Wed, 09 Dec 2020 14:59:22 +1100
Message-ID: <87v9dbsk85.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy <ego@linux.vnet.ibm.com> writes:
> Hello Srikar,
>
> Thanks for taking a look at the patch.
>
> On Mon, Dec 07, 2020 at 05:40:42PM +0530, Srikar Dronamraju wrote:
>> * Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2020-12-04 10:18:45]:
>> 
>> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>> 
>> <snipped>
>> 
>> > 
>> >  static int parse_thread_groups(struct device_node *dn,
>> > -			       struct thread_groups *tg,
>> > -			       unsigned int property)
>> > +			       struct thread_groups_list *tglp)
>> >  {
>> > -	int i;
>> > -	u32 thread_group_array[3 + MAX_THREAD_LIST_SIZE];
>> > +	int i = 0;
>> > +	u32 *thread_group_array;
>> >  	u32 *thread_list;
>> >  	size_t total_threads;
>> > -	int ret;
>> > +	int ret = 0, count;
>> > +	unsigned int property_idx = 0;
>> 
>> NIT:
>> tglx mentions in one of his recent comments to try keep a reverse fir tree
>> ordering of variables where possible.
>
> I suppose you mean moving the longer local variable declarations to to
> the top and shorter ones to the bottom. Thanks. Will fix this.

Yeah. It's called "reverse christmas tree", that's googleable.

I also prefer that style, it makes the locals visually sit with the
beginning of the function body.

cheers
