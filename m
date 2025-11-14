Return-Path: <linuxppc-dev+bounces-14168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C789AC5B51D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 05:31:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d74395YL2z2yx7;
	Fri, 14 Nov 2025 15:31:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763094693;
	cv=none; b=kvVS0F6mt//E8NkI63RhCaERJS9byqNn31O5p7vOURlw7ZnUoU4bUYAA3Rro56dcmAziNZ7lMcs4sgA37M2Jy5JUKPpONhls6AMKJmHFixFVsq1v77S768AqIdiLIo+WtfFwmWk9ST6YF5FrZOVQWaUY5H65yvPVffv8ixxVMuF7afW+UPe06FKhJoLTpRoDF/3YQlsA6nDyVhhgiUZjEIvbSvXCh0ipCx1mC4VLeUnOmu3M7LbOtAWzbza+n1p/ucHU5SNprENKGBGCuj1Ju44WndcVyyf+uuVPEKjIWTdyza0OpqAh2wQZ6aVul36R7q5YG1w1hXs9r8gAK5PZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763094693; c=relaxed/relaxed;
	bh=RvaU/90NUCMkBacPGRdTV9VIE02nVNvBvmqxIT8RmRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkAk6lQzZSGl2YA+d39lwEWmCui5n7p4ATmBgvzVzcH23zn/bEuwR7LaKmKE7hXe+TuIjbtMDbyqvHsiXgsGmISWhIRm3aEkVzl0ei/NiQ7gN0AZROLO4eT6JLXSshiHUvV2OWDtdY7lzW1QVhN7HYCQ4SHKc4lxbDAj7YqK2E9fhPPqfXE1PmFDbSy00NmnVybojtdp5gN+jIkUm05eC0OTAYIb5uoVXvmI4BaQ7L48sFLWehMT71hHMOK1TDXAsUhA0LYXvsnrVxMWmD6YabQkaKnBWZmLEJIBK4d/S1QOEYiUY9ZJ4ucd0YjiAPyMJc1Gi2dIjoCnqzNMYSG8zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdpqxCxO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdpqxCxO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d74385sCQz2yvX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 15:31:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F24E640483;
	Fri, 14 Nov 2025 04:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FCCC116B1;
	Fri, 14 Nov 2025 04:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094690;
	bh=uLMghE7ydDQjNwo+3JIijtmU11kVbvrP2zjXCZJb08c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdpqxCxOi3xQvATJP2BCYK6hrOnP9R5cYiNjQHQBPz9oSNHH7ro5W0uD4gZ+648jL
	 tj/JiY+prRTx+D1vt7Nz03pusbf3dGGKQ/6fz8PjKc2IFtrPGR8LiFBHwCQAry7Qxw
	 mUlnsbsazRxcrQsUDznTlpORXe/+nncE/B8pCnioxZdSgbJxELm6QrmNLgwF7zE6JN
	 Pxrux4Sfz0nwhoWSODtDr5mAaxx5p3/gYBHabHsDigfml2sd+mb2qnOTPK1knulMUy
	 ZZsk2NqRLRvBZUvbtbYTeA0D2tZvVb31byZFt1gt6cvBxxiIOcPjfEdc4KCJuIPl/q
	 ZHNAlCJu1LZsg==
Date: Thu, 13 Nov 2025 21:31:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <20251114043122.GC3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 03:05:18PM +0200, Thomas Weiﬂschuh wrote:
> The generic test for CC_CAN_LINK assumes that all architectures use -m32
> and -m64 to switch between 32-bit and 64-bit compilation. This is overly
> simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
> also require byte order handling (-mlittle-endian, -EL). Expressing all
> of the different possibilities will be very complicated and brittle.
> Instead allow architectures to supply their own logic which will be
> easy to understand and evolve.
> 
> Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
> to be implemented as kconfig does not allow the reuse of string options.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Modulo Nicolas's existing comment about CONFIG_ARCH_USERPROGS_CFLAGS:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile     | 13 +++++++++++--
>  init/Kconfig |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bca4c90db435ecdbd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
>  LDFLAGS_vmlinux	+= --emit-relocs --discard-none
>  endif
>  
> -# Align the bit size of userspace programs with the kernel
> -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> +# Align the architecture of userspace programs with the kernel
> +USERFLAGS_FROM_KERNEL := --target=%
> +
> +ifdef CONFIG_ARCH_USERPROGS_CFLAGS
> +KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
> +KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
> +else
> +# If not overridden also inherit the bit size
> +USERFLAGS_FROM_KERNEL += -m32 -m64
> +endif
> +
>  KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index 7b722e714d5c5a0580467914b226dc0700ec0797..4a2ae3cfbf26525a60936d9b29a74ef4319ba3a5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,8 +82,12 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
>  
> +config ARCH_HAS_CC_CAN_LINK
> +	bool
> +
>  config CC_CAN_LINK
>  	bool
> +	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
>  	default $(cc_can_link_user,$(m64-flag)) if 64BIT
>  	default $(cc_can_link_user,$(m32-flag))
>  
> 
> -- 
> 2.51.0
> 

