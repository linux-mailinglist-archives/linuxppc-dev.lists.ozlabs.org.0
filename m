Return-Path: <linuxppc-dev+bounces-14885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F0ACCD20C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 19:18:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXJn43JvGz2yFg;
	Fri, 19 Dec 2025 05:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766081880;
	cv=none; b=VPMeR3bAVJoTsDP3rkJmxWtym+jCzhN51QvHIUFRdDXwF8S3uImiLa0NpepDZY3y6GlK6JW4B6YF+NYGgOJua0t5maGmc4C9yKaplSr8HrR7szbIj7S82NJFXFM+fMjcp883d2D11dxxqKEz9sC7SOdhs0MVZF4UjnrUkjAw3O4SSJO/7pBGEu5M/OD4sobaDUtmZxf7CIDz6EVKkgMZK+SST+S822r7KpbNm4WfLC0srmvRfEgxrnLbg6I5dBwlSWSnI5Vvdpl7xApHwS3A8DCJMY7Ee2qxuz1x0IGM9amPKi+rLu6eeRHVwoPGOoFur1fyljA+ChigEZFHYBaThg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766081880; c=relaxed/relaxed;
	bh=JZbEZLltgSx+3+la4R8/eGRr+cuu6iTQmCVeHjfkkO8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EI1i7TnmMpr8hqPa9SvCKbl7rvjTEFDpwfZJBzAltscJe12Sbhc9AMXFlvDWupJ9oB6J8W3t4fpHEn5oGc/5FGZIU4vakudgg1CR+3kvkhFDZMgwE2ABV3imBJmGi6w2Tp/SD+mGBJCekUlCR+Qr2WA3bk6pG2z31CvDG6HpheRFkrKHzwUKRNDRtXh659yjBhME6ip7h0wQ1eawZPzyAKJhAP+iSyE9V2Zh1WXEslCXCBdG9vnIcj4RGko/+DCzIyZw3MGViVbPlfMi+vl2jhXmWxn5KJCnnXN53np/jA/eImfxa0C6rPkJKAywIfDUDJZl3oh9MXvPVzg1SGT+hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V9MG8j3m; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V9MG8j3m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXJn36jbnz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 05:17:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6953B60149;
	Thu, 18 Dec 2025 18:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A97C4CEFB;
	Thu, 18 Dec 2025 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081877;
	bh=pWxzxV2ERpNbrD9L8kun4z2fQ/h+mC0aWXfZj1yYrPQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=V9MG8j3mb6EY3/o7CNWxaul3cOszPImUcKNbIxbU5vAHTZga4UXlQZsCUcNeFyO56
	 bg/26ZU7OBbsnAgL64+yHdBriENsXHAJeLWO8wmIVwqAgOgBc8KgLN/bMTithUftfR
	 lQGJgXzO7i7RFsr8tV2+fhH1v9yWEfIw6Ln4vgD6U2bsrralKt2ZuyDDAqz6Sn6/hs
	 tNDurw4NV9FWQGuKsmeHWclM5iangoulyqSv7dBNmArVKctQRyAw/Fw8NAOGEYjAbs
	 n/KNExArBNizQ8D3LAYoyJ9cyTe2KdCMBDEk8KPU+KtwrbANUF+Bq7fhLwAPkGlMlZ
	 GItvzLME36mQw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20251216071656.648412-1-chancel.liu@nxp.com>
References: <20251216071656.648412-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Use of_property_present() for
 non-boolean properties
Message-Id: <176608187468.237766.15246617240590815373.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:54 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 16 Dec 2025 16:16:56 +0900, Chancel Liu wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> Otherwise there'll be kernel warning:
> [   29.018081] OF: /sound-wm8962: Read of boolean property 'hp-det-gpios' with a value.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Use of_property_present() for non-boolean properties
      commit: fa43ab13c59f4c047c479673792ed033ab567c65

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


