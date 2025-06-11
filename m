Return-Path: <linuxppc-dev+bounces-9297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA5AD617F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 23:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHfBn0sqHz2yGM;
	Thu, 12 Jun 2025 07:37:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749677841;
	cv=none; b=kMcV/uJqbH/6Pl44U6/8b9D/gE0u65S9sn1jIw6VWkUgjiEGg3+235I6BvBOB356u8QQDrCryuVSAYdm+RALtd3rrIUAcCN48Wb9001lNvBOi0hzq+Ref71IUI3zB7kQCgXMzSJGb1Dji/sabDheI/LWXRioGzxwehX8KOrmS8O3eDcr8px1935gYm4uZW0QImdb8d6UvP6oE/qhGurfDJQ58Q3TcpR5UtphDNAH5jil9N8M/Zh/eH/mDNqWbfiIvYgkzH/mfbZ9tmOD8umARfXmDwGtDXLCokym9b+DIcPfFuX6BsRe1CcpQW4w72zG1xHqeJSfa3c+qz2a/EKqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749677841; c=relaxed/relaxed;
	bh=GadKINRywzBXrfqPVJAYfbBeC3UCh33khZeoLkWRJYU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMyBxkmItp/K+8ES51d3P8v9pGgfGa6skZ7N3eg2fN8tc07d0pdk/n05oGMcv6iyqHUNqXHltvhGio7XTmSRQtJwIA4RoyghJGEG8/450XNVd6R42tKH2KIE2xMvKt5waVt6zJPGI2HsWIJJkSA1Q3hc10hTPoLYh9hG+Ia2eHaV1fuQcVoQA/QF4X+SVTLKfo/yIckZRkgR+sQkuA6cALcud8r+dKoYmQJOeYxMkj1XnsSMXhc9B0xbqfyvPn6FCs3jbN0yFLyZjSQP6qYwyk/gt+rX5kPWXjux7p4LHkMp+oIlHhb34jMihX+0l4K65k5km6ddprXyhSDG52bVmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VGa+fxTV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VGa+fxTV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHfBl20Ygz2y82
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 07:37:18 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so1699145e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749677834; x=1750282634; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GadKINRywzBXrfqPVJAYfbBeC3UCh33khZeoLkWRJYU=;
        b=VGa+fxTVp4p6B+LfnryFb/jdIX2qfB2tiNTEPMAtZ0pIo58mnCmlhpEwGR55AK3/c6
         gJvrXL+Vus17/2JpwOkkAzkPZJJAz8wlY/oIlie4F0q55KDF+2+v2OsAoq3whtjB6XoB
         /lCSdmZb6dE6UAbTxeNIB2boimxrCs3q6lY6Dsc6KNwNOEnMRXElhIJwTsBhr8C3+Olq
         U03Rbnw0ftoi+Fw5VB0QNsQiT2c872WzGRyM03V+w8PybBg2O/uB7ZPLv9DGlw0USdfB
         CJwrxN9X6JOzKzRkQfESTXtPBAUhZP0+e27GxMBJTQYZvIs0jeeYm88S5GLURbaKYXgX
         GB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677834; x=1750282634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GadKINRywzBXrfqPVJAYfbBeC3UCh33khZeoLkWRJYU=;
        b=JhhHWET83wJnZmxVCjuwb6m3wT9AUkOb87UpdtSAPD990NME49O7/MOV4qOXS1c8Mx
         7Fy7BQc511au2jccPXDYfYAKQlGM6pdsSIJBtJ8pINtnDIgFQm5IoFrTQyyhIKXMBFgV
         Ms2WAroKq5THUKiwCWiyuoMWUYBJIoGdTXLvruGOqcVAYEhsI00ztiu5f6roj10CLSzq
         rMISmgsWudQBqpGkPk9BFg4qV4sPGr04VwmICA1Zn9Uq/J17c4ePmdHqEySBckK8XZY0
         KnU8iTCOK7CHfI/UtmoDhBST57cmZOpHc2JXEd4pZg/y4wuiVqNQQTX9JE8gPbJh5ahK
         xB3g==
X-Forwarded-Encrypted: i=1; AJvYcCW+8jTd0RS3uh9pGLhDhbCz9LZmQ+zD/6Aica+xSuzNX6Z2PTtdhUHOz3XookS+Lm108HydUkcynL2Dn6Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLCfLkP+k99/PMi0B+ALJVYsvG0NjYdt85mcoEpXCSv8jQo2Qv
	KGSIcg8N9gwYEE9TRNmMxftnQItXSdPJxy2QLf0fWH1Md+JS1PdBgGv2
X-Gm-Gg: ASbGncuSB2AwRCQsLuMZDmgfsrs21Zc1bdkpHVpw7eScK305vPdcQKPdxs9PKZO59Pj
	WIJ0cTlCwscDysUEbYIzlO69RXy88jnrFQA86i2R6nEvry3qSYktj5NBIA1VJVcriSo0ZDX1IOK
	ChU3NHE20jYK0VCwpG+Hvf1QnFocSZyIAGwVRrD1Sf3ZsU+sdxDcOJBGMufHuwLVVQkVFqxa4Cc
	BDEdqHNI5HkBYdnBq1nAnxiYJ2K/2/B8PcgLUWsqL3EqDWOAytFfr07b7DlWhkKaMK7AbKxv/Ku
	rneB/E7RbmDx31nTqlDLW0bo/hW1laLYVm4PdyRQ0gWzavERWllzCGXSfiTnGeRz2azs3TPi+Qd
	Gob0ksseSctvGnSZvWnKE5jR8
X-Google-Smtp-Source: AGHT+IENXAxOFUkn6ai3f7uiv1cxIoglRihLgcmGTCPE72Ecl4xW86WzHKRFfKByroxWekJSsl3FSA==
X-Received: by 2002:a05:600c:8b24:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-4532b89f9d3mr13570905e9.4.1749677833651;
        Wed, 11 Jun 2025 14:37:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25ec9fsm851985e9.34.2025.06.11.14.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 14:37:13 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:37:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Mark
 Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
Message-ID: <20250611223710.254780d8@pumpkin>
In-Reply-To: <051e9722-44ad-4547-af5d-3e42c8cfe8d9@csgroup.eu>
References: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
	<20250610205358.07b1cc05@pumpkin>
	<051e9722-44ad-4547-af5d-3e42c8cfe8d9@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 11 Jun 2025 15:48:30 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 10/06/2025 =C3=A0 21:53, David Laight a =C3=A9crit=C2=A0:
> > On Sat,  7 Jun 2025 13:37:42 +0200
> > Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> >  =20
> >> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> >> each and every call to get_user() or put_user() performs heavy
> >> operations to unlock and lock kernel access to userspace.
> >>
> >> To avoid that, perform user accesses by blocks using
> >> user_access_begin/user_access_end() and unsafe_get_user()/
> >> unsafe_put_user() and alike. =20
> >=20
> > Did you consider using masked_user_access_begin() ?
> > It removes a conditional branch and lfence as well. =20
>=20
> Thanks, was not aware of that new function, allthought I remember some=20
> discussion about masked user access.
>=20
> Looks like this is specific to x86 at the time being.

I think it is two architectures.
But mostly requires a guard page between user and kernel and 'cmov'
if you want to avoid speculation 'issues' (and 'round tuits').

> I would have=20
> expected that to be transparent to the consumer. Allthought looking at=20
> strncpy_from_user() I understand the benefit of keeping it separate.
>=20
> However is it worth the effort and the ugliness of having to do (copied=20
> from fs/select.c):
>=20
> 		if (can_do_masked_user_access())
> 			from =3D masked_user_access_begin(from);
> 		else if (!user_read_access_begin(from, sizeof(*from)))
> 			return -EFAULT;

I proposed (uaccess: Simplify code pattern for masked user copies):

+#ifdef masked_user_access_begin
+#define masked_user_read_access_begin(from, size) \
+       ((*(from) =3D masked_user_access_begin(*(from))), 1)
+#define masked_user_write_access_begin(from, size) \
+       ((*(from) =3D masked_user_access_begin(*(from))), 1)
+#else
+#define masked_user_read_access_begin(from, size) \
+       user_read_access_begin(*(from), size)
+#define masked_user_write_access_begin(from, size) \
+       user_write_access_begin(*(from), size)
+#endif

Which allows the simple change
-               if (!user_read_access_begin(from, sizeof(*from)))
+               if (!masked_user_read_access_begin(&from, sizeof(*from)))
                        return -EFAULT;
                unsafe_get_user(xxx, &from->xxx, Efault);

But Linus said:

> I really dislike the use of "pass pointer to simple variable you are
> going to change" interfaces which is why I didn't do it this way.

But, in this case, you absolutely need the 'user pointer' updated.
So need to make it hard to code otherwise.

Note that it is best if masked_user_access_begin() returns the base
address of the guard page for kernel addresses (which amd64 now does)
rather than ~0.
Otherwise it is pretty imperative that the first access be to offset 0.

	David

>=20
> In addition I would expect a masked_user_read_access_begin() and a=20
> masked_write_access_begin(). It looks odd (and would be wrong on=20
> powerpc) to not be able to differentiate between read and write in the=20
> begin yet using user_read_access_end() at the end, ref get_sigset_argpack=
()
>=20
> Christophe


