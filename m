Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 998187AFB0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 08:26:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=m9RzDzwT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwRTP37Slz3cF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 16:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=m9RzDzwT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwRSV72jGz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 16:25:44 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so1264098466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 23:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1695795938; x=1696400738; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/2T+kTv/JcuflJsGd2CXCzB7+oY7taYM7m20LJ70dY=;
        b=m9RzDzwTgbbCD3DovAZ0kLn9WZ1KbWtFaToNvuPAeCiIBwwU7ed8p4O7ANbHGRsIcY
         ZsU1lmnzV9PXUGDc45H2cwjiWEl8yn8+4HIE0b7Ws1OnGcPQzOHX1LVTvL0gN5uERm/9
         KbrAHTOz4jIOyTc7YevWc7wgCT4iT3MrzSydD6qufxXk+/GQDhCfnc7TuLEtLvebOz8/
         tret81nT1q1IQGIvuix9WuVxrtzSRGVMXox+pkjZ3YUXH4FKhLUYwAahMhSUzY4UXSBy
         rD/p0h0ipsrGoEB6Ra1G6XF1KLQwySdf3x1NlYzs82ui8V7WDPv95Dum8lrjzCwmuOK8
         x+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695795938; x=1696400738;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/2T+kTv/JcuflJsGd2CXCzB7+oY7taYM7m20LJ70dY=;
        b=giMbc9QJ7wYwFtS5PgVjFZF3MtiC9sJHoaIPzlTbtDNgjmJmX0fHUh3LrM/ziNo0af
         yfbtw/aQQiLBYdJAgvJyQLh0N3fPcCl5QZDCC9/7E8gzcsfn3Bcln7BT4h8sK1foi/MZ
         bW+lY9GF7YWJ9cod0VHoBr3Ru2laeSM+u2riU3nB8RebnfvSCutWRX3hdUcXb2a0H/uz
         FyunLrHKUAda/0VCYo0Sz396gV7Wj2YZR7Oifn1zL0HmwXPD8I3kN+Iest1/vkr4nnnN
         10IbLBTyGTcGqFKrtWZnfCZqB760DkU8vCtoQ+Mpqp5bQwJ7E65Dkd/8ZvPqmnZQuCJD
         +xvg==
X-Gm-Message-State: AOJu0YxyY4YK4BJb1pHVhYzhc7jdZSy+MbV/FMsaKHCa/MjlF7QXauh4
	q2mVRZes29I+aa8Aq0WPYanNLA==
X-Google-Smtp-Source: AGHT+IF+sh98cRJjLNIq8jQ2+ohMpgsb7FuT+Rgx8cnmOM61ikOsnrb8g2fLxxOWDkxmJbxpUUyb7A==
X-Received: by 2002:a17:907:7858:b0:98e:26ae:9b07 with SMTP id lb24-20020a170907785800b0098e26ae9b07mr860495ejc.35.1695795937865;
        Tue, 26 Sep 2023 23:25:37 -0700 (PDT)
Received: from smtpclient.apple (213-225-13-130.nat.highway.a1.net. [213.225.13.130])
        by smtp.gmail.com with ESMTPSA id rh27-20020a17090720fb00b009930c80b87csm8868973ejb.142.2023.09.26.23.25.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:25:37 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3 1/3] crypto: mxs-dcp: Add support for hardware provided
 keys
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CVS3NIJ8OO6Y.2C6GJ9OBR6COC@suppilovahvero>
Date: Wed, 27 Sep 2023 08:25:24 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <88FFAB6B-10A8-4732-A901-50859E22352D@sigma-star.at>
References: <20230918141826.8139-1-david@sigma-star.at>
 <20230918141826.8139-2-david@sigma-star.at>
 <CVS3NIJ8OO6Y.2C6GJ9OBR6COC@suppilovahvero>
To: Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" 
 <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jarkko,

> On 25.09.2023, at 17:22, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Mon Sep 18, 2023 at 5:18 PM EEST, David Gstir wrote:
>> DCP is capable to performing AES with hardware-bound keys.
>> These keys are not stored in main memory and are therefore not =
directly
>> accessible by the operating system.
>>=20
>> So instead of feeding the key into DCP, we need to place a
>> reference to such a key before initiating the crypto operation.
>> Keys are referenced by a one byte identifiers.
>=20
> Not sure what the action of feeding key into DCP even means if such
> action does not exists.
>=20
> What you probably would want to describe here is how keys get created
> and how they are referenced by the kernel.
>=20
> For the "use" part please try to avoid academic paper style long
> expression starting with "we" pronomine.
>=20
> So the above paragraph would normalize into "The keys inside DCP
> are referenced by one byte identifier". Here of course would be
> for the context nice to know what is this set of DCP keys. E.g.
> are total 256 keys or some subset?
>=20
> When using too much prose there can be surprsingly little digestable
> information, thus this nitpicking.

Thanks for reviewing that in detail! I=E2=80=99ll rephrase the commit
messages on all patches to get rid of the academic paper style.


>=20
>> DCP supports 6 different keys: 4 slots in the secure memory area,
>> a one time programmable key which can be burnt via on-chip fuses
>> and an unique device key.
>>=20
>> Using these keys is restricted to in-kernel users that use them as =
building
>> block for other crypto tools such as trusted keys. Allowing userspace
>> (e.g. via AF_ALG) to use these keys to crypt or decrypt data is a =
security
>> risk, because there is no access control mechanism.
>=20
> Unless this patch has anything else than trusted keys this should not
> be an open-ended sentence. You want to say roughly that DCP hardware
> keys are implemented for the sake to implement trusted keys support,
> and exactly and only that.
>=20
> This description also lacks actions taken by the code changes below,
> which is really the beef of any commit description.

You=E2=80=99re right. I=E2=80=99ll add that.

Thanks,
- David

