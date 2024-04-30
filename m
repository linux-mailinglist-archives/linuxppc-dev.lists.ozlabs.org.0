Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B558B7559
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 14:04:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=bBHk7NZK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTJm23F5Gz3cXs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 22:04:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=bBHk7NZK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTJlF2QDrz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 22:04:06 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5709cb80b03so5723025a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1714478640; x=1715083440; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roFKNV9068c4FWvmmLYomBY2V974jx//R1VbbE7RHEQ=;
        b=bBHk7NZKEgt1Hd2Ua2KIwS65Gzcp7ThoQGb1bpxQjVFRo9HvsBxh1PEqh+FO8blClt
         d048vzoGCvLFDCQNXkVC+hy+F/NND0hPXkfJ5GwGqt6eukLL97SJVBaGPYOTHniQkegA
         2yIbp87yAMxYOTF25r1cDnJFoCwJ+SIG1n2/QuV4Vm6TmL9ZkBBEezT2jZ1pBWzXVEyA
         3KjRpcyxUXoXq3+BCGE2Uv92k2pkMHlnx6JdqhMeQZxf5UMN2XaI0s67cu6zns/M6MRU
         3FiXV32C8C+tfeX2/wspMfCn7kL0bx6iM6Uwd7ZCj75hAmudpxzFRKO/Pl+2JpF4cgul
         rpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714478640; x=1715083440;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roFKNV9068c4FWvmmLYomBY2V974jx//R1VbbE7RHEQ=;
        b=fRgrOWSEdqor7+Rv29Em9d9sCB28ASL4tTYFcUvTyST/kVKdQgSutuJOFqyQnwEbQP
         uDh+Szfqyqyu287llzlS9ovgnz6VZ35jdl0xlG+j0ydh/PTBsjBs5Mjw8+qr58Vu1lXr
         nxzuM4ERblblBjeBQ3Pe+CPsFBAYJvVZgcCOSztL4RzXsNTq0yWsmTEDjy5nk2ZVkH7c
         HP17y8PaRMZFUBEuKGf0kwUe+CsNrnQqJ86AqyskMk/B4VM4njh9ZWKrowQDztSHZAp/
         kXe1lAm07uis5UgKpD/j+ngXu2fvP733rmCciVT5jS/gY3UiS/JMtU5Veote61DzXuzA
         zE1w==
X-Forwarded-Encrypted: i=1; AJvYcCXFmylwK3MM84gAMYscZ6z/qturE0ly+JSpn7H6nd8JerE6FNOuHP10T2WGlY5+SMdnSsjEjAqCoUuRDpCqMfN2vEOOqTCvlxmreR5xRQ==
X-Gm-Message-State: AOJu0YzqUXnkRYQejTVz/sk8iBaAABS1UtsVhBIem4z5pNdhy6Ms8q+P
	FWC5mk3+OADARZh48epZAXQW2oXGeyD/pLz7xQN/7e9yo01xSRp6VsN6x+X3Xs0=
X-Google-Smtp-Source: AGHT+IFOJa95c5L3PLcuPC8+myscInn7v7yIygmTBp6T6UQW/vkzzT0D2o5eQO+OLj8DOz8EVMoqXQ==
X-Received: by 2002:a50:bb0d:0:b0:572:5bc3:3871 with SMTP id y13-20020a50bb0d000000b005725bc33871mr1684440ede.10.1714478640578;
        Tue, 30 Apr 2024 05:04:00 -0700 (PDT)
Received: from smtpclient.apple (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with ESMTPSA id j17-20020aa7c0d1000000b005729c4c2501sm433685edp.24.2024.04.30.05.03.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:04:00 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [EXT] [PATCH v8 6/6] docs: trusted-encrypted: add DCP as new
 trust source
From: David Gstir <david@sigma-star.at>
In-Reply-To: <DB6PR04MB319062F2A19A250BA22C12D48F1A2@DB6PR04MB3190.eurprd04.prod.outlook.com>
Date: Tue, 30 Apr 2024 14:03:48 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB9357A7-0B20-4E57-AF66-3DD0F55ED538@sigma-star.at>
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-7-david@sigma-star.at>
 <D0ALT2QCUIYB.8NFTE7Z18JKN@kernel.org>
 <DB6PR04MB3190F6B78FF3760EBCC14E758F072@DB6PR04MB3190.eurprd04.prod.outlook.com>
 <7783BAE9-87DA-4DD5-ADFA-15A9B55EEF39@sigma-star.at>
 <DB6PR04MB319062F2A19A250BA22C12D48F1A2@DB6PR04MB3190.eurprd04.prod.outlook.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gaurav Jain <gaurav.jain@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, dl-linux-imx <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pankaj Gupta <pankaj.gupta@nxp.com>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead
 .org>, Paul Moore <paul@paul-moore.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Kshitiz Varshney <kshitiz.varshney@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Varun Sethi <V.Sethi@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jarkko,

> On 30.04.2024, at 13:48, Kshitiz Varshney <kshitiz.varshney@nxp.com> =
wrote:
>=20
> Hi David,
>=20
>> -----Original Message-----
>> From: David Gstir <david@sigma-star.at>
>> Sent: Monday, April 29, 2024 5:05 PM
>> To: Kshitiz Varshney <kshitiz.varshney@nxp.com>


>>=20
>> Did you get around to testing this?
>> I=E2=80=99d greatly appreciate a Tested-by for this. :-)
>>=20
>> Thanks!
>> BR, David
>=20
> Currently, I am bit busy with other priority activities. It will take =
time to test this patch set.

How should we proceed here?
Do we have to miss another release cycle, because of a Tested-by?

If any bugs pop up I=E2=80=99ll happily fix them, but at the moment it =
appears to be more of a formality.
IMHO the patch set itself is rather small and has been thoroughly =
reviewed to ensure that any huge
issues would already have been caught by now.

Thanks!
BR, David=
