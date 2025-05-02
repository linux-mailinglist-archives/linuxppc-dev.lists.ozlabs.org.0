Return-Path: <linuxppc-dev+bounces-8241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C0EAA6BC7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 09:38:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpjSw1TDdz2xlL;
	Fri,  2 May 2025 17:38:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746171488;
	cv=none; b=dYf46aSQ2Rd5fY/EJOznJ8A2YWxu9NMp5OOQNxnLQf5lahm7kwVp0Jscyrd+m9XjJ17H7e778L+kz7j7HlCR3FbQ/Db1FhIOBJsx4rlcpVa+/NpoFcXYtui5dpFSnGrX+pc/4Ubjtoi44su8DcO53/8hP2ILT8YtHpcn7l5InLTx/sFdpwZHYWnB7Q7GQlhtFAWigO/3ldOFNCgLGPOsSiSxdv34nNlX8qRp4CxpwKwp/QnB5uuZ2cwbvkqxoQXx+bpz56XrVoc+zDMJZAUKSC3J8ciDt10yT/0ayc+34er+3hFJFFJxXFKq3XN2E/yIivyhn783+Hf6r3Plu5QIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746171488; c=relaxed/relaxed;
	bh=WIUUdyhk+vjr1/jIeHCt06X37I+JMP5uKdTdJjA4jRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzjwwmLudYZ0iaIe+rJ67JMB2BYHdZxB51QWw05IrRqZX23Sw06+ZoEoDysd8iK9xaWOscGfw00kJQsyJin33IarfjpOcs9dlN9Vz+RzPGS/fNADwxnGYEGBf2d6ciJibiLdhfQjykKbk0bbFmsTAZ/X9fblB3VFbBDgrkG3nqAsswJ3OYELIKKKhn5WSk2kHtVn3mkeaznE5PvEMLkfrDbFfxFVf6xhmyJIJv5wPokNHzFGDpOsFzCeeYuXrEuHpQKor96pcAwNRo9iyuYjMW3lYCB1/+fLT0oXW2YpcnJMNQHfeyyNSY46Ya1E/8XZHSTkUVL8aanxdyPiuFg/5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X5rJAWtt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X5rJAWtt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpjSt5wldz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 17:38:06 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-736c1138ae5so1850756b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171484; x=1746776284; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WIUUdyhk+vjr1/jIeHCt06X37I+JMP5uKdTdJjA4jRY=;
        b=X5rJAWttMx3x608iKYljWa1zdEiF340i8aSHt+xn03X63GOCXNgXK6XKBshWpK2gjp
         tvzLsIAkg2dnKVaS4nWCjDWF8hx00VO3DRSVwwQXC2QzLQVWOp+BKQU5DMWqWR2ba+wa
         644sfL9kRZGOZ1wcSZbLdiY5zTPkayMuH2Bq6hhqgEzANMEM3rYEClrFLIHRmE2iOK99
         ik/g+TsZayuyKtxp/kKCg0/dJhLSAH51AD49w2JfIBn4qk9qWKzG8PPI6SiAZEIDRzqP
         8OgLNPQnz6bQl5H0smyztWfc+2tGT3PMYQmU0a4fJN4FTbxawFpYkOhCC07MEjpNUsVa
         ZHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171484; x=1746776284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIUUdyhk+vjr1/jIeHCt06X37I+JMP5uKdTdJjA4jRY=;
        b=Lh7PqWZkUGqDPrheTEiSZEkYa8W8lk/3I0t0HTfnr8lTjZUgM/bcLvP9kT048V8dTH
         Y3IRSJ3+216ClNoyMYXnNfwHTZqEWmScNZL7dr8FiDlaXxBG20Pqd7x89yGHSW5UgTmu
         yYJOAhj080lZCntOexH8aPQOBVWEsdVYGjl+h6udbRnc4vIItHyEJrHC3/r9sbLMIwLq
         SVRVvlk4trGTBjOVLWbzJ02Lk9leglwuUi5R0XhvsoirzhseNR/Ouf0E1wAiLPsWsRKN
         K3DOPC/QT5cnC78U+xiW0X2JAa0dTUwtN3ULh9y3MZTv9CR5iRnhtAulfWoB44tokhMA
         ERFw==
X-Forwarded-Encrypted: i=1; AJvYcCVw/ocv8R8Y/TnLdU4qbfACb3NrmHmLWfwWTnvTKZDHDlQsdPtGyB36F5FkQKLeDn306jVM79Aax6U2Opc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEypjKeP1+jqtHtdWXY/g3UUtBwtv+YCNz/hvrUZmcKRdEQfQ1
	cvMFw0q2eVF52ZuAl9Mi661GJl8Me1WcTzpdJkAUTAAYVFhV7Xxi
X-Gm-Gg: ASbGnctyY1lz/uBpMXR0v7MqSlNpuPUUtAQblY2fa9wxVvnp8D90HXu6yJFSNZw5Hne
	A7su+nT4Nvr+kjsHqumK9+Hhs3/Z177PP3KdvmRX6RXhs5bL2j4bLk4sAWfpGuc41YjXm3KkBKZ
	0B+9DvdRm+92JHwkNRO7l5FfTm8bY3x9IPxK7BBsZ2SslRgP1gWMPNzTGNhLcF7i8QE+89G+1bq
	mok+M3meSgp27cBnX1/mwEQvrglirffgdcalwkg+lVt6crqPNyqC7OCf/P5MvmhmxdSPERzOtYf
	JwOVTCSRLjA1xL2tPV5RIjc9dNqPKr79IdjE2Sro
X-Google-Smtp-Source: AGHT+IEkx5U45M+fmLoDrTtgXvtx/OHL0KLCFdrVje198BJ8SaCMdXadAKJcV3ecPgmXQZf/gd2R9w==
X-Received: by 2002:a05:6a21:33a9:b0:1f5:8678:183d with SMTP id adf61e73a8af0-20cde9525b7mr2724388637.14.1746171483583;
        Fri, 02 May 2025 00:38:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbcd0sm922663b3a.63.2025.05.02.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:38:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6C66D420A6AB; Fri, 02 May 2025 14:38:00 +0700 (WIB)
Date: Fri, 2 May 2025 14:38:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: sfr@canb.auug.org.au, tyreld@linux.ibm.com, linux-next@vger.kernel.org,
	hbabu@us.ibm.com
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS
 ioctls
Message-ID: <aBR2WF9VylGPSNlj@archie.me>
References: <20250430022847.1118093-1-haren@linux.ibm.com>
 <aBHodTu4IjqzZeXb@archie.me>
 <5a23e0d7-f32a-4097-b3cc-dcccb7355778@linux.ibm.com>
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
	protocol="application/pgp-signature"; boundary="uhdSpaHqEo3xkb6N"
Content-Disposition: inline
In-Reply-To: <5a23e0d7-f32a-4097-b3cc-dcccb7355778@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--uhdSpaHqEo3xkb6N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 09:42:37AM +0530, Madhavan Srinivasan wrote:
>=20
>=20
> On 4/30/25 2:38 PM, Bagas Sanjaya wrote:
> > On Tue, Apr 29, 2025 at 07:28:47PM -0700, Haren Myneni wrote:
> >> Fix the description format for the following build warnings:
> >>
> >> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
> >> ERROR: Malformed table. Text in column margin in table line 301.
> >>
> >> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
> >> powerpc/pseries indices API
> >>                             <mailto:linuxppc-dev>
> >> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
> >> powerpc/pseries Platform Dump API
> >>                             <mailto:linuxppc-dev>
> >> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> >> powerpc/pseries Physical Attestation API
> >>                             <mailto:linuxppc-dev>"
> >>
> >=20
> > Hi,
> >=20
> > FYI, I've also submitted the fix earlier at [1] (but different approach=
).
> > ppc maintainers, would you like taking this patch instead or mine?
>=20
> Looked your patch (thanks for the link) and it is more of generic clean u=
p.=20
> I would prefer to take Haren patch now since it fixes the specific failure
> case. But would encourage you to send it as generic cleanup patch.

Do you mean submitting the cleanup patch (essentially the same
resulting table as my patch would) on top of Haren's patch?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--uhdSpaHqEo3xkb6N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBR2WAAKCRD2uYlJVVFO
o5EeAQDgZMzLaVa90fJIFN5X/wUO/RR6qiHLHkJlzXscE0f+QwEApjJtouQHYJtQ
OY+IXAvOY7ZcKJQoR0c76S9eTZFnUgw=
=J55u
-----END PGP SIGNATURE-----

--uhdSpaHqEo3xkb6N--

