Return-Path: <linuxppc-dev+bounces-16686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMd0MsP8hWnUIwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:37:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB33EFF0FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:37:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xX016G8z309y;
	Sat, 07 Feb 2026 01:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770388672;
	cv=none; b=EuW9gKEQSGlaLQKEpcWoVajy2RpRTkD3t7HZL0LPPW2dlJ9jGtkPkIygtxnSCuhTXMhBvdw1sVUkWXSQdjPB1MNbPO/k/+GkfxBAlp2bh7uJgeMV8yqbkhs+MOuTjAFq2d04ZFT1uyrw0DMoik9ep6EueJjXX4mDCiXQTAy0jOF1KCAnyYTedsIygrLQ39BOUipSyVfEpz57I3jHuNKVWjChCrIyuNClU9j45AsctrY5q62zSj5VxWX22oXd0PI+iNsW1PnRRHDTmRXJ4fquF6px6XH8RKlvzbLgiMwOVRCCL2dh+sDtEChHOuBMbqA57rxQregMZNIwJ7eR89I5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770388672; c=relaxed/relaxed;
	bh=6gGXh+kLbZ7AK2NVMrvL1ivH+8pNxuKEB4lGyvqc3iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACc2fmyTgtgpzQQIVWf72nFvSBSGDY6dC0wX5hkxzuvehK+5ez93JlpF6/hMPy4D4QZn4+LphvGLmHK5w9S7QRdz2QuwKMK46aH7VSjZ29GAQnU9zi4IinmaiBuj/f9Ow27PhcJrqvo9OiIgWwWo8qgVw7KEgRZ1V3+p9iDGm6tskTTESDZlt96gVd6XJ+zif4Et5rXNdMZEztiBAkLrinryhWbc4dOnb76+vFFI8nX7TutoeqTyvG73br/XXtrO1L+smXyrTWWS8YfDGQqM2vlIofXa8tZP2C1P+xTwdCnT5UrIPM4XinBFKnj9qLhriBLG+P3DZayboG3YpZlwUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fTApNlbH; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fTApNlbH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xWz2sQXz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:37:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8899140605;
	Fri,  6 Feb 2026 14:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A47BC116C6;
	Fri,  6 Feb 2026 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770388669;
	bh=Jb40v8mY4M7tTNZXeR7aVTdPQb1xvqpEjVIz9gC7w30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTApNlbHQajRJxUlp3PS9vUGXFC1v/0fN2X1ol3nL/kZdnHl7UklO7cwosQ5LDnVe
	 0CI+sdQg2ArK/yn7uYHIf0HB9NzLe/w6LIlI8UhpoUdhtfp/P/GUKwKrX9sYM0+oir
	 XI+K7FEOQsKr4fXY215UOONyDh711Cbz7GkHkRPvBDxfOLUTv53OUsa53eveBM/+FN
	 OJf81TyuWlJd0/eFbaO4JLgZdk4F1fzSA1OGr6ksV1YPPaxMUouq80yBI8/aO+6XPG
	 yvTFNG3h0LaFrDd3sTwUKSGnfP9WM+dCA/UpGwJpXdSe+21wN1OqOxGH+RafcguHbd
	 yfZEBy+VoJqrg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E78FE1AC57C7; Fri, 06 Feb 2026 14:37:30 +0000 (GMT)
Date: Fri, 6 Feb 2026 14:37:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
Message-ID: <aYX8qnKiPxHej-Xo@sirena.co.uk>
References: <20260206084334.483404-1-shengjiu.wang@nxp.com>
 <20260206084334.483404-2-shengjiu.wang@nxp.com>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4U4VAjC1uItOIZh0"
Content-Disposition: inline
In-Reply-To: <20260206084334.483404-2-shengjiu.wang@nxp.com>
X-Cookie: Think big.  Pollute the Mississippi.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16686-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: DB33EFF0FB
X-Rspamd-Action: no action


--4U4VAjC1uItOIZh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 06, 2026 at 04:43:33PM +0800, Shengjiu Wang wrote:

> +	SOC_ENUM("Transmit Timestamp Increment", tstmp_enum[0]),

Don't have arrays of enums with magic indexes into them - this is just
error prone and hard to follow.  The normal thing is to declare a
separtae variable for each enum, or if you *must* use an array use
named constants at both ends to index into it (but that's not
meaningfully different to just having multiple variables...).

> +	SOC_SINGLE("Transmit Timestamp Reset", FSL_SAI_TTCTL, __bf_shf(FSL_SAI_xTCTL_RTSC), 1, 0),
> +	SOC_SINGLE("Transmit Bit Counter Reset", FSL_SAI_TTCTL, __bf_shf(FSL_SAI_xTCTL_RBC), 1, 0),

__bf_shf()?

--4U4VAjC1uItOIZh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmF/KcACgkQJNaLcl1U
h9Ds6wf/YWaxs5YOsfGQrXDpwAs4yUlLFDh7y71lDdgia/JOhB8hzK0DcB/7IIm1
LLdfmXH7FtIoJRSC7vnsb5Z0aGZHs2K/uiD4qBt5GIvJO5tB710tCR8I+g69wQiB
ojaYxQHlF4OOIz+NOoWCaBUtJUEbMaEPntJtL9gmeCWYgFyYXvXFk1zmcpdyYCWy
O3IDrXOlJF66o88YNwtQzlNfrBLnMNMAoP1gdZaEA5ffpb0y5f6nT22UzKmTBMYD
m59LPLxxlCP73/Kre6gxR0PuRoMCyNn0vrPwgfG3BE/1QjXzhdO4fS3aSCUEewJw
1sHHbF7Jn2kP525HIOYPoPgm9hhErg==
=XqPH
-----END PGP SIGNATURE-----

--4U4VAjC1uItOIZh0--

