Return-Path: <linuxppc-dev+bounces-14155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AAC597A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 19:32:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6pmK3WJfz2yvX;
	Fri, 14 Nov 2025 05:32:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763058769;
	cv=none; b=FhEst5RYOD33JLAXSr338eYZOu1hpA01noJrgyPQ7KMdJn/MxXcJPNIAyHUbULVN48qRYh4Rs3cDaD0alDfTzoEvhkERe6du0SC6u2ksUfMeXcQfk6+Wy0XpnePovl+9zpZ3lNNa1CyitQod4NyAZ51jgDIESoKfgnx2dYrJFxMb38ctG1DrXqZohDat0V/egPHr7PP3IX6Giuc8EaZF6O/3grYi+WqxcuUleMl8wIpzNaE8kyHpjsQeN8oPuW3/WHGoomUfzfYgzk2ik5ozYIj6WZfmTF2y488Z9jEZp1POexgysGKNgu0toGUY+tqc2cZZo9GgnwBzyUjTVAuHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763058769; c=relaxed/relaxed;
	bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFuCyFmYG/fBrpCmtTKUcRTPvlHCpu8mu7WAKlrrdRgbBxWi1GqjuT9B/UheTh+rKObUL9Q13Vb93y5fJFU6ntU0eOV3Egpd8DW6fefEE6iPpNp1veyaQZS76+LyxlpakeyaEz8PKUmeRRL4RrFcTfyZbxFf9lW+mTV/UmwxM5U77o2nQt4SgUJZ2yYPzo2m0E90VZFlX6lZ4k2OSPToRA00Y1d2XlEbpPBRF0WPHf+KaDra4S57PFkpUaaY6zxZNlPPKr5L2M1hh7HcwJrAHP3ielNRSB/MNchq7BPvGbTZAyDgPae9iOssmSvtqbbEKZhA4Ul0kVA7UAjXoB4xEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UUZkCOjS; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UUZkCOjS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6pmJ09Gsz2yvJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 05:32:46 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so9082355e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 10:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058763; x=1763663563; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=UUZkCOjSB89/3wHFmj2FVsfuYen9L1S2IaqRzX5TbqnKYtq2wyCWX3UTASugdFbzvN
         ewwItt+s70oeqQn834NwcH4DsZLGpchSXssF3NPydRf8sQ9FDOnDIe5BNHqGG6iy14m0
         cjKcLTPPa3ADfLssojSbu+hOQwJXSIMriIGjTK9lFj2EeH7z2xHrhtaW4t9N/DwxTOvm
         WtvdAXqHrgHz68VQx6oBopf0rcooR6tvcvDr7l4cKbCMg+OBvPo6iakzxcab5f6jnso1
         HkY/hpGIgSUHEJFc2aQxoG8FhjpVPalc1S1S4G0Tjhr9g1l73vGT6yIYjUcDv3EFnVsc
         bv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058763; x=1763663563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=qi/DHMsLjhUEKZ5axICZIvb82s7gebXhLW/Gb+5Tr5m3aDnfDCHic2n4HPbQ4pcXVF
         WSwyU1m7MdgCbY7d/odx9tqFMtKeMqRGAGWIveAsOz7CwYEDRcWOgWE92WUqTTFnIWxq
         Qi1XOkV9bOx1qxXrx9WXlS694gat9uFP5Sw1WiUTp0RZNRWfUJ7npBgZjqq3gEtUJ7yo
         i+e7XvuUX+0dHs3U+o+bL1c0LfMztB74VlHssTNGxfQ1fROPTwyUCFFDwH9aAGPIhSYq
         mrrE4UqVDBoW4UlgZEYzLbO63pGD2NUmw3Uud1qY4VqHGJ4k32O+Iix5jBUt/Yfsv1ZI
         +OUw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCV9PggyQGr4jvDGL2OtKy1AjCzTSQOO1ysGKMQWykmymtNNoTGxIGLXYiQ0gOnNJJ8IS8/C2R2W+FIQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbuATT6SekADHVq2v05tvKfVvJn0MK7UlsmOuUYEmnaXrSX9mi
	9NQVx2lrv+tZe6yRB8zlvaWSt/K8HsEjLMXN6/ECs6tPd1uHAI+JgG2a
X-Gm-Gg: ASbGnct7+IvhG6sRB3WYqT0Y4O0H/8Fd1zELeA9D9DXBoGO77m9SDct5+X58313j6q1
	dsp9oCgh1OjREYr1u/ld1EU5vFNnr6jVe9Tz+x15OgIOUwymTdHGxLeaRunoZoA0wrj3MgGIk8G
	wrpmgysVUCvuekTgdGt6DCbA2PsWyj4Yp6gg6HaHJA+19Yt0WTmxYDWYnklsrooH7Cf2PJ6v97s
	9eTAN9ZCwiXKvjq+0Wx/wHHmYhTc+urN9wT9xJdAu344Ka4OsxVxa+wbYNqZrDMFlUm0Zc3Ss8e
	tS7Sk95YCcnPoO8A9MEMRYwLQi+IAT1xyFTvOENI0fvvqWN1HRhVZydsDTHJgqCoLSVrEnUyo4A
	fm7OGQAGH5tCkLveK93PqQCUfX9B/dZ3ZIPJ0BvIYvmvmVpi469SjnQIecb/NSucKmFtXjmAI0g
	c9z8Ng+jDBT75ZxuqULaoOkkzc06+pQ5B0ugEesfjiEfzCGizEoB9aIAqpH/4fm6TxWnmaOcHpV
	A==
X-Google-Smtp-Source: AGHT+IEUOfl9Mj/MhDnCs6vXeSUiBJWe5OA5hhf/B85epyvDSKEXz8FsTxq8lGXRcYwvA52KNvjEqA==
X-Received: by 2002:a05:600c:3b12:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-4778febd327mr4653575e9.36.1763058762895;
        Thu, 13 Nov 2025 10:32:42 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm63595835e9.11.2025.11.13.10.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:32:40 -0800 (PST)
Date: Thu, 13 Nov 2025 19:32:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
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
	protocol="application/pgp-signature"; boundary="7axrx4sqgqvkj2b7"
Content-Disposition: inline
In-Reply-To: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--7axrx4sqgqvkj2b7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Wed, Nov 05, 2025 at 05:52:01PM +0100, Thierry Reding wrote:
> On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> > On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Several drivers can benefit from registering per-instance data along
> > > with the syscore operations. To achieve this, move the modifiable fie=
lds
> > > out of the syscore_ops structure and into a separate struct syscore t=
hat
> > > can be registered with the framework. Add a void * driver data field =
for
> > > drivers to store contextual data that will be passed to the syscore o=
ps.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > This change is fine with me, so I can apply it unless somebody has any
> > specific heartburn related to it (Greg?), but in case you want to
> > route it differently
> >=20
> > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>=20
> I have a few follow-up patches for the Tegra PMC driver that depend on
> this. 6.19 is what I was targetting, so if we could put this into a
> stable branch that'd be the best solution. I can set that up via the
> Tegra tree if you and Greg are okay with it.
>=20
> If that's all too complicated, I can probably wait until the next cycle
> to merge the PMC changes.

I've added this single patch to a branch based off of v6.18-rc1 that I
plan to feed into linux-next so it can get some broader exposure.

I can keep that branch stable so it can go through multiple trees if
needed. If anyone's interested, the branch is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/log/?h=3Df=
or-6.19/syscore

Thierry

--7axrx4sqgqvkj2b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkWJEYACgkQ3SOs138+
s6GbLQ/+LcY0n50MLCzG6P3cLlbnizYWB4fd77qBH6YbB2iRPf1TPkFtC1s24QiA
KgZqLzCkJ5rw0Xtvmtzci4gr3GeqsMf/4DM0k3X5WdN/DMat0RTe1rhVuxq0MmGV
7kmy+iB9FW6MgVt4kjeYdEL94ohEKXEUKTS6HTGfPFsonbJjnZdIsv4GVThClyxW
Y3vE0mnoAvxjqtVu57jc/Ihryv5Zz6pYiX9AWhT1ryTG7tmgKuFWW0YgqkFy/Y9O
rneSUrPJCeOBzjgL5oY6mPqTCl5f0VdGMb9S18RK+DKXSCLW7b0nGt4CCN7sEuOo
7Dy1UuUjok1XLs8NYPQ7oDD29Q536WmrUmQMjMm0R3HuqmmD+PDO0/I9QA2cuOvw
V1zUm+XqIlAyZs4lZkJXotqlCEBkPNCv0iIqEraETrCS1RYi/k0eqPF3Yu3oQc5p
58cnaEW28DaJ9+Cy7T4NCu7lsDzDyyL+5n4HQyWGaFkVYU+Wkfh0H1ezo8bP9txU
/Yan3s21OGdjzLMcCT0abiDrFOdN9N6HGOI2/UHnz87jxubwy7HjZ52Fkz3iGATD
uz1HyHzrIav2FWTN0PkENUQpiTQIHTs0znDBKPpTvDkeVbTF5nQuP2S0+bUGxvLR
BBevVnm7dT2dD5WqJbGfhem+DFPn66JVA5SFq9+/bvG0KsOpwpA=
=Jfb5
-----END PGP SIGNATURE-----

--7axrx4sqgqvkj2b7--

