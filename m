Return-Path: <linuxppc-dev+bounces-1793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5246E99269A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 10:06:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMWtr3nGPz2yVX;
	Mon,  7 Oct 2024 19:06:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728288372;
	cv=none; b=OinN/ugLrHLfgl/SQedfRP6x3e1WANIMLYFXpZiFHyE5jH1Ik+anpGL/rYpHCSQG6FletEjgad1tYjiZAvEVRVoe25sNczoULOI9F7heP+Fvy3NbWXdh/mkFmJiC/1q3iq4kLOlVUTTtNxhq27BrM4l1NKtASqNvf7LkxkK2dExA4AHtcEEsz7e4YOaHJPQdd8JAoMbS0RkJQqrrNHcPxiIod+Qh+VUPyrDVh4iVv/8J16EL5MoH0PfqjYYs8j7AqIoR28JlQZYMnW5ROvQHy7TjOTZVEsFlo/DktbUeAbaNKzL3AyMGbLr4rX6R0CdvaztMmpgr+lsT79pZ1Wr3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728288372; c=relaxed/relaxed;
	bh=ZkOxRoRypHAVQgVjyqb7heF/q9DLPK8SmPxFVAuphQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dir7XBn7KoNL3DgtQ1X8HiIIv7DdGOZJsyk9++RHnTvn96Ola/VXT+HlwWIw6zlZpK4ua83BZ6i1WD1seyUD13JrOrTf6OYbwXBg3QF/4+O7vCnL4rV7OuExM0lPGIboIl1JXDlLwzLbkavHzTLoSQpeaxq4ChKzn6VouIaxZAxgMRebEt2S8QuHynIDhYGZh0vMXBuWWCkjnUQtRBuIEnySjv2iU7nOLslI0GsFbfs5naoo0UfzuWs1gQdk8waAbIZMDrZ3oUK98pADGx2f/suMMlZ1Z8uYdpWpJr5shcrXkFNahJKpuVvKt5QKitXULTr0ifxj+ZO5zhFTc4qLzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de; dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=G/k1s40U; dkim-atps=neutral; spf=pass (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org) smtp.mailfrom=sntech.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=G/k1s40U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sntech.de (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMWtk1dRQz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 19:06:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZkOxRoRypHAVQgVjyqb7heF/q9DLPK8SmPxFVAuphQI=; b=G/k1s40Ulb10wWe2CvPP9H8zku
	QyoRAgzReOYMUcvY1lT5FklGPJb9trwS8HWM5iKC2m2ws7E5TBIouShElZ6rUqd7aL1NY7tFFpVKE
	wqInKhrzG35pjz7jHf4OdIyFp3xZtpyrQXwDcYsiY6x/GxEZc2Jw5mZA5rcEBBcKbM2WHNg1Fdfs2
	kNbk1NVQV/19IsFaacmsHaoCamjIA1H2jsOPU65USw0roLxH03+ZCKnQBXaVtJ7nLQr2BB8WSp9q/
	pK0Qc7UupO3XNZW14pv9HT2V5bQRXcSXjTwLYdsqnGept/bPGsRtLZYkPMGkRaEsXJw7YIF5kf8hC
	Rg1jWntw==;
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sxik7-0004Pv-F9; Mon, 07 Oct 2024 10:05:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Mon,  7 Oct 2024 10:05:20 +0200
Message-ID: <172814935870.2376693.17979672250689687487.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SPF_HELO_TEMPERROR
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied, thanks!

[06/11] arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
        commit: 7ac5c0a592f73fdc52393f6469ce8211ff3e771f
[07/11] arm64: dts: rockchip: Switch to hp-det-gpios
        commit: 3ca743f8a5b568dc5e5d5f1bab0298a4a43c2360

after the binding change from patch 02 got merged into the sound tree

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

