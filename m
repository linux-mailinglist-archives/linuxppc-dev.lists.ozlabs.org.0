Return-Path: <linuxppc-dev+bounces-14167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57787C5B4EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 05:29:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d740P2SDjz2yvv;
	Fri, 14 Nov 2025 15:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763094549;
	cv=none; b=AggxwiyCsCS3Fvi/hbGWFNNhI8pilxm+Q0EqRx6TfhFhPknzDk25ETYvU+svJhxgo5fH8LVnzEGrNnKj+ieyWKwZ8UX6AYfWhdVphOspoleENKjb2LYO/VtWJWIJwncqQv4OfT+rfzenHaKjbDjIndOL4qj+H+LcTxtPb+LGG4VUT2jvZ7kb1kEBoZtM49dlweLyQ4Q8KGzFmzAvjp6DFosZQi//Bk4WmfLPUmwpzyeeSm4J6nenrqPXxA2CXrtL/GMc3AS947thsXyG2yZfo3vKB243kNjajKe4hpZtpYQhXWOMAv9OgHIpBelDbmGB8i5PmC9Y7Fs4E8QaYRGHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763094549; c=relaxed/relaxed;
	bh=hZdPPdmgMLIURJsLeaFfdE+jku1R9N2bzU5Yp4bEM44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVtGgnkWyBbWVHQc1qFGJNgtnDHeKoVS0kSMi+LwCmfUJHb08qBjabOKtGFvIOIGay6whdtk5fpqYfNKxOsdWHvkPqQlibgn/yTH2nZLkp7eaWdVrZTSJjUCp40RHxUhE6gxPe0mPxw7xPfzM1i2X4L1yiKhohBRPaAC2ZtVxKtYBV14GO2YMsPxFeVoFjLG2mv7wRdO8mj6iQUDLGY5KZAIfz+tdBeJR4MWYRloN2DAOKUaNLpgTt9mrembF8dPzHVzQonEZ520KIbM3WCdX5yl4X1KYuq0h0KZkJOaiVR6x/KOdsx++We1wGOhXi92Rqta7t7iwn2yZ0WbJOuBEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z5ruQ2Mt; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z5ruQ2Mt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d740M6GSVz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 15:29:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A43B160128;
	Fri, 14 Nov 2025 04:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3C0C16AAE;
	Fri, 14 Nov 2025 04:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094545;
	bh=pNnQKFMOXRv/8psHWwl6fS+z0lU+MW1Zt3XGUGS81hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5ruQ2MtWCS6I6U+6vV1Z+0TCZU6f+9X82zJurev+eP9mNn3Gh1vAhiv0QiwoIgDg
	 zObjRFsSETG+fc2lcJT/61HwvIHiOgslQGjxQspUtVRm6JBsrvcGQBfsAjVpoHgTeV
	 kipy8eHjNGe6zaKCO7/sCwj9xEVqvu9C3WlQlKiE25AwY5zeCaucNEuQCeBqHUy+Jy
	 k6/FaVMxodHyCWO6HT7dwztd6e/5oJfmcPp5qfHfrsWJ4si05H1uZfaFCbzoAJG3TI
	 f7WRio/5YJEIzHBD6QhspVqEWtVVeKZBGJrXqqIXnyJO2sQoHHj+9LuPyZ95opyZTl
	 p9xMfxseUX/8Q==
Date: Thu, 13 Nov 2025 21:28:56 -0700
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
Subject: Re: [PATCH v2 02/10] init: deduplicate cc-can-link.sh invocations
Message-ID: <20251114042856.GB3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
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
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 03:05:17PM +0200, Thomas Weiﬂschuh wrote:
> The command to invoke scripts/cc-can-link.sh is very long and new usages
> are about to be added.
> 
> Add a helper variable to make the code easier to read and maintain.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  init/Kconfig            | 4 ++--
>  scripts/Kconfig.include | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index cab3ad28ca49e7ac930207c9cde8d431d55dc7af..7b722e714d5c5a0580467914b226dc0700ec0797 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -84,8 +84,8 @@ config RUSTC_LLVM_VERSION
>  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
> +	default $(cc_can_link_user,$(m64-flag)) if 64BIT
> +	default $(cc_can_link_user,$(m32-flag))
>  
>  # Fixed in GCC 14, 13.3, 12.4 and 11.5
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 33193ca6e8030e659d6b321acaea1acd42c387a4..d42042b6c9e243b46d1626d892c0c986621ce462 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -65,6 +65,9 @@ cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$
>  m32-flag := $(cc-option-bit,-m32)
>  m64-flag := $(cc-option-bit,-m64)
>  
> +# Test whether the compiler can link userspace applications
> +cc_can_link_user = $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(1))
> +
>  rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
>  rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
>  
> 
> -- 
> 2.51.0
> 

