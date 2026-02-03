Return-Path: <linuxppc-dev+bounces-16535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAfTMzSagWl/HAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 07:48:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAADED5727
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 07:48:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4vFP5MsCz30M6;
	Tue, 03 Feb 2026 17:48:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770101289;
	cv=none; b=lke8P85/Ys+2c/fUWcOTlwLifi83IhkUPArsgiqUs/ZrFse8iiI1ozE5hZbtoW9bj8xosGgADGts6e7J6Z4smtQaBpwx5O6lCS6/dGFD4QhJMzLs4DdMOCbqiFus33LrLEyjQob3wrOztWgKte9XdclcuYnAtpcOZSR5x+cgrXAZoxUbdQhOyC4oNXSiVM7IEyrP566qF1or7qmsP2lSGdJwbpKvfz56qmv7NYON2EJtU6TD8uppsCujYXh6yChWKECuxnxG147WZPFA7LkdaNT1lk9ABqQ73Ip880AibNtIHXnSBT7ASLDx3tC00HWiE149GdQtK4Gq3hDf2rkuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770101289; c=relaxed/relaxed;
	bh=wKfgeNcUZsfODc/EWUF+P356I4tXzdW6JOW+pXIZpKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He1ERbwKlgCdz1KaKOFkfwULJCOacffJR4V9quricLiVmpEf2vFq/75UvzfPZJRN0Q7lCXkxqEXro86MMv56Z1rf6LX1FCnZK+xq0BXVU0WiO3Wd+TK/YkWKei2Uf/SnWSYXOUi5SypgVR0Xmtxf4VQVqF+PG6CYg5H5jZqtCOkrXiPe+HE1wyqVFLVmjuHA+ftluAPsZXLNTpIjviIxI6ey2/mgZw5DtRb1iTWsEP0hDwACfRAbP4UAlqko1lPROIuIsORcipXOo9VXVpqfyqGHjmllXO65zKCkyoJ1TSpKVLE5QOgPDOkZXnDB+eIND47jr8DnRoxVAADj8L738w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eevVl2qq; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eevVl2qq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4vFM5d7Yz309y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 17:48:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E6A940168;
	Tue,  3 Feb 2026 06:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C875C116D0;
	Tue,  3 Feb 2026 06:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770101285;
	bh=DBiReB4Q+1e/CMQ4SDJwbTiDxnKQkOOzQpHkhc3T+/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eevVl2qq5esU47MGc2pWXWt1cCWEVoqkzuDgNwlq321XIQssdSpKaZgLszLB9UPh2
	 c2tVHkj/2UriXlqFNq71B4izt9hefFNWBSogNsl7HkQZErVq9mS0ApDn15QudFwXWj
	 JMs4Va7XqXKKi+0O0xrnvxpYHQR2pbk5YDUFLbGORy6YTq3BpkUIaPTGF2AVdajT4R
	 oZRX1ctk3yFC/l1Deg/zkrgR5i93LsvweHWBIXnSYfvAliEuPQ1ad0Hqq47pg5RlGT
	 rdeZ/xXq/CdeBgYxedU2ugJ7qMORWTlTC8YrNk0uALf1Xp2WFl6a1OlVckBpVHQWA4
	 WWCRz9mF7AInA==
Date: Mon, 2 Feb 2026 23:48:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: chleroy@kernel.org, linux-kbuild@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
Message-ID: <20260203064800.GA701088@ax162>
References: <20251123.131330.407910684435629198.rene@exactco.de>
 <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
 <20251123.160941.475051668667578407.rene@exactco.de>
 <20251123.162551.979799191208988118.rene@exactco.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251123.162551.979799191208988118.rene@exactco.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16535-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rene@exactco.de,m:chleroy@kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[exactco.de:url,exactco.de:email,patreon.com:url,system.map:url]
X-Rspamd-Queue-Id: EAADED5727
X-Rspamd-Action: no action

On Sun, Nov 23, 2025 at 04:25:51PM +0100, René Rebe wrote:
> Hey,
> 
> On Sun, 23 Nov 2025 16:09:41 +0100 (CET), René Rebe <rene@exactco.de> wrote:
> 
> > On Sun, 23 Nov 2025 15:57:24 +0100, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> > 
> > > Le 23/11/2025 à 13:13, René Rebe a écrit :
> > > > Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> > > > save/restore symbols, that the linker generates on demand into the
> > > > .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> > > > too. They are needed for the amdgpu in-kernel floating point support.
> > > 
> > > Would have been interested to know with which version of GCC the
> > > problem started.
> > 
> > idk, maybe forever, or at least a decade fo GCC? Most devs probably
> > don't build size optimized, and addtionally we only use in kernel
> > floating point for amdgpu since recently? Should I add Fixes: for the
> > in-kernel FP hash?
> > 
> > > By the way you seem to fix the problem for modules, but does it also
> > > work when amdgpu is in kernel ? I would have expected a need to add
> > > functions in arch/powerpc/lib/crtsavres.S as well, just like following
> > > commits:
> > > 
> > > 8fe9c93e7453 ("powerpc: Add vr save/restore functions")
> > > 7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 bit")
> > > da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc
> > > versions")
> > 
> > idk, I avoid linking that big stuff directly into the kernel and would
> > need to specically test that, too. I guess I go do that now, too, ...
> 
> It appears built-in amdgpu FP somehow magically works for me:
> 
> debug-linux:[linux-6.17]# grep DRM.*AMD .config
> CONFIG_DRM_AMDGPU=y
> CONFIG_DRM_AMDGPU_SI=y
> CONFIG_DRM_AMDGPU_CIK=y
> CONFIG_DRM_AMDGPU_USERPTR=y
> CONFIG_DRM_AMD_ACP=y
> CONFIG_DRM_AMD_DC=y
> CONFIG_DRM_AMD_DC_FP=y
> CONFIG_DRM_AMD_DC_SI=y
> ...
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
>   AR      drivers/gpu/drm/amd/amdgpu/built-in.a
>   AR      drivers/gpu/drm/built-in.a
>   AR      drivers/gpu/built-in.a
>   AR      drivers/built-in.a
>   AR      built-in.a
>   AR      vmlinux.a
>   LD      vmlinux.o
>   GEN     modules.builtin.modinfo
>   GEN     modules.builtin
>   MODPOST vmlinux.symvers
>   CC      .vmlinux.export.o
>   UPD     include/generated/utsversion.h
>   CC      init/version-timestamp.o
>   KSYMS   .tmp_vmlinux0.kallsyms.S
>   AS      .tmp_vmlinux0.kallsyms.o
>   LD      .tmp_vmlinux1
>   NM      .tmp_vmlinux1.syms
>   KSYMS   .tmp_vmlinux1.kallsyms.S
>   AS      .tmp_vmlinux1.kallsyms.o
>   LD      .tmp_vmlinux2
>   NM      .tmp_vmlinux2.syms
>   KSYMS   .tmp_vmlinux2.kallsyms.S
>   AS      .tmp_vmlinux2.kallsyms.o
>   LD      vmlinux.unstripped
>   NM      System.map
>   SORTTAB vmlinux.unstripped
> make[3]: Nothing to be done for 'vmlinux.unstripped'.
>   OBJCOPY vmlinux
> 
> So I guess the patch is good to go after clarifying which kind of
> Fixes: to use?

Was this ever picked up or addressed elswhere?

> > > > MODPOST Module.symvers
> > > > ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > > undefined!
> > > > WARNING: modpost: suppressed 56 unresolved symbol warnings because
> > > > there were too many)
> > > > Signed-off-by: René Rebe <rene@exactco.de>
> > > > ---
> > > > V2: description
> > > > Theoretically for -stable, but no previous commit that broke it.
> > > 
> > > In that case you have to add Cc: stable@vger.kernel.org
> > > Add indeed it is likely a gcc upgrade that broke it, not a previous
> > > commit.
> > 
> > Should I then simply use enabling amdgpu dc_fp and in-kernel FP as the
> > breaking commit for Fixes:?
> > 
> > Thanks!
> > 
> > 	René
> > 
> > > > ---
> > > >   scripts/mod/modpost.c | 4 ++++
> > > >   1 file changed, 4 insertions(+)
> > > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > > index 47c8aa2a6939..133dfa16308a 100644
> > > > --- a/scripts/mod/modpost.c
> > > > +++ b/scripts/mod/modpost.c
> > > > @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info
> > > > *info, const char *symname)
> > > >   		/* Special register function linked on all modules during final link of
> > > >   		.ko */
> > > >   		if (strstarts(symname, "_restgpr0_") ||
> > > >   		    strstarts(symname, "_savegpr0_") ||
> > > > +		    strstarts(symname, "_restgpr1_") ||
> > > > +		    strstarts(symname, "_savegpr1_") ||
> > > > +		    strstarts(symname, "_restfpr_") ||
> > > > +		    strstarts(symname, "_savefpr_") ||
> > > >   		    strstarts(symname, "_restvr_") ||
> > > >   		    strstarts(symname, "_savevr_") ||
> > > >   		    strcmp(symname, ".TOC.") == 0)
> > > 
> > 
> > -- 
> > René Rebe, ExactCODE GmbH, Berlin, Germany
> > https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
> 
> -- 
> René Rebe, ExactCODE GmbH, Berlin, Germany
> https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

