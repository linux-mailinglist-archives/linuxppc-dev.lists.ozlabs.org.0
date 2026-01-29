Return-Path: <linuxppc-dev+bounces-16390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACSgDjQue2mbCAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 10:53:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FDAE491
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 10:53:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1vbz68Rjz2ydj;
	Thu, 29 Jan 2026 20:53:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::62d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769680431;
	cv=pass; b=N+OcVrjylHalhPVF7gOL1azEqxs76lcmzSRHVg1UP2Ra7qEVlti41MB08VL0Sp+t5TiYEEu7ffVHccqW3lPqSfsnT9TFJ0XksvHJ+IHeJsvrEiic89dI0b3s+PK8ZxztOrG78Cvjj0FXi22r/oTJ7dp/4fPOqCpnrlis9vYn7c2oz8lh3Hu4iYG9UbOYqmyWp4qOUcqf5B1STicMZhZmUNnUYo/9M1sR8f3CTrPO94gwQUeMwcsDuZE9JfMpWp2sPvvOQlGtwTcvypcv4GK+k3VSjLIx3TRi3GIWGLMUrlBpnWvzj8j+dG3xDYeoH3Tpv3NHmS0StEgTbfzXnA5Ifg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769680431; c=relaxed/relaxed;
	bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hs9pKUYYds8Fg45tSjEyPaGTYZp+u3DxUqHaH8a3wsaTdc905fI+q4S1654FtSWnQyw5w18bY5H288ZYZiC0wb35dP38i+t8uONtIFxdnAvOw7Ud3m+jeRJKU4NPh1CN3EivqarK1+Tet+2XkLrFlBbXEqT56yzw8G2NAdvHrhhyBTZ3uauyIhTvglW6acZLy3/DWzpAQt3apLUrGHcYywp6EEFGpF3BQCWpPm9xqn6U+ImjeSy3aQ+kCiJIFXcDks5HjqlmlxBgtGn6hhL3xwkV11ikNH31MXYK8B/yYwEM8KTqYhfIr5/AgTmcq3G1SilHiQet87Z5BfKAI5id2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AvpAZbOD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AvpAZbOD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1vby4xpSz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 20:53:49 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a7bced39cfso7398085ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 01:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769680427; cv=none;
        d=google.com; s=arc-20240605;
        b=AckHCpcdjBl6GBz+M/KhXJc4uJQUIIU1Xug3GgeNEOrYbimSziiM7veOpcK3+oQq0p
         q5n7HYG7F4NXpNc5s9CP5k9Y6jkyuhockqHE1EHs5E3Xk70uT7wyf6587ClY49BRpRT1
         6NXX6WzBWkreBpfXOgcLoBi2rrZaBGQhR6P7bKqMdRxRy8Cfa670gjvhCsDHq+8Ow5jc
         WasbbWurnI7P+ZUC1pHCAg4UxkKLACIl7QqVTbcOOTslj+wbRi8f+Q0jUNwy+EpcZOik
         1IYPwctVj17fmGIS/hIrCueHjfUxDd1X12PK3MQTTgRcPVy6vd3kTLNb7dnHWlH5qvvZ
         qXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        fh=Tqy1zV1zwzWo8U3cLjiw/zrYeUIC9McihoZVmnGzU94=;
        b=E1bLMJuykZ8bXlxxbHplGw2Av6lyxauyFCeg7MB8/Rz+p/NWE8FGso70PU3XfNvHO8
         AwHmzyuZCc+cUA/iSi7L8BzbrHvoqQmS2ijDhqxA9zFu1fqho+t6AE6XiZJyKeDTfawd
         vhBnrae/m98CFQgr8xWl0nG/Uk2OWhkg7jcaEfip+qil7ROHaxJTmgnQXN6Sn78ZItb4
         NPAW7JeQ7jPqu+YdbPvHpdKvOuKtl9gj/e2sgIlLlRDU7y/E4/rBSMsmqW5ovajtD8WJ
         KKgtA+yjJNKodDlkyaCaZCb8BEuJeMjSJXH0hldNNtFudKwsNtFW6aAdOl1Mpu0+W1JX
         /rhQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769680427; x=1770285227; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=AvpAZbODlbKCfSrPkX+BAMZtAtVJSanXVAlNBKbDCJICslDxc54ql6wdZxte3ZKnHT
         g2g2m/7XURoGTAwkzonUgYruFaK9XcaS1qkFiFqhBlPKiMwWTtUMDP3V72kEppFCc5oD
         qhqfZGFcvp8j2fqiB4tawEYns45sGIlJSZ3T0VHDlC8FxkPmApisfctLO0BPSV4meMcH
         AeUQnHKv3uAd6v7fZDRq+eJhROprxdqf1ZXby6GS5gttTTELk4M1C2byvToBFX4n5f3o
         ftAL2NpU6reitfq05iEMHu+0H6biRWvgGZEI4s9P+2NbEXJaODyNkkVjT4BLAIlnGbos
         ecCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680427; x=1770285227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=aEY/A0XnsLMnDXpWS9pdq+hSGXJD4ieiT5rPkGw4sWDErmsvuDgGF7Xv6d1ZPW1rli
         TpnrhPDjIehMeziS7oELyAxlX6sM99IZS7IoqeVxV6hSc5PYlvbHcdE4QKI0KsmWmpyn
         /wch6y7uvQr7PV+mhCeZsYj/BDYUGF1IVbXH3sErlaafwxEwjXZO3nqeLG9iJkIaFwNS
         h/BB/yUhT1PtDwilHKTkM84E58uCDAKf+1xyATrWZe4IfG2lVyJj59CqVO7mAAYdVsOd
         9SKWSmiTVTDm4FkiLjIAzzrpolrN1i79k667xG1dAe3HUn5e0X5PUZZMcEfxFvU/qbCk
         xvaw==
X-Forwarded-Encrypted: i=1; AJvYcCUNCt2c4A9O/t8T3NGzBtpw7UiclWL4joisPcdi6aOBA/G+Mvfz0Mco+6vnzf9WDkDdk3X7octiIPmCroI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDCkmI9r8hIIKko4GUPN74e1M+A1LFsFAq+JD/tY07WkSZqy7O
	/1yWjViCgCDY75y2YKIhE9ISohq95zavjM7dtjG4YQOm8yhN/3aHUk9KUQZsxixhvq5nrgii5Dl
	XynnyAnwAF0Ag0sikacIwDSERJpH52gA=
X-Gm-Gg: AZuq6aLdzhz9gGcIzJqLTXbz7QNBNH8bMvbcj/NwUANDo2Un0sgiMT4u9MJ7Mf2wPw9
	m5viAiVoelw+VJ7GKPCr/wxjCuaxDJYLhUrOXCSA32m+WfUtPz8ys0qQ5iYBQo6AXF2ZHUcd7/J
	ma0wIbvBQLWjN6QmecdVZCOAZZhSAgk8QIjUBczw1+2r9w9IewWsjAtBW88ZZBl4g11f7J3D319
	65zRifnmfiqiy9db4hoyySJwt9tBaWmZWfb/KjV0XkIOc7q2u6tiZdXNC0gPI2bpk/65Wg=
X-Received: by 2002:a17:903:40ca:b0:2a1:5d2:2e45 with SMTP id
 d9443c01a7336-2a870e7dbf0mr74134655ad.59.1769680426799; Thu, 29 Jan 2026
 01:53:46 -0800 (PST)
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
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
In-Reply-To: <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:53:34 +0800
X-Gm-Features: AZwV_QhJaxBDlnFwwTXJVH6oDtpo891knd-s55tPdoqjkrrPNspPNZy-5Dfzq3s
Message-ID: <CAA+D8AP==mteo7ucx=R4eyPw+DpBUtzC7H1++_iZBMN1kkPJsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16390-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:daniel.baluta@oss.nxp.com,m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5C5FDAE491
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 5:17=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> So need to trigger asrc before dma on i.MX952, and add delay to wait
> output data is generated then start the EDMA for output, otherwise the
> m2m function has noise issues.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> This patch does more than one logical change.
>
> I would split in two patches:
>
> - 1) introduce functionality to start ASRC before DMA.
>
> - 2) add imx952 support including clk_map and introduce fsl_asrc_imx952_d=
ata

Ok, will separate them.

best regards
Shengjiu Wang
>
> Thanks,
>
> Daniel.
>
>

