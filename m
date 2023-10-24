Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324CD7D5804
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 18:21:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=O9UDW4eY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFHPN0nZwz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 03:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=O9UDW4eY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFHNS1l5Bz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 03:20:38 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so7285526a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1698164431; x=1698769231; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRO+xCDaQbDKnIXJCwBi3Y2yF65udPG/2rEKc0aYwBQ=;
        b=O9UDW4eYBQT+wLa2X0LbSh4BhyBYyezPC0ZixvsPFbu8X8k8s1HHPhNUN0nPQqALQd
         Ee21K22V/KuLDTZWSv9RpNgK8D4PTPaKtP+rZ+78KPpfdwqPGErVwjlMCx3Ykyd6CoCH
         49NyALfHnkW1i5ABFm6opM0OKxp7rjoIwe1MobheEAR0KIX/39jgfPZzi/GOBud/uii5
         JPZ5Gpjy+8p/LKc/eBb58NuSwqcDgTmzNKs4YIO5KL0VpOoSfYVA2fmYsN5r72TZ68w2
         6FbMUmr2yTD+JEBwe0ZCglBnu5AZiMv083Xa4xexs0uP7Cbje33wbVwOCbnf+YobfFi9
         Bojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164431; x=1698769231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRO+xCDaQbDKnIXJCwBi3Y2yF65udPG/2rEKc0aYwBQ=;
        b=N2+oiPZE9zI8+kkDdJKspOzhTmSt0+ZlweNjL+E/TSisSZL+CVCV/BVC+lbXdOYrf2
         PAmdxHDK1d0XEv0JaUGVbpQ89Gox7LtQf1KrkSRyjH/3kymlxobAOG638T+iBdu1pkUa
         yNwpe/2tyVjCg8v0caa2KgqcVrB9SoCpGjaIbGgA5zmNqrauSrsIMNuFblvjzlYigpTw
         5IVQnOfrYlf7OvF1RoS8W4MQ5hco+BcazpLfpGiH19ZSo8NBdAFO2ttD896v9wLabKyP
         Zvy3r89SYPlx7bmMhtgfWewaPUL+DO0tNjhnfc5VMeuuXIfj+k0DE+BZV01XcC/I+kbM
         M+dQ==
X-Gm-Message-State: AOJu0Yw0//aZTkreOgxQjjgspfVtuRzucwFmcTedu6PvjaC3+baa59IR
	3t+0ycbZ7eb2UMFKmZWlw04wZA==
X-Google-Smtp-Source: AGHT+IEIk3iJ6GCsHRYMeMdo8uw1QNTL6gntpg/5SaGUAZHqkqQekLyT81Tgpt8fo9diZdiabupYpQ==
X-Received: by 2002:a17:907:c0d:b0:9be:8693:66bb with SMTP id ga13-20020a1709070c0d00b009be869366bbmr9625930ejc.59.1698164431055;
        Tue, 24 Oct 2023 09:20:31 -0700 (PDT)
Received: from localhost (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with UTF8SMTPSA id cw11-20020a170906c78b00b009add084a00csm8489556ejb.36.2023.10.24.09.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 09:20:30 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v4 0/5] DCP as trusted keys backend
Date: Tue, 24 Oct 2023 18:20:14 +0200
Message-ID: <20231024162024.51260-1-david@sigma-star.at>
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

v3 is here:
https://lore.kernel.org/keyrings/20230918141826.8139-1-david@sigma-star.at/

v3 -> v4:
- Split changes on MAINTAINERS and documentation into dedicated patches
- Use more concise wording in commit messages as suggested by Jarkko Sakkinen
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

David Gstir (5):
  crypto: mxs-dcp: Add support for hardware-bound keys
  KEYS: trusted: Introduce NXP DCP-backed trusted keys
  MAINTAINERS: add entry for DCP-based trusted keys
  docs: document DCP-backed trusted keys kernel params
  docs: trusted-encrypted: add DCP as new trust source

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

