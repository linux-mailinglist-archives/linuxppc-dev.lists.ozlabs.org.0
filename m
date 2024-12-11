Return-Path: <linuxppc-dev+bounces-3995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D909ED752
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 21:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7nVh61Brz30Mn;
	Thu, 12 Dec 2024 07:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733949500;
	cv=none; b=ihAdtbK3ldhsXq3pqLX+wtYStSkDOT+XqMA7g24IiX3oBMIfTiQ8cC99MjAGBwY14evnwz9+6e/lcjiwsZKd4WY9u7CxCqU6C3gWW8cWqWi0l3botJutsDP6loiy0MNZ42E+4u3fRGoM6f94+o3A5CkO34K+Yra/jOiuLskwyKwqr/oQKovrPc87fGuoASszA+a8nHYK7CDfWHgVa8ldpgSXNs7/E6/tI9Py7neAuzRzHzsDCbHdeH5iv6QQTdWv4vktqhmtDAP0H/o7g+8/XwYCp3MFIq0lQgIm+A22M64pCJL0QcnMoFzrsDSRvSTVkx6yO/eUXs4UzWcQTuzMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733949500; c=relaxed/relaxed;
	bh=EHDKwgV+N029CC+OcaszNmAfmIuMsmdDczodZSpaBg0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xt5TsOwnkfiruBXU8n10lo4fBT8rGdOCypepRHMYdpuvKu+a9KNHsoUXrJU7Zfc8OgpI9hZmEAugar3GSEJRqp170wu/OALaSmkXyj7On5EcwOkNfwxXNDNJ8+4Jf+ILN4gv1CyC8Ip9zQ0tsCecr4PRIAv/XmSpUMk73Vpji2KqJBZbQiigkHRS0U4QUUIeAxD5GSPbDOT0GrI1Pc3RpHswocTTsAGn8I8j7FoukxSO6CzlUngW2piR8YTfMVLNy1BsrJk2TffPETINizEA/VC874Lspz0iUzKtSxvB73s+ygoWjjcFsfM57PAgGcmHv3eo4A8k5eRM9KVE3O2xlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tD6AQSah; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tD6AQSah;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7nVg6pT1z303B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 07:38:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C53E5C32DC;
	Wed, 11 Dec 2024 20:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEA1C4CED2;
	Wed, 11 Dec 2024 20:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733949496;
	bh=U3TTKecYbJu8CPW6jwuij629ZrlvUeHH8MPaClL5ufw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tD6AQSahKTAfHW2XREukl+XNlyNF8qI5xqQqpGNqOYXXGC/cJdWVYv/Br/Ki2NMn1
	 racW/EbjfBW9t6GjU3NSU3xvdBN94u0TUGRTH16C8S9h6sdVWSJBBSzpFDFQ2X+pMi
	 8Cg0OM3CS4j8TMCWZXJ70AebZMAQ+IinSC9v9rnrPmu6ji0HwehjIlXKE105p1ucHb
	 6Kz3mj4CYL3scDkLndUV0rTkBOITiHASKk87R7znB0qdeqquhFJPi/2P827Hmi46y+
	 7EkbOULSIG1RYG28FQZleMAMsgOVf/+RceVRC383az3FMaZrX+76S7flIEMy+5Mc07
	 6IVfmeLUKuo9A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20241126053254.3657344-1-shengjiu.wang@nxp.com>
References: <20241126053254.3657344-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: fsl: change IFACE_PCM to IFACE_MIXER
Message-Id: <173394949437.1491700.15212046480843342137.b4-ty@kernel.org>
Date: Wed, 11 Dec 2024 20:38:14 +0000
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 26 Nov 2024 13:32:52 +0800, Shengjiu Wang wrote:
> As the snd_soc_card_get_kcontrol() is updated to use
> snd_ctl_find_id_mixer() in
> commit 897cc72b0837 ("ASoC: soc-card: Use
> snd_ctl_find_id_mixer() instead of open-coding")
> which make the iface fix to be IFACE_MIXER.
> 
> if driver need to use snd_soc_card_get_kcontrol()
> the id.type need to be IFACE_MIXER.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_xcvr: change IFACE_PCM to IFACE_MIXER
      commit: 7c17f7780a48b5ed36b6d13a06004fac993e75af
[2/2] ASoC: fsl_spdif: change IFACE_PCM to IFACE_MIXER
      commit: bb76e82bfe57fdd1fe595cb0ccd33159df49ed09

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


