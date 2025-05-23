Return-Path: <linuxppc-dev+bounces-8914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF1EAC213F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 12:40:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3hWn0Bc7z2xQ5;
	Fri, 23 May 2025 20:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747996836;
	cv=none; b=AqGWZYv0R89XpXyNmacAgkTYr57ZbDQRzEykMewx3IJtQJUYpjCmIuCZyzhL/7JfPI5LjWRoxtUjZdfdtrFf4ashpYtPfzrv1kVbn6w4cjbA9C7nhopkAt646eIpb8PVre+2lDF0xKlNmQR8qzePLom2hjbGoXR4rMk5/otCBaPMNeA+Zm821A97vlzkfEOifln+MVjUV+tqPiEfKOtdTnSo87V3NFuizew8BBpixVg0whfUKJU46QnX66h/AeTim+O7HT7elkMj84kZlAg/XM/eBH/3CvTWuV4wxq/+uc+RuhnTFJ7pxF+1v4niQF62WbJKPIFvZUa8u3wDKpVXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747996836; c=relaxed/relaxed;
	bh=K2JQO+uYU43rONsrKzctsDigqQZ79oxfKv9WnQ4M8rs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kj8kJBnDPmq8BVIr02NFc0bjA55IOvrlCbwSuo2oOqAI9pNkBoXouKKdkpzI9SiLSPmfAoPiAExn1oKj9Gsh6McAdxXL3bVuctzqwVy011ilWRLYKFfX9geljRByQoNl4H8Ab9s5BvBj03/wpJsmRdFMiWhrLywy3DXpSW5txUSbldpv+kGGuXV/3mu9KEYWCCNuOAomZCjH97kVAXq01qRexYz/DJ8tXTRX/yeP6x8oJOVrx86wI3m4aI11zrLGym1L+pPoDFIU6KU7P4PIC2P68XMDK+duGV0vpS5sn3mmbzB/qMsRhvmY/dzLDeu9s4tkngiCndgEAutuiYFDdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=N390EY4a; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=N390EY4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3hWk6QGfz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 20:40:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=K2JQO+uYU43rONsrKzctsDigqQZ79oxfKv9WnQ4M8rs=;
	t=1747996835; x=1749206435; b=N390EY4auneCPcN3UBzJyajPtLQMDLRJ1OhscyDUz63FKzE
	pqJlW67Qj1Mc3YMl6mKNj5TqVkmu7W8pDGnkacGXdhr+GIbMZT7b8txBikMJT2XK5WtPDBsFAKWlQ
	qNs+zeKo58sW5ZAK9BJ6Iqn6IotangP9+OGNhenT6ZG1uIcgb6UZj71DZPTyh0FTLywwgmDM4iMuB
	0+EC8OWqEms+UvX0tUWuN6JfzLjDh7r1eKM+OvBG5KAPTxp8vTaGbf4LqNM2Aav7InPjjv5fNePwK
	OS7jSxtePOmW9zEN8JtnvRDoHfwnfGoSk8jrjR+BO8XYZLyeLp6bv/DJ9k1fxv3A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uIPp5-00000001O1N-1Ky4;
	Fri, 23 May 2025 12:40:19 +0200
Message-ID: <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: =?UTF-8?Q?=E8=89=BE=E8=B6=85?= <aichao@kylinos.cn>, perex
 <perex@perex.cz>,  tiwai <tiwai@suse.com>, "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood	 <lgirdwood@gmail.com>,
 broonie <broonie@kernel.org>, jbrunet	 <jbrunet@baylibre.com>,
 "neil.armstrong" <neil.armstrong@linaro.org>, khilman	
 <khilman@baylibre.com>, "martin.blumenstingl"	
 <martin.blumenstingl@googlemail.com>, "shengjiu.wang"
 <shengjiu.wang@gmail.com>,  "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam
 <festevam@gmail.com>, nicoleotsuka <nicoleotsuka@gmail.com>,  shawnguo
 <shawnguo@kernel.org>, "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla"	 <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>, linux-kernel	
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-renesas-soc
 <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>, imx <imx@lists.linux.dev>, kernel
 <kernel@pengutronix.de>,  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date: Fri, 23 May 2025 12:40:18 +0200
In-Reply-To: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
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

Hi,

[you should avoid HTML]

> "simplifies the code" is no need to callof_node_put() .

Fair. Except that's not what you _actually_ changed here. Like I said,
either it's buggy before or after.

johannes

