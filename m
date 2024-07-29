Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C815E93F768
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:18:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z1Vq4Cmu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgS95WTQz3cYF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:18:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z1Vq4Cmu;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgRR4Ps1z3cNB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:17:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1722262639;
	bh=eCNFlbyuvUg9Dr6Km3nJh9bqYmWj+BgQRf4YrHZk1R0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z1Vq4CmuKHs1HWAwpmMP+liv5O3VTi1k+f1wjDTlu72cs116wcFbnnSq7L+ZRaVdf
	 DBjpe3NbmEkN9ZvS4cFnKwKbpFVZNMlBCYkgb9Y10KYNb7TVRAXdHezja3NEfIpHKA
	 gI+NRUN1Q3cZgkBPDRe+KANatjKnytRxItQmIvT30MfsUwcezfPNcaT02FtTTALNHv
	 zRJwVOEXWKbZ/UgvVEt31IM6tvutA215KIaeEOGw1Lwp85B2xhFtlTy+juDpxmLdia
	 bdFZ2uLslmRzolrNiGJA0I/3Khbw6KUffchXGNX7+0xsPT5qXRiBQdz5CITlO4n5Ri
	 840OxqxEqauAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WXgRM3Tb1z4x1V;
	Tue, 30 Jul 2024 00:17:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ryan Sullivan <rysulliv@redhat.com>, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on
 livepatch sibling call
In-Reply-To: <20240724183321.9195-1-rysulliv@redhat.com>
References: <20240724183321.9195-1-rysulliv@redhat.com>
Date: Tue, 30 Jul 2024 00:17:18 +1000
Message-ID: <878qxkp9jl.fsf@mail.lhotse>
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
Cc: pmladek@suse.com, joe.lawrence@redhat.com, jikos@kernel.org, christophe.leroy@csgroup.eu, rysulliv@redhat.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, mbenes@suse.cz, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ryan,

Thanks for the patch.

Ryan Sullivan <rysulliv@redhat.com> writes:
> Currently, on PowerPC machines, sibling calls in livepatched functions
> cause the stack to be corrupted and are thus not supported by tools
> such as kpatch. Below is an example stack frame showing one such
> currupted stacks:
...
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> index 76dbe9fd2c0f..4dfbe6076ad1 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -244,6 +244,9 @@ livepatch_handler:
>  	mtlr	r12
>  	ld	r2,  -24(r11)
>  
> +	/* Restore toc to caller's stack in case of sibling call */
> +	std	r2, 24(r1)
> +

It would be good to have a comment here explaining why it's safe in all
cases to store the current r2 value back to the caller's save slot.

I haven't convinced myself that it is always safe, but I need to think
about it a bit harder O_o

cheers
