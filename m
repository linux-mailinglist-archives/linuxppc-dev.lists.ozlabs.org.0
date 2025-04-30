Return-Path: <linuxppc-dev+bounces-8189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA97AA4E20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 16:11:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnfHP3rXtz30Sy;
	Thu,  1 May 2025 00:11:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746022273;
	cv=none; b=od/EaealKGrYoIZhtMUYaRnflORIBJinShgV3maiu+4/WW1W+BwbqoUp/x7UJbIwLSU6R7fGbPXYzMOf0m8q4tnYHh2ep9T2uu3hDDvCIXUXzYXpRAOeh7pu/6gc3xvxPP1HkfARNCJGOVuknvuAWwcgmJAXCtL/elK8tcDp+LjvIRzz8/abMGRY3MG558+aQq3WTIkNgq5+SEEg3ULXPdApInVzN+XRBScviCPsg7PcAFgFTBzarH9ywshIKgnhiVdZBjN1OXdvnEzbOIYmTMIM48tYFYxLTxo3cmHAKg4b+Tk/WGSB1PaIs6Os7kUWFCACjhPwhGydeiFYmM6/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746022273; c=relaxed/relaxed;
	bh=dsud/2U/NzgyuLT4SAm3RqXxWU7GCVGgm+BpDHgFKOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MybgF2L1eJ+Umwr9+HCG2pbXutOsS5i/yK9hnuZoljAyWuUHzDD4EgFyIZd1ONPZdXTk9AC+G3nuqs/q0PyUt9C3YZZEeentSZwT18YyQVyq/WM+bVbQ6usr2vticvRWZU0eSk6RgTTqpwmwXY96IyhW8YeN42BQHWeKWZhJaSUpKQbqCD1Gt5B1YmZpl32NJTUeVTGEOejJZTpXfHEFUXlzJFhBUa+D0MZgaS5rceTH0v/yBG3yny2K+JXVonLYS/ThvMMtlJ5Saf0RIv/tRNF+CJtetdefAXHy6tVbYFKpfbjB4HqCwIbAp6TEVpUe0HlQWR5P746MuWyhkkTSbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LuGlR1W1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LuGlR1W1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnfHK0WQ3z2yrQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 00:11:07 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223fb0f619dso82308495ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746022266; x=1746627066; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dsud/2U/NzgyuLT4SAm3RqXxWU7GCVGgm+BpDHgFKOM=;
        b=LuGlR1W1kejB08xzpJWSkIKOPkGO1Fh0zLqJV2i/ezQ+HRRUmgr8FkH7DQ2KvdkAz0
         cH+8fPT2weTO66dGQPzg+9/BFgQXun6CGGjv8Zg1SbCGRt8FsWl+FYUgfUIaLxwdQ5V1
         7rGQfEiMThr+voukFGSTgcJ/4jVfeigXbS6e8ugcJxq0H4/Z6AHdcAcqAWJXvmgB0qJU
         WRPDvpS//b5toRnrXUXlN9CLaZeh9c1SWogB9QHExZ9o2mUgAtbPN0JtnRqTMg6NlgkI
         jGmFe86bTyVyK1tidKUPcDFKZaoJWBFY2RvDtNFqsK7GRJMH/LtgKRoJ5NNLPgLSfXuk
         z6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022266; x=1746627066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsud/2U/NzgyuLT4SAm3RqXxWU7GCVGgm+BpDHgFKOM=;
        b=FuCbLbu3Pju0XWx4kKtK2fNBpgMMVMdoTNLLnQJoT4AWnDMp+ysKn53NhSNsFvXmzx
         k78OllnXOB3lr45IWlBLjA9Ngb0Lg7OIUnQNnSsnL5At95LQAtQx/jjxpaOKkPbnGq54
         YamirkdYiG+iuOrXb9DqK1EtlP1vfy10+AkjAD6uxTpyOZcMStXUkLIdYot6+cU1Z9jT
         +Z2WHBdWys2oSI1LGfAx2fWNDk6Dvh/L0DHOze/ktecmxuHQTezdE29DTNjQqBggjDOa
         Hp0n1pHHc/gFisA7a3jBGRjHL94b+sF8yVP6PDlgGGnSeM00jGnSSlexSeLrVlKb6sKO
         7how==
X-Forwarded-Encrypted: i=1; AJvYcCVdYrSIIVR3ChR4DF9M/6QwX/zGyeJHsj06jU72W6+90Rq1Kt8a02rVgihIn+ryrYH7A1OcJ/cYX2394Dw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZEfzyPjOJlLZ280Ow4bQasPSKqbUWbIRrIGWKTIag8ymZJJLq
	rzLPQpY3ess8IA+KunjAJIWsza6R4Q+N9l9agjKGWPtPnhlVVGIB
X-Gm-Gg: ASbGncurNaiBV5WyGouTrLOAh9xgPFYRDQJCtYKPq0UuM5x4LZAxD7rn3mq0oT3ylw8
	olV0eQq0YGRGAL6AnIJ/A6Fu8EEotBiXxJV7tuAXzoIIwD8gnnhJj9JurIPsyMCOVERSaigHOFM
	lzfrfZKXPVVGtwxs/jX6XYlnECuZbUXCYgSXsPeaWpPlGM9ycnVYbea9kVUI9glNQn7G/Mz0qLV
	G4b1UftbfaWE00HREYIF7ZUTv5XGDvGyMhDCoHa+9jf40U8MpNp5RSKnZ279uT9IZbXLhAzXmZe
	dCW/TialvYZS4BS1Ps6Y3Rnz90AzPzhMZwjWtsOi
X-Google-Smtp-Source: AGHT+IF0trVfcRYBBwO9lBLK8KETXWSFQfqRdeh2DW8hkHBJS+ZTFbNfty9mP4zPhIeEhtDyItzp+A==
X-Received: by 2002:a17:903:4405:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22df35cad23mr55838435ad.49.1746022265792;
        Wed, 30 Apr 2025 07:11:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a9fsm121976415ad.111.2025.04.30.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:11:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8AADD4208F70; Wed, 30 Apr 2025 21:11:02 +0700 (WIB)
Date: Wed, 30 Apr 2025 21:11:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Alyssa Ross <hi@alyssa.is>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Documentation: ioctl-number: Extend "Include File"
 column width
Message-ID: <aBIvdqKy9cCQPLox@archie.me>
References: <20250429130524.33587-2-bagasdotme@gmail.com>
 <66e4a803-05bd-4fbe-96bf-84415eefe412@linux.ibm.com>
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
	protocol="application/pgp-signature"; boundary="JY5zQzvXTsAY1P1v"
Content-Disposition: inline
In-Reply-To: <66e4a803-05bd-4fbe-96bf-84415eefe412@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--JY5zQzvXTsAY1P1v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 06:38:27PM +0530, Venkat Rao Bagalkote wrote:
>=20
> Note: There is other patch [1] <https://lore.kernel.org/linuxppc-dev/aBHo=
dTu4IjqzZeXb@archie.me/T/#m013297a6731d3ca3dc1e0f23d161774850d6b41c>
> which has a different approach to fix the reported issue.

Then let the maintainers decide...

--=20
An old man doll... just what I always wanted! - Clara

--JY5zQzvXTsAY1P1v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBIvcAAKCRD2uYlJVVFO
o/EaAPwKtcQ1wbetpC3zLm+DuLSa5qEQtOm51qI4RngKFscKnQEAmrD6Y/Ovyazo
mBa6qHv4bKKYjW2KLekEMQyFs4iPHg0=
=NWAu
-----END PGP SIGNATURE-----

--JY5zQzvXTsAY1P1v--

