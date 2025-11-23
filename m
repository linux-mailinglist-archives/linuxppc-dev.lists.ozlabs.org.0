Return-Path: <linuxppc-dev+bounces-14431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC6AC7E244
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Nov 2025 16:09:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dDsn96Y2Fz2yvd;
	Mon, 24 Nov 2025 02:09:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763910573;
	cv=none; b=SJiBP1IaQLW19j6OqmcWRveevIXuQ0txYivRZHFTPBb9QCNwlSHltwM/HGMZH47F9ZKvIfnI391+eJPQY7p/rQPEyrSweEBm7TM4mpTPv2KhEH/AzCPPEIWOAphrrB/NMBJHd5hpbNXcm8lSec4sAxMyYXHBrn3JGvdEHSu3KeuCJ5K2VQtJJW3GKfFEh6WP4z157qRFwVqzBQKKSav54vnbj0kbaNpKa0ahHTHcwfpW64r/sVLlSB4BnTf5wjZQyR7dvioDc6K5kq3rB2A9Xavp9fae0QjVM0KaX1j7zsmrKC7Tlj+IC3e1P2VyoOtGpcqO2LflkoTKGZ/WP0v1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763910573; c=relaxed/relaxed;
	bh=pYnxXGxePcmKdMcZ0fCAr8Y5GRyhHX6Qfr662/zdMhQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Nfsy9/qkM4ZS8Tj7t8WfiRSpdlmK50bylLnc2X3GbnNNDZ1tAPkOOtD5zmr/XYTpS4Flsup2jGZIwwN7J7UXfiAHf3iIFgIhoj6GwiGMfogmSO/PSHcTz/JEjLa2xItDrdSNUk1iZrySGl+zvL0lf9gOrrtwgx599yhcTxwc9H9lthYWKpfB0I5SPkIePFBQ3NWGN5+HPwuefL+WiUzrv9QLi3F3T9ItPkHvu8qB/Zijd1QSgwSwZoaZFrBZNbyPv/WssNPdOmzsMWSoPG297+GRN17wVQIYdR/fVotomkh6cxfm7ef8QDQdu0+AnoLkKEYi/NXMIeB7vI5YLTSn0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=VlkQBt2c; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=VlkQBt2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dDsn66x9Hz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 02:09:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pYnxXGxePcmKdMcZ0fCAr8Y5GRyhHX6Qfr662/zdMhQ=; b=VlkQBt2c+utwInwyKCitudKBuA
	QriOyXsszVm6wezL4cIGzhNo8IovQGyXhl4cQLsHcTOPBNFSFq9SCr03R2YsC23A+q1op56S1d+vI
	RGOpETaemVEchbl8k5DPwuLme4sofAVHOsBtOeCxdWFaHVQC+OrfS42nX1+s4lK0Tc0GT+ckBWyKf
	eSZMOhfpYNIJ7dH+WQNNpuF7iERdvd6u/LEKjxKKd7L617+vX1laImWTe/VD7w82zewl74FMTPY0P
	StygOieVpHi/dZ33tbD//lQk+fjIECnGvMbrZ7CyJkUMoRk9kTkNZTXeR2q2edWyoQOC3ZnGZHpa6
	OukzIU7g==;
Date: Sun, 23 Nov 2025 16:09:41 +0100 (CET)
Message-Id: <20251123.160941.475051668667578407.rene@exactco.de>
To: chleroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
References: <20251123.131330.407910684435629198.rene@exactco.de>
	<d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
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

Hi,

On Sun, 23 Nov 2025 15:57:24 +0100, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> Le 23/11/2025 à 13:13, René Rebe a écrit :
> > Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> > save/restore symbols, that the linker generates on demand into the
> > .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> > too. They are needed for the amdgpu in-kernel floating point support.
> 
> Would have been interested to know with which version of GCC the
> problem started.

idk, maybe forever, or at least a decade fo GCC? Most devs probably
don't build size optimized, and addtionally we only use in kernel
floating point for amdgpu since recently? Should I add Fixes: for the
in-kernel FP hash?

> By the way you seem to fix the problem for modules, but does it also
> work when amdgpu is in kernel ? I would have expected a need to add
> functions in arch/powerpc/lib/crtsavres.S as well, just like following
> commits:
> 
> 8fe9c93e7453 ("powerpc: Add vr save/restore functions")
> 7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 bit")
> da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc
> versions")

idk, I avoid linking that big stuff directly into the kernel and would
need to specically test that, too. I guess I go do that now, too, ...

> > MODPOST Module.symvers
> > ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > WARNING: modpost: suppressed 56 unresolved symbol warnings because
> > there were too many)
> > Signed-off-by: René Rebe <rene@exactco.de>
> > ---
> > V2: description
> > Theoretically for -stable, but no previous commit that broke it.
> 
> In that case you have to add Cc: stable@vger.kernel.org
> Add indeed it is likely a gcc upgrade that broke it, not a previous
> commit.

Should I then simply use enabling amdgpu dc_fp and in-kernel FP as the
breaking commit for Fixes:?

Thanks!

	René

> > ---
> >   scripts/mod/modpost.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 47c8aa2a6939..133dfa16308a 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info
> > *info, const char *symname)
> >   		/* Special register function linked on all modules during final link of
> >   		.ko */
> >   		if (strstarts(symname, "_restgpr0_") ||
> >   		    strstarts(symname, "_savegpr0_") ||
> > +		    strstarts(symname, "_restgpr1_") ||
> > +		    strstarts(symname, "_savegpr1_") ||
> > +		    strstarts(symname, "_restfpr_") ||
> > +		    strstarts(symname, "_savefpr_") ||
> >   		    strstarts(symname, "_restvr_") ||
> >   		    strstarts(symname, "_savevr_") ||
> >   		    strcmp(symname, ".TOC.") == 0)
> 

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

