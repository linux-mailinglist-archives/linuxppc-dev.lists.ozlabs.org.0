Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24E6E28CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 18:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyjJS4TkJz3fYN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 02:56:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FVajcu1o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FVajcu1o;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyjHW5ZQXz3c92
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 02:55:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0B3060EDF;
	Fri, 14 Apr 2023 16:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420DAC433EF;
	Fri, 14 Apr 2023 16:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681491316;
	bh=zfi8iWx8VfO8MKmwceMa3D8m/IBfuYFucHF0zFsFtsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVajcu1oTL46z+SSqTwPGvOgQzFx9sbMpoE7RPwos54i1smcd6dDj6o6YgElRPuj1
	 r4l6bzlP8SxQzt7F04gWAhJYITNCNh+p9XgdmxfRezY/kD4TMlQ2xLYh410ZBrELhC
	 M98gC0DpUgRf34FFb1zi5lOwhOHjxSPu2zdLEV/5Mlypc7dES4sqw1Rpaz8t9JfM7S
	 xBiLhv9p+iKEh//u0erf7JZShNINTsT7XfDEJ7RD82A4IqIvjOmWAlnOkPcvvKVdm+
	 CE4fcNOVkW1z1NtxgqevJYvkN3eaLVtG2P8UDlULrlDdSUqAah+TW7WgRZveiy51Uz
	 Mr/1Lj0ZFKUSw==
Date: Fri, 14 Apr 2023 17:55:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <2d69ba0a-b12f-4bd1-83c5-d7c01ceec4e8@sirena.org.uk>
References: <20230412112213.59365041@canb.auug.org.au>
 <20230413184725.GA3183133@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nWCn96Kw4rEEQprW"
Content-Disposition: inline
In-Reply-To: <20230413184725.GA3183133@dev-arch.thelio-3990X>
X-Cookie: One Bell System - it works.
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


--nWCn96Kw4rEEQprW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 13, 2023 at 11:47:25AM -0700, Nathan Chancellor wrote:
> On Wed, Apr 12, 2023 at 11:22:13AM +1000, Stephen Rothwell wrote:

>  	select SND_HDA_COMPONENT if SND_HDA_CORE
>  	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> -	select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> +	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>  	help
>  	  Choose this option if you want to use the new display engine
>  	  support for AMDGPU. This adds required support for Vega and

> Please consider resolving this in a future -next update, I was rather
> surprised that my AMD test machine's graphical output was not working
> until I noticed the configuration difference :)

Done.

--nWCn96Kw4rEEQprW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5hW4ACgkQJNaLcl1U
h9DwlQf+PqBzMRJoY9ltIo/EurRsBEgmKU8U5pdAjZ5Bp4l3Ict2GB7CwdgoLxU1
l1VZa/y5bGqzl42FU1e+DrPw9Y2nGaeg8JqCfrYvpX+je/0L2RL19oKhRnINY8yr
5ErDb4PmXDhYSZG7d/PR22uYsTchKjFxIFb4LF5VFZneOWVDbn2dZwhH5YYP41HS
Clp/4KSzbNipmVxIlypdZkK2j0YQc3/W1nNFlFtplnMYoqFfZFp9sU6xrWbgrILN
fxoSticRDVX/A59iQ0u55B+okIAwJ1OCpbjrm3z895Smhv+jdTwX03QDyqPSmnGV
YnTIs3ASOVNZHTCHSvtV969K7y4kJw==
=cnQC
-----END PGP SIGNATURE-----

--nWCn96Kw4rEEQprW--
