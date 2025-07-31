Return-Path: <linuxppc-dev+bounces-10493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1DB177A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 23:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btM7q4xB3z306l;
	Fri,  1 Aug 2025 07:06:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753995975;
	cv=none; b=lAMaC0DiAqGim0TKeDU/zmlfCZI1MPdq47v9dyplNvykC11TjywUC1hOXemJGHZdLDJUUyjVZDEQiyCYYanJXSYAju8jQXiSQhJB1jtY9JWq2j3IBBXrw4DLEAoz5K/0looXq2sQjiE78TbJsQtXaZnVfO4m6JjJqaaJMDbwX/kQJUaoeoIZUKA+ZuicYaGdSGA2nCMTm1s0GNGIHLtU0inJ51ecVxnnXXZIOFa/6QffV7UkIxL7trUiQtGDt86rd7PYHn6XYcHsVMMlAp2Npi+j3H3qZ+zNkTgpEcRnh56xeywf8Lbpvzh+jdWatCgFLvKYwzEwOFBxEBKe0Qmdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753995975; c=relaxed/relaxed;
	bh=x7iC7gDXSIuhAR/CbJkRs5xaFqZ4b43Gf0COwq8XDGg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KgwxwqNnyUI8btTMNQr1txrw5zJaeaVUDEK1SfeW6jpUxVzlXQ6j3cr0vKrj4FgArclRFnCHDXYgS9a3SlbXa/9IFwUWbifu6T7aDkVt57+UxH/SKjj2VWpGFI02H0dDqysZCf9KBu8J8/P0HE6X/cICF5RPWbU4dFDIaPAaZSRyAYSuS25NsKPYVONH2NA1ghw3m/LXsik1RTCAWPZKUgiCqgXPjGMqJ7afLYtkGZDsJaREgnKR8BYoAijmu3Lyr8kIaH0ZXwXXhgSjVj78i6NN6FJjz31YTniApE47/KoKysuZNcPgrsY1FwuCmhpFqmbKzvE/vVo3dRcNH8OUEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; dkim=pass (2048-bit key; unprotected) header.d=fluxnic.net header.i=@fluxnic.net header.a=rsa-sha256 header.s=fm3 header.b=N1iwWIB5; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GVoYy6WP; dkim-atps=neutral; spf=pass (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=nico@fluxnic.net; receiver=lists.ozlabs.org) smtp.mailfrom=fluxnic.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fluxnic.net header.i=@fluxnic.net header.a=rsa-sha256 header.s=fm3 header.b=N1iwWIB5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GVoYy6WP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fluxnic.net (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=nico@fluxnic.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 446 seconds by postgrey-1.37 at boromir; Fri, 01 Aug 2025 07:06:13 AEST
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btM7n0Zmmz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 07:06:12 +1000 (AEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2BA1C140038A;
	Thu, 31 Jul 2025 16:58:43 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-07.internal (MEProxy); Thu, 31 Jul 2025 16:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1753995523; x=1754081923; bh=x7iC7gDXSI
	uhAR/CbJkRs5xaFqZ4b43Gf0COwq8XDGg=; b=N1iwWIB5Lw6L4iY2s6Sx7dIA97
	1KijnzmGKtr2bnI1Vd5SLJITG6X6t/lEwtNeVTljgyW5QDsxwT46N0GTwPNc+LCF
	XtPSG0Uoji/RyERhGCibQQnRI8OQqJdGsYyrhcdN37bcMgQh92HhsptOvjE8b+RG
	YUrfA+Vk1q8PeJGL8bd3cLXzQ9KBr03kD8nbyJrU/dmrfijkx27oat+Et8SNPe91
	+LzES9c76ZeP2zx0uq7xRmM/imAwCd7x3hXF1vN4WJY5ZdlCCgBDvj0zwWy/ia68
	B6DCEWpzANvrx/zgBUjZlgMPE0TtznvdGelUZxZcYlI7CM+P4rY/e1jOY4CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1753995523; x=1754081923; bh=x7iC7gDXSIuhAR/CbJkRs5xaFqZ4b43Gf0C
	Owq8XDGg=; b=GVoYy6WPrzmtFx2QApnqzKkGikvJ/4iPCVLW7FNNy+QUOQJX5Lc
	IV7jH7jnIRT9IBmMz8gIF9lMpuwbNwWD4CY78xs/TdebvbmVeG3vTXiMoTIpcmJb
	y5bcGZKUvTDfV7lsplJFZGm7rb05nYtdYopLH3Y845vU07BMRrrrJk7I/vEkRoZL
	3fvjg4+BqjpIozIg+2JN3yWFj3WsSw7pluyR2cy6/AfyT+O5ZptZHHfWkHiDSuYd
	6XQQkhoC+R9ZjHPD5WdNZt6mj+cxBxLKE+UtRmh/xz8+xWgEWyqKggzohpUZ4eW0
	J5b76wFlBX15i2TlhwmyVAhBac5ZOuGRbxA==
X-ME-Sender: <xms:AtmLaCv82KKiSfk7WWNsmIBC2MW17lnqjlpjLKittmE7oZ41gkns6A>
    <xme:AtmLaPFbcH7Vl6zEwCZNmfxDUng8nP5DX0nUyeIDXfuU5pAcpaHQbJpMsnyOOFb9W
    jMV-59Ckov2aTw16PM>
X-ME-Received: <xmr:AtmLaLamBhfpjNHZfz0qi7xA1G5UzKGBDAIhrM1FiUaBqV1kSpX5xDnzD2MI755QRUuNMHYFFBGA7mzxCYLp4o4ffhM67uxZuRNwYQ2W5GPGbMZiKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddukeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefpihgtohhlrghs
    ucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvghtqeenucggtffrrghtthgvrh
    hnpeekveeftdfgkeejhfejleeigeffueehieetvdeifedvhfeluedtkedvgeeuieejgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihgtoh
    esfhhluhignhhitgdrnhgvthdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprd
    gvuhdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtth
    hopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqshgvrhhirghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheptghhiihighhothiikhihseigvghnohhsohhfthdruggv
X-ME-Proxy: <xmx:AtmLaHU98d6aKfp9t9TCJ-44-pc_4eIdb-_4GIeEDjve8vJqXgDOeQ>
    <xmx:AtmLaJlmszz26_TbUfrOEzNshqilN2ONQOc_sOxOENo44lgcFbSHLw>
    <xmx:AtmLaKCz2nFl7Amv4rnrft4yjqsSy8JIRAaXbSxSbzTvCoexyuF8Wg>
    <xmx:AtmLaAg5uC_zs-m6CKZtcV1VIMtpgtsmmNLyuAtWBP-ipw_eVRMe_g>
    <xmx:A9mLaHzo_9hrHFNuup7uho4CytO5X1lVscNyAjjz2QkY35UMGlbhk-_a>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Jul 2025 16:58:41 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 31B4612949CA;
	Thu, 31 Jul 2025 16:58:41 -0400 (EDT)
Date: Thu, 31 Jul 2025 16:58:41 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org, 
    Christian Zigotzky <chzigotzky@xenosoft.de>, linux-serial@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 07/33] tty: vt: use _IO() to define ioctl numbers
In-Reply-To: <3ac7427b-4f17-480e-99ae-f00e5c00e678@csgroup.eu>
Message-ID: <9811012p-4q9q-284q-n2qr-7597s16p8sq5@syhkavp.arg>
References: <20250611100319.186924-1-jirislaby@kernel.org> <20250611100319.186924-8-jirislaby@kernel.org> <97ec2636-915a-498c-903b-d66957420d21@csgroup.eu> <3ac7427b-4f17-480e-99ae-f00e5c00e678@csgroup.eu>
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
Content-Type: multipart/mixed; boundary="-1463781375-1419361712-1753995521=:3602219"
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463781375-1419361712-1753995521=:3602219
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 31 Jul 2025, Christophe Leroy wrote:

> 
> 
> Le 31/07/2025 à 16:35, Christophe Leroy a écrit :
> > Hi Jiri,
> > 
> > Le 11/06/2025 à 12:02, Jiri Slaby (SUSE) a écrit :
> >> _IO*() is the proper way of defining ioctl numbers. All these vt numbers
> >> were synthetically built up the same way the _IO() macro does.
> >>
> >> So instead of implicit hex numbers, use _IO() properly.
> >>
> >> To not change the pre-existing numbers, use only _IO() (and not _IOR()
> >> or _IOW()). The latter would change the numbers indeed.
> > 
> > On powerpc your assumption is wrong, because _IOC_NONE is not 0:
> > 
> > $ git grep _IOC_NONE arch/powerpc/
> > arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE 1U
> > 
> > Therefore the value changes even with _IO(), leading to failure of Xorg as
> > reported by Christian.
> > 
> 
> And is likely an issue on the 4 following architectures:
> 
> $ git grep _IOC_NONE arch/ | grep 1U
> arch/alpha/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
> arch/mips/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
> arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
> arch/sparc/include/uapi/asm/ioctl.h:#define _IOC_NONE        1U

IMHO this one patch could simply be reverted and the "old" code let be.


Nicolas
---1463781375-1419361712-1753995521=:3602219--

