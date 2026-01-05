Return-Path: <linuxppc-dev+bounces-15281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D460CCF54B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 20:06:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlP0M5TvJz2yCL;
	Tue, 06 Jan 2026 06:06:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767639971;
	cv=none; b=ZPELMIWY6hibWlDlu4KyK9MxcXeOTErB2MLTXQ+N4Czn33nmfZddgXb5uDvRJGt4AWFVIXQS8ut4Qm6dLEtv9tdpK8+YUJ8Vy8YDxbVO+uFvGLp5VKzQflvXuSRkRW/6+LiJ4ORNiFRZdcfUCa4PB+TfhrOKN88BmRaAZxxXtfGRaTRgtUl0d1fLr+DQqF5DVvSbj7SPP/08yZ0Ox2jDrZbTJhMstzcrLIe7/fy0+1wg9Kq1TeQYdKIIal4bZtZM9ZjpqnsqgdT8VYCCEPzgTPGCM0nhsYiOe9bFLgNfH3T7RMo6Qvtvw6BOzAj9jofP7ZLjd2AvB8XzBK+kEg568g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767639971; c=relaxed/relaxed;
	bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FaP25nmvM1Xk4mvkx/nYgj0X4gB24fojIhk1f4uabZVWnXqAyGHwJr+ZFt3RBAxgp+MYx3T2nL6ZGf8gXSx5Yfac4ORyCyozF8osqWDYxvbS2XwkJwCyuLFAWIJhdgkjfSYfUFlau2xpfg1dRuKr4QnbIbqFyGPHXYZZNn7ctoZ5lXL6F87U/Fs0/qGanc6h8kzRy1P6IqMOVdswL1JodoXOIX9fLDh02TyPZKoN1JL5gg2rpIxQgHyCIhZJlHFBKmuiu/sUIN6nFO2NSBAFOyS5y5/TVdz0Yk2pvejlP9/jjPAv2vhk4rlpL2UCK1YGwMQuOIiFWy4aio0BNzzISQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFRnYQqV; dkim-atps=neutral; spf=pass (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFRnYQqV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlP0L0gygz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 06:06:08 +1100 (AEDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so1827025e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 11:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767639906; x=1768244706; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=;
        b=IFRnYQqVW6CIy7n/Hq3K3yAMgxyt5jG8P4oapw0r0NdNfd+fdpMudlsY5JTApFGx4d
         lFtqXGriQccW2qtlv5+qT4KQOJqvoHwoNqE+r3rMMc808gZ9JJNQvVvEabxIRkNcJogu
         16V32TVKV/FUgcSP+ftWi62+YTxe7e2psL8QuzYkQPRRjRamKVpGf0d8BqFICHdu26ct
         9A/0TLKsvO5MviICk7ze2mjE5M2im1VDCRCdxeEYUnxEB7eLhP5j3cb/akRWDljGgyCc
         9/dbUm1wV5quTYEpGFQNsmbpttvD6BBnJ5Sz8Gzlm6hDjwAAchgnpQ7z6x25k9qr82M7
         OqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767639906; x=1768244706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=;
        b=uma+0xCoZHP/JQAMbq+neX6ViddIIne+/QZ1Q7GiEXWhJBAzk52fuNzcDz1q8tkTV/
         xkXy8n5DlRGXlyNX3oA7ePnWmrnjOdXcoXjR+vK3mCPT4ZKaEbrJNbqH83xYy9gFGCZe
         NcysvgELuZQdOP0rk75D1rHVADyImInImN3jGx1u6K5tJX2T4IEW8ds9ebytxISO5FIe
         ytoHiCpJWsTKfSU7F6yHJz7F67PC7Y5R2UrpAAcs04IAxfBuVEep8/qdI2TNgqRPKRXl
         NgOY95Z/RUxsT7AJgisw5gS2OXk/yQtzELHTLFLo9LiwxO8eBvgg4hvCwexFUQP+TwNP
         Ls7w==
X-Forwarded-Encrypted: i=1; AJvYcCU4d4iW7A83hPINnsvxnc5vYOplOx6GdfnQ8ANJMR4F50QLYxGOf7n6bfTUx2PbGPGc/KxgeNtu4em5/tw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyT5sWOXD2MDW49RPFMX4+ekhTayG+sCZee9BJf+bH1+7DAOrGT
	IQQDC1ySoaXZw6V1iwP/56b7a7dIKdHmimb9sD+0TgxohNXpyIAsN6Nq
X-Gm-Gg: AY/fxX7duOLtWg95MCG655lgt4BTu1ynlA5Txtn/ygUhP3+s79xzN6iUufEM9N0RuQP
	YnOJOnSHHdkDBzvHaQbgP09Gj6sAEXAO92GSekZunjovVxQhBqLTorxP1D4QY0lQ3OkyBK7ev1M
	Jfd1RdwJbIKyfrAradn3vB/nvecYhia8oHKDBMn6w7TDEynlFZ6D9acoO7eylkIopqEFrPunJ/r
	QH2Ghrc4LsPWbrxDsGD69GpP+y5JDn1sUNErXTomDiFBblE9/FcuqyUuG8eSX3qYusittUn7zNu
	C7IX91oo96RdB6V6WoLg+Dvyc42eFAEn9Aclb+yjDMxN4mlkX+rGK9T6JGN5Jat6RyQ6rmckvmI
	kibgX4aeQ3zcURECGSjO2sgC+O3wYp3AzRDLiQDc6sLE4WMzygH4g7rq7e67p5lldayxDgrTI8b
	wKdEl5WxaVDxHKQgCYcAkPyjtHj+JgoC9S7TcIHd7N3fObgj38suAbx5nW7hWHVuk=
X-Google-Smtp-Source: AGHT+IGlHrTGN9QhI9D4GcPAN0WpXBCiJkY6o1Su8HuTrk460ua/0mSfGa1CiVo2PPimvYizFp7ESg==
X-Received: by 2002:a05:600c:4f93:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d7f0929c2mr4085365e9.18.1767639905594;
        Mon, 05 Jan 2026 11:05:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm2991115e9.7.2026.01.05.11.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:05:05 -0800 (PST)
Date: Mon, 5 Jan 2026 19:05:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: ebiggers@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
 dengler@linux.ibm.com, freude@linux.ibm.com, herbert@gondor.apana.org.au,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Message-ID: <20260105190503.53cc31dd@pumpkin>
In-Reply-To: <859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
References: <20260105051311.1607207-20-ebiggers@kernel.org>
	<859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
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
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 5 Jan 2026 15:40:22 +0000
Andrew Cooper <andrew.cooper3@citrix.com> wrote:

> >  	/* Most significant octet of plaintextData corresponds to data[0] */
> >  	swap_buf(r, data, 16);
> > =20
> > - aes_encrypt(&ctx, data, data); + aes_encrypt_new(&aes, data, data); =
=20
>=20
> One thing you might want to consider, which reduces the churn in the seri=
es.
>=20
> You can use _Generic() to do type-based dispatch on the first pointer.=C2=
=A0
> Something like this:
>=20
> void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
> void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
const u8 in[at_least AES_BLOCK_SIZE]);
>=20
> #define aes_encrypt(ctx, out, in)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 _Generic(ctx,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
const struct crypto_aes_ctx *: aes_encrypt(ctx, out, in),=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
aes_encrypt_arg: aes_encrypt_new(ctx, out, in))
>=20
>=20
> i.e. it keeps the _new()-ism in a single header, without needing to
> change the drivers a second time.

You'll need to cast the 'ctx' argument in both calls.
All the code in an _Generic() must compile cleanly in all the cases.
(Totally annoying....)

	David

>=20
> ~Andrew
>=20


