Return-Path: <linuxppc-dev+bounces-7705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A62A90BB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 20:54:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd9F155Fgz3bn1;
	Thu, 17 Apr 2025 04:54:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744829685;
	cv=none; b=bQDO0HbezM7jSMVodEYLVWiMvDY/+tSKs7+WyjcT8wGwecRBtF5Eduv+DWZN87YQxcsz53BVJZmc5FbPf303Tu7hgqGTtCLl2FGtJertlUq5eLaTyt5vUP4WGKa5AVyS0lggLJQ/uQyUAomfv28QzlvL2Dk16UqzrMS6NhTF68t9O2gW+dfjV20Geef2EG9sSi6juBAgrjcAezVfXv0i4YLPMRI5kCP/84focX7N4q3G+7rIr+ltudZKNsM1k7kPR5QoVd5MIJaiOWTCCk+Rw0Pa4MlISkjeHhuicozk9+e0RDnFJeh8BtRYndZYFpOAfgQYyqaKeH2yJ6wZ81qD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744829685; c=relaxed/relaxed;
	bh=qLrLUzsFF/fQZeZrf1KawTjQNlPQ6IHM/LTrSkJYX3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LpL3434UC7XUoxo8FexyCtqGd1bcLNqiyENnZYptysXl92XpHrBsMLL+LGpa1yQ7BliF4I8bL17b2DYH80rGWvJF5FbLjopp6JOPvV9K7JIluuSaftSILt4XJp58h5cDwm5sy2XIJ05kPIelzFSo59lqXBNWNEVdXRc31NZOv7E8LjaGrc/IjuM1WM4/ssd9oZff6l9BE7O5jt82EuZUcJmoOmx/K8yaTTzQMBc/X/sZJm70+5p4Bpgvm//be6Zcc1ErsXWd8sOG9w+FwbTF8/lTj659U/QVtSly/VoArKK8t3JVTKiNBvm9QL5UgkDDwfhTUBZSxlvFyQnorY/eaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBkSJNao; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBkSJNao;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd9F10pHLz2yr4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 04:54:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F7344A2FB;
	Wed, 16 Apr 2025 18:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFE0C4AF09;
	Wed, 16 Apr 2025 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744829682;
	bh=HkxnMpHH4HUof71suoyJTPqcloEFW2ZCJEO35rSobdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hBkSJNaoUw05O1BtAawQzkeO/5ucbxvrTkR2ZFvtt9lnYRtxiQvg/pkyKUpNB3GIg
	 yYNB09/B7cFbpRe/EEP5jSY9kS6Ewck+hJo2Dy/FZH+YoZ/cGPZ88ZzTHAWOyBNywM
	 8jsUYAI0Q04x4CHeE5OuE6cZ2Vm7/WzgJ7mthGRbLtzHNhZMs99arqiLUMAAOVs5vV
	 aJoDqYOHEcSfu3dZ+fp6fzOHk7eLvbkOl6/WdQMgsScHDiLsA49IAOl9UX9DWo/KKN
	 6saIwxcR/7y7QQ6eUhVd/5uJ54drjtonCdXE+yR5ehGpM2hagmKUSa7tr+0MyPa1Fk
	 AtxGtpIx48E7A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250416041431.546370-1-nichen@iscas.ac.cn>
References: <20250416041431.546370-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Remove useless return variable
Message-Id: <174482968045.823707.11072007128438554496.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 19:54:40 +0100
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
X-Mailer: b4 0.15-dev-c25d1
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 16 Apr 2025 12:14:31 +0800, Chen Ni wrote:
> Remove unnecessary return variable and compress the return logic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Remove useless return variable
      commit: ba05bc25490a2256f60be2c02bd797e6f8217119

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


