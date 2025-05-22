Return-Path: <linuxppc-dev+bounces-8871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03CAC09FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 12:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b34Vs4W2sz3c4r;
	Thu, 22 May 2025 20:37:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747910261;
	cv=none; b=UhvQbumz52rtDVOeY8dIzCH+ypyxcMVkmmOM4d5BnMb6X2fVlpuNyu4bcdLc06B6t895Di/o3K7vzIz7YJb9/2v/+INQbpgyVBGlFmYUeFzp34G/uD07C9HZQq6HJ1fs82ajUt+jRbet54sHCt0+pwiTiPR1CPzypEDURti60Y8KP3cak+Ma4fxUVIr1OfGHtjDyqkkbRBVv2W0tIsspmFo/B4mtRzI79wOJmNikLRwT10dxGO4CJg9ZMjmTFR4Yuo5bimIN6Pmivg77YA5rtf7EdmA1PGDF/uWB6gOrKE4rBhL6917fsk1fLCpneQBTClEbvnl3xR4ZMV0X7MmuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747910261; c=relaxed/relaxed;
	bh=BEvqtXUoRY2MtYTRcX5uBf01lX2zWH/6+T3j+WmGUyc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L1Q2nwx2Dxe9GtyUX0qJhoYIV1fStpry7FIHUfc6BKtq9IVZVypzf2B1jt7C7o+FJISmLk0aIymE94X42C6bp63Np17HRuJ6SxUmnDbypcCxa5l3au+yNNU7dBqx0Zk8FpQ/GUEiESwJItM+5GpLtaouyghJg50pB4KbOea+iBX+HBhJFq44uH8mukWdEfMON6XmaExnM75DxEde3ofo576ygBJRa15gx51GA1r8/3OKQP8bDIQsYFqfcW62JuP6jGYVTGcxv8hjIQ3bBnx4TDd4WwZ/Z3TmlONJASr9uc11KoGcUhq3KvPn308pCfWnmSUvAmO70Ba+XpoPwBSLgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=KAbwJocx; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=KAbwJocx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 1984 seconds by postgrey-1.37 at boromir; Thu, 22 May 2025 20:37:40 AEST
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b34Vr1kdpz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 20:37:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BEvqtXUoRY2MtYTRcX5uBf01lX2zWH/6+T3j+WmGUyc=;
	t=1747910260; x=1749119860; b=KAbwJocxeIBQ2SXGzXgU0EAB1JaPBkBgoODlw8VWwBJwq/6
	r3r/TFfYWUdwi832KE86P9sTYE2lWzDQbmZPqHAVzrWW+90WacqVVdjt08V6njmCCdM21SsKjAtaj
	Ai53xbf12C12aT2gSVCTmEspkBX0EKRd1tGO4sa4uBx7rQIH79BrHO9RZDnMmROYwYJnGyobq2vP7
	oq9GbVpejGx1QuuKZmBzU5kqBcRN3fQo7x/AjmHw/VymU3J830rwmBi9OB9xirZ7AHVSB4KJMKZkO
	Z8Ph6VRwt6GHhmUu78wxsPFBMho9k5timcPTG7eHKqEQLm9yyu/AafJjGB54O67A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uI2mm-0000000GdCj-3E2p;
	Thu, 22 May 2025 12:04:25 +0200
Message-ID: <3fa189cfc0a52572008590efbf5f4ad05c81dbc6.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, 	festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Date: Thu, 22 May 2025 12:04:23 +0200
In-Reply-To: <20250522050300.519244-3-aichao@kylinos.cn>
References: <20250522050300.519244-1-aichao@kylinos.cn>
	 <20250522050300.519244-3-aichao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-05-22 at 13:02 +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.
>=20
> Thus, use this helper to simplify the code.

> -	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
> +	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
>  		if (of_device_is_compatible(np, "i2sbus") ||
>  		    of_device_is_compatible(np, "i2s-modem")) {
>  			got +=3D i2sbus_add_dev(dev, control, np);

Given the structure of this code, this either fixes a leak, or is wrong.
I really don't know which of those two it is, it's been decades, but
either way it's not a change that simply "simplif[ies] the code".

johannes

