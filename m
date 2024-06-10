Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2E9027A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 19:21:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kvsoZPam;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vydr21qLwz3bZN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 03:21:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kvsoZPam;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VydqJ5wC3z3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 03:20:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1E00CE16D3;
	Mon, 10 Jun 2024 17:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0638C2BBFC;
	Mon, 10 Jun 2024 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718040025;
	bh=9ae0qgr8xdT/10GNbaF9gMbE8JRtUPpcAk68EIOPOC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvsoZPam2cRKqAxkKOPeaEh+4Gf2NwjKdi7hr0ZU/TCaFXXIV1xxBT4YXf2hIfc20
	 kdQlKi9dyR2F0Gxajy3YGmc7pTXxetkdTblRPH1L2XctzVcqWjFZVPFYXVWnWywciW
	 o5qeej6OkROoCnV8WZMBVWEGmzU4KPtmqzNbPMGO7FHLeSYmtbVwIotAsn5Qvf0auu
	 E38oArsQ0ktT4leO6xY4cda3MGp4c62ws04pLAuyi0iAV2zVi58tO3PmDWo3YcSP2V
	 WOkZQ8jUvPBjIMEPNDYwzj6HZMA0WutZVJM0GhmvXLL7G6QcpaZNm/jEyJy5OdWVNp
	 bwXNPewtH6j1A==
Date: Mon, 10 Jun 2024 22:46:07 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH v2 4/5] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
Message-ID: <a3awlvqgr4quory52btf3zq7wyvgtttjjk5qjidumktcre6myw@geiennjv7pic>
References: <cover.1718008093.git.naveen@kernel.org>
 <a4f44ffeb6f0327639175f8aac61cd21bc23150b.1718008093.git.naveen@kernel.org>
 <CAK7LNARc2SYfNQjo78rYSc5ODmNcmBgxPjp2v6ceWju4QnxbKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARc2SYfNQjo78rYSc5ODmNcmBgxPjp2v6ceWju4QnxbKA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2024 at 06:14:51PM GMT, Masahiro Yamada wrote:
> On Mon, Jun 10, 2024 at 5:39 PM Naveen N Rao <naveen@kernel.org> wrote:
> >
> > On powerpc, we would like to be able to make a pass on vmlinux.o and
> > generate a new object file to be linked into vmlinux. Add a generic pass
> > in link-vmlinux.sh that architectures can use for this purpose.
> > Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
> > provide arch/<arch>/tools/vmlinux_o.sh, which will be invoked prior to
> > the final vmlinux link step.
> >
> > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> > ---
> >  arch/Kconfig            |  3 +++
> >  scripts/link-vmlinux.sh | 18 +++++++++++++++---
> >  2 files changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 975dd22a2dbd..649f0903e7ef 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -1643,4 +1643,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
> >  config ARCH_NEED_CMPXCHG_1_EMU
> >         bool
> >
> > +config ARCH_WANTS_PRE_LINK_VMLINUX
> > +       def_bool n
> > +
> >  endmenu
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index 46ce5d04dbeb..07f70e105d82 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
...
> >
> > +arch_vmlinux_o=""
> > +if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
> > +       arch_vmlinux_o=.arch.vmlinux.o
> > +       info "ARCH" ${arch_vmlinux_o}
> > +       if ! ${srctree}/arch/${SRCARCH}/tools/vmlinux_o.sh ${arch_vmlinux_o} ; then
> > +               echo >&2 "Failed to generate ${arch_vmlinux_o}"
> > +               echo >&2 "Try to disable CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX"
> > +               exit 1
> > +       fi
> > +fi
> 
> 
> 
> This is wrong because scripts/link-vmlinux.sh is not triggered
> even when source files under arch/powerpc/tools/ are changed.
> 
> Presumably, scripts/Makefile.vmlinux will be the right place.

Ah, yes. Something like this?

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb96844..77d90b6ac53e 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -22,6 +22,10 @@ targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif

+ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
+vmlinux: $(srctree)/arch/$(SRCARCH)/tools/vmlinux_o.sh
+endif
+
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)

 # Final link of vmlinux with optional arch pass after final link


Thanks,
Naveen

