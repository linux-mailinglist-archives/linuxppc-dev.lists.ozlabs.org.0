Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF96BA4EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 02:55:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbtkY62lCz3f3c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 12:55:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pEMdQTdr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbtjd0c74z3c6Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 12:54:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pEMdQTdr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pbtjc6JzQz4x84;
	Wed, 15 Mar 2023 12:54:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678845252;
	bh=Yopb6U17LAWbhJiYVS5Y0FAVkJR1WAusT9HFfXsuug4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pEMdQTdrbNOpL7nY3LVYUCoTyZO4iy44A6sY3MHiFMvkGKD6KBMy+kjTY8qUY3wZk
	 a3mkjVR1liYsejtuRLwm4yWfSL38YcNktXQb0E0fw9mMP08IBvcgNiomq9prWpNcZV
	 izXXTqB6f1Ue76O6j8TgDbmfu17AN++MhemYg33esPGusDrf7E4AUCTuhifmkMrVwi
	 05zPG+EJ8lDi1jxATBBeJvb3+claeGTthFT4bCcIT2FQ1KoGij5TR7PecmlwdfyoPd
	 nyNBOwTrrFsUqH3VtdX9D6AJc0lm0jZ44GQRPFnVM75677E21zQy+lEPV097FAviul
	 nD5cLLBVN2Zkw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Child <nnac123@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v1] powerpc: Add version to install filenames
In-Reply-To: <20230314164442.124929-1-nnac123@linux.ibm.com>
References: <20230314164442.124929-1-nnac123@linux.ibm.com>
Date: Wed, 15 Mar 2023 12:54:09 +1100
Message-ID: <87edpqok3i.fsf@mpe.ellerman.id.au>
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
Cc: Nick Child <nnac123@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Child <nnac123@linux.ibm.com> writes:
> Rather than replacing the versionless vmlinux and System.map files,
> copy to files with the version info appended.
>
> Additionally, since executing the script is a last resort option,
> inform the user about the missing `installkernel` command and the
> location of the installation.
>
> This work is adapted from `arch/s390/boot/install.sh`.
>
> Signed-off-by: Nick Child <nnac123@linux.ibm.com>
> ---
>
> Hoping I am not breaking someones dependency on targeting /boot/vmlinux
> so RFC'ing.

It will probably break *someone*'s workflow :)

> I typically have kernelinstall on my LPARs and installing and rebooting
> goes peacefully.
>
> Recently, I did not have kernelinstall and `make install` seemed to behave
> differently. I got very little output but a succeful return code. After
> initramfs issues during boot I dug into the makefiles a bit to figure out
> where execution was differing. When `kernelinstall` cannot be found, we
> invoke `arch/powerpc/boot/install.sh` instead. I am primarily interested
> in getting more information relayed to the user about what is going on.
>
> The changes to installing with the version appended are more of an afterthought
> that makes sense to me but could understand why someone may depend on consistent
> filenames.
>
> Opening as RFC for opinions/rejections/concerns.

TIL arch/powerpc/boot/install.sh even exists :)

I generally netboot kernels, so I don't really use `make install` that
much. But I know some folks do, though they probably have
`installkernel` installed as a rule.

Still this change seems sensible, and putting the version in the file
names matches what arm, s390, arm64 and riscv do.

See if anyone else has an opinion.

cheers
