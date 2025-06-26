Return-Path: <linuxppc-dev+bounces-9806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9A1AE9C74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 13:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSbq63XYJz2xYl;
	Thu, 26 Jun 2025 21:21:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750936882;
	cv=none; b=PTrzX7sW2VHCyQNlXBzCvCvN3ask+tCtKjhztEC38EAhJOpUSmPMCOwkyVKlRAdc5SZWNA97XGC2cTKfhoo09fmd0r0yEe90RIE6qqCkzr4Otz8fox4XDg71poQMhJFKJxv65LOUd4Xe4FBYdBca9B1CVUj8V06Y2Y/1FABRjF2gupzAy6RlDO1e2utjWTPLTwjFLQWp3mB3dRtR5iG8pEv070Gbds5UCvqHDeS4auPVo5FCBGeOlal2P+qRi8Nh5CpCzvjxnTn1f44F1XdC89nmlaDtTDdoimc0JuK2PsV4pykD1VJmb/xJ+t7dO0VJ8qRWUw+794xtrxI7Fvi5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750936882; c=relaxed/relaxed;
	bh=/SW6QnMa4UOsnOldpJxTYj4HpI4vmk6QAX148MJm4ns=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IQMbKAkuoeXcHRqDTIZ3ct59XLyefYONwU0a5uq7ZU5WD5ywGPY25Dci+QzCllJftcx1rcs/jJSCQbq8gCU9OiipByERMAtpEK1eh73O1H7JcMIueQDdu/cKsS3reDy4Yuaf/NImusar3KNgdhSSBOELVfCH67XJCoZo5gLRklx1/eoknZ/N4Y/LbFK4YlbZJDXnJpSoY4Sf9pK+loeWAxMZQdaTNaJpD1Gaq52CrTqnXUo/ccJtjQ8CAiQQFK1D1tAqVG30caFkQ88/e2DTMpXMganYl/EL+lMAPxwFn1NxGCNiDzhpbDCOGdfSMc2saeznTwX2NfNGcSF8fhNHjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=aUx+u+Pz; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NRG2LYb7; dkim-atps=neutral; spf=pass (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org) smtp.mailfrom=arunraghavan.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=aUx+u+Pz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NRG2LYb7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arunraghavan.net (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSbq40NKpz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 21:21:18 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E8E0A7A0112;
	Thu, 26 Jun 2025 07:21:14 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 07:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1750936874; x=1751023274; bh=/SW6QnMa4UOsnOldpJxTY
	j4HpI4vmk6QAX148MJm4ns=; b=aUx+u+PzXKbeDI132DZ2ONFxkdH6gfjSsGmKw
	LhkbkptfdDlCPANSyk+2Bkd+kDEcbxzb94N9Up+FzxNO4+6gDc8rlXByLp00xhbE
	xId5r/ZQ0P5ONQOs86lo5KjzNkUJzaFJpWxea6IjuMPt/uKlQN4uNMRJY33A6/58
	IB/lmcovDFjeXZXP90xWOnv6FZYINgPt3B6HxjzTc2TSbnCGYq/hx4G/KgXCV/yu
	sL4ku2txNt+7CjT7v57M1wiicMJatqqn+53cXSXFzTnn4WxRCfZfvSieyQQUiDhh
	g1k3mqmfAQ9QgxFflG/9CV1bETx1SXU6MNuB45ps7GYL+W7FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750936874; x=
	1751023274; bh=/SW6QnMa4UOsnOldpJxTYj4HpI4vmk6QAX148MJm4ns=; b=N
	RG2LYb7lyvgK66RNHxMP2CVf/66oR/HvesiSg0o/yRNAbM1flPJb1uZcbmULKLKB
	zuk1/OeXJORMEb8g2ypKnmHTGueztzegfzD9AFeu8ontPClhD6vlt85/5EtGWEmJ
	VtHvRY5FUXshcJ6DhowbC0OTlBk2MzeGL2PjdSlS+AxFpn5oel23s2xUxpvHM8qS
	Q8hW+oLjNqO9iNtNIv3MMtizKYmzl7W87J7lA+nshKFiEQSwoZG9AxPt48VDVZF9
	HE470lpbdFbP2u8XsRtGYTQFRXqcTHjhoa/3e6HbeIqBtyCH+0Pmrp1LZNvURvPJ
	vYl8+V+2WalbQ3ZgTQKeQ==
X-ME-Sender: <xms:KS1daAv6z_zNa4zVJuOP1jePfcoHBnxuZ8msBrtdBQw3QdWss4XOtA>
    <xme:KS1daNd0TdMOzbquTdW5r9iKZwFDDBNm0CD51EuhLtg6nGduyUAz4D0tlbX15B8Yl
    YI31YMyLAGkAQ-3Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhunhcutfgr
    ghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqeenucggtf
    frrghtthgvrhhnpeegheetffehudfhiedvkefgheelfeetueeutdetudeutdeiveejvdet
    jedtjeekveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghruhhnsegrshihmhhpthhoth
    hitgdrihhopdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirh
    gufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrg
    hilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-ME-Proxy: <xmx:KS1daLxBiK4O07CHZKKWp79mrEvtOfzkrr84FPRq6FXIWGYG-3VYvA>
    <xmx:KS1daDNRRqFdRtx8zQ0LijpBD5UyM8CFXcV9zkL1drh0GM7_llrd9Q>
    <xmx:KS1daA8pLCnUZgXi_PRFVvohuApAJmExpSNgGTswvPZSACSOa-4czg>
    <xmx:KS1daLWRa5GH67FAqb10ebX73zqVeyNxb6xZ0ZBp02ft4JauvjCOKg>
    <xmx:Ki1daC5yvRr1RyhXBx-MjzS9t-gLeycqPGOAGqmjG7BDVXGLAvkQ6VIW>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8C444B60069; Thu, 26 Jun 2025 07:21:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
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
X-ThreadId: Tbce6b10f0faf42d7
Date: Thu, 26 Jun 2025 07:20:53 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Shengjiu Wang" <shengjiu.wang@gmail.com>,
 "Xiubo Li" <Xiubo.Lee@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Pieterjan Camerlynck" <p.camerlynck@televic.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Arun Raghavan" <arun@asymptotic.io>
Message-Id: <4d4d15dd-3f2e-421a-be5d-005d6422385f@app.fastmail.com>
In-Reply-To: <aF0qMiPiNfDBXZld@finisterre.sirena.org.uk>
References: <20250625130648.201331-1-arun@arunraghavan.net>
 <20250625235757.68058-3-arun@arunraghavan.net>
 <aF0qMiPiNfDBXZld@finisterre.sirena.org.uk>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting in consumer
 mode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 26 Jun 2025, at 7:08 AM, Mark Brown wrote:
> On Wed, Jun 25, 2025 at 07:56:16PM -0400, Arun Raghavan wrote:
>> From: Arun Raghavan <arun@asymptotic.io>
>> 
>> In a setup with an external clock provider, when running the receiver
>> (arecord) and triggering an xrun with xrun_injection, we see a channel
>> swap/offset. This happens sometimes when running only the receiver, but
>> occurs reliably if a transmitter (aplay) is also concurrently running.
>
> Please don't send new patches or versions in reply to old threads, it
> makes it harder to follow what's going on.

Ack, sorry about that!

-- Arun

