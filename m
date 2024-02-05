Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2D849591
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 09:40:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=QwOUudl5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT0F82YNmz3c40
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 19:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=QwOUudl5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT0DK6CXFz30GC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 19:39:27 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a36126e7459so538478866b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 00:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1707122360; x=1707727160; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fYC3H+9fhYO7ZOc/qX6rq1afQIQ11uUH5tLK3IWpXc=;
        b=QwOUudl5ASrntmF24ja6Alaw70RFTss4eJunljpAxe9Xod7EMaU5X8igGMPR4+a1Ho
         G+S2Rbl7BiMZdnWAeEikyVAKTBQGdugGIsEp6OLAlTFEEMIc4IyI23FiMScXbOpoAKzz
         ceg98eaAPqLCzVaooPFbkiT8vcPXnJFg+Cj6Oe4cD0KVvtxptMsSQfqaZQ3cBQH1uFuN
         VUBu9B0IFX1zRWU8kzUI9Ea+XBaTqHnX1GdZI4kdFl6mICss+eLlYEgnlvmCOpZoBtnW
         FS9wtcU5rl3A4FRkCqBlPv+aPONROTrZQ6mlBObi2O7Uu/uVWOdqA+IzoYlQOOuijj4l
         qU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707122360; x=1707727160;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fYC3H+9fhYO7ZOc/qX6rq1afQIQ11uUH5tLK3IWpXc=;
        b=uN+VZpdRnEoLTaCCVKEd4LkBQh/rFuYyq9Bode61/1j2gaCwjS5laCXsxUETkxlt7w
         DJMQswCqZrrt975aWmmBy6WJHB5KuyZresrUgCMRx2wlEj9pifY/BnQA7DAItvRkayga
         6FKCo+F5YbdQWqVt1+4lFDHzKpdYLi9bX1oFMl3wyGl0Gcu3GxUUebPGo7iNUb/PXxJX
         5YuItjZgA7snCTw+TadJVFJqdxbTI1VwiF3M2ipYW7qsjsgk+68HdNNZI7qo1mNuFUdl
         /pWiLf7wS25Z2XQ6Ts3maW0DqRiX08ZzkaUHt3A/xL0bGZj5DaKz2Ul2+ctYx9MBn404
         9Xrg==
X-Gm-Message-State: AOJu0YwuqEmQa+iL2R4M4xTe6PpIr7ZHvUSYElENFAy/TmC4TeFbeyEK
	fddaJi0HUaMrpRNK1aJ/9sES+VNWHKSKXSi/fmhoatg2gjYEyBvgESuosEnY8l0=
X-Google-Smtp-Source: AGHT+IHLVlIqTHZQT4uS2cWMqHQ2/IKc/41epP/Cs1vBSz9FD6909OEjZv22ODsI8EUgs+fyzA4YHw==
X-Received: by 2002:a17:906:16c8:b0:a37:bdc2:e4e6 with SMTP id t8-20020a17090616c800b00a37bdc2e4e6mr1530645ejd.10.1707122360096;
        Mon, 05 Feb 2024 00:39:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUTINvkr7TdZxNV3zYWkm9NGPQZ3GBX+JIgmxygvgv41SJzvPqoxxCTp3Tc5PUMHqQw6PbrIpUJx88b3E4cjK5SpUhXe9GIOdkr+YAeq65K7GeGBl1IcKBE3vDLsUsnuV2IbaG0QNY2n7bIZmG6EvZe1SBcWh+cXAGLPTi+gsHzLIB4Ek4PUYTx4gU+ytkjrCv9icm50Zeb3mURGFiiEDIG7cEFIv8APYkltJkm2gyR7ujeOD214DLsYXioA4GA+mfSAn1zE6cUXN3gEY+rLpkmUpLjD2iJPbzDVzGNISNprHIg7SmguU4h2FdVVnwSTySpbdJdWbY3O73k0isTb+fW+2BhqgbYzLQP4Th8toVBowOkBsWLuiIMTWzYAOhJmk6ekd906b1/N5qCiiP0jMcDqGHNHD66is0Ey/uYHly9YuPt9eh1AjwKjjwF5b/qpsQ704D/FfKIJGUGgJ1LvvVEDZ4wkLobm4MWzCyKR42KQu0JY9qwDmsVCk+CmP2XiCJQ8kF2e1uHxU2m6jE1Jk/PCyOQgU3eOv7zuzVmmRlrTGC97+WwZ9lMD8jIvBNhTVIoLbb6F+28AgmyFJsGRwnuvmQaQIBSDluu/HVeamiL/BJF4j44dxmUseTJh1DPAFnwb8JEHWSiMWx8TUueFEYA879cQmBtXxDqUYJWkmFVkkCePJ36slN9TE80+JJXJ1Z0bJJAZkbT5axJshtLmW1nYM/cCaLufm5IJ62p4nLFPkfgMBdpMO6VDWIOUm45cYxAY+QEZfwBlvJpE8Lld5T1ciB/mRzSVLQhcT3wgMswJ4SIQG0CdlYdDMod8umwfxAvQ5eVNuJZUIxogGlCwuZkzTMDTNJW11/MvqvmrxyUY2liKdTG8Q37KBJklaQPX7hBwW80miWJmXOgOFH/ZR0c8gSG0jlvmwQvhcM3zN3VOh/65AVlQsT6eAoJaDQm1u4hW4
 /DnIJlK+OUtw19HfTP17A+oLh+MUcCC6cXuft5pI0Syr4CJfj5Mt2O/zB3IJax/LQQuYmm
Received: from smtpclient.apple ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id vu11-20020a170907a64b00b00a37a38737d5sm1316761ejc.89.2024.02.05.00.39.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Feb 2024 00:39:19 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v5 0/6] DCP as trusted keys backend
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20231215110639.45522-1-david@sigma-star.at>
Date: Mon, 5 Feb 2024 09:39:07 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <7AED262F-9387-446D-B11A-C549C02542F9@sigma-star.at>
References: <20231215110639.45522-1-david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
X-Mailer: Apple Mail (2.3774.400.31)
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "k
 ernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> On 15.12.2023, at 12:06, David Gstir <david@sigma-star.at> wrote:
>=20
> This is a revival of the previous patch set submitted by Richard =
Weinberger:
> =
https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@nod=
.at/
>=20
> v4 is here:
> =
https://lore.kernel.org/keyrings/20231024162024.51260-1-david@sigma-star.a=
t/
>=20
> v4 -> v5:
> - Make Kconfig for trust source check scalable as suggested by Jarkko =
Sakkinen
> - Add Acked-By from Herbert Xu to patch #1 - thanks!
> v3 -> v4:
> - Split changes on MAINTAINERS and documentation into dedicated =
patches
> - Use more concise wording in commit messages as suggested by Jarkko =
Sakkinen
> v2 -> v3:
> - Addressed review comments from Jarkko Sakkinen
> v1 -> v2:
> - Revive and rebase to latest version
> - Include review comments from Ahmad Fatoum
>=20
> The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
> as i.mx6ull.
>=20
> Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
> encrypt/decrypt user data using a unique, never-disclosed,
> device-specific key. Unlike CAAM though, it cannot directly wrap and
> unwrap blobs in hardware. As DCP offers only the bare minimum feature
> set and a blob mechanism needs aid from software. A blob in this case
> is a piece of sensitive data (e.g. a key) that is encrypted and
> authenticated using the device-specific key so that unwrapping can =
only
> be done on the hardware where the blob was wrapped.
>=20
> This patch series adds a DCP based, trusted-key backend and is similar
> in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
> It is of interest for similar use cases as the CAAM patch set, but for
> lower end devices, where CAAM is not available.
>=20
> Because constructing and parsing the blob has to happen in software,
> we needed to decide on a blob format and chose the following:
>=20
> struct dcp_blob_fmt {
> __u8 fmt_version;
> __u8 blob_key[AES_KEYSIZE_128];
> __u8 nonce[AES_KEYSIZE_128];
> __le32 payload_len;
> __u8 payload[];
> } __packed;
>=20
> The `fmt_version` is currently 1.
>=20
> The encrypted key is stored in the payload area. It is AES-128-GCM
> encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
> the end of the payload (`payload_len` does not include the size of
> the auth tag).
>=20
> The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
> the OTP or UNIQUE device key. A new `blob_key` and `nonce` are =
generated
> randomly, when sealing/exporting the DCP blob.
>=20
> This patchset was tested with dm-crypt on an i.MX6ULL board.
>=20
> [0] =
https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@pengutr=
onix.de/
>=20
> David Gstir (6):
>  crypto: mxs-dcp: Add support for hardware-bound keys
>  KEYS: trusted: improve scalability of trust source config
>  KEYS: trusted: Introduce NXP DCP-backed trusted keys
>  MAINTAINERS: add entry for DCP-based trusted keys
>  docs: document DCP-backed trusted keys kernel params
>  docs: trusted-encrypted: add DCP as new trust source
>=20
> .../admin-guide/kernel-parameters.txt         |  13 +
> .../security/keys/trusted-encrypted.rst       |  85 +++++
> MAINTAINERS                                   |   9 +
> drivers/crypto/mxs-dcp.c                      | 104 +++++-
> include/keys/trusted_dcp.h                    |  11 +
> include/soc/fsl/dcp.h                         |  17 +
> security/keys/trusted-keys/Kconfig            |  18 +-
> security/keys/trusted-keys/Makefile           |   2 +
> security/keys/trusted-keys/trusted_core.c     |   6 +-
> security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
> 10 files changed, 562 insertions(+), 14 deletions(-)
> create mode 100644 include/keys/trusted_dcp.h
> create mode 100644 include/soc/fsl/dcp.h
> create mode 100644 security/keys/trusted-keys/trusted_dcp.c

Jarkko, Mimi, David do you need anything from my side for these patches =
to get them merged?

Thanks,
- David

