Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B167AFB27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 08:34:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=nNaC4v8h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwRf71hnLz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 16:34:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=nNaC4v8h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwRdD2SJvz300f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 16:33:19 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9a65f9147ccso1278162266b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1695796395; x=1696401195; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T708F5QyhTdSRBo0vkbwGJcJTd2q8jjeOwZduLQ6af4=;
        b=nNaC4v8hglfh4GL4ZzXEaM8ijtlpdQkhwL68PWU1jBrtc0F+14ljh1Oq/7CgnxHciy
         FFckzPEaqHPyqEsXS1dtylqk2KRrdXO0wSD0rJh6jSOEfw0wQX87RsxQx3SVn+vq32TU
         qfbzWik2tOCf1EboWMXs0q2xVU9HuZCYQ+okWEjixbXSM8oBZXMQ/df2i09llnHOKClJ
         hPDwPxOhq4RwF0cvlEIUZPlcTIXiz1KKJ0hUqvQMOMZdTFtaSGgjaHRKqYfarzHnd5Fr
         vyJzMh0l/X3omL2iUQ+sAOalODBxbkbdtaovJP86QW/2EnYg0fvtBBL5S4Dmg2GR84Uh
         BNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695796395; x=1696401195;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T708F5QyhTdSRBo0vkbwGJcJTd2q8jjeOwZduLQ6af4=;
        b=VpnnWz0M+oOnsIDsr7Yz7dXfyni5+3Dtn5kkdh6m1Jz4EAm9jfOR5MBiCy89+mHkTv
         Q5+152+av5RAgGi+Xok86YEcJeQflXKXUKDugCnLxP8u30bL5bOKZxbXUwPI2gDTuCxZ
         EoKCThsRGle6e+Os2pHG55rSdPbjW8bNCo3VdTK4kbNkNJS1yJBmqmTAb4XHXnUviEPO
         uKaEvKG89vI0aCe70rnkUpyO0KsCghEJZkJO9slZamkiS82aQ0nuBpze8BHThzD7A7Mf
         oraaeBAWfFG5BnwV6OpE2TqXnROd9UwDMvH3V7FwSbknBzhjG++ftIWsCaxiJ3tz2Mvk
         GVaQ==
X-Gm-Message-State: AOJu0YxJnUy1XH8J9YnnXhSS7BmednKqsewb0hjuo2x6B0cCe/Dz9VqQ
	zHcP+sLR0NLSIcFmnJKGrpbInA==
X-Google-Smtp-Source: AGHT+IEOdVKh3lqrnVsm5wgtPLXy5Xv/FFQE8Bm/j/IIYkd2ZH2UDUPzX449yWw9sMd34VT6PLwL3g==
X-Received: by 2002:a17:906:5390:b0:9aa:25f5:8d95 with SMTP id g16-20020a170906539000b009aa25f58d95mr858687ejo.59.1695796394622;
        Tue, 26 Sep 2023 23:33:14 -0700 (PDT)
Received: from smtpclient.apple (213-225-13-130.nat.highway.a1.net. [213.225.13.130])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906140700b009829d2e892csm8988478ejc.15.2023.09.26.23.33.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:33:14 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3 2/3] KEYS: trusted: Introduce support for NXP DCP-based
 trusted keys
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CVS3WN3Q04XY.B40S4RBH9QM7@suppilovahvero>
Date: Wed, 27 Sep 2023 08:33:01 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <085CABBD-1EA1-44A9-AA9C-C04039A627AB@sigma-star.at>
References: <20230918141826.8139-1-david@sigma-star.at>
 <20230918141826.8139-3-david@sigma-star.at>
 <CVS3WN3Q04XY.B40S4RBH9QM7@suppilovahvero>
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

> On 25.09.2023, at 17:34, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Mon Sep 18, 2023 at 5:18 PM EEST, David Gstir wrote:
>> DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.
>>=20
>> Beside of accelerated crypto operations, it also offers support for
>> hardware-bound keys. Using this feature it is possible to implement a =
blob
>> mechanism just like CAAM offers. Unlike on CAAM, constructing and
>> parsing the blob has to happen in software.
>>=20
>> We chose the following format for the blob:
>=20
> Who is we?

The authors of this patch. But I=E2=80=99ll rephrase that to get rid
of the academic paper style.

> And there is no choosing anything if the below structure if hardware
> defined (not software defined):

The below structure is actually software-defined by this patch.
Contrary to CAAM, DCP does not have a key blob feature.
DCP=E2=80=99s hardware-bound UNIQUE or OTP key is used to bind
these key blobs to a specific DCP chip.


>=20
>> /*
>> * struct dcp_blob_fmt - DCP BLOB format.
>> *
>> * @fmt_version: Format version, currently being %1
>> * @blob_key: Random AES 128 key which is used to encrypt @payload,
>> *            @blob_key itself is encrypted with OTP or UNIQUE device =
key in
>> *            AES-128-ECB mode by DCP.
>> * @nonce: Random nonce used for @payload encryption.
>> * @payload_len: Length of the plain text @payload.
>> * @payload: The payload itself, encrypted using AES-128-GCM and =
@blob_key,
>> *           GCM auth tag of size AES_BLOCK_SIZE is attached at the =
end of it.
>> *
>> * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + =
@payload_len +
>> * AES_BLOCK_SIZE.
>> */
>> struct dcp_blob_fmt {
>> __u8 fmt_version;
>> __u8 blob_key[AES_KEYSIZE_128];
>> __u8 nonce[AES_KEYSIZE_128];
>> __le32 payload_len;
>> __u8 payload[];
>> } __packed;
>>=20
>> @payload is the key provided by trusted_key_ops->seal().
>>=20
>> By default the UNIQUE device key is used, it is also possible to use
>> the OTP key. While the UNIQUE device key should be unique it is not
>> entirely clear whether this is the case due to unclear documentation.
>> If someone wants to be sure they can burn their own unique key
>> into the OTP fuse and set the use_otp_key module parameter.
>>=20
>> Co-developed-by: Richard Weinberger <richard@nod.at>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> Co-developed-by: David Oberhollenzer =
<david.oberhollenzer@sigma-star.at>
>> Signed-off-by: David Oberhollenzer =
<david.oberhollenzer@sigma-star.at>
>> Signed-off-by: David Gstir <david@sigma-star.at>
>> ---
>> .../admin-guide/kernel-parameters.txt         |  13 +
>=20
> Separate commit for this.
>=20
>> MAINTAINERS                                   |   9 +
>=20
> Ditto (i.e. total two additional patches).

Will do for v4!=20

Thanks,
- David=
