Return-Path: <linuxppc-dev+bounces-16424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPmnDHNdfGkYMAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:27:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30EB7E8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:27:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2SJv5q3yz30M0;
	Fri, 30 Jan 2026 18:27:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::132c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769758063;
	cv=pass; b=ZiVVguQwhhLy8f4Fm8RhnqucXSTv2yXQ0dEYmaZJyVwglPp3CKBzuao9N+U7Q72++4DyDUfoguuLtNGwz7ZO7P1k5ZuQQtDIxpj8fA0yutadDm52f3DaxDD+ggLcsFWOQypVnXmdlmoKJhaoqok7oeP2dqBPPtzJ97sf2yPFNoJxnxvU4+Ajxge0Q1Tql+WKTvLluCaIhZqrxU+QyISQWLdRudVGYGNBGo2kLiY8um7oouakqlKyWhAtQ/QT4Rem2EDYIUvHOQMmqzyJk9NhbPXvSOjYfp4cqmovo9Gp0fQZtPfytNmMLlwA3RqFtmWyH5ditgEczIgKdaOwdXG60Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769758063; c=relaxed/relaxed;
	bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6Kq9F+crNGbaG3jCMJNyUCB8sh2fd7ETrTFAryM739xzQ4DNhmANHK9qbAJmT7wLxxeEbnjruKUcwhBk3wx34//s7l55pKBI8wxglUR4ChrCAJtiLnYcB9hgDR7lMQQX80klCGkBDHYwS5xYLwafIZc19iKIiXMBAwLB6NmgHfv8iLgOLHKi+wQ7t4aLqg1MrGVIwyk8JNSasIJuYoFdqV0VPPm9eMErOMnBW9fumwFwaIyclFoNtb6XuygI781AKBcmafqBKgWwhjh6RT2U3FPe/Y2YftIxXzdvdsJ+0L6TNhn6JWAc0gZ5h2lw0o4R3vUcUf/DpNAGDldMFgpzQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=abbZPuD3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=abbZPuD3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132c.google.com (mail-dy1-x132c.google.com [IPv6:2607:f8b0:4864:20::132c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2SJt749hz30FF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 18:27:42 +1100 (AEDT)
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2712897eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 23:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769758061; cv=none;
        d=google.com; s=arc-20240605;
        b=HtJTvjwSlfa3q8lD5gdcoxL2NcD6ZZQ5XvWoSHtroW/j7d4xSOeokaCkoriSwMXX3K
         RkVWZPPfVZ60JMlXQbJNxIv2A4FuFt6IbGPfHqrCQGpQkPcQSDDDTOvogr8iKT59rM0b
         2R+7Mxl+d3SLfqiic9pWcj12K6xcjDGnCy1+JPqcDgc+Yoh08EVg5Wy6znQ/8qpo4WB6
         be3MLntjBsAU+HibqwqiJtXNScjo4kXbk3LbrSXDIHuxdLExnG617fxxytdaSlpR+f2h
         3GvfJt4mzC4+RhDX1ziiBa+DPOt/BuTXWsEZkJOo6Hhqz1Xc6ol3HOrykPVJMlZqQtRY
         3shQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        fh=AqByyzaDzeZdfvHpV0pDZD5Y5inBR1yYFtSFm3aM8G8=;
        b=f+w7hVTDE8DCUs54Vv1twTwHtNnupR4jtR0x9II5PtqW/hRYewZ8UtZwUcUI0Q5DG8
         jqHbP51TIT48TZ6s6M5O/VGPKj5ePWrSfbjfGpzGzizOD4qCXNmQc5yV6Gz1NwUTWABf
         prPClpFexz/4vKCQ7L/Bp2P6ykIP6eD6TIG46CXnkyAZGsm9PNYY55ToVMG/mj5sgJX/
         eAusMTQ0WsSadEZEuqAs+wgGdNHU5g5MKUWEn5AdAEiX3XOT3XB5uCV4tcpBCTckBnuj
         jpuGksXZn3/hYCOB7kvHhBLCThliN3ZkoQU9lpx/waLaUH/yv7EOL6e8389zTIlWObmL
         kXLg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769758061; x=1770362861; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=abbZPuD3SfPNfn8KJTgkcrbmS/lsE2CTn8VCFiYK+6lIaYDYvjmNUnYOlGTAb8F7mW
         R3HhsIJnHkuQsQ2bNmtaY/PMhbWdV8SnfDxHzBkO3GBnaPFDE6+a2ZlVMStdDY4giy32
         XbVrNny0KEL9663wPMtuw49IDxEFwj0ZIEif5Rg6fP5dIXIDnTU46Z8NbGkXHwh6/sEj
         thWstTTrQs/JMA8mRbRSiJX1mnoyefRw3ZDV57XT8QxonO9PK1aejg04T/TX84yAtHHN
         N84AkE5KbvlEy2/jFMAdt+mofM7nlt4QSS52AemY4zC2p+zQNsfNPgdEFsOy/2MLt3r4
         HObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769758061; x=1770362861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=Ul+2pICct18/mwCdzS5Wuo+Ty0JJV7NL2FItZBxFUpvs/FtnxNo2awjADeXPx/qdlQ
         AXJkh38Is57ll7P2YT96tZ0zXbe5Ytf5zvWTOxi8T6RQPvNlwC8epx2w5IpIFszGzdUU
         9IF7znw0BuKukSWdOO4MmNHXmS6yljsZEHJgA6NnyHmeF9zGis71Ss/8Jrb+LGoa/lqF
         Lhu6uJ6D6spuo9ReSInm8ClyD5fkzazbcCCN+L5OWRQ3cwCmYMKscy8ks1uR1FoSihYg
         i/eBpuEC94nbTRaRrsEl8eiNixdr/rNxPXQxBpeHzatgqTCBb7HLxQtKCUdHyuMWaSck
         suBA==
X-Forwarded-Encrypted: i=1; AJvYcCV5DlOvOPr5C9LZKNRb3PevS6jh2UFBPUHdwcelkqbGxkCrZgAYxhSfBP5jPpkdt8DsTylacBCiSjZ46Bo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBYa61pTUPCTtv6R3CNqRCdCvdgw+cHXz4GFWfEqpxfYJTiyu7
	aIuwDHXX9BD1jHwEcp9vUpBaeLj5FXnjJ85Rwds8X26AWtDY3JOMbuEIcTUoDQV92xJcBsUplUo
	Nhd3+CnJadiH13bF2BargFOgsiX62HUQ=
X-Gm-Gg: AZuq6aL2E8kO6MvRtczCVzP+b09PQkRoYewFH5iPsxGBoC7L/nAYfQSFd47PmDC3W6E
	MHNfL3JMOOKrD3IN0h5IxLExa8bcQ0eK5Iy4ka/hDMIn7Hn8WaBKdeNwVxsE6MuG2oshKS/Cuor
	JvXrm0j3v0q4UvYqOiuXUz+vmz7vpl8esFO5+7LpZfoioyZe3oyCL2NoEuvTPjO3nRGlyZ/jbME
	ZbLaCDjrRWOoxnA7THtTdLX8pwArAOJLOX+/1bZOxdp0dpjwYW/GmSa/4qjtZGD8lStrFgVP5ah
	/xnu/tvjJFP1SO6iCjg1b3z4dVK4pR0xgoHq+cc1xsbpU57olb3/50YjGW9dBOqTeD6UhmpkUw3
	W8bZ5RlQoRL63bA==
X-Received: by 2002:a05:7301:5f8c:b0:2ae:5db9:f32c with SMTP id
 5a478bee46e88-2b7c88d96d3mr823727eec.26.1769758060694; Thu, 29 Jan 2026
 23:27:40 -0800 (PST)
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
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:27:28 +0200
X-Gm-Features: AZwV_Qgjn1kkHIU5h0wzpNnEdB_ncps3lPvcrbigVIp1umd_Brl0rdk5oiMuE6E
Message-ID: <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16424-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[danielbaluta@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielbaluta@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3E30EB7E8D
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

At this point imx952 has the issue with dma request not cleared you fix
in patch 3/4.

So in order to avoid this you need to swap patches 2 and 3.  And in the
newly patch 3 you will fill fsl_asrc_imx952_data with correct value
for start_before_dma.

Thus we also keep everything working for bisection.

