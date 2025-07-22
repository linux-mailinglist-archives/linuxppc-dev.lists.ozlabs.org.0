Return-Path: <linuxppc-dev+bounces-10356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF8B0DC02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 15:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmf2W0rcZz2yb9;
	Tue, 22 Jul 2025 23:56:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753192611;
	cv=none; b=gTCLypWZ5oFAbCL+XMJyiD0GREI4KcpHMaSte0MQ5llebCooy6pgVwqJKwkfOXGKNeUm3R35qb5cFytF13RuIYeU4m2qnclGTQLY8dDNuOr02pUBQf8m8Qi7lAv2WWTYJFeylSBd2o9N5LZj12vyusvb5g1/K7dCkolcZqK5neCIxJnVtqWdwAcuIJhYHiZbG7lQlsY56QNm/K4a/lCD8zkH6qNoDB0Fuu5hENA/zxHRwzZid35bn8iTsS4MzDp3lhG6XA0SA0CETnLokRwi1tbnddwYKm7BnruSMSqZUrfEochDaj2NgJjq7gisrOgDFm9iSQala1NAT1+92hUtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753192611; c=relaxed/relaxed;
	bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0sOlVkGhDdECUxpetcg6Mpfje7pe2s6e93JbQ4CHm13vLe+qnUBXiTA9Q8R/wSv9xKx9RF1kknydjaBv1s9JqL191hm8I60nOkHUkgmxoz6Gu7kCL7661y/a/e8USiV2YNE+YJ7ikVVDecqcWJOQcNoDdMXNr4IkSXhhaVoZs1ZHv+OMAglFX/UZBDxzau2F3tLHZjPNZJbRpuJg02AyMzDlj4rppLNX1NXEoTf1XWfdH31YkKq6kf1/cXINLhQODkcCRjbfI9pU0DFHP94NH07E7N/Nje1OjBMbbMJi6VZijR8qObHf5f5r3HNSAMKzQuh527qkdl8frvVO0gOjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EUai8juz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EUai8juz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmf2T3JlMz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 23:56:48 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso27684005e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753192604; x=1753797404; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=;
        b=EUai8juzDMIgD7lgDI083rg1YSWZWTI3paLM5C26yFUKHP6kegIXcxAE23Va1GX15S
         7m+YoOV0oZPRi0nPSykN+JCddQAoG3vbJ8vWAuExqKWZIoq2czJBzG8UUOMN5sdtN/R0
         NStHMpPRdOCW3FNuF7RjrjKFuUVXHIVu/V+Qe6tHsIGptiQaZ3/IGux1wig3kiOav8Ix
         0T+xHkDAYipSmFvQs9UKH+YDu/jz3/HvLgAoMVVuW9b0gpvH0xjqxM/BRXySCZ77nR8D
         JBq7KVzhNWCuyelHwoaZE3ckblZUbqYgTusxcwyTC8Jwg7CPB5aIxzdD7T7KUCn8Ej1S
         OA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192604; x=1753797404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=;
        b=qwlePDV03joCeKd4OWr+8pLPM+GhfA15DD7JylfhwNtys2H7rvqC7XjMtY+Mi5r/x0
         levCoRjSBBR7Egi9e6BM+9d6jxEgaHuaa9nlBNrwdsY6DB+2OtXaFfGjoFXMNK/a5eaY
         U0TzWWnIW3fP74XHgDB77FyEMqNbFAJI4K1iKJKkFLswqYcwMFFZYtwH7lueMizbTaFO
         84iUMDRKDPUoVNeHkjTVoVPWL7X/1KTV6xGxL960IRJffs/r+Fa9lku9UOjKzM40La9V
         jmdQAtnoFZcUABSDW38+OHsi05X+vHyL3unkFqkB24/FJPRADCkyKkijDUAD+WmOQCww
         dSNw==
X-Forwarded-Encrypted: i=1; AJvYcCWsYsBGFo8rBQ3Kc9tfls/Q99BHIRLSscxQDfh1LF80gS5/yPy/VvWJv11WqZBQXrWznp/hGE6r5GrvsmU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwsFaPSPLHAlTHWn+sG/n3dP8F85GKIGxk08ncT+QD85yTTDqwF
	/VV58FvW788kf+lZHlx3voO3Qv0izXDWAlxin2cUVG3CjkHD0VgUpq47
X-Gm-Gg: ASbGnctN9bBk+vblIIlpQy/F9eflAFRNoPvaW4rhMkHv4cyYZaXKPwDHfcSu1BEMsHE
	8mbmPqxFjXuCL0/StDjdZqnd9sg+5OLku7Svni5R9VLkLdN8hqdzjb7kxygaAeYf0nErePCVruF
	lGuZyFFVWEVrJ6v4yxo2yLDzn7VGJSq24shT5svR62rXn0jkdxDLP95JQbnbhbiN451wm7p66vn
	VjtyGDhngthM3yukbNpU0BOiXQBCSahcfwFyhbdCzdZyZHINPrjjySmpk1t59Ea5bkIGQoAnI/1
	cP3obpNDsI7yzP2D70Dy4CF26P2DD3t1wsCPnogP/8+B35Ov+uX3NFM/nMZQEfSFuYCV1eOyX97
	G9iIGTS5yrHKAAOifnSAdr7DschbmArjq90ZXyJCPeQDnDqqME6sz/jjf9MUpujzyNoqUF5reGp
	eBuFHqAm67
X-Google-Smtp-Source: AGHT+IEXfV5AQDvaaCQOegEyKdsH0umt5I9YjBYWNMUwcatDOEmZLLM8MRQ3Lk0kGHyWW+MsfUSbDg==
X-Received: by 2002:a05:600c:c16d:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-456352d0b70mr190106725e9.5.1753192603600;
        Tue, 22 Jul 2025 06:56:43 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2d4fsm197624025e9.4.2025.07.22.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:56:42 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:56:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
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
	protocol="application/pgp-signature"; boundary="sm7baow4ljogvsjb"
Content-Disposition: inline
In-Reply-To: <2025071919-patience-cattishly-cf7c@gregkh>
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--sm7baow4ljogvsjb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
[...]
> > 	struct syscore;
> >=20
> > 	struct syscore_ops {
> > 		int (*suspend)(struct syscore *syscore);
> > 		void (*resume)(struct syscore *syscore);
> > 		void (*shutdown)(struct syscore *syscore);
> > 	};
> >=20
> > 	struct syscore {
> > 		const struct syscore_ops *ops;
> > 		struct list_head node;
> > 	};
> >=20
> > Is that what you had in mind?
>=20
> I missed the list_head, so yes, this would be better, but don't pass
> back the syscore structure, how about just a void * instead, making the
> whole container_of() stuff go away?

Yeah, that's a possibility. I personally don't like passing the void *
around because it's easier to make mistakes that way. I also find it
unintuitive because it doesn't immediately show you what the functions
expect.

My understanding is that the container_of() should get optimized away
most of the time, so there aren't any obvious downsides that I can see.

But I don't feel very strongly, so if you have a strong preference for
void pointers, I can do that.

Thierry

--sm7baow4ljogvsjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh/mJUACgkQ3SOs138+
s6FyzhAAq8z/gI18SVH4qmKTQkcFaPuXBegHTP2dgId1CA1dad3cmBj4tcAz1+Ng
liio3geyWrxKqZSJTrQOYYYloM4s9UhkY3AvXvDB+L4/DZC/HBgAGnL5dMKte/WQ
sNUniNOWw1gW2tluO+vi9saSGE4Test34XaIWpBaItJYO9uhuiAC57jJw9Uutl0h
wkjvwyxaOXSleKiCSwlnSBx31PCz7k5nhb8pIeptnxbxw+Q7+IsDzK/cH2PrV979
7AzVNifmqUfpO9Xy0FsSrYU0SrUCM7I8WU6elGSeuswDL7+Mlsh9kn/KfVyL86ed
0jP2iQRyzteg2ATh6dQJLM7KEPK8DnGZqaLDLJlzn3af7Mv5MvRGO1cx7dVGhcTA
ADto5YN6dKXC63ijHppnQ2xjZ725T1zuVpj1z5OTlXpKtlGvYiIejh+B5tjFMMrr
zTNbjIBbykgIZXvIvn52ttFRDrLgpnh2mQPzI8VWp9Bv0DaBH6Q1jfxUlWXQiSaQ
bWrFys6N7IBy5+o83FiAGZvQ//IFZhyF8T/6HD+6OuoX26vTOa5vwrPgs5qru2/s
T5iJf9UOqnHAuzssCGk2OZcqcVn17seSpXcJScckVPt/HhegIgcgxoVTCOBQ0K7J
xUhlsns/ZnbEGVKtLr2T/t7UTeCDZIkqo0pEloVCu9UGfeAI16c=
=Cczj
-----END PGP SIGNATURE-----

--sm7baow4ljogvsjb--

