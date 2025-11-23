Return-Path: <linuxppc-dev+bounces-14432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E09C7E28A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Nov 2025 16:25:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dDt7k50ptz2yvd;
	Mon, 24 Nov 2025 02:25:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763911538;
	cv=none; b=Ar2WYAIu9XcTyx1Ef7Yol8boHmeIqtB8kRMIRHBII/4gDzlTbDZ/NZfRup3cjsQTlzDWmP38bYYQwYkdB8KdoDJofK+xBLXAvvriO2KUJzNwJsuf5D4zKywz5RqULRzVNK53abvf4fhkWxvvhxJZisA3bkt3ykCdYarqdCUJ7zPHYJ2q/iBRvOQBYlxpwmK8+yLjPZClGUzPv4iO5dvXRPH7U71+t8YgIMPRt3gH2dRPaYb8u0wGIR4LWtJc29C82B/leOFFmPHL+psQa2uEBI4dD/mSamylegjTBpemeRnV/Pz0mwgh50PyOTb2lSFOMNi445g7FCHA62ZRdYz0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763911538; c=relaxed/relaxed;
	bh=aUc3P9ysPZDm92XYCdc8+nGHGL1i/S6DJc77k8uuxBg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=m5EqRSdA8wczFlA9R2rysb0KWvAOuIeZ4Q8aJ8ZeyEC0f/F4Ge0NI0OVmN0mkyGPSHTbWjZGPFK59cMwhr56LHC8lk3hQIxz9ydoTSvWDenRIlofJcExLznP1+qwqOTR0dk9Jn0Y3SeXpNe5DlzfLPq0HlpslTARSsJfMiB2GH/ANc/sjGlWUvuQUEEpP8OUSDC0J4hF6eMgavp2mkF36ivvI+jV5VIuRurFAzSwKxgG44SgtT556ozTS1v5eKG4GHz4l37jzLyXIuhsrZwz0RbkmR7G+fBhv3tvAdFFjPvJ58SUxsY9PCvz41kVi1w8iMlxXiGJPVy21Rtq1NjtgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=Tpb/gHw0; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=Tpb/gHw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dDt7j4hGvz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 02:25:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aUc3P9ysPZDm92XYCdc8+nGHGL1i/S6DJc77k8uuxBg=; b=Tpb/gHw0qdwL8dHvFhQJ9pNDk3
	rUFL1jOmjY5harVw1Vav6f/OyEpEssXvatrnQqvVi+Plk5FUtCvgsAv2aZmDxfPHs3TPYVWpvnNLv
	GrEHJbyzZkJXcmO6ccfPNIG4VFIwTsTsIH0MURlRj4LZS1JkZ0MjevIJVp/y+Qt3Gz4mOdf6nMloy
	izrzcPAhqaxLrJUUpWIErT4UoMM47X5/s6bl6f++KlPWkwMVGftxhPwkranCadW4+xF4v38Eggk9X
	/qsX6Y7ZVcMQdWNAvubtjc4IMfdM3ZwnXHiy75+fVlrlQh9f4BXzOAH7RGOBMBcM8zNBczZ8rEsEM
	pQAxzYcA==;
Date: Sun, 23 Nov 2025 16:25:51 +0100 (CET)
Message-Id: <20251123.162551.979799191208988118.rene@exactco.de>
To: chleroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <20251123.160941.475051668667578407.rene@exactco.de>
References: <20251123.131330.407910684435629198.rene@exactco.de>
	<d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
	<20251123.160941.475051668667578407.rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
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
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hey,

On Sun, 23 Nov 2025 16:09:41 +0100 (CET), René Rebe <rene@exactco.de> wrote:

> On Sun, 23 Nov 2025 15:57:24 +0100, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> > Le 23/11/2025 à 13:13, René Rebe a écrit :
> > > Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> > > save/restore symbols, that the linker generates on demand into the
> > > .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> > > too. They are needed for the amdgpu in-kernel floating point support.
> > 
> > Would have been interested to know with which version of GCC the
> > problem started.
> 
> idk, maybe forever, or at least a decade fo GCC? Most devs probably
> don't build size optimized, and addtionally we only use in kernel
> floating point for amdgpu since recently? Should I add Fixes: for the
> in-kernel FP hash?
> 
> > By the way you seem to fix the problem for modules, but does it also
> > work when amdgpu is in kernel ? I would have expected a need to add
> > functions in arch/powerpc/lib/crtsavres.S as well, just like following
> > commits:
> > 
> > 8fe9c93e7453 ("powerpc: Add vr save/restore functions")
> > 7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 bit")
> > da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc
> > versions")
> 
> idk, I avoid linking that big stuff directly into the kernel and would
> need to specically test that, too. I guess I go do that now, too, ...

It appears built-in amdgpu FP somehow magically works for me:

debug-linux:[linux-6.17]# grep DRM.*AMD .config
CONFIG_DRM_AMDGPU=y
CONFIG_DRM_AMDGPU_SI=y
CONFIG_DRM_AMDGPU_CIK=y
CONFIG_DRM_AMDGPU_USERPTR=y
CONFIG_DRM_AMD_ACP=y
CONFIG_DRM_AMD_DC=y
CONFIG_DRM_AMD_DC_FP=y
CONFIG_DRM_AMD_DC_SI=y
...
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
  AR      drivers/gpu/drm/amd/amdgpu/built-in.a
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  GEN     modules.builtin.modinfo
  GEN     modules.builtin
  MODPOST vmlinux.symvers
  CC      .vmlinux.export.o
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  KSYMS   .tmp_vmlinux0.kallsyms.S
  AS      .tmp_vmlinux0.kallsyms.o
  LD      .tmp_vmlinux1
  NM      .tmp_vmlinux1.syms
  KSYMS   .tmp_vmlinux1.kallsyms.S
  AS      .tmp_vmlinux1.kallsyms.o
  LD      .tmp_vmlinux2
  NM      .tmp_vmlinux2.syms
  KSYMS   .tmp_vmlinux2.kallsyms.S
  AS      .tmp_vmlinux2.kallsyms.o
  LD      vmlinux.unstripped
  NM      System.map
  SORTTAB vmlinux.unstripped
make[3]: Nothing to be done for 'vmlinux.unstripped'.
  OBJCOPY vmlinux

So I guess the patch is good to go after clarifying which kind of
Fixes: to use?

Thanks!
       René

> > > MODPOST Module.symvers
> > > ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > WARNING: modpost: suppressed 56 unresolved symbol warnings because
> > > there were too many)
> > > Signed-off-by: René Rebe <rene@exactco.de>
> > > ---
> > > V2: description
> > > Theoretically for -stable, but no previous commit that broke it.
> > 
> > In that case you have to add Cc: stable@vger.kernel.org
> > Add indeed it is likely a gcc upgrade that broke it, not a previous
> > commit.
> 
> Should I then simply use enabling amdgpu dc_fp and in-kernel FP as the
> breaking commit for Fixes:?
> 
> Thanks!
> 
> 	René
> 
> > > ---
> > >   scripts/mod/modpost.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index 47c8aa2a6939..133dfa16308a 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info
> > > *info, const char *symname)
> > >   		/* Special register function linked on all modules during final link of
> > >   		.ko */
> > >   		if (strstarts(symname, "_restgpr0_") ||
> > >   		    strstarts(symname, "_savegpr0_") ||
> > > +		    strstarts(symname, "_restgpr1_") ||
> > > +		    strstarts(symname, "_savegpr1_") ||
> > > +		    strstarts(symname, "_restfpr_") ||
> > > +		    strstarts(symname, "_savefpr_") ||
> > >   		    strstarts(symname, "_restvr_") ||
> > >   		    strstarts(symname, "_savevr_") ||
> > >   		    strcmp(symname, ".TOC.") == 0)
> > 
> 
> -- 
> René Rebe, ExactCODE GmbH, Berlin, Germany
> https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

