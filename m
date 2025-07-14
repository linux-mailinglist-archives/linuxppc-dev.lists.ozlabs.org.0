Return-Path: <linuxppc-dev+bounces-10234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8C3B03415
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 03:05:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgPHn4GgMz2xlQ;
	Mon, 14 Jul 2025 11:05:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752455109;
	cv=none; b=O8sVWqaB59KLhpIbTiaGO3xbPWedUIfxmDOCogQxCOSBUAyzBdILKwY1BbYzQ8fopKegwPPgGanSlCCM+eF6x5kUyHNomo+sBdHKXzASBlXCI8gtunWUcBI676c8orK3zd6XUzr9ClNjsAbO/f3+LttIeSZxw7uf/uSdbfuILB85tHz7sewzetpTcEMzmif9gO0uw3Gcji765I+m2wcByxwXP6Ph7oQ/sKbDKQhATvnWJraPOTa1uEmlfSseFMLJ/Tgiy8I3nppKQeaVKnzNDOw5b8SNdr/v9P+/Q2/916sXpRBaV+Uszi4gB7FuWTvuLDxCzfBpgpN5AI/P/W/pzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752455109; c=relaxed/relaxed;
	bh=OgjzoolF9QAkZAGrz9Zh/lCii89swrUvWtInk88c+zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWcSeHmGrvxlF5L0O6wmvnkYXSug8zKib4IvFzPZlTDdawZTi9iWM0oiGVttkM5pjU2gzVh6wDzDfCVB0DRlJhe3wQnAGk3T23J5mD4vJ7s38ZyMkNWbu8LHdhhNO+0eDTIJoHQu8Ip1HCy0HpbS/PIG0HF/GppI7qn+Fk6dTLAOi/7J5+KknipuTKjcNGJa/3mLpLbzL8GFNTbCVkfABMF7+jcxWI3kZy5/jbeZqrgC/AiFAresbSMX+zz2N6gTHFq5sL6NOQcwwiVKXS+eZdOTFZFGTdjuyXgvv/FM45J+2JBta5lUaX8f2kn5xG7nc0Gf6jHuDLye4LR6hE/WYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y44HVB0g; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y44HVB0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgPHl6Wb3z2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 11:05:07 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae3c5f666bfso674538666b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 18:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752455103; x=1753059903; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgjzoolF9QAkZAGrz9Zh/lCii89swrUvWtInk88c+zg=;
        b=Y44HVB0gNQpuZa8tFYi1V45nNn5LlyC2wceKNO4v5EFvw1myN8AxHY6cNUzDFzZgYg
         LZqzsPdmMFg8ZjBLOlwDqZye6xvcEY1c/3mmEPBLPTZC/HXtuO0R01ooHA6NQr8nluA9
         Aowec0op26KVGU8WKdyCFIjcOxjRnZWWAs2gob5OLlEbtVcdd8OjwhOulleKmMADK6/N
         E3dHlpjSHM2J6wlUBRB5eajSAlcbwoddtofbCbCqJLBrFh5z06tK2nMSGP5sDNlKH0AT
         zzaWh1fIZcvdebDPNyQmiig6l4Wsb55saTDXSkbxmTPUDZI2x8FXUHj0Hkla8Nj0qPSM
         LCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752455103; x=1753059903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgjzoolF9QAkZAGrz9Zh/lCii89swrUvWtInk88c+zg=;
        b=EllR6rcRGe6JjPmkQNqdgGqi5ZcAPW0zmmtNnE5p9ZckIvE4/I9m9/dheHOI5JXGjG
         0ULwyyGgVr4OEbrAhy6ebdTgLj7EslR+gOctv0RG05vYUZQxZzuUZx87BHwrhpqcMY51
         VGyAJ9rDKQyzuEQo3q0gTuOI4yExtooGRFloccImn5JwI6Afgc2cYqkLMLkDBax+bCf6
         IjDIRvyiVxRNVcjnXAZa7CO8jfji+57UEJRa5Q80Uvb9rObcDMYG7/tXda74lqWXHhn4
         wYA3/m0rw3g3mm1UUUJDob/qR/XEduuLYTclcOi7v+ZU4PS2QzDBc/gUFCdrD/hT8A1m
         pw/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJGxBlyHRCaSiQfCY2VsCCOdftPUeU4xN+lBdBdzlws8xqh3TppveZ0uDFdYF55g9a7RxJdUmeBv+os1I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzH/atuJw9l/Zgc06FL4dSIi+uSmqHLLOs4O7kc0CFbL89paRJp
	E4c2gfk7l8xklDCs6B8cthHUM8+KHhbgczKUe2grr1YDgW2D97RyHVVd
X-Gm-Gg: ASbGncuF0eGzJGOxA2ZBTVZhMnO8jfGUPol+rONWs5VL+CDzqSw6OgWyV5jsd6X8oq0
	MKl7k5pDa7nbZWW9Wh7o4TeCEf03X2wEsnCWE0OUBtJApDxYqruDZK0GK/Ttrq8FyMAOyQ0WVRI
	s/taD+U4SofVcLa3KbkXpux9wNyRqTlU8WqSXpzEF5wrRVov9yAAegqz1pMivJCYShW2Ks2kC0W
	lPSkh+bOvFWPwE/AUaIkRwEhombjJMSRHOeml5lGs4u/tsU4jGxYFJadwvjA0v2bbR+fWM1wBJJ
	TcVo9zWh4jGJL1ZgI6MzqjMmp7IDmIsBEBWTQOqMMEwu6ZJmYbTLcl/ZyYPT254rhO3NA/+1k2s
	INh+xRnghex+7rspg1mzsEg==
X-Google-Smtp-Source: AGHT+IF4N0NBIMf66QVWdB2Wvpxc2yAm9emz4Bom0q51CWzc2xcY8yNkAgcJ3cJqRGg6aAKkWLvcpA==
X-Received: by 2002:a17:907:6e8b:b0:ae0:c976:cc84 with SMTP id a640c23a62f3a-ae6fbda3f38mr1099077466b.24.1752455102421;
        Sun, 13 Jul 2025 18:05:02 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264756sm737302166b.105.2025.07.13.18.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:05:01 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 52EAB420A817; Mon, 14 Jul 2025 08:04:55 +0700 (WIB)
Date: Mon, 14 Jul 2025 08:04:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Haren Myneni <haren@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH RESEND 1/3] Documentation: ioctl-number: Fix linuxppc-dev
 mailto link
Message-ID: <aHRXtzxOeL3CnR5L@archie.me>
References: <20250708004334.15861-1-bagasdotme@gmail.com>
 <20250708004334.15861-2-bagasdotme@gmail.com>
 <3cdeef45acba94a1ab14e263cbb9764591343059.camel@linux.ibm.com>
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
	protocol="application/pgp-signature"; boundary="KXgAq2S9Sh2ErA+o"
Content-Disposition: inline
In-Reply-To: <3cdeef45acba94a1ab14e263cbb9764591343059.camel@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--KXgAq2S9Sh2ErA+o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 07, 2025 at 11:23:30PM -0700, Haren Myneni wrote:
> On Tue, 2025-07-08 at 07:43 +0700, Bagas Sanjaya wrote:
> > Spell out full Linux PPC mailing list address like other subsystem
> > mailing lists listed in the table.
> >=20
> >=20
> Please also add:
>   Fixes: 514f6ff4369a ("powerpc/pseries: Add papr-vpd character driver
> for VPD retrieval")
>   Fixes: 905b9e48786e ("powerpc/pseries/papr-sysparm: Expose character
> device to user space")

OK, thanks! I will add these in v2.

--=20
An old man doll... just what I always wanted! - Clara

--KXgAq2S9Sh2ErA+o
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaHRXsgAKCRD2uYlJVVFO
o9QUAP9hSnB9sVrTHZuYxdfH5z761AvDoeyCceLOal5lxQ5VoQD+KxDB/HFCPvXc
UeYj+rGMuNLiSKWOuxQcSY0TQLyOcQ0=
=Fvx7
-----END PGP SIGNATURE-----

--KXgAq2S9Sh2ErA+o--

