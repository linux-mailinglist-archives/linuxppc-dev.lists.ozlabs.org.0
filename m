Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B506D1E5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 12:54:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pnxy24tdhz3bTc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 21:54:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AbBH1oq3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pnxx82PYBz3cJF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 21:54:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AbBH1oq3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pnxx241sXz4x4r;
	Fri, 31 Mar 2023 21:53:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680260040;
	bh=8QUsIUkBAgfdYfmbh//kvQTjF8lIKNNdvGDKhDBFuWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AbBH1oq3KYd9qxnIlJOo0+7fIFnlw+pTGY+aW7PSFh5mdL880GrQYw72MEllwI+Fu
	 Sn/TjtOyvGg7OR3BUbipFCYwSA5Yf2nP4FH3IDESzrgs1WW3lIHW1brLI1C+T0vdqO
	 w7h94bj6QCeXfEHnv+HrsqMLGutoz7KwFzBsHbEUdhElNbDkqKiA30SW8SSCFAuM6A
	 kCRKf/NqhSAmytND1L897CKg7WHSw2yq8uKMNZCp3nCncYacK6GlmMPLeKXd+O77Od
	 hcyThV0TzQe1Jkalx5JTBxzOOc3L9GJwA/dRzLUW+2txepCtH9t9nPyoIkvQ9bZXyL
	 kgIrl6k5DV6HA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Kolesa <daniel@octaforge.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] drm/amdgpu: drop the long-double-128 powerpc check/hack
In-Reply-To: <dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com>
References: <dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com>
Date: Fri, 31 Mar 2023 21:53:57 +1100
Message-ID: <87o7o9b396.fsf@mpe.ellerman.id.au>
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
Cc: dan@danny.cz, alexdeucher@gmail.com, tpearson@raptorengineering.com, amd-gfx@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Daniel Kolesa" <daniel@octaforge.org> writes:
> Commit c653c591789b ("drm/amdgpu: Re-enable DCN for 64-bit powerpc")
> introduced this check as a workaround for the driver not building
> with toolchains that default to 64-bit long double.
...
> In mainline, this work is now fully done, so this check is fully
> redundant and does not do anything except preventing AMDGPU DC
> from being built on systems such as those using musl libc. The
> last piece of work to enable this was commit c92b7fe0d92a
> ("drm/amd/display: move remaining FPU code to dml folder")
> and this has since been backported to 6.1 stable (in 6.1.7).
>
> Relevant issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2288

I looked to pick this up for 6.3 but was still seeing build errors with
some compilers. I assumed that was due to some fixes coming in
linux-next that I didn't have.

But applying the patch on v6.3-rc4 I still see build errors. This is
building allyesconfig with the kernel.org GCC 12.2.0 / binutils 2.39
toolchain:

  powerpc64le-linux-gnu-ld: drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.o uses hard float, arch/powerpc/lib/test_emulate_step.o uses soft float
  powerpc64le-linux-gnu-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.o

etc.

All the conflicts are between test_emulate_step.o and some file in drivers/gpu/drm/amd/display/dc/dml.

So even with all the hard-float code isolated in the dml folder, we
still hit build errors, because allyesconfig wants to link those
hard-float using objects with soft-float objects from elsewhere in the
kernel.

It seems like the only workable fix is to force the kernel build to use
128-bit long double. I'll send a patch doing that.

cheers
