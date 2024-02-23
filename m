Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FE860AB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 07:21:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J021kmlb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th0K92345z3vX0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 17:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J021kmlb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th0JN2jgNz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 17:21:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708669263;
	bh=kPUUTb99+ePyms3srOE4LdBxVc7W3widOyIM/CneeRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J021kmlb25fiXOqM3kjCt/ENHQvdDNuic+X/Acp3DMixZ+Mk9XYAkqWqZ/4GMedzN
	 rHpKBlyB7ZItXPI0dI+ttFGi1iXvNIUGa968U/3orBe20bjSnAn3fTDWsz2IkMKFTM
	 dGDLga5aJq9sPa8V4wO4m8za+iK9UNKQCCgC9Wkrwtr5xzU5koPhETnxQqXmAKbxow
	 sSrbM1ejgjiM6DsLQZAfNMRXqWcXIzN6QqxQ+tkjGFfW1KtQedvsXO/vpP1yJW6O9J
	 XZaIbrjO3MZNvTokj+Hi1lHB751G79WklgTLK/4X10ZCxptSPrqKLp+dbWRerWQh7/
	 rXZiiVMpTYaOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Th0JH0Vp6z4wcR;
	Fri, 23 Feb 2024 17:21:03 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: use correct function name for resetting
 TCE tables
In-Reply-To: <20240222-rtas-fix-ibm-reset-pe-dma-window-v1-1-7aaf235ac63c@linux.ibm.com>
References: <20240222-rtas-fix-ibm-reset-pe-dma-window-v1-1-7aaf235ac63c@linux.ibm.com>
Date: Fri, 23 Feb 2024 17:21:00 +1100
Message-ID: <87wmqvaegj.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> The PAPR spec spells the function name as
>
>   "ibm,reset-pe-dma-windows"
>
> but in practice firmware uses the singular form:

Just to be clear, you're talking about IBM firmware on PowerVM machines.

>   "ibm,reset-pe-dma-window"
>
> in the device tree. Since we have the wrong spelling in the RTAS
> function table, reverse lookups (token -> name) fail and warn:
>
>   unexpected failed lookup for token 86
>   WARNING: CPU: 1 PID: 545 at arch/powerpc/kernel/rtas.c:659 __do_enter_rtas_trace+0x2a4/0x2b4
...
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 7e793b503e29..8064d9c3de86 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -375,8 +375,13 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
>  	[RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW] = {
>  		.name = "ibm,remove-pe-dma-window",
>  	},
> -	[RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOWS] = {
> -		.name = "ibm,reset-pe-dma-windows",
> +	[RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW] = {
> +		/*
> +		 * Note: PAPR+ v2.13 7.3.31.4.1 spells this as
> +		 * "ibm,reset-pe-dma-windows" (plural), but RTAS
> +		 * implementations use the singular form in practice.
> +		 */
> +		.name = "ibm,reset-pe-dma-window",

Qemu also spells it that way:

$ grep -C 12 ibm,reset-pe-dma-window hw/ppc/spapr_rtas_ddw.c
static void spapr_rtas_ddw_init(void)
{
    spapr_rtas_register(RTAS_IBM_QUERY_PE_DMA_WINDOW,
                        "ibm,query-pe-dma-window",
                        rtas_ibm_query_pe_dma_window);
    spapr_rtas_register(RTAS_IBM_CREATE_PE_DMA_WINDOW,
                        "ibm,create-pe-dma-window",
                        rtas_ibm_create_pe_dma_window);
    spapr_rtas_register(RTAS_IBM_REMOVE_PE_DMA_WINDOW,
                        "ibm,remove-pe-dma-window",
                        rtas_ibm_remove_pe_dma_window);
    spapr_rtas_register(RTAS_IBM_RESET_PE_DMA_WINDOW,
                        "ibm,reset-pe-dma-window",
                        rtas_ibm_reset_pe_dma_window);
}

There's no version in SLOF, it delegates to Qemu.

The old platforms that use RTAS won't implement this call at all, so
there's no issue with the naming there.

So LGTM.

cheers
