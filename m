Return-Path: <linuxppc-dev+bounces-11885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD75B4961B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 18:49:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLCbp52sYz30DX;
	Tue,  9 Sep 2025 02:49:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757350182;
	cv=none; b=W6PAyBGxeaWE0r2STnRPZuABsrOG8fhUsKYS8MBFzWJW6BbMHEcd5VIoMo+xCe6yXZ+F4t34/JTgDuJ/mgokSJ6b2y3YbAIN2fbPNTwPgAhMu0F8UGtcRUZSEqRVk4OjfkDTxoDRcKuMQJ1q9L/HqqffGR9aV356qANalSAAIfl+N1yYvcJaYBOz+OAs2K4Kq902Omih0QMUTdv3xDazEAyuvGMW6fhDow6tobGIAp60JQDjnrWYY7aZXOBreTyrR6PuDSZOOZxG8wITaLgd6hA23/jNGOphl5D3Ak0vxZJxyDWcwxlmw3yeaiLnGziG4g82xlTPBzBCeOrnuO+4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757350182; c=relaxed/relaxed;
	bh=QpB5tNXBjyOovnphQdFXz5SaIPdBCpYHvTLfm99HsZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSmtvlYTAS8WaZqYBO0FrvF552zy3myNJImGQmaE2uwohU/4530CqrfbkFmUrpJq8FFJmdhD5dY2rfOuOj2f6ScgQYOJs2McIvbUlAupYQa/jMnfNAQ6e2EjJ2X1mcE5XYWMs7EF5Dn/mWbHl/M24ziFu7PblsyMA8u6BWUWjpPWR4MIDZ4ggFq3KUrtJHAkYG2jouy83y7EMBr8cR5ZAgaw8u57MqzWcws7/RbETtY9NFksOX3BRsh6CLrmX7a2JoV1dbuOYDdfBadq0mTfdEXUx9HhtULA25b9cGmB43SnoOWSiwCr13IJ9/046Mq3MFrn9kA1spRBPzp9zgmw8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Vv9fpBv6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=isgx=3t=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Vv9fpBv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=isgx=3t=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLCbn6Ypjz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 02:49:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11EC6438EA
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 16:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBA8C4CEF1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 16:49:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Vv9fpBv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1757350177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpB5tNXBjyOovnphQdFXz5SaIPdBCpYHvTLfm99HsZs=;
	b=Vv9fpBv6zOVNc2wiXzUH8hqPT6/w9QKa42prXd24TRVkuGq0vms78eRkV0/+5GmHSeQT0u
	or/xt3dOnIUEUBJWkn/794RW0z1Z1G+xf5zTtotCA37n/G11BfLwVJH0fUxsbvr3WRq8mI
	V16AkEUbATUXANihR8D2O9swr/NmZWw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1af9d67c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 8 Sep 2025 16:49:37 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-61bd4a3f39cso1030159eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Sep 2025 09:49:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMZI9W4BA2qhJeuHFIXPD718qaIW0Gm3KhTBegDdWE/XCoZlpNxxHGegBxPaetnXBZWDXY1kDhhIIJlkg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1mTNbQxSWVWwLAnnRFKqgyHHEd2RqURqE38VnwvE1mqIBzzBW
	PJfNbAMx/5aczBQxc55o7wNTHuYfRhdlCg43Q0B9ySe0skcvPngq/fILShhwsv1Youx8YlCcUyW
	84I1UVB46f/qUcD347tjbx7SPyRfvbz4=
X-Google-Smtp-Source: AGHT+IG1k1MmnF81J1Vo2jmXSIx1yHc4qgVkpm2QOFlj3gX2CeXc8Y5S0Gow70vJKvxabq0LnsYZB9vjl73O/LZxUXQ=
X-Received: by 2002:a05:6808:15a0:b0:439:1c13:4585 with SMTP id
 5614622812f47-43b29a8995amr3903338b6e.20.1757350176315; Mon, 08 Sep 2025
 09:49:36 -0700 (PDT)
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
References: <20250906213523.84915-1-ebiggers@kernel.org> <20250906213523.84915-13-ebiggers@kernel.org>
 <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com> <20250908164706.GA1331@sol>
In-Reply-To: <20250908164706.GA1331@sol>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:49:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9q3qa2ZmPrZWAe5tkWp2xGgNd=1BBx0APa_ACb3=bo-1Q@mail.gmail.com>
X-Gm-Features: AS18NWCGPRb7OwMUI-tVEiz_hU1uUOJpyLd0OY7Ve43ZcitTO73IQk18snpDrbA
Message-ID: <CAHmME9q3qa2ZmPrZWAe5tkWp2xGgNd=1BBx0APa_ACb3=bo-1Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig selections
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Zhiqi Song <songzhiqi1@huawei.com>, 
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 8, 2025 at 6:48=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> On Mon, Sep 08, 2025 at 06:35:04PM +0200, Jason A. Donenfeld wrote:
> > Hi Eric,
> >
> > Just a small nit -- would you commit this with the subject line all
> > lower case, like the other wireguard commits?
>
> Done.
>
> > By the way, I have been reading every single one of your patches. It
> > didn't seem like it'd be useful for me to respond endlessly with
> > Acked-by/Reviewed-by, so I haven't. But I have quite actively been
> > looking through these series. Thanks for doing these cleanups and
> > reorganizations. This patch here especially is quite the relief...
>
> Thanks!  I think Acks/Reviews would still be helpful, as it shows that
> someone else really read the patches.  Maybe you'd at least like to send
> those for the cleanups for the algorithms used by WireGuard?

I can do it for everything I read, I suppose. I care about a lot more
than just wg, anyhow.

Jason

