Return-Path: <linuxppc-dev+bounces-14135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D6C54537
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 21:04:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Dqk6qYPz308H;
	Thu, 13 Nov 2025 07:03:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762977826;
	cv=none; b=WVRJwO4lB8vBgrfjtmLRa1sHE2bF68Ddvs+aKtYtmmzNz01dxkcY6wDzIE91psoWqws68rbwN1JRvYXOQddHzqtUOQRzu/UXxeuPRsiOE9DRfSxrV/vv/4JnYz3yGdunFvdGiezPdysyZ8JfrmESIbC/ooX/I3IspAoDp+C4LKRA4lpbOIHhuWnY/SPLEr5A0CvcDYPBkX+8aCcbZEokTmz9hIX169s7Y71dI0TlISsEGzvv9XveThIU6nr6mCwdk7kOAB5ED6SNm6BL5Y+kv/USXM5SvUkt0UfWF7SrAw4DPfLcDfEZsK3Rd7JqZZ3buwOYUJZPmWnoYmOjJe+S1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762977826; c=relaxed/relaxed;
	bh=QcS8Tylz4PckLYxwgWE0NhLBuWtGFPg9ZZAxAxk0DWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUqF/EIhdWnxj74gv0ZuFsIiNmuvKaMIxho/xoKfTeot6w0ZV8ihlZxqAaTT47V8ISYkuWqaTf8+Cf0Z51Nn6TxLRre4/ALVo+QAc8YqcrP5EpN45cy1VwiBbhIFuDVHicoZ1WHgHbFADNtFVVKMm9cUQ4fTH0FuuJUx11lO+wTJSVCcVgmjvIAJAzakigZvXpjgpmZZgpLO7fl3iI9cZKS8zOxSZdCzRSozc/fJljOm3qBGbb89fUW/C6gYkJ28rpEremNzXLZnFJFDNUB/80DwgMwAGCsNntnKAKf3f/LWZ8/V70IOGmxsV8ULFMygXuKT1x8bJEE5Y08OxDSuUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aRShmlGO; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aRShmlGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Dqk1BBrz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 07:03:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9223640430;
	Wed, 12 Nov 2025 20:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2030C4CEF7;
	Wed, 12 Nov 2025 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977824;
	bh=5XGz0hlFo8UZGbHju91BH5eFiKMsQoRSZ/aU1mUCqXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRShmlGO4OOUEpCIywZ0LyFsNqkWdpHeqkdZ0lgEtfkK82ZFTvPZdRcg6RsBEyHHW
	 EG3blHG/DfGSKdXv+Nh8IFDvUtYTfeOU5dErfiBACZ4MhVabQi+OVv6txDptfOuJX+
	 JHc/fPobgnIOiau5sP0QWHnUIdTQEuUTP97QT/Pmutyjeileznh2IkyNofbsAJxpOK
	 kX9dy3TTJQnavtmWNj70vAwe4KUExZ+gGnm/rMIBIglSfCIlNYXzymsGsLiOhvhhdt
	 Xt/bqmAzZX4ehH4QviVQCXhxU5JFWzhEVtskSohomDNdd7rgIG+zmBCafEUAdBzBCd
	 vfAb2Btlz1Q1Q==
Date: Wed, 12 Nov 2025 20:56:12 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
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
Message-ID: <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
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

Is this some left-over from a previous version?

s/CONFIG_ARCH_USERPROGS_CFLAGS/CONFIG_ARCH_USERFLAGS/

Kind regards,
Nicolas

