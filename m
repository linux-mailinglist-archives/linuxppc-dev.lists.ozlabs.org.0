Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2136ECB9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 13:52:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4k5L488jz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 21:52:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VoP7HDp8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4k4S0gzJz2ypJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 21:51:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VoP7HDp8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q4k4Q2cmLz4x84;
	Mon, 24 Apr 2023 21:51:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682337094;
	bh=KBQL8ssMthEHvYa5VPiSMs/LCpDXnzoIeuAfczo++Wk=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=VoP7HDp8HB4SCi0gEWSiahq1b/7MV/1HwUEH+OlIrekgbc1ZRlfgkHoW+nu+3GVG9
	 1KfeE8n463Mq+HObgJARtJqK+UBKVsOGHyDb8NyR3RBmJs1Cc2LPfooEFn0Ipz3abA
	 BejkuFWPr0ZAuTAPBHvGogrlfJhjLqgB1oidF7yxdWKDi7eOVqZ4vK3U7Kj/bw7kAf
	 oCgmFBBm4mHeKxDJ7I7p5RR/n7ztqSMsCKdt+1wVp/gWRmoQVqE7DxWV0FjQyUseC3
	 kn++9p4u+OcyN0Rju+tuqiRzWt9toKQvbypI8TcMP4Ljzqn8twPgJuSBp0NUocYO9A
	 4rAY1Bk/OMeaQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Harry Wentland
 <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, kernel-janitors
 <kernel-janitors@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: In-flight collision: DRM_AMD_DC_DCN renaming
In-Reply-To: <CAKXUXMziSWC9oGVQxCPs6U5GsnuA2KbKsobj1Feo_eNUn3e4dg@mail.gmail.com>
References: <CAKXUXMziSWC9oGVQxCPs6U5GsnuA2KbKsobj1Feo_eNUn3e4dg@mail.gmail.com>
Date: Mon, 24 Apr 2023 21:51:30 +1000
Message-ID: <87ildlzef1.fsf@mail.concordia>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lukas,

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> Dear Michael, dear Harry, dear Alex,
>
> The commit 4652ae7a51b7 ("drm/amd/display: Rename DCN config to FP")
> renames config DRM_AMD_DC_DCN to config DRM_AMD_DC_FP. The concurrent
> commit 78f0929884d4 ("powerpc/64: Always build with 128-bit long
> double") overrides the renaming change for the select in config
> DRM_AMD_DC, and this leads to selecting the non-existent
> DRM_AMD_DC_DCN.

The powerpc commit doesn't override the name change, in the powerpc tree
where it's applied the name change hasn't happened yet, see the diff:

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 0c9bd0a53e60..e36261d546af 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128 || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and


The problem is that the resolution of the merge conflict in linux-next
is incorrect, it takes the powerpc change without taking into account
the rename from the amdgpu commit.

The correct resolution is:

diff --cc drivers/gpu/drm/amd/display/Kconfig
index e36261d546af,06b438217c61..000000000000
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@@ -8,7 -8,7 +8,7 @@@ config DRM_AMD_D
        depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
        select SND_HDA_COMPONENT if SND_HDA_CORE
        # !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-       select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
 -      select DRM_AMD_DC_FP if (X86 || PPC64 || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
++      select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
        help
          Choose this option if you want to use the new display engine
          support for AMDGPU. This adds required support for Vega and


(Note that 4652ae7a51b7 incorrectly changed PPC_LONG_DOUBLE_128 to plain
 PPC64, which is why PPC_LONG_DOUBLE_128 doesn't appear in the diff above.)

Possibly the merge resoulution can be fixed in linux-next.

And ultimately the fix is for Linus to do the proper merge resolution
when he eventually merges the two trees.

cheers
