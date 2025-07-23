Return-Path: <linuxppc-dev+bounces-10373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB823B0EDF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 11:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn7R3210Vz3bh0;
	Wed, 23 Jul 2025 19:01:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753261279;
	cv=none; b=n0Vpe+oW3JFyxB8Hi67+BXlmkdi8D9Nva5arZ25+Z2X2w6HznCYbAHxoFi9KrlDJ+bctriCHjapB3t0Hju7O8m4GbWO9TMOSsplWT/TZPv7h5oDNkI4QJggyr6ZdliaWi+j2aZl/Wkflv5fNMJl7DMJXEA6pGLCl5W2+Y1wqnsXRCqRiSm0q/YgYHyWJExHjPNsvh9ei+tvtp5PK0z4HyvxB3/hvU/kwiiBnRxWVcQrlT16adheyLVepWrwj3v0jxaCI1kzjf1J1YphH0W+LcTk1InwNrhSPY7y81j+VH22QFUoqW8g83PYoRG/xKhK6hm47rShk+hyJJlwXw0UWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753261279; c=relaxed/relaxed;
	bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFVJMDFTtH9+3LrinHJFqdJKXw6Vafmj5Rr5k0Yvw6TdPc0US6IVE+rnGmH0ruuZgmY5wmFOB4JHQpjwQHe/P9IF89rM0kj8hmHPcpG3uIJbppehSYR2cznY93f4L9njwv7n4Ad6D0j9mk6l3LiQdQPwDoHrE5X37xwL98cyl2Cm7cDwmduUTZ7wmzYxpOgVTUEj/JnMlHHck68dl53/gA0a+FtdKnkgkB71JIgjf30emwfQdTAfotpqPpfeVxKDpyqeEzBOgXO6cgejta7R/s7i/wiR3NwtUL82xLDF+boMTedAvOGk6zovCtQXIERSjOdx9zPRfOdT163Yj7dcFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EWz+lNYj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EWz+lNYj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn7R13FT3z2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 19:01:16 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45555e3317aso37268405e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753261271; x=1753866071; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=;
        b=EWz+lNYjYY6r95+3HbOtRWHsTilQo8J3DjJze+jAd2+Vx3M6CyoewbT3mw4hHeyczj
         RT3ZIEdnyv6Z8EPu6nYupKX/vpxn7jDW6AN2XQrI5t5V9gvaGU4EOugjGjfFP/VdXgQ7
         yZzq7kLzsQaGruje6C1tjnDiatXhlD0vxVoFt4ugf268wlRUcQxj874Ub/8Gz/EinTrh
         AQ8QPK5ArGRzmWy61tpC99pSQrT5MggiBwnaCKoqXbDKPeKbdJQc3mepY+Z5t11Wq4Xp
         sS3Nk2wYFk9D+W7UN6oIaNiQ+SwTe1fpU5YjZ3CatZCSeFrU9sHn7KnM1HN+gBYktHeS
         RNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261271; x=1753866071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=;
        b=T36I9uicSd/jWIrcWI5CGo7uy6ZsM+nfMPSIvrbyF3OxHO6KCNoT19upClM1nrJgAf
         DRHCANqHtVSoZuvLvUHIphSYBVlW6avhnGjyL6oK6fuXmt/5mU/ihnyrO9C2sdEv0Ytc
         1rk8kTLsid1ADkObYuNgJ4jc/vB43DLi5n6M8PAEFJglIDB7UGAn/tCK0KNuMLPc+6WT
         Ahltx6FofAngE/lU1V9unc1EOTkAdXv+QfGSYYN/6zfx3eKEOAGaMr6V7lZlpVedepuC
         YcGrRCeQndDiXXIRobnIsLWyBgAa+kGjn3q21ZnQzhBM2Rvoddtzkxub4vOXG4ErmiVY
         XpYw==
X-Forwarded-Encrypted: i=1; AJvYcCXVLQXGVG0XqlIjPdFRiDQk08xm/Wk4brU8mQ2lWF6Uclo44iPGJ0t38/wIX5OATXHZySyOo5WyKcEJKWg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5gY4x7VSgqqng0PTUn0s5x/Y1FdY5fJ08st5gnPVY4OQxHCbm
	9L3NZwrC6NKE7v4d1BX4jYpLRxU8cZ0p/x/iKkt7A8d6QxR12d/esesS
X-Gm-Gg: ASbGncs7cqz9GDIKwtA/jNsdXElwps1lI3WwGkcEUJ4cCy4c4zV6HAnoDzhgT90/LnL
	jowTHvFr8wGXjtj8i3I99rIAlBhXVlXN44JfjoPWGJ8l0/3IHQG88J1Z3+5sPfuIVc5x3zi6tqR
	otSmPAhYbUf9HxhW2D8AfUNUvLhMmg7DIenuNQiJ0dpWq7q7lt0Plcs0s8UxvDfnI7cg8Vh53FN
	x/Q3JNon/lVqnbNaYk3BHyUQHWCza7CVnjfRUNSHqZZw5qMAK3Apl2zWGSoldN3eS4pfeAjdmCD
	/PXKKizPyBxHZ71Fe1BkGoRCnAS+MG9Mkx+9NtxexrU93pRLmsHvPZDbRHi3YL0QAcsEjN91X59
	vq/d6z9B4koyoTEb5w6aqV+SNNeokioAEoqKXV6NEQplHU3ifoWJUJ4my88QxZ05Svy70LlJXk7
	JIGK4aw1Eq
X-Google-Smtp-Source: AGHT+IEknrstHg6cUD/SgoHhNho7BNCTRJA/GS5vJOJzPvYI6zayldv/5uJL7C58FRXa6VpYJz8Fmg==
X-Received: by 2002:a05:600c:8b08:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45868c79052mr16967605e9.4.1753261270574;
        Wed, 23 Jul 2025 02:01:10 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca25533sm15448303f8f.11.2025.07.23.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:01:09 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:01:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <awvdox3bgabbc42aamezlg33k4cje6y75qoxn7ruh3nhd4qv5n@u3spdahehad4>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
 <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
 <2025072218-decipher-spree-327d@gregkh>
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
	protocol="application/pgp-signature"; boundary="t3b24mrvydogtoje"
Content-Disposition: inline
In-Reply-To: <2025072218-decipher-spree-327d@gregkh>
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--t3b24mrvydogtoje
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Tue, Jul 22, 2025 at 04:08:09PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 22, 2025 at 03:56:40PM +0200, Thierry Reding wrote:
> > On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > > > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > [...]
> > > > 	struct syscore;
> > > >=20
> > > > 	struct syscore_ops {
> > > > 		int (*suspend)(struct syscore *syscore);
> > > > 		void (*resume)(struct syscore *syscore);
> > > > 		void (*shutdown)(struct syscore *syscore);
> > > > 	};
> > > >=20
> > > > 	struct syscore {
> > > > 		const struct syscore_ops *ops;
> > > > 		struct list_head node;
> > > > 	};
> > > >=20
> > > > Is that what you had in mind?
> > >=20
> > > I missed the list_head, so yes, this would be better, but don't pass
> > > back the syscore structure, how about just a void * instead, making t=
he
> > > whole container_of() stuff go away?
> >=20
> > Yeah, that's a possibility. I personally don't like passing the void *
> > around because it's easier to make mistakes that way. I also find it
> > unintuitive because it doesn't immediately show you what the functions
> > expect.
> >=20
> > My understanding is that the container_of() should get optimized away
> > most of the time, so there aren't any obvious downsides that I can see.
>=20
> container_of() is just pointer math, but a cast is even faster :)
>=20
> > But I don't feel very strongly, so if you have a strong preference for
> > void pointers, I can do that.
>=20
> That's what you really want to have here, it's a syscore data type
> thing, that the callback wants to reference.  Just like a irqrequest_t
> function passes back a void * that the handler "knows" how to deal with
> properly.

IRQ handlers are different, though, because you pass the void * data
when you register the interrupt. That void * then gets stored and passed
to the handler when the interrupt is processed.

We'd have to change it to something like this:

	struct syscore_ops {
		/* parameters now changed to driver-specific data */
		int (*suspend)(void *data);
		void (*resume)(void *data);
		void (*shutdown)(void *data);
	};

	struct syscore {
		const struct syscore_ops *ops;
		struct list_head node;
		/* NEW driver-specific data */
		void *data;
	};

It ends up increasing the syscore structure's size, about 33%, though
given that there aren't a lot of these that's probably negligible.

What I think is a bit more unnatural about it in this case is that we
embed the struct syscore into some driver-private data anyway so that
it becomes per instance, and then we have a circular reference:

	foo->syscore.ops =3D &foo_syscore_ops;
	foo->syscore.data =3D foo;

Which looks kind of weird. Alternatively I suppose we could completely
rework it and make register_syscore_ops() allocate struct syscore, and
hide the internals from drivers completely:

	err =3D register_syscore(&foo_syscore_ops, foo);

With that it may be problematic that register_syscore() can now fail.

Thierry

--t3b24mrvydogtoje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiApM8ACgkQ3SOs138+
s6G76RAAlyjbBOBTf8eNokhrwb69GbuFv4iEunTnd/Xy91IhOncqHjdYHN3rqTn9
GZWy+L9VFYLaEmLV5W1ChOD3rYHCxZ3gep+jdE5ThLQvJaK4IBB4oGZ0OGXLHmVy
TqNy+Tq/dQi2jM2o7MW1DUDM8EunrbLmjBWZZONJzH18GqJPn3LWazuC7tBBL6vu
bmowzEXxm+4NWx5Ow3IvFnLzDa05JLaBKtVREPuf/UdRHcjzrra1RyYLyaYUI9Gy
pWZHkgUA+1gAO2hutK8eyL98cZlnl8zrArmduJZsyZQhcNe1ltwPTzUq9wejYOr+
Vywgy/CxznLtvKd0e27hP/I7zCx64ktofCb6l0SwueraLWYTcpJLQ23T93g1bDwY
02o6cq0874YQdndJytU7t3cKETe5uXF0AGmepX/+GKvcQN6lBqo04OL+Ge6yRMyy
G9gv6P2nxqY+RWkDrFtqO6RwFB+lJSwc2J3RfxHC/2ygMy2Zr2AJ5oeeAKOtTZ/0
smpK40Y2FB6y4ohGq3UK3uPyBvOJi/jw6sMuRyv2Ou7tJIFE2EtSpA5+m5DcwUcR
gRcfO6O0V9Y6qWBx2Tt+i6Fzekj/0xBzlQdyvCom8xrhRZ9VGbZBfpIaXDs/Anp6
ovlk/rkbo8DsYQQxINnmSBx2uQcWSCYAU53leg5fnr4EoSGPCsg=
=l8CI
-----END PGP SIGNATURE-----

--t3b24mrvydogtoje--

