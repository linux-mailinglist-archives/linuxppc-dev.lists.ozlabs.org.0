Return-Path: <linuxppc-dev+bounces-6120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E817A324C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 12:25:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtGFc0xMxz2ynR;
	Wed, 12 Feb 2025 22:25:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739359524;
	cv=none; b=GQaJqIFSL9OB9Dn2WA7qLLjiZIJ1ei4D7jiMRSVcfTg6VgsALYXFVYgj26HYEwmnTG66Ppvdxbz/8/qqLgj+IovCKTgs0fUG8FKiHOXN6goitmUGNeRnNbq1TSxZt6PLwjESCPjAxcmJP3OOMuvYSbFZa3+PZHBHi0M4G/6hg39LFngtD/OBTSM0w1DKIcoAmZSBxgXQCLJDFvC7hSn8gqQqeGc3ZTxbZAaPaOBLtdlJj/s1kI0cMmyW0kTSnctBKHfXUU1sqsUJo0yRFW6cXv7NF0SF0GhDlTZyrD9dDnhPHG8JqoAcAMtLpQb/jhnkiZrOOOXBja5HvjLnXxWExw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739359524; c=relaxed/relaxed;
	bh=TgoLBoSdsmfmuqpXM5gofGXTPEUeyBBSV93lb6OMC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e94O/1uj6DNk4Tb/ucjw5LDSo/UYf3Iro+CD7HJjTNdgXZKSpTxWcj3BRyMOL2FsIj1LPv1XK2t/1mEFIMICz9e3TB8p1IBnyg0k1/38TvNu23TGU+/1EVtCg+wmaWkiJr2s5EuEw0Hwwf6s2hcEe2ZIG3DPos60puUuR5bnqhJyTa6RtK7hsuIrJQt5Km+QjV5jLJxjL+VGOJ28nrI2kZliAfrPjJO2cn0rFAem/sc+ild6coGvtbN20wQC2tgSj1yAw53pG/L5LbSRBxNZSGj2oeOYgsP9+F9ux721crCIY5HGYfWYC8eIF0xu2cuhcO/r3EBF/DfbFtdjUJr7vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EA0JJgYb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EA0JJgYb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtGFZ4VcDz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 22:25:21 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f55fbb72bso87309155ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739359519; x=1739964319; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgoLBoSdsmfmuqpXM5gofGXTPEUeyBBSV93lb6OMC7Y=;
        b=EA0JJgYb7UW7LfLqY99omNVuGI9Ih3DhOdbWLcA96Lcjcihb+6y1Z9E1HwdUul6M8S
         DZIj6+DneO/+PulUqOOYgqaj0VT4o14k5V4zJZOx2dQw4wSa2hFSET2m35ZkKMvKN1bL
         0bSH54Z1XAQRDo6mCxz4WGns6HafrVGR/17vF2w23bB0iA90/DHk0TqcQ8iXF8vpbYzi
         QRtdJZZcWcmxd7TDvtQwVTNAY7YXWxMRKL6VPOweeP4GNAhG4M7XZLxxHbvh6E23Tz4E
         kpBprpOGSPTRSqWS2Y41gClhaAAi91eVyFCGufa7/1ghiTUYp5AdJfK/HQh4Pv6yyZeX
         cZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359519; x=1739964319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgoLBoSdsmfmuqpXM5gofGXTPEUeyBBSV93lb6OMC7Y=;
        b=M/RFr3AWdN8ScGR3iuuOT9SYN3fmm+9JWAkyEPouUseJxsFTOh74DTZq2dWOPk5Hsk
         GMbY+ctDBn2wVtxpGeV402AiqYFMVxMx2+gIWgDCwSPX/PPHk/4Zp/rSSvOKdr6wCK92
         xtxkFCtCR2bxDaAE9ooe0SzGEzkoq0avLWwyROC2zAXPr5Hr6C91/jlBjIWKdx7GzO05
         CpZS9w7FOUDoN9T7OkdiL9SHCrYI6mS3IqP5U3cUC6g64L/Mw5BSaeciyxLtuA0KR/0x
         XuQDj8y+LnEkuimaO5lK0VzQuMAWc5o7ogxay17Qo22nMpU0p8VzkGI0dtB8ymkBeNCY
         GXGw==
X-Forwarded-Encrypted: i=1; AJvYcCU82Vxry6JT99xtDCsR/aDMDGS32x+zklesZUlb1wXXpQ87WIVXCy9RzM7UsAo+dmumldB5UIbDnLXb3yM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMoWv5ghRLC+gRxKFrHAn5jGznXV3u7m8SoyjNDLob6c7dQuvx
	8f2wnteJpmy6uYM3BxmpUAwAWyjA5/+1ad1ZiAUnS3fAm61R4Xgm
X-Gm-Gg: ASbGncsqjcpR9YY7gYtJJEEoBNb2gE+pycOuTMtOXrtTJWdgdlOc3w6TYRcI/TuOGTz
	+jYHnmqID2PxJF7GtiJBMd/94CBi5PuQOVBePEcs4ZB59xczs0jzuqAy2YZgrJyI0AoOfPTBsOJ
	PIeGeckDpJiy8rUJylEI8bis+EDRp2KbAk9axPPjToPuD+FUGgArAHVo0qrwyFHNN/au0lCzHGI
	6NaWZu9hYgg+YDnASVHFSmJMWw1eS0xh4Cd9BkI8oBoexDuomjxQl6Co6601w/WuS+1xJUYzYCB
	p6g7v2g6vLgu/Hs=
X-Google-Smtp-Source: AGHT+IGSXAu22CD7MFAjaX8B91j1oDJlyn+2ztCU9HVQMzNMzKgxATJmndOJK7sQ6+CxJ94W1Ao6xg==
X-Received: by 2002:a05:6a21:3987:b0:1d9:6c9c:75ea with SMTP id adf61e73a8af0-1ee5c732ce4mr4676523637.5.1739359518743;
        Wed, 12 Feb 2025 03:25:18 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308cef0957sm5468012b3a.5.2025.02.12.03.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:25:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EF2E541F5559; Wed, 12 Feb 2025 18:25:15 +0700 (WIB)
Date: Wed, 12 Feb 2025 18:25:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andreas Noever <andreas.noever@gmail.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Dumazet <edumazet@google.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Young <sean@mess.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	James Morse <james.morse@arm.com>,
	"Nysal Jan K.A" <nysal@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, workflows@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] Extend automarkup support for ABI symbols
Message-ID: <Z6yFG_NntQfkwYli@archie.me>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/8yu6IEGS0ve/RxO"
Content-Disposition: inline
In-Reply-To: <cover.1739254867.git.mchehab+huawei@kernel.org>
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--/8yu6IEGS0ve/RxO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 07:22:54AM +0100, Mauro Carvalho Chehab wrote:
> Now that ABI creates a python dictionary, use automarkup to create cross
> references for ABI symbols as well.=20

I get three new warnings:

WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defin=
ed 2 times: /home/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-de=
vices-system-cpu:27; /home/bagas/repo/linux-kernel/Documentation/ABI/testin=
g/sysfs-devices-system-cpu:70
WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: /ho=
me/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-devices-system-cp=
u:89; /home/bagas/repo/linux-kernel/Documentation/ABI/testing/sysfs-devices=
-system-cpu:70
WARNING: Documentation/ABI/testing/sysfs-class-cxl not found

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/8yu6IEGS0ve/RxO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6yFGwAKCRD2uYlJVVFO
o8lhAQCQ4fRHrhmP52Ie1GWpvmnThVAVajYhveINLTbggfy+8AEAmFJjGR9fv2Ph
AlybXGGYbN21qaIJUDcQ8kIXnvwi2Q0=
=z6el
-----END PGP SIGNATURE-----

--/8yu6IEGS0ve/RxO--

