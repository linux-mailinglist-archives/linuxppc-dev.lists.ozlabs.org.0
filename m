Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F6F86FA61
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 07:59:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eAT8eJWe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tp8gh42JXz3c4t
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 17:59:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eAT8eJWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tp8fz16ppz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 17:58:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29CFB60C6B;
	Mon,  4 Mar 2024 06:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8B3C433C7;
	Mon,  4 Mar 2024 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709535511;
	bh=pCHXV/s88VE05KHiAtDUcDWj2C6kZNCANXL4c+tdvNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eAT8eJWePJd0jK8Q2ixYVlvIpvbeeLUFoFy/sPTywGp9Q9vA+7LVcfX852wftPuwt
	 MCzTGMA3XXTTiCtMvzdJtShw5uz7C3mlwqC+2li4cNz8sAXfqo6g7vhltuNVKX+zHI
	 G6D1sVk3N4SeMME7KilqGabeYxTc3/y3FBBO68N6l7IezvBwRyl49B5I6ENlcQbQVL
	 T++ovo7BFzwcTa3jmK7C3Ib8e3sdcSRbl4Ot6eof2/A9rXto3fTz1Ll3XLKByaLCYw
	 8CDZEFzigrcusaCgFK1iRGuP6PkmTq9GlQqcw95+itOVqVIcbH26w6aQ9e+ipONRqg
	 LADpyzp2BriQw==
Message-ID: <0b1ebda7-cf70-47bc-9d31-129eb895ae9f@kernel.org>
Date: Mon, 4 Mar 2024 12:28:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
To: Michael Ellerman <mpe@ellerman.id.au>, Joel Savitz <jsavitz@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20240301203023.2197451-1-jsavitz@redhat.com>
 <87cysdfsef.fsf@mail.lhotse>
Content-Language: en-US
From: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
In-Reply-To: <87cysdfsef.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/2/24 4:53 AM, Michael Ellerman wrote:
> Hi Joel,
> 
> Joel Savitz <jsavitz@redhat.com> writes:
>> On 64-bit powerpc, usage of a non-16MB-aligned value for the mem= kernel
>> cmdline parameter results in a system hang at boot.
> 
> Can you give us any more details on that? It might be a bug we can fix.
> 
>> For example, using 'mem=4198400K' will always reproduce this issue.
>>
>> This patch fixes the problem by aligning any argument to mem= to 16MB
>> corresponding with the large page size on powerpc.
> 
> The large page size depends on the MMU, with Radix it's 2MB or 1GB. So
> depending on what's happening 16MB may not be enough.
> 
> What system are you testing on?
> 

htab_bolt_mapping should have aligned things to a lower value that is 16MB aligned.

	/* Carefully map only the possible range */
	vaddr = ALIGN(vstart, step);
	paddr = ALIGN(pstart, step);
	vend  = ALIGN_DOWN(vend, step);



-aneesh

