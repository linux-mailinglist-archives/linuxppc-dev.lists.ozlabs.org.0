Return-Path: <linuxppc-dev+bounces-12666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B3BB963A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 05 Oct 2025 14:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cfhY40pxnz3cDN;
	Sun,  5 Oct 2025 23:29:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759607090;
	cv=none; b=oytR6NTjH2gp86+p+NBgeQOXXCIEuyQV2x0H3BcX4jYzPVceIGyQKWxHyGFLUolsQIz5wTYkgxmcBtlR5IzDyFXD/uO+3+Zi0qKLRkbtP4E1e7CVuCpkZnTHZ524Lp47BOD3fMab0qcfY5yI4ULVMCB4Jc4QBWi5PpnrViVRINx7vHdgIXePK/LzEqk2NPYEfcqZX5fWkLC7Y9wueCq1bmyPZHs3LsQUPQg0/tj2J2L/SLKhFZLC+XsXkqdyoPU3fSRrsr12oFCpkV7xSWP7Zby0yJJou5tyER0tJt5pDod8I0ObM0EwI0VnqP7l1Ux4PcpTNFKmtKSHmacI0ZtmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759607090; c=relaxed/relaxed;
	bh=38QCdlJu90O2r2OoiJeyf978B/fLItXiS3AbITIDR7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Neam+gm4dMsNC1TlOTjYL75BwM/i/z81zX5EYorEJtILJgW4j30vhXdNL/T8fVK/4w4EwK1Tii2q5AdbWQzJ5XMIv2fJZqslvojQ1hiSInLkaTFcgNYTN/SCetSOkrbZYQhLSIM1SHK4czzSRG8NRnMrSG+Y+YxBXTIvnbp9c22pMEtnOY3kO1kwBbvHmFHia4NJbrB/oOBZYI7OGjqp1wjKeWxM9ilf7HyhlYUOmNxCmjgFUpYRPgaDHmYPXaseVVy/ijSsdO+9huiORWA72vrq4D0EAZR2qxZ6J+vsS2+Ycq3hpcG82rsFFHgRmryNrQFISrI8bGeo5WsKNajEcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M9dKdNva; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M9dKdNva;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cfGFs3lr4z2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Oct 2025 06:44:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A2FF61E65;
	Sat,  4 Oct 2025 19:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E750C4CEF7;
	Sat,  4 Oct 2025 19:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759607086;
	bh=9nkAewDrs9jT1kq0EmKmCzMCk++a7cpgzLbOZF+8FX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9dKdNvaWdXCWe4jUDVRAJyTOGtleUbNo1SCu17M8qUDFShYPNNJVnlDxFTWL1LaR
	 H28Gak1+1jiJiNgzfbZi4eMIJ7U65E5ZkfiU3Me6frwWCu2D2fKGm3tRzT954/aOTg
	 7EpeKrgMKJZo8wgldqTZn6Uqi8Z54fFKB/+DEa7nu1HC3+YUkN07Yy8gxqOlGknjfw
	 q7GZbL6WTH7VhzRWWwr9W+JfjYR/Ez26QZGwo6vxoWpS0AfpBEfndnp+BsP894WFru
	 XqLsP30ir+Yhd3hIwwWc+pa6zB1aujO+gnFGJG8CM5W/QMavZ73r/xdbOEe/FZzFOe
	 fzoEyxwvHhGSg==
Date: Sat, 4 Oct 2025 21:43:23 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
	naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
	npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
	christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
	mahesh@linux.ibm.com
Subject: Re: [RFC PATCH v2 2/3] kbuild: Add objtool integration for PowerPC
 feature fixups
Message-ID: <aOF4223Q5egUS_in@levanger>
References: <20250929080456.26538-1-sv@linux.ibm.com>
 <20250929080456.26538-3-sv@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929080456.26538-3-sv@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 29, 2025 at 01:34:55PM +0530, Sathvika Vasireddy wrote:
> Add build system support for PowerPC feature fixup processing:
> 
> - Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
>   build-time feature fixup processing
> - Integrate objtool feature fixup processing into vmlinux build
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  Makefile                 |  7 +++++++
>  arch/Kconfig             |  3 +++
>  scripts/Makefile.lib     |  5 +++--
>  scripts/Makefile.vmlinux | 13 ++++++++++++-
>  4 files changed, 25 insertions(+), 3 deletions(-)
> 
...
> diff --git a/arch/Kconfig b/arch/Kconfig
> index d1b4ffd6e085..d870aab17cba 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1334,6 +1334,9 @@ config HAVE_UACCESS_VALIDATION
>  	bool
>  	select OBJTOOL
>  
> +config HAVE_OBJTOOL_FTR_FIXUP

For me, FTR is not that natural to parse.  Is there a reason for using
FTR instead of FEATURE?

...
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index b64862dc6f08..94cc2bba929a 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -84,7 +84,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link_vmlinux =							\
>  	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
> -	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
> +	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)	\
> +	$(cmd_objtool_vmlinux)
>  
>  targets += $(vmlinux-final)
>  $(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> @@ -131,3 +132,13 @@ existing-targets := $(wildcard $(sort $(targets)))
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>  
>  .PHONY: $(PHONY)
> +
> +# objtool for vmlinux
> +# ----------------------------------
> +#
> +#  For feature fixup, objtool does not run on individual
> +#  translation units. Run this on vmlinux instead.
> +
> +ifdef CONFIG_HAVE_OBJTOOL_FTR_FIXUP
> +cmd_objtool_vmlinux = ; $(objtool) --ftr-fixup --link $@

This cmd_* definition is broken as $(call cmd,objtool_vmlinux) would be
evaluated to '... ; ; ...' (shell syntax error).

What about putting the objtool call right into cmd_link_vmlinux?


cmd_link_vmlinux =							\
	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true);   \
	$(if $(CONFIG_HAVE_OBJTOOL_FTR_FIXUP), $(objtool) --ftr-fixup --link $@, true)


Kind regards,
Nicolas

