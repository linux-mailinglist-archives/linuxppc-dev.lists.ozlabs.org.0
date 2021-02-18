Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBA31E887
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 11:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhBDn2tMJz30QN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 21:45:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OHvydnjH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OHvydnjH; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhBDG6nmLz30Kw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 21:44:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhBD64vFvz9sBJ;
 Thu, 18 Feb 2021 21:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613645079;
 bh=ZsNlPzRZrmg4PFm+VJmNAO7Irdgz1Plpmx+SNgFPZsc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OHvydnjHKxgHMLUHcND78HFYkWD+xm92BEqIiAhEdc7OJ6TiViZv4g7xrWsiyp+7w
 kBWgxU4fI565Am8ML/cW78MpEwSWxgfWl3mJhalmuJ6QRn7GyqbMH/4orAq+Uo94TK
 TG79AOyTlFWpeTnfBBzDIJlqb/cn83/FIzNPNrtIm2HTcKHU5dvhTRJdy3YwKkFCnF
 RXWK2Sy8wfF4ouZfctD3X2Sa+681bn8Z4F5d6iaeJB8je7D/xdFGI7yvbGRoJStC9X
 r/Txz5Ije+ogYpJRw2IDcNjxKN2YnFlQny3pHD8S9UF2tlc1hBqx75oJZO94PxwXlM
 OsvrGFBDcMWoA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring
 <robherring2@gmail.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 powerpc tree
In-Reply-To: <20210218144815.5673ae6f@canb.auug.org.au>
References: <20210218144815.5673ae6f@canb.auug.org.au>
Date: Thu, 18 Feb 2021 21:44:37 +1100
Message-ID: <874ki9vene.fsf@mpe.ellerman.id.au>
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   arch/powerpc/kexec/elf_64.c
>
> between commit:
>
>   2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
>
> from the powerpc tree and commit:
>
>   130b2d59cec0 ("powerpc: Use common of_kexec_alloc_and_setup_fdt()")
>
> from the devicetree tree.
>
> I can't easily see how to resolve these, so for now I have just used
> the latter' changes to this file.

I think it just needs this?

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 87e34611f93d..0492ca6003f3 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
 					   initrd_len, cmdline,
-					   fdt_totalsize(initial_boot_params));
+					   kexec_fdt_totalsize_ppc64(image));
 	if (!fdt) {
 		pr_err("Error setting up the new device tree.\n");
 		ret = -EINVAL;


cheers
