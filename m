Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2EE79E240
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 10:37:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=okpTwTVP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlv2j4dkPz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 18:37:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=okpTwTVP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlv1n4QRRz2yVQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:36:27 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401b3ea0656so68948225e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1694594184; x=1695198984; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uolj6bycuQLgVCoKuVx7OW6O8ol63jhVI8+H9GWvM7E=;
        b=okpTwTVPoWo0nMIeH4sE/eQt3AcP0sWNkQ2M20JUMeCBd6WP5x32/i4Q81nz4eJdHW
         Hh/Ue3o7x9uSQvSMxGW7Mxmpg84zpA++lJgcJ1eWT4XbGp8ccbXw6ddEs7pVWhDNGP0/
         BuXjDMEBJyL8cRFBnqtW+ZGXB3SYoOwcGT9uMRS/C60D1Ygv1I0VD4xKl8yTP3Hg10Rk
         hExTuwJS9bH1TSfajyB/WRE+eQVSj2ygnUIqYF8A8EtZN2dT63bH1c7KrjKFy+mZFXYA
         Y3LGIXEN1EtWynVRyWvO5We1bIShqA0LI3dDAC4gmLonaZ4o2uL6YrWqGDno7FrbZrSX
         cuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594184; x=1695198984;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uolj6bycuQLgVCoKuVx7OW6O8ol63jhVI8+H9GWvM7E=;
        b=htRv7tD7nhX+oWUhXFiT3TuxRXuMvOJZLtx/N5fmieDkF3KNlEyDRyveVuI1rsinEM
         fEwPoylJkDhFeGu3lrgCHl5CkipAg1cNcYtFTnqJG2jz+jKFLVYy1P6sDE9TgYO9Ho2H
         3g0WSOkH7AYKn5/ydUj43OL5hH4Ga9nTq+PiQ+uZ/i8GOeg5saEGv21Mh7WtFty7POvG
         GFaKyucTb7PtmG9fcHiaDtoq3TpBW+n4BiJ1yWC5BINQ+4lnyuAiGOc1Jpsa5l3ysaWE
         WIbxIh7e6huvt6Zp75UTlmYX4uRtqbVXDsynQhHhVFZqhp4dnsNrqDTUmXx5ZWwSP7p+
         TBmg==
X-Gm-Message-State: AOJu0Yyo1qZWzn8QReUczqWoL6/GrxLw/v8GVYlYlJlPs5DdvQfZmBiF
	/rSNaAk+VGCT9FK2IxIcjXM2eQ==
X-Google-Smtp-Source: AGHT+IGXZEXOiBFL14tbu7JB9wJiL81o7SR10ExAo1isVi5iswnBwwcoSwfHQtzWGjeJP8MxZaq/dw==
X-Received: by 2002:a05:600c:2159:b0:402:f503:6d1b with SMTP id v25-20020a05600c215900b00402f5036d1bmr1463747wml.0.1694594183662;
        Wed, 13 Sep 2023 01:36:23 -0700 (PDT)
Received: from smtpclient.apple (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with ESMTPSA id y17-20020adff151000000b0031c5dda3aedsm14955606wro.95.2023.09.13.01.36.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:36:23 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v2 1/3] crypto: mxs-dcp: Add support for hardware provided
 keys
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CVH49V57VE6R.2488KOQMR5AKQ@suppilovahvero>
Date: Wed, 13 Sep 2023 10:36:11 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2794F55-D63B-448D-B954-C3C25E0B474D@sigma-star.at>
References: <20230912111115.24274-1-david@sigma-star.at>
 <20230912111115.24274-2-david@sigma-star.at>
 <CVH49V57VE6R.2488KOQMR5AKQ@suppilovahvero>
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

Hi Jarkko,

thanks for the review!

> On 12.09.2023, at 19:32, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Tue Sep 12, 2023 at 2:11 PM EEST, David Gstir wrote:

[...]

>> - /* Payload contains the key. */
>> - desc->control0 |=3D MXS_DCP_CONTROL0_PAYLOAD_KEY;
>> + if (key_referenced) {
>> + /* Set OTP key bit to select the key via KEY_SELECT. */
>> + desc->control0 |=3D MXS_DCP_CONTROL0_OTP_KEY;
>> + } else {
>> + /* Payload contains the key. */
>> + desc->control0 |=3D MXS_DCP_CONTROL0_PAYLOAD_KEY;
>> + }
>=20
> Remove curly braces (coding style).

Will fix that and all similar cases for v3.


>> +static int mxs_dcp_aes_setrefkey(struct crypto_skcipher *tfm, const =
u8 *key,
>> + unsigned int len)
>> +{
>> + struct dcp_async_ctx *actx =3D crypto_skcipher_ctx(tfm);
>> +
>> + if (len !=3D DCP_PAES_KEYSIZE)
>> + return -EINVAL;
>> +
>> + switch (key[0]) {
>> + case DCP_PAES_KEY_SLOT0:
>> + case DCP_PAES_KEY_SLOT1:
>> + case DCP_PAES_KEY_SLOT2:
>> + case DCP_PAES_KEY_SLOT3:
>> + case DCP_PAES_KEY_UNIQUE:
>> + case DCP_PAES_KEY_OTP:
>> + memcpy(actx->key, key, len);
>> + break;
>=20
> I don't understand why the "commit" is split into two parts
> (memcpy and assignments in different code blocks). You should
> probably rather:
>=20
> switch (key[0]) {
> case DCP_PAES_KEY_SLOT0:
> case DCP_PAES_KEY_SLOT1:
> case DCP_PAES_KEY_SLOT2:
> case DCP_PAES_KEY_SLOT3:
> case DCP_PAES_KEY_UNIQUE:
> case DCP_PAES_KEY_OTP:
> memcpy(actx->key, key, len);
> actx->key_len =3D len;
> actx->refkey =3D true;
> return 0;
>=20
> default:
> return -EINVAL;
> }
> }
>=20
> Or alternatively you can move all operations after the switch-case
> statement. IMHO, any state change is better to put into a singular
> location.

Makes sense. I=E2=80=99ll change that.


>> diff --git a/include/soc/fsl/dcp.h b/include/soc/fsl/dcp.h
>> new file mode 100644
>> index 000000000000..df6678ee10a1
>> --- /dev/null
>> +++ b/include/soc/fsl/dcp.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2021 sigma star gmbh
>> + * Authors: David Gstir <david@sigma-star.at>
>> + *          Richard Weinberger <richard@sigma-star.at>
>=20
> Git already has author-field and commit can have co-developed-by so
> this is totally obsolete.

Also noted for v3.

Thanks,
- David

--
sigma star gmbh | Eduard-Bodem-Gasse 6, 6020 Innsbruck, Austria
UID/VAT Nr: ATU 66964118 | FN: 374287y

