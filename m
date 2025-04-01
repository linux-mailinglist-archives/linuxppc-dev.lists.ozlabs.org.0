Return-Path: <linuxppc-dev+bounces-7419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C363DA781DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 20:04:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRwrS1J1kz2xl6;
	Wed,  2 Apr 2025 05:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743530696;
	cv=none; b=Ndr7ZpoDWOlkcMzqNHRXqOZE9l6IYd/BjQ9b0DGTYthZJH1urteSrw3tt8vq+SQoLnUoNBK96B590F++/b0+ikVoP07O7RGFM0YjrmQXevCN3RLxIkQBnlYKhaxleTUm7mNoelpHwJWZN61gbjLJ4/fyzF3AzREkh6siFH3z3XBBO19kxUcbdQEh3A+Xu8wxLHIP9NfhH8cPKtaTZYA6/fTGZowaR4bbVqN9mGqoMc+Qos68Ss7npCDrEwTze8CxZGEbOiZSIkltbNRTN2Og8h+xgFeCtt8evqbQ7tpoOgNkwcc7JqPPWoJkYcrda8kiqZupP/kWmXqctCFM6dEhng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743530696; c=relaxed/relaxed;
	bh=LB5IRxPNWYdSS+G6MLjXl0IBrONExgZhEiGTec7yczk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CtBci9qZ/8mlLP0bX6vh5PRvHVqGsMSEZsRHUQ3BOL32IGUpi4hubfWnzPNYPPDxeqwpDlX0g7SORlvZpgDrQ8BEr5pQPYn3KKfD4NYBQZQuUyD25VZF46DyUPl2Pu2Y9uNzdLuvko5uUzp8nDN3hzA+5KTYRcWtX/W5Hb+K60xFvou1lAx+J1raj0TEs7jruYQcgcYOLp7HrsmObqHnx7dQrjW4Xi2lZQ53cQ63MJrCwGuJU8M3lY4T3zdtRROqWZVYNbQJUaPFpmIha11AU4MochQ/2ft65Ieop3chCDTM93z9BQbjpuiS8I2ZJQ9vGWy3buvhpG3R2DmzzonlTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/i+k9op; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/i+k9op;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRwrR37lWz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 05:04:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C29268409;
	Tue,  1 Apr 2025 18:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C5DC4CEE4;
	Tue,  1 Apr 2025 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743530692;
	bh=X3UWVR5FrAiTLHuUdqDGWuSjTyf0NcWGQa2Gmhjp7SI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h/i+k9opvXNDV/viKgz+IkFJDV0Q/+srL6x1bADFHk/mNdi36uSTPuGv5g5wlUNOh
	 6nTKRTXq6KItqyV8v9GzG52p1ttKL/MYNkyBNpj8uScFbZrEjS0bNcoGAg9RXnZGAo
	 HDXCYaH9bFx5OIdBohOCn28yQ3WawNYDtNw47zX+kv7v2sdYPNQw+0wYns//VNVt+q
	 L8I+jUstMjum93FaeEfdgxeeP2/kDfqmj3ZRRoJ3zFZnmyhc17xR6h7fJsP3l0ai6t
	 4yZVNp2B0kHRdpLkiAOJsyBz7/9VtTlupu9J9HrsATz6sjr/RzT8V3wmwEDU3iRaiJ
	 2FZWVFt4Om9qA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, 
 Henry Martin <bsdhenrymartin@gmail.com>
Cc: kernel@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
References: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Message-Id: <174353068900.126969.2791062137526970115.b4-ty@kernel.org>
Date: Tue, 01 Apr 2025 19:04:49 +0100
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

On Tue, 01 Apr 2025 22:25:10 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> imx_card_probe() does not check for this case, which results in a NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Add NULL check in imx_card_probe()
      commit: 93d34608fd162f725172e780b1c60cc93a920719

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


