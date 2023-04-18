Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA26E6C04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 20:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1C2Q2tthz3f6W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 04:22:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eC6qMqdw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eC6qMqdw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1C1W55jWz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 04:21:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 584CA62C35;
	Tue, 18 Apr 2023 18:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27916C433D2;
	Tue, 18 Apr 2023 18:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681842107;
	bh=fMVjHMGHdpVVTqAnb5vzPaJx9vDQalTucSaWG0SBO9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eC6qMqdwtVcKihRXLrTBp7pb5nBEwR95sbutowsfBcTGq858TqLYX+G81H6OmVhFJ
	 eGeF16z1nV5TlFf7Z0ihVovLmnRU+LfNcLkrjupfE1fAZKExjS4yUbfBkHE09mBZmb
	 1Qt4BosAvscnQPLKsdH8+4Jjb//CEwDv8zpx4gbFYHUGJC02Olo1roUwR0+7NvzSXv
	 uSeqtwk0OY4ViKcMfZbDPQblFwA7AWWOu2bULXCBcDZ5p0evafPCFI7BC5BHEZPgHQ
	 qLCITRmBmR1CobAeAUCKMZ4fEVPesa1yanHa/FB4YzXYThssgcHDGK6PxDUqG2xVxQ
	 rYfYc9dKgkKCg==
Date: Tue, 18 Apr 2023 11:21:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <20230418182145.GA1392657@dev-arch.thelio-3990X>
References: <20230412112213.59365041@canb.auug.org.au>
 <20230413184725.GA3183133@dev-arch.thelio-3990X>
 <2d69ba0a-b12f-4bd1-83c5-d7c01ceec4e8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d69ba0a-b12f-4bd1-83c5-d7c01ceec4e8@sirena.org.uk>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 14, 2023 at 05:55:10PM +0100, Mark Brown wrote:
> On Thu, Apr 13, 2023 at 11:47:25AM -0700, Nathan Chancellor wrote:
> > On Wed, Apr 12, 2023 at 11:22:13AM +1000, Stephen Rothwell wrote:
> 
> >  	select SND_HDA_COMPONENT if SND_HDA_CORE
> >  	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> > -	select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> > +	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> >  	help
> >  	  Choose this option if you want to use the new display engine
> >  	  support for AMDGPU. This adds required support for Vega and
> 
> > Please consider resolving this in a future -next update, I was rather
> > surprised that my AMD test machine's graphical output was not working
> > until I noticed the configuration difference :)
> 
> Done.

Thanks a lot, sorry for not saying it sooner! It looks like this
regressed in next-20230417 and next-20230418 though.

Cheers,
Nathan
