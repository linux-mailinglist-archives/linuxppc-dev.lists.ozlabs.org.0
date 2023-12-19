Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6970817EF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 01:46:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Gd/18TRR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvJ0r3s75z3c8H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 11:46:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Gd/18TRR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvJ002M93z300f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 11:45:50 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dbd46eabce4so768706276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 16:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1702946745; x=1703551545; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oasQpdQEdRdV5iTLy9b03b575xEh8lY+6DBy55U7VgY=;
        b=Gd/18TRRbbWN2qIy6LMTHhtdwNHlcYvey7Zpoah407AtU5sSdYZhZwwWVMDLNuGf78
         ovY7jggpiXT90biRNUZPEFkTtwS3sU4+V1VZNtkLeosPZHwjWbVX4JymE29gKlHJj8EC
         3M/eR3GUd6R9NWY/S748pCa4VNkd4YiaYHFxocHRsRKIDoyjnN5vMPLAVH8V5LBC2s6I
         4UJQcI9mToXANp1C7Y7/nT1gNvz41MVl7MHz9cgasuSrORzPyB1uNouzUrbm88/6pBrd
         /pgG0xKMl9JXD9i2GQ7yFX0CkEKaeTmHABwsMdScg9l2U6jRVtpEybiUe+OF4mkPQVKS
         fwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702946745; x=1703551545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oasQpdQEdRdV5iTLy9b03b575xEh8lY+6DBy55U7VgY=;
        b=big7Eqc/LhXEnOzTSshYczVZuOgq/1MKn5rL3xdLXHGNOYUUUTSuHGTNTEHJUA6dgG
         RdeX2IQeIzA+QUZwc3qSq4lCiUqrJrNVH5Kmt17oEsdFa7QWFJQ0NziKVjE9czUrU513
         4ZdURa6UqadqwsbqDIhHRAhbNy4XIbktDA9TFIUXuVOgh2eGNKUTh7rbQCrnwPtP3zR0
         5ChNq1aAEbUIlgFjAY7YsVgqVkL67ILNbIFtDx0HZp9mHozxNKPvPTH/iMTyjDL2NCWo
         RFZAk8IUTqgyu0WRTsL61fI9J+oEL+jOEa6oGQzXo3ov64w7/iYXcu1CWlOPFveCS0h+
         7Y3w==
X-Gm-Message-State: AOJu0YzaO/cFk6zIg5lxx8Uv81Hc8lhZU/B1FxQRLf5WJDzwGE1p3Lr1
	ucKpsV+wahHbWCYPvkMz67gp5l6Iz5ZGzRqaTIDTxDMbKe0D
X-Google-Smtp-Source: AGHT+IHFtpoGslhpNZUWQ9Yvh/0J3BP+vucf5ghv5vQv8fV6Ebtbue95F9C+pqRj+w9X/e1PwDGZwltTgDSmFXCRZ9M=
X-Received: by 2002:a25:d785:0:b0:dbc:f85e:eb39 with SMTP id
 o127-20020a25d785000000b00dbcf85eeb39mr196775ybg.3.1702946745056; Mon, 18 Dec
 2023 16:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20231215110639.45522-1-david@sigma-star.at>
In-Reply-To: <20231215110639.45522-1-david@sigma-star.at>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 Dec 2023 19:45:34 -0500
Message-ID: <CAHC9VhSRjwN=a9=V--m46_xh4fQNwZ9781YBCDpAmAV1mofhQg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] DCP as trusted keys backend
To: David Gstir <david@sigma-star.at>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@k
 ernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 15, 2023 at 6:07=E2=80=AFAM David Gstir <david@sigma-star.at> w=
rote:
>
> This is a revival of the previous patch set submitted by Richard Weinberg=
er:
> https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@no=
d.at/
>
> v4 is here:
> https://lore.kernel.org/keyrings/20231024162024.51260-1-david@sigma-star.=
at/
>
> v4 -> v5:
> - Make Kconfig for trust source check scalable as suggested by Jarkko Sak=
kinen
> - Add Acked-By from Herbert Xu to patch #1 - thanks!
> v3 -> v4:
> - Split changes on MAINTAINERS and documentation into dedicated patches
> - Use more concise wording in commit messages as suggested by Jarkko Sakk=
inen
> v2 -> v3:
> - Addressed review comments from Jarkko Sakkinen
> v1 -> v2:
> - Revive and rebase to latest version
> - Include review comments from Ahmad Fatoum
>
> The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
> as i.mx6ull.
>
> Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
> encrypt/decrypt user data using a unique, never-disclosed,
> device-specific key. Unlike CAAM though, it cannot directly wrap and
> unwrap blobs in hardware. As DCP offers only the bare minimum feature
> set and a blob mechanism needs aid from software. A blob in this case
> is a piece of sensitive data (e.g. a key) that is encrypted and
> authenticated using the device-specific key so that unwrapping can only
> be done on the hardware where the blob was wrapped.
>
> This patch series adds a DCP based, trusted-key backend and is similar
> in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
> It is of interest for similar use cases as the CAAM patch set, but for
> lower end devices, where CAAM is not available.
>
> Because constructing and parsing the blob has to happen in software,
> we needed to decide on a blob format and chose the following:
>
> struct dcp_blob_fmt {
>         __u8 fmt_version;
>         __u8 blob_key[AES_KEYSIZE_128];
>         __u8 nonce[AES_KEYSIZE_128];
>         __le32 payload_len;
>         __u8 payload[];
> } __packed;
>
> The `fmt_version` is currently 1.
>
> The encrypted key is stored in the payload area. It is AES-128-GCM
> encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
> the end of the payload (`payload_len` does not include the size of
> the auth tag).
>
> The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
> the OTP or UNIQUE device key. A new `blob_key` and `nonce` are generated
> randomly, when sealing/exporting the DCP blob.
>
> This patchset was tested with dm-crypt on an i.MX6ULL board.
>
> [0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@pe=
ngutronix.de/
>
> David Gstir (6):
>   crypto: mxs-dcp: Add support for hardware-bound keys
>   KEYS: trusted: improve scalability of trust source config
>   KEYS: trusted: Introduce NXP DCP-backed trusted keys
>   MAINTAINERS: add entry for DCP-based trusted keys
>   docs: document DCP-backed trusted keys kernel params
>   docs: trusted-encrypted: add DCP as new trust source
>
>  .../admin-guide/kernel-parameters.txt         |  13 +
>  .../security/keys/trusted-encrypted.rst       |  85 +++++
>  MAINTAINERS                                   |   9 +
>  drivers/crypto/mxs-dcp.c                      | 104 +++++-
>  include/keys/trusted_dcp.h                    |  11 +
>  include/soc/fsl/dcp.h                         |  17 +
>  security/keys/trusted-keys/Kconfig            |  18 +-
>  security/keys/trusted-keys/Makefile           |   2 +
>  security/keys/trusted-keys/trusted_core.c     |   6 +-
>  security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
>  10 files changed, 562 insertions(+), 14 deletions(-)
>  create mode 100644 include/keys/trusted_dcp.h
>  create mode 100644 include/soc/fsl/dcp.h
>  create mode 100644 security/keys/trusted-keys/trusted_dcp.c

Jarkko, Mimi, David - if this patchset isn't already in your review
queue, can you take a look at it from a security/keys perspective?

Thanks.

--=20
paul-moore.com
