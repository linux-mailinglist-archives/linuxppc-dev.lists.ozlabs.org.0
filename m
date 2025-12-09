Return-Path: <linuxppc-dev+bounces-14702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78126CB052C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 15:45:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQhVJ29Mhz2yFK;
	Wed, 10 Dec 2025 01:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765291544;
	cv=none; b=Yz8XPfeXiruj4U/eCqLzBSPpi9PfDdJp/Vr6l0WUKXaj9IocUGE3gaKHXfHvkOS64tl+pTrLzUP+j9HZY4T0TpXKa7q8tbNwn7uUnfabve95hGKLN1VieZTrs85srIx6T3FcvglWrXlFlYsqV11LKPdWMvwanY1JvoOzo1zCbxf27uj9oJMiWQmxscKpQN3F5ynJW+j4KBtZZr5xIM50elvpC5hOnpwhFoodoJpAaWGCejWgWhL1vQ2keBzENp8GHjRsCX1/JEfVjrYvx5IJJOpriOeNs1sdfxQl+x0JCAYvSPhaJ6rTn+r4SywfzrGJ6pPd3h/7arQyDMYwN2TLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765291544; c=relaxed/relaxed;
	bh=kVOhHzVscYty/G+BBWATwCjtSn+LiTKUykdCwHdrR88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODz/TprsGYeB4qX6uJLRco/j5nOEtoPgKtLSGVfPQyORiwA4d/1Ldte59eR15Zp2o78+Wzbl8DUPzuMSSKodLQYS+kKty33wU6RsbEZ+ae8jLQmyNmwuVJgqlcrH4KX4YvEEoU6VMcaS+AsTa1kxVDLm85gn2rsRABwzr+pbhQDCpz/p0EfiYxskgTZ7zFsCOon2sHbaohoByi2Js26V6AjYp5j7bH6NOXUuNGk4Ug6qQPwy0zhX1GIJ6DG3zvGCKjiEWic8jkZJ1OUNWFbiEcMqhI0aCaRPolW2bcXTggpBSGdaIteuK1WKBb+6dcyig+3HufCsUG8/pcpycjt8gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jWgJPiAw; dkim-atps=neutral; spf=pass (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jWgJPiAw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQhVF5bghz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 01:45:39 +1100 (AEDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b73545723ebso965327666b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765291476; x=1765896276; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kVOhHzVscYty/G+BBWATwCjtSn+LiTKUykdCwHdrR88=;
        b=jWgJPiAwB5tKFYVLG1LXrKaSd8qNZ1goR0YWzDaU9I+L5sxfi8fOhQHXxtg+C0pZ7d
         utA+ysmi+3yPCQgMuDOWYoT4phfwmpW64nfYa0i9/lAErIHz0TIZPoWzPZ1XCrLd/PRY
         HTuyNOzD0b3kjij892ie9Bszx8sIhiAYxIGRBhW2USQF3aNe1XLiwTL6sXM6UkOBNX6r
         BSiv95WC8ZJFaoPdIpBWo/mUL22kqI9bIkLYrvJfC6mvJzLdf97WnJftcPs2I81F2z77
         sgGWAEVUw6AoLMEUFdWc5cAxgdfk6Zb3hO3qiCLLap3nNvA8QNFLQJEewefHeIBaZJvY
         4+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291476; x=1765896276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVOhHzVscYty/G+BBWATwCjtSn+LiTKUykdCwHdrR88=;
        b=UCQfwjX8XujJL7RAuDZADQA1TcJSKtmtrs+xVwcHBmS8hykmTfbUxyzuMjnq3nulcW
         7dpk5au+V4cjmnboGDETd7CMLd5mtINsoCTKSOOPFbiau3H66mvjiNsvrTh1/STqZS2t
         grfSUPVAwlwATRQ+21lLYzqzOVy4YQYilfeeIR49PJAa3atdmekHADuh9Qt2iJXG6V9k
         Lx3T4gbHtL6S+U3okUgKCFsZHND97q+kwbzqiWBPil6FAFmHkN8LQ+7LTsh8I5hd8cuJ
         xc4elEjJE5ZgtTMBbsM35YghwQcxgDLFcQm6eXm5qDo4XEpBwSp453E6r7vb2ioi3XLc
         qTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUqONDT2zyjN+h69aLXW1QXL6Kp8shX8s4J8YfICYoGML66fQSdXGnc//GUfGzC5Vbdku3RvpvgLD+YaA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxqNXYTU24+S6ix+weaA5SwiYwvrMdTjxmIEWWStUaCfPuhDCg
	5mNACTBN9Kq9s0LAJB2BBz8s48/eLsNUDLU/ymi+NZdx7iL4ov4CP0Wmzw2YKPacyts=
X-Gm-Gg: ASbGncvrJX2NTyf3rZxRxGPIexNqYlWawcmA8dPqNTYWqhyK6Gw+XGGlpz4I+x2+p0S
	26Pqw2Cc6w7HEHHw/JAZpKH9ek7IJzVjXtAxYbzvlKpJpHn/GiDIXpJVLRy0rz+7m/oSgZQSsCC
	YV7hNxKixtpcjxrY/vn+yPwjnAKXMkLazXeLwvjzRWyW4owSxFVW1IhKnnPn/kK7VJ2jlSITuAM
	BSDmbpNulGWjj1crCyrgrcN5CEzceVMjoHx5E53mbb7EiwKYKVMPjfOAH9FXBGvuuNC1QNAdsnZ
	r7Ggx0QmZ/GF9IhMcOrEXi75FgLv/5WHPfdHlp/66/9kn/BbbQLApYCQenW6MGQyYkscwAJSgAM
	YY+3a+Ca7fxnl66PMkScbAgFDv97Pdad51Qmab2oOZ26rAg5rEKtKCrYkeh17wpgztcih57TTb5
	jGgcieaTVii1xIJMxG5Vq4fmDELS5m4tX89dOVMf1mnkMsBjr8kW3zDdwJZJWfAwqot8ORsRDjr
	Co=
X-Google-Smtp-Source: AGHT+IGniSPCVWdbAdR6lXWT2hrO2Vb2FI+DEc4Pfx5sd8xCIn9sZrCMfwA/MnGMuGUmxfgYWSBPlg==
X-Received: by 2002:a17:907:8e96:b0:b79:fc29:ebd2 with SMTP id a640c23a62f3a-b7a242bebe8mr1161488266b.3.1765291476544;
        Tue, 09 Dec 2025 06:44:36 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f44597e6sm1410280966b.12.2025.12.09.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 06:44:35 -0800 (PST)
Date: Tue, 9 Dec 2025 15:44:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Cope for unbound devices in fsl_mc_shutdown
Message-ID: <jibl526ybakduh3rw6u4e4apij2yny3isdhmgcirbk6vj2kilv@ans2qvz2tcvd>
References: <20251209115950.3382308-2-u.kleine-koenig@baylibre.com>
 <c51882f6-500d-481f-adf3-c257fb7ea47a@kernel.org>
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
	protocol="application/pgp-signature"; boundary="wkc5pao2ioxlxdwa"
Content-Disposition: inline
In-Reply-To: <c51882f6-500d-481f-adf3-c257fb7ea47a@kernel.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--wkc5pao2ioxlxdwa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] bus: fsl-mc: Cope for unbound devices in fsl_mc_shutdown
MIME-Version: 1.0

On Tue, Dec 09, 2025 at 01:05:50PM +0100, Christophe Leroy (CS GROUP) wrote:
>=20
>=20
> Le 09/12/2025 =E0 12:59, Uwe Kleine-K=F6nig a =E9crit=A0:
> > Other than a driver's shutdown callback the bus shutdown callback is
> > also called for unbound drivers. So check for the device being bound
> > before following the pointer to its driver.
> >=20
> > Fixes: ef980bda574d ("bus: fsl-mc: Convert to bus callbacks")
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > I pointed out this issue a few days ago in the thread that resulted in
> > commit ef980bda574d, but didn't receive a reaction so far. Given that
> > ef980bda574d is contained in next, I guess it's time for a proper patch
> > to fix the issue. Here it is.
>=20
> Thanks for the fixup.
>=20
> Nobody reacted against what you pointed out a few days ago so I guess this
> fix is OK.

Always the optimist, I think it means nobody bothered :-)

> Unless you mind I will squash it into previous patch to avoid having to
> manage the Fixes: tag update when I rebase to 6.19rc1

No objection from my side.

Best regards
Uwe

--wkc5pao2ioxlxdwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmk4NcUACgkQj4D7WH0S
/k64Ggf/cTuXXm1dYWrAq71Z5O1Fg8gsTcQZ3naAwNkkb57K9oKd486/861nzcGi
/BtQjQkWl/mDaCCFIPmqaYiguPw16EVpz5GgUV8uSO2+CgT9IEztz6/eh+i/IbaA
SfnPNufUr6jsHgGNS8uWl4XqgK0ny7tYXYRQrT5rL4u7A9Ol10sUhos8OKV5yPvx
aA6bMcP5LaEUoS22exe6alLuq/I0NuHOsMhtmiSJ6VclQWc+sITwTpHjhn9B6R7g
IbkDGgyUdwEaoC7h6qTjc0tWOzdnaedJXA2Z3iqr6YHzsZgGxNSwhhZVu7a78ORY
OP8nOKTruSrYWhlje6lG1wqsMJcTRA==
=5b1I
-----END PGP SIGNATURE-----

--wkc5pao2ioxlxdwa--

