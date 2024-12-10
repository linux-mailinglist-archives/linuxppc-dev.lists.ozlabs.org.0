Return-Path: <linuxppc-dev+bounces-3908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE0B9EB206
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 14:36:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y70B039D8z2yXs;
	Wed, 11 Dec 2024 00:36:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733837768;
	cv=none; b=elMjGZioWiaYTnVhm1dB/yH7YOsBF4f8vCy4ZNLqB3kB9tWPj2DZBigKr1n7BZFp5AnsCAvfxeq873GwydGWPZsUBLiQwXebjlUGo0QOvoYjhrvjvJ7F1UGajP7a8f9UIyx9OCOPekfU3rwRkSp54WpJJE+MEJtKnOFYdTs4xl7rc3JP1Ve55MIerzX8T9A+dFDuKgVUuVzeiHykrVRqUbaoQUPNhsJBypdvOUPGkTka9s5x4NetCDFe4zk/hthihbDjwJL/1ShufbQZGe/DvoWWg7IIes+6sqfaUEM08W/GkVET7+ip6k2/JAgHuWiJha6DfhlLakJLmtfD6bdJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733837768; c=relaxed/relaxed;
	bh=DlE3f4kgUF1y5PhPQ1O0KJW0qCJeZnyhnzjRB1pHd9s=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jyLSI6yPW9ZmT02Jg+fx9/ypdg8fPW5kxf8OwGxy50Ai8eGTMT7NCK2XbY5xKLust79jqT+8Yoa+PGIoGXTO9ELyjYIV9zwvNckD+VHlo7il/qp2O9MMhV/m2GCuE024NNws3FZXxNuDKRRgWuVTIiWTkojDFmJ9HhFPVfgYpXBRehilUSKGDXNMI9cK3G0LunzDjOLRbsEBB22C/tdCH2TfUKp3MXUfe0enw04/uS+21QTcJiROfPeLS1V66iIPs0Td0kI2MRKM/fV8OvyBRxtl11utPDWRotdUKnYhv58UCoYfSoiIhFZeUch6iJIBdgWYYBlO1Jco4Ywe5Q+8HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nt6Lu3/d; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nt6Lu3/d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y709v18k9z2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 00:36:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A33ADA40693;
	Tue, 10 Dec 2024 13:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD34EC4CED6;
	Tue, 10 Dec 2024 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733837758;
	bh=b2I0+eKk4iK9OnVnulSzlYA0NLcSmfUjvE0er6c4iww=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=nt6Lu3/dIXv//XgupGVTniobw37MR1F2itWDNVH8bY13QPrlj9SUF0qTMBS/3GRav
	 WBV+isYER+30vTCC4Gtt3lRAFjlpJROLjV0ZCtaFY1SS+PK/pAN9oLC7eUnJwEhP+W
	 iLBvCFRpArPQzIWjymSS1xunV3pXjD3VeWbOg7PBzALqbJIg2nB7tyyF4y2+PPGsO4
	 MOxcO3EmsqRAqEjiwbDH78Gwk6CGDUULRaKZptjFQPipQZRwcXHnRrMMjFBPynWe86
	 lhMJKb2q0h6G8WtoZJAwERUnHRTGRnxqhDToi8DmsgSbg8fyOCerbcgmZKaZdky/yk
	 3Jzazp9hkDi4g==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20241126115440.3929061-1-chancel.liu@nxp.com>
References: <20241126115440.3929061-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 0/4] Add function to constrain rates
Message-Id: <173383775650.46965.9428255940556546352.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:35:56 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 26 Nov 2024 20:54:36 +0900, Chancel Liu wrote:
> Platforms like i.MX93/91 only have one audio PLL. Some sample rates are
> not supported. If the PLL source is used for 8kHz series rates, then
> 11kHz series rates can't be supported. Add common function to constrain
> rates according to different clock sources.
> 
> In ASoC drivers switch to this new function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: fsl_utils: Add function to constrain rates
      commit: 820bcaeb1ff5705ba907563e554f17d0deecc3fa
[2/4] ASoC: fsl_micfil: Switch to common sample rate constraint function
      commit: daf7a173fc7c4b652f3fe69d3b5aa520976a7d63
[3/4] ASoC: fsl_xcvr: Add sample rate constraint
      commit: b622b677d255b41cbfce20b66535723933a6b640
[4/4] ASoC: fsl_sai: Add sample rate constraint
      commit: 4edc98598be43634f87af5d3876ebec6c274d2cb

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


