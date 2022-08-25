Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ACC5A0AC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 09:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCwFV3Khyz3bb2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 17:53:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZLFEHd4S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCwDx1DpPz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 17:53:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZLFEHd4S;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MCwDt5BS1z4xV9;
	Thu, 25 Aug 2022 17:53:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661413983;
	bh=UtVip1icK7gJdBlHq+HFWJBnOoW3QoCQ+h8pU+n3KkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZLFEHd4Sc+LArWxSHPMZaxUV5Xt5HbCBwxEJoAOkDftQUBd3UvDzQ3SPoUGfIq8+Y
	 XOXVABGmUJRXNewPOhBZ4PnZBgAclyRWiDmLWWWIEoOxbTyf0lT9HmzLfn6qDXHVP8
	 4cFLNr2mtb3VMBT0+X8XSw8kOQcDbMBET6kwqKOBcIoT5DWSkK5aoD9YgXXoTklXi4
	 4vn7aZmWvMmRDrzEWJ1c3IdlA0o+UvHCBus9SLXerZ9zIaIxILLCzH95mjf0d5/kTH
	 Nh5wLMJbIfMZsTuGrUc2j6C3xLq/AaC3ujgNFv8DeGoG8jRuDO1B7lmoCz2us+rszT
	 QVS80HXLzHXbw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: align syscall table for ppc32
In-Reply-To: <20220820165129.1147589-1-masahiroy@kernel.org>
References: <20220820165129.1147589-1-masahiroy@kernel.org>
Date: Thu, 25 Aug 2022 17:53:02 +1000
Message-ID: <874jy0lpy9.fsf@mpe.ellerman.id.au>
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> Christophe Leroy reported that commit 7b4537199a4a ("kbuild: link
> symbol CRCs at final link,  removing CONFIG_MODULE_REL_CRCS") broke
> mpc85xx_defconfig + CONFIG_RELOCATABLE=y.
>
>     LD      vmlinux
>     SYSMAP  System.map
>     SORTTAB vmlinux
>     CHKREL  vmlinux
>   WARNING: 451 bad relocations
>   c0b312a9 R_PPC_UADDR32     .head.text-0x3ff9ed54
>   c0b312ad R_PPC_UADDR32     .head.text-0x3ffac224
>   c0b312b1 R_PPC_UADDR32     .head.text-0x3ffb09f4
>   c0b312b5 R_PPC_UADDR32     .head.text-0x3fe184dc
>   c0b312b9 R_PPC_UADDR32     .head.text-0x3fe183a8
>       ...
>
> The compiler emits a bunch of R_PPC_UADDR32, which is not supported by
> arch/powerpc/kernel/reloc_32.S.
>
> The reason is there exists an unaligned symbol.
>
>   $ powerpc-linux-gnu-nm -n vmlinux
>     ...
>   c0b31258 d spe_aligninfo
>   c0b31298 d __func__.0
>   c0b312a9 D sys_call_table
>   c0b319b8 d __func__.0
>
> Commit 7b4537199a4a is not the root cause. Even before that, I can
> reproduce the same issue for mpc85xx_defconfig + CONFIG_RELOCATABLE=y
> + CONFIG_MODVERSIONS=n.
>
> It is just that nobody did not notice it because when CONFIG_MODVERSIONS
> is enabled, a __crc_* symbol inserted before sys_call_table was hiding
> the unalignment issue.
>
> I checked the commit history, but I could not understand commit
> 46b45b10f142 ("[POWERPC] Align the sys_call_table").
>
> It said 'Our _GLOBAL macro does a ".align 2" so the alignment is fine
> for 32 bit'. I checked the _GLOBAL in include/asm-powerpc/ppc_asm.h
> at that time. _GLOBAL specifies ".align 2" for ppc64, but no .align
> for ppc32.
>
> Commit c857c43b34ec ("powerpc: Don't use a function descriptor for
> system call table") removed _GLOBAL from the syscall table.
>
> Anyway, adding alignment to the syscall table for ppc32 fixes the issue.
>
> I am not giving Fixes tag because I do not know since when it has been
> broken, but presumably it has been for a long while.

Thanks.

I trimmed the change log a bit just to say ~= it's been broken for ever,
and added a Cc to stable.

cheers
