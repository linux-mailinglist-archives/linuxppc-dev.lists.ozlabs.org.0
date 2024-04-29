Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB88B56D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 13:36:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=n+aw8rX/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSh9J4Yqpz3dJB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 21:36:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=n+aw8rX/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSh8Y2dLTz3cV4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 21:35:23 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so55135651fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1714390517; x=1714995317; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfGzQB1xZB8xBXRUtcLsXtsSVhNRLi0+5fwIT5ItXxQ=;
        b=n+aw8rX/WCDvooaU2qSd8WM5BR70u0nDzfwg2sj+QbSykFBh60n2AJnlnjyM5ObdRa
         62XwY0ehG3sc/iaGuFevzeu/Hz+joGBH6tCsbMWeHTR6nJTLArRayzr+n5AgE+BcSXxX
         v0dOy8dOU2djoEFO1J0WYb79OA4gFlyKttNYURwhOviGRjQght93xywJkCZFRnB4rwEc
         x0Nfb2mWbFjAJ2M4J92eEwzxD/MAEMRXD+MrmKj4/zbDzDAB1HU4AfHp1Z401AvsI2Ad
         QMvgpG5mMNEUvmhZZjE7/Cfh4cOLVIHzfjrj2C5wsEeAak0pyvjhsagwO2ORg53rOnFG
         6Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390517; x=1714995317;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfGzQB1xZB8xBXRUtcLsXtsSVhNRLi0+5fwIT5ItXxQ=;
        b=SG3PGmGG1m+xtkh1zl1RHYFjC0GIXNRAYCxGR83GzwYlBU+sjWpCs3YnZEtafswQK5
         823ZNju/2N9uEjmj3yWIUWLPgZ4IhwPcbtv4y2YZ/C7AXbnVHYmpRJGKYpM1ROc648BL
         AQCwmMa8X24PuVWxN172FJkIkwpANSTHOKgGQX/ovf8hau3Dl/0Q0i7eKgpp/JsVaHHv
         ycfw8qFcwedVi8NvDkc1wdAhSnF+KJgc1WBafzJGPG4jM9OfLFQ91VS6Xn6m9JmZcUNk
         +nSH3IR0qTEFgeibqZFMtoGwEhFCU5eZ2Dq73qVn9wPIEfWJxu2ChqsWE3JQLwjsumhB
         EOTw==
X-Forwarded-Encrypted: i=1; AJvYcCXBPPkuJ5mXk2b8RYeICSQd//eDQxy+W2PXb2W7Qxu27lqvwkS7Z+e90NWSDhviOz6FXA2+ZPH6hbRwjgu+tWacPadL5uu4wE/xXgmeSw==
X-Gm-Message-State: AOJu0YyZXSTN1lk6ImckdMjtYNcF0VTDq1hANPf8alLtbyUoUElKhVQx
	fEsBzQYo8Z+Ijn6CakubaUC73RtR4GsVC4PeLsV9OTjYQiubOR8s21WahSwQlmk=
X-Google-Smtp-Source: AGHT+IGw2Ek0i5lSqjv/2CHs1TiQwOEm213t8IkDWkoV+quS2g6sI4vXDerOpOiRvHBEgiO62ZzKtw==
X-Received: by 2002:a2e:968b:0:b0:2d8:63a2:50d2 with SMTP id q11-20020a2e968b000000b002d863a250d2mr6603309lji.6.1714390516956;
        Mon, 29 Apr 2024 04:35:16 -0700 (PDT)
Received: from smtpclient.apple ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id b8-20020adfe308000000b003436a3cae6dsm29249925wrj.98.2024.04.29.04.35.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:35:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [EXT] [PATCH v8 6/6] docs: trusted-encrypted: add DCP as new
 trust source
From: David Gstir <david@sigma-star.at>
In-Reply-To: <DB6PR04MB3190F6B78FF3760EBCC14E758F072@DB6PR04MB3190.eurprd04.prod.outlook.com>
Date: Mon, 29 Apr 2024 13:35:04 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <7783BAE9-87DA-4DD5-ADFA-15A9B55EEF39@sigma-star.at>
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-7-david@sigma-star.at>
 <D0ALT2QCUIYB.8NFTE7Z18JKN@kernel.org>
 <DB6PR04MB3190F6B78FF3760EBCC14E758F072@DB6PR04MB3190.eurprd04.prod.outlook.com>
To: Kshitiz Varshney <kshitiz.varshney@nxp.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gaurav Jain <gaurav.jain@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, dl-linux-imx <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pankaj Gupta <pankaj.gupta@nxp.com>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-s
 tar.at>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Paul Moore <paul@paul-moore.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Jarkko Sakkinen <jarkko@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Varun Sethi <V.Sethi@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kshitiz,

> On 09.04.2024, at 11:48, Kshitiz Varshney <kshitiz.varshney@nxp.com> =
wrote:
>=20
> Hi Jarkko,
>=20
>=20
>> -----Original Message-----
>> From: Jarkko Sakkinen <jarkko@kernel.org>
>> Sent: Wednesday, April 3, 2024 9:18 PM
>> To: David Gstir <david@sigma-star.at>; Mimi Zohar =
<zohar@linux.ibm.com>;
>> James Bottomley <jejb@linux.ibm.com>; Herbert Xu
>> <herbert@gondor.apana.org.au>; David S. Miller <davem@davemloft.net>
>> Cc: Shawn Guo <shawnguo@kernel.org>; Jonathan Corbet
>> <corbet@lwn.net>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix
>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>; Ahmad Fatoum
>> <a.fatoum@pengutronix.de>; sigma star Kernel Team
>> <upstream+dcp@sigma-star.at>; David Howells <dhowells@redhat.com>; Li
>> Yang <leoyang.li@nxp.com>; Paul Moore <paul@paul-moore.com>; James
>> Morris <jmorris@namei.org>; Serge E. Hallyn <serge@hallyn.com>; Paul =
E.
>> McKenney <paulmck@kernel.org>; Randy Dunlap <rdunlap@infradead.org>;
>> Catalin Marinas <catalin.marinas@arm.com>; Rafael J. Wysocki
>> <rafael.j.wysocki@intel.com>; Tejun Heo <tj@kernel.org>; Steven =
Rostedt
>> (Google) <rostedt@goodmis.org>; linux-doc@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-integrity@vger.kernel.org;
>> keyrings@vger.kernel.org; linux-crypto@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org; =
linux-security-
>> module@vger.kernel.org; Richard Weinberger <richard@nod.at>; David
>> Oberhollenzer <david.oberhollenzer@sigma-star.at>
>> Subject: [EXT] Re: [PATCH v8 6/6] docs: trusted-encrypted: add DCP as =
new
>> trust source
>>=20
>> Caution: This is an external email. Please take care when clicking =
links or
>> opening attachments. When in doubt, report the message using the =
'Report
>> this email' button
>>=20
>>=20
>> On Wed Apr 3, 2024 at 10:21 AM EEST, David Gstir wrote:
>>> Update the documentation for trusted and encrypted KEYS with DCP as
>>> new trust source:
>>>=20
>>> - Describe security properties of DCP trust source
>>> - Describe key usage
>>> - Document blob format
>>>=20
>>> Co-developed-by: Richard Weinberger <richard@nod.at>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> Co-developed-by: David Oberhollenzer
>>> <david.oberhollenzer@sigma-star.at>
>>> Signed-off-by: David Oberhollenzer =
<david.oberhollenzer@sigma-star.at>
>>> Signed-off-by: David Gstir <david@sigma-star.at>
>>> ---
>>> .../security/keys/trusted-encrypted.rst       | 53 =
+++++++++++++++++++
>>> security/keys/trusted-keys/trusted_dcp.c      | 19 +++++++
>>> 2 files changed, 72 insertions(+)
>>>=20
>>> diff --git a/Documentation/security/keys/trusted-encrypted.rst
>>> b/Documentation/security/keys/trusted-encrypted.rst
>>> index e989b9802f92..f4d7e162d5e4 100644
>>> --- a/Documentation/security/keys/trusted-encrypted.rst
>>> +++ b/Documentation/security/keys/trusted-encrypted.rst
>>> @@ -42,6 +42,14 @@ safe.
>>>          randomly generated and fused into each SoC at manufacturing =
time.
>>>          Otherwise, a common fixed test key is used instead.
>>>=20
>>> +     (4) DCP (Data Co-Processor: crypto accelerator of various i.MX
>>> + SoCs)
>>> +
>>> +         Rooted to a one-time programmable key (OTP) that is =
generally
>> burnt
>>> +         in the on-chip fuses and is accessible to the DCP =
encryption engine
>> only.
>>> +         DCP provides two keys that can be used as root of trust: =
the OTP
>> key
>>> +         and the UNIQUE key. Default is to use the UNIQUE key, but =
selecting
>>> +         the OTP key can be done via a module parameter
>> (dcp_use_otp_key).
>>> +
>>>   *  Execution isolation
>>>=20
>>>      (1) TPM
>>> @@ -57,6 +65,12 @@ safe.
>>>=20
>>>          Fixed set of operations running in isolated execution =
environment.
>>>=20
>>> +     (4) DCP
>>> +
>>> +         Fixed set of cryptographic operations running in isolated =
execution
>>> +         environment. Only basic blob key encryption is executed =
there.
>>> +         The actual key sealing/unsealing is done on main =
processor/kernel
>> space.
>>> +
>>>   * Optional binding to platform integrity state
>>>=20
>>>      (1) TPM
>>> @@ -79,6 +93,11 @@ safe.
>>>          Relies on the High Assurance Boot (HAB) mechanism of NXP =
SoCs
>>>          for platform integrity.
>>>=20
>>> +     (4) DCP
>>> +
>>> +         Relies on Secure/Trusted boot process (called HAB by =
vendor) for
>>> +         platform integrity.
>>> +
>>>   *  Interfaces and APIs
>>>=20
>>>      (1) TPM
>>> @@ -94,6 +113,11 @@ safe.
>>>=20
>>>          Interface is specific to silicon vendor.
>>>=20
>>> +     (4) DCP
>>> +
>>> +         Vendor-specific API that is implemented as part of the DCP =
crypto
>> driver in
>>> +         ``drivers/crypto/mxs-dcp.c``.
>>> +
>>>   *  Threat model
>>>=20
>>>      The strength and appropriateness of a particular trust source
>>> for a given @@ -129,6 +153,13 @@ selected trust source:
>>>      CAAM HWRNG, enable CRYPTO_DEV_FSL_CAAM_RNG_API and ensure
>> the device
>>>      is probed.
>>>=20
>>> +  *  DCP (Data Co-Processor: crypto accelerator of various i.MX =
SoCs)
>>> +
>>> +     The DCP hardware device itself does not provide a dedicated =
RNG
>> interface,
>>> +     so the kernel default RNG is used. SoCs with DCP like the =
i.MX6ULL do
>> have
>>> +     a dedicated hardware RNG that is independent from DCP which =
can be
>> enabled
>>> +     to back the kernel RNG.
>>> +
>>> Users may override this by specifying ``trusted.rng=3Dkernel`` on =
the
>>> kernel  command-line to override the used RNG with the kernel's =
random
>> number pool.
>>>=20
>>> @@ -231,6 +262,19 @@ Usage::
>>> CAAM-specific format.  The key length for new keys is always in =
bytes.
>>> Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
>>>=20
>>> +Trusted Keys usage: DCP
>>> +-----------------------
>>> +
>>> +Usage::
>>> +
>>> +    keyctl add trusted name "new keylen" ring
>>> +    keyctl add trusted name "load hex_blob" ring
>>> +    keyctl print keyid
>>> +
>>> +"keyctl print" returns an ASCII hex copy of the sealed key, which =
is
>>> +in format specific to this DCP key-blob implementation.  The key
>>> +length for new keys is always in bytes. Trusted Keys can be 32 - =
128 bytes
>> (256 - 1024 bits).
>>> +
>>> Encrypted Keys usage
>>> --------------------
>>>=20
>>> @@ -426,3 +470,12 @@ string length.
>>> privkey is the binary representation of TPM2B_PUBLIC excluding the
>>> initial TPM2B header which can be reconstructed from the ASN.1 octed
>>> string length.
>>> +
>>> +DCP Blob Format
>>> +---------------
>>> +
>>> +.. kernel-doc:: security/keys/trusted-keys/trusted_dcp.c
>>> +   :doc: dcp blob format
>>> +
>>> +.. kernel-doc:: security/keys/trusted-keys/trusted_dcp.c
>>> +   :identifiers: struct dcp_blob_fmt
>>> diff --git a/security/keys/trusted-keys/trusted_dcp.c
>>> b/security/keys/trusted-keys/trusted_dcp.c
>>> index 16c44aafeab3..b5f81a05be36 100644
>>> --- a/security/keys/trusted-keys/trusted_dcp.c
>>> +++ b/security/keys/trusted-keys/trusted_dcp.c
>>> @@ -19,6 +19,25 @@
>>> #define DCP_BLOB_VERSION 1
>>> #define DCP_BLOB_AUTHLEN 16
>>>=20
>>> +/**
>>> + * DOC: dcp blob format
>>> + *
>>> + * The Data Co-Processor (DCP) provides hardware-bound AES keys =
using
>>> +its
>>> + * AES encryption engine only. It does not provide direct key
>> sealing/unsealing.
>>> + * To make DCP hardware encryption keys usable as trust source, we
>>> +define
>>> + * our own custom format that uses a hardware-bound key to secure =
the
>>> +sealing
>>> + * key stored in the key blob.
>>> + *
>>> + * Whenever a new trusted key using DCP is generated, we generate a
>>> +random 128-bit
>>> + * blob encryption key (BEK) and 128-bit nonce. The BEK and nonce =
are
>>> +used to
>>> + * encrypt the trusted key payload using AES-128-GCM.
>>> + *
>>> + * The BEK itself is encrypted using the hardware-bound key using =
the
>>> +DCP's AES
>>> + * encryption engine with AES-128-ECB. The encrypted BEK, generated
>>> +nonce,
>>> + * BEK-encrypted payload and authentication tag make up the blob
>>> +format together
>>> + * with a version number, payload length and authentication tag.
>>> + */
>>> +
>>> /**
>>>  * struct dcp_blob_fmt - DCP BLOB format.
>>>  *
>>=20
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>>=20
>> I can only test that this does not break a machine without the =
hardware
>> feature.
>>=20
>> Is there anyone who could possibly peer test these patches?
> I am already working on testing this patchset on i.MX6 platform.

Did you get around to testing this?
I=E2=80=99d greatly appreciate a Tested-by for this. :-)

Thanks!
BR, David

