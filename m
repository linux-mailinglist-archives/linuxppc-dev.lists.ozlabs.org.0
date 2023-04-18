Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 896CF6E6C17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 20:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1CCQ3DScz3fS5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 04:30:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N6Ua9loz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N6Ua9loz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1CBb2tBzz3f5N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 04:29:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E01E62F6B;
	Tue, 18 Apr 2023 18:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A74FC433D2;
	Tue, 18 Apr 2023 18:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681842581;
	bh=8EF/b6rFEqY18fb5qJviLJjMaViEY5I0RMFUi25++jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6Ua9lozDUX+VtIi5y1RT1zzlKZd5EN9A+VUZna09GR6kyCpeZOJ7PxApwwBCdlLq
	 YJmVFOjM7+dx2foTIuJm+Ymm+jln1k+s7SnRHzRrqW4JDNLGjgyI4NCMTHt34N7Ug1
	 A66IY3AY3mwEWc1l55FV7O2pbDamDBO4Xi+aAxB2sn+eJeWJYtThYJWzbRjqUdQ1SS
	 NCLj6PkUPPTyla8S/0j1jyUJtYIgKxfGFbWkdzUtt/j/ludJE1VTvo8pcNZowd0YST
	 mM9nge6LlHx6LvWqVgkcuyTnWio2jd0V7d2CwkkpJqqnJi5ek7qEenrbFop2tOQL6Q
	 bEjRAMUpdK1Yg==
Date: Tue, 18 Apr 2023 11:29:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <20230418182938.GA2066635@dev-arch.thelio-3990X>
References: <20230412112213.59365041@canb.auug.org.au>
 <20230413184725.GA3183133@dev-arch.thelio-3990X>
 <2d69ba0a-b12f-4bd1-83c5-d7c01ceec4e8@sirena.org.uk>
 <20230418182145.GA1392657@dev-arch.thelio-3990X>
 <57051c9d-aba4-4c47-bdaf-f7230dbab69a@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57051c9d-aba4-4c47-bdaf-f7230dbab69a@sirena.org.uk>
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

On Tue, Apr 18, 2023 at 07:25:00PM +0100, Mark Brown wrote:
> On Tue, Apr 18, 2023 at 11:21:45AM -0700, Nathan Chancellor wrote:
> > On Fri, Apr 14, 2023 at 05:55:10PM +0100, Mark Brown wrote:
> 
> > > Done.
> 
> > Thanks a lot, sorry for not saying it sooner! It looks like this
> > regressed in next-20230417 and next-20230418 though.
> 
> Someone sent a mail saying they thought they'd fixed the DRM tree - is
> that not the case?

Does not seem like it:

$ git show -s --format='%h ("%s")'
67d5d9f013d6 ("Add linux-next specific files for 20230418")

$ git grep DRM_AMD_DC_DCN
drivers/gpu/drm/amd/display/Kconfig:    select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))

Cheers,
Nathan
