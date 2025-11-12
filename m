Return-Path: <linuxppc-dev+bounces-14137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83389C5453D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 21:04:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Dqs2DxMz30CX;
	Thu, 13 Nov 2025 07:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762977833;
	cv=none; b=EupCHK2X2ajYE1G4bcPWoZMajEdDum0nEi6Wg0zNM1uJqdcbX4b96NvfqHDLtxlEuK4h/OMHvygN7tzBqu78BBmA9JcTAXHDsSrm1S0ScnVlcyo6p7IqdMlh+y9cnSFAEavZ8rijiRPxypsWj0g7J+U8mQzN7p1UzmMjNnEDaMkJMIJIq7Aw7X8xPurtcrmS5Lzx2jPBSJ8Ql/ieTUicdHYwjmRr9lJK8PedMwz5UBxeE7pJg8DHVtazb7Mjz++gHcaAQF33GtNtZiBkGT6nCme1chgwdZyo+kP+JoJ7XqbFl5xY8fM09L+8R777BswVJypl6E9ihT1VCyDbFV6cyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762977833; c=relaxed/relaxed;
	bh=qtBTQixwVaGCFqd3r1XjO0N4nrRJlIo8TMVFgrk+GI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1/n+eKtYcWdLJeHOisKJPe9yZbiRO7R7YacQMbkx08//L7dPDkklr5Orr9efln9tinTYNfHGDHwTqTb6+UANPeNmlxhfVlFxhglOWdT0CPCiGjsVebtEDUw8M3xMCnpfBa6wa669lUFZDAS8VnCGqAZDpLVgKhVXEFRO3OlthkgtFu81a5BM6NDWBAtaW9pBCrrS1T5p9ETO+BzmtZTMulEQkxBtZi5mmwrWW1dFYBlzffV3oUi1ESPHzRSgCeQm1YQDLDlo5QucAuZbBvGfyuM56r298DxSApu+BLswxG7rtz+aj7z2wEtfjGUUYwYn4Nxbm23bhf9Tzr8thaqpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l/ZMvnzn; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l/ZMvnzn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Dqr3Njgz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 07:03:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6C4240A26;
	Wed, 12 Nov 2025 20:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5E0C19422;
	Wed, 12 Nov 2025 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977830;
	bh=nUO9ROu0gW7/ns/uQ28gcX3yc+GW0w13a9/X2aAT8jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/ZMvnzn2CADtOmnEK8oxSBL8h+W0p5Nn5UpsvsKruwJSHxVcUeR4XM3Xql0nKdus
	 bSqKhs+uMkYIkIZuUXwM0okWDFlbTc1b3GFwaLc0i8MS0mArq4SZjPqyfw0pTxylrb
	 kDcACs6NyCZrwCjMXmWAun5aPbx2tyCNun6nsiYlfBKzyIIndQtIzMFJnjIFqLp5W7
	 U7cJIK3dUA8BdBGXaq6srPbi1okyViOeP9mxuL9ACCcf5VmurrX4ECVYI2S9Yt8Co2
	 wGu2c5Zt7YjzPlTh1Ym0osiGu8n7TbyhwjUGx6vHaiztJkPuyn821csRFMNgYBEt1M
	 bcQaFk/gjrsng==
Date: Wed, 12 Nov 2025 21:03:23 +0100
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
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <aRToC77bNUy2sKAK@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
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
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 03:05:15PM +0200, Thomas Weiﬂschuh wrote:
> The current logic to inherit -m32/-m64 from the kernel build only works
> for a few architectures. It does not handle byte order differences,
> architectures using different compiler flags or different kinds of ABIs.
> 
> Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> the flags used for userprogs.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Rebase and drop already applied patch
> - Disable CC_CAN_LINK if the test program generates warnings
> - Move to architecture-specific logic
> - Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de
> 
> ---
> Thomas Weiﬂschuh (10):
>       kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
>       init: deduplicate cc-can-link.sh invocations
>       kbuild: allow architectures to override CC_CAN_LINK
>       riscv: Implement custom CC_CAN_LINK
>       s390: Implement custom CC_CAN_LINK
>       powerpc: Implement custom CC_CAN_LINK
>       MIPS: Implement custom CC_CAN_LINK
>       x86/Kconfig: Implement custom CC_CAN_LINK
>       sparc: Implement custom CC_CAN_LINK
>       kbuild: simplify CC_CAN_LINK
> 
>  Makefile                |  8 ++++++--
>  arch/mips/Kconfig       | 15 +++++++++++++++
>  arch/powerpc/Kconfig    | 15 +++++++++++++++
>  arch/riscv/Kconfig      | 11 +++++++++++
>  arch/s390/Kconfig       | 11 +++++++++++
>  arch/sparc/Kconfig      | 11 +++++++++++
>  arch/x86/Kconfig        | 11 +++++++++++
>  init/Kconfig            |  7 +++++--
>  scripts/Kconfig.include |  3 +++
>  scripts/cc-can-link.sh  |  2 +-
>  10 files changed, 89 insertions(+), 5 deletions(-)
> ---
> base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
> change-id: 20250813-kbuild-userprogs-bits-03c117da4d50
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

Thanks for the patch set and all the work behind!  I found only one
issue in patch 3, the rest looks good to me as they are.

I haven't reviewed the compiler flags for the archs, but from the formal
point of view they look good to me, too.

How shall we proceed with here?  I think, easiest would be if we get
appropriate acks from the architecture maintainers, so we could take
this via kbuild.

Other opinions?

Kind regards,
Nicolas

