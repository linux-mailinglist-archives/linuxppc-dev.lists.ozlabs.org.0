Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C97A4B05
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 16:20:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=HTD/WrPq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq6QC5GZTz3cSR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 00:20:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=HTD/WrPq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq6NM1V8Mz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 00:18:41 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a5c0d949eso5529992a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1695046715; x=1695651515; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFchyKYZaSrX7EMCsBGCn2uZcmTzjow+NxNlenZjDxg=;
        b=HTD/WrPqf/XgCvQlPXWxLVuWalr1Lfu3dsirmHUnvEWY2w8vyVmu2RGRz2XeI5Cuus
         +yGB53hQn82ZUGZAPfrFHvIW8tvQmGFAhqJlIUj/uwqtNC5vYkPyO9nd+7UrAMIyWwfZ
         pfr2utXISYjstb2sn1mQA6u/DrcEOSDoIMpyS7gVh0jpTYGIZmEHE6aUgm53BGOQ/wGL
         MQrV43EbqPV2Wx975s/GtfT7GBD176NuFsVSOAVtJyNgOqgYa7ehQ10vnYy0EDZRJzsG
         4PSdp2lAfpf8p8HthWUQPjlvLKzqZAXT2xOz8J3XHWmFN+EiZ0hrPl5JcoTwQmfQ4Nxt
         7uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695046715; x=1695651515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFchyKYZaSrX7EMCsBGCn2uZcmTzjow+NxNlenZjDxg=;
        b=B01M8Bz3EXuhEv4du5ZwnewPtgq6Nv3/ZMlISONyDKYd3cWx6BgyXRLTIRSRNzw0Nr
         sdV14xLH6Gj05TKHKxQrt/yLQsB+7r72EDh1jYQz6C/7UXV+/1MmRpS35smrH+8WFYEU
         CMQvkMwymhJqNTLYurSD7RaOS69YGCCUbV3GCiRy0jQ69wRVYA7HO7C3rNYpMh5d13ed
         nsXHXy+bvP0/FieNYrljrq6Qmg47MndgIpOZlkFn/ITz/0uoLzwFY2dVEznPRKkAG221
         2t1fb8rfT0+AldujSyf5tfu/U1dENYVUVo92xbJnB1MVk3rC+KRmzk3Ay4LZQl03Pmsh
         ZxTw==
X-Gm-Message-State: AOJu0YwJbJsaiv7VWBufkYNR0zZUmUiOpwycJKfBTa+ekavICPzGAFZT
	DI6cgdH6PHAvXW9QLzTtRJPlCw==
X-Google-Smtp-Source: AGHT+IGZY9EAv9fq5jtqbWievBVWv5LiwqHR3LyOgh3sgu5FxK83H5apmVz53SdQ15aJu5RB2fhOsg==
X-Received: by 2002:a05:6402:28ac:b0:530:8d55:9c69 with SMTP id eg44-20020a05640228ac00b005308d559c69mr8040854edb.11.1695046714597;
        Mon, 18 Sep 2023 07:18:34 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id f23-20020a056402161700b00525503fac84sm6031869edv.25.2023.09.18.07.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:18:34 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v3 0/3] DCP as trusted keys backend
Date: Mon, 18 Sep 2023 16:18:22 +0200
Message-ID: <20230918141826.8139-1-david@sigma-star.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.
 org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a revival of the previous patch set submitted by Richard Weinberger:
https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@nod.at/

v2 is here:
https://lore.kernel.org/keyrings/20230912111115.24274-1-david@sigma-star.at/

v2 -> v3:
- Addressed review comments from Jarkko Sakkinen
v1 -> v2:
- Revive and rebase to latest version
- Include review comments from Ahmad Fatoum

The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
as i.mx6ull.

Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
encrypt/decrypt user data using a unique, never-disclosed,
device-specific key. Unlike CAAM though, it cannot directly wrap and
unwrap blobs in hardware. As DCP offers only the bare minimum feature
set and a blob mechanism needs aid from software. A blob in this case
is a piece of sensitive data (e.g. a key) that is encrypted and
authenticated using the device-specific key so that unwrapping can only
be done on the hardware where the blob was wrapped.

This patch series adds a DCP based, trusted-key backend and is similar
in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
It is of interest for similar use cases as the CAAM patch set, but for
lower end devices, where CAAM is not available.

Because constructing and parsing the blob has to happen in software,
we needed to decide on a blob format and chose the following:

struct dcp_blob_fmt {
	__u8 fmt_version;
	__u8 blob_key[AES_KEYSIZE_128];
	__u8 nonce[AES_KEYSIZE_128];
	__le32 payload_len;
	__u8 payload[];
} __packed;

The `fmt_version` is currently 1.

The encrypted key is stored in the payload area. It is AES-128-GCM
encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
the end of the payload (`payload_len` does not include the size of
the auth tag).

The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
the OTP or UNIQUE device key. A new `blob_key` and `nonce` are generated
randomly, when sealing/exporting the DCP blob.

This patchset was tested with dm-crypt on an i.MX6ULL board.

[0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@pengutronix.de/

David Gstir (3):
  crypto: mxs-dcp: Add support for hardware provided keys
  KEYS: trusted: Introduce support for NXP DCP-based trusted keys
  doc: trusted-encrypted: add DCP as new trust source

 .../admin-guide/kernel-parameters.txt         |  13 +
 .../security/keys/trusted-encrypted.rst       |  85 +++++
 MAINTAINERS                                   |   9 +
 drivers/crypto/mxs-dcp.c                      | 104 +++++-
 include/keys/trusted_dcp.h                    |  11 +
 include/soc/fsl/dcp.h                         |  17 +
 security/keys/trusted-keys/Kconfig            |   9 +-
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
 10 files changed, 554 insertions(+), 13 deletions(-)
 create mode 100644 include/keys/trusted_dcp.h
 create mode 100644 include/soc/fsl/dcp.h
 create mode 100644 security/keys/trusted-keys/trusted_dcp.c

-- 
2.35.3

