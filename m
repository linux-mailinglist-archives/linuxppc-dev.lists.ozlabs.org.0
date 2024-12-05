Return-Path: <linuxppc-dev+bounces-3842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7289E6E2E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 13:31:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4Vx70Mgjz2y8d;
	Fri,  6 Dec 2024 23:31:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733411506;
	cv=none; b=ICbQdE8wuqILkW55E6dkpZMROk7w8vok2F7BzKMu1/0eIk6nEnZLEV7ruNuMFXgvhDFAjM0WVQiRCKA8KXaoOtVEeDD3wLjS47DIak6SWaeVyOKqSmktlqwkh/VMEhs1rCXW02cLjV6afiE8YRuEg9Vw8xKKW+x9tjszhE7Rml8D/QN63j9WJ9f7QtbboQzqAm/IJ+RKIxKHMNB1GMS8SzpO0MsesFD1Fjf8frWxXNQrmsGC7ORvt4AvpyW70J1PPxG7wpwG6QPRXUgSJ+i7xVzFEbdIzhKQPsVzhEGhqVnTEUTeyakr62yenBSyI5yE8eSHbxP86c/N8BXllDEXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733411506; c=relaxed/relaxed;
	bh=U4tAJ6TV8DxPggrWRYBcrXQOjbfDnhgaB/464F8x+Is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aW/mFeNiIQXP+RvchSG41qdSFOLuqdzqYTW34alDUi6vbqcQqe8gHhgZXuKRPJ7veUXU8crU4AnWSSXLNuQQ8dTe1qtQzvPzhvPQG7y8bW0AUNvTiEDGV9eRLxZfTYEcYFIHIEjE1mc36LF+/z+rznoHqkF7X9bEMu+/Dd2OfiQYt/O8dLzO7SNyz/5UBinJVp+bCvgjq33nVoRTGfNzGLmJ35JXyATftDVEvcHsd9YJmIU2X8HrzLhyL0kRug7D2m8d7h+w2PG2WXRwvHm31EtmZ27q4b97e0hLMQZ9rk2kK2o55ZpDdreb3qelVxhb6x3BAE0OZWVRWrPHBt2WxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CXiY5t3l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CXiY5t3l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3yXb2DWjz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 02:11:42 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d89dc50927so7273026d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2024 07:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733411497; x=1734016297; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4tAJ6TV8DxPggrWRYBcrXQOjbfDnhgaB/464F8x+Is=;
        b=CXiY5t3lkTH/h5WJyI4OPy3UI4//Tdn3LERFN7anKzddJ/AB7qY2y69ftD/+AQKWx2
         9IajXGnEWii4H4i8woKHqVTPFDFxF0QRgo8w6By7rI8TNkkNcffB31CE01OwXlJlWm9b
         1IGFS8A9onRM3bsv2klT+Jb6+2gQ/ixoDjtSSFsJVzQnUwi7tZHyLGX+F58dvMJ8Tn0J
         rZy8CjVNWQYD40vTw/NX0V6CzwraA+u+Opxhva1eOZzneW7G5GcDxwkKNXBokAYwIV3a
         zzRZB9Dn+vF+SLcnoHXWmWtxn+RIwgPHW7fDPKrO8MYLC75qD5lRLe9n9+fPIC1UBPai
         d2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411497; x=1734016297;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4tAJ6TV8DxPggrWRYBcrXQOjbfDnhgaB/464F8x+Is=;
        b=JwMQ4tj2h7hRQWp5AhzA1x0Cg5rwhxCLTq7S7wGh8BMKYhN9RsfW+TfFhbdofHZbil
         2sAmkV00IrdEUmzRxVgqgo85PmaT3iJvMa5R+K2IXKX7tu6VtcxD06PXYH94da4o+5j1
         6fmEqLbPMbRD7AxYGtE88W05q9oPJEjB22SXtkyY/GVWUcBG+P5CQcq2i2i8sM6PCemT
         dgigYxgRHOei2kfmoh2h5WydZdnX6cVROCLTnNUg6Cxlzs4igqzNkGGiNunFEsEIqKMx
         9dAUzKj+sGwUAn2fnDTHhCdCDW+t5rxA4XZpSV3K6hfqM/WI1GLKdj7xVdr8kacsg1Qr
         DL6g==
X-Forwarded-Encrypted: i=1; AJvYcCVouw6emRJWv1esgRBngG/2CfxGmsH9e9QUBsduIbHtma9s5fJMpu5gWWwtBp4WbAkDd0K+fj826wCJQ3Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTIbmuftP9zzYlcfZ3Pk0XL66pH/55iyZZ4RiKc8tvm1m69phW
	5w8gH2BT/8QgIYvHoBc/D3xsrmIy1h5w6c0Fy2y61VXNG1bF8NTb
X-Gm-Gg: ASbGncuA4f2XjqMgUUhif6xbjZbtkXdK/BJYGGy84+d4ZjOftBhaLTRKS9iRR9fYFJJ
	qx1w9UuFcGAoIjx3E/zD9tCsRyTZYPSZ/JcW4eQg4qxi1JTFxQRPEWWISjffQEoP2VFi8QXM4B9
	xYs7dKX6ECk7kqlrywj9cayYAVaiPU4HwuEEvhsm7TVrpPfnA6ANMNc81JEuQ9ko19aEK5InT++
	fTG0Pr2l4u+vqR9QNw4KDRA0vE4KMZrorbmYRww0YjS8LaFwLIINyKX1ka4dsPlbbcktPxaed1U
	NA13ZcJyDIBHK3UIY9ljgS2hRrjh/m7EpB6xum0PN+ZNkjd+Ud7kWUPPIDw=
X-Google-Smtp-Source: AGHT+IFNrhhhVcTpiz9Py7yKSuTNiAlk+9kay/zY7LCAOBh9ULkOxxBOYwJX8Q38AOY6Bf47d1lRmg==
X-Received: by 2002:ad4:5c4a:0:b0:6d3:f8a0:5d8f with SMTP id 6a1803df08f44-6d8b745724dmr225981326d6.45.1733411496530;
        Thu, 05 Dec 2024 07:11:36 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:37ce])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da6b2bd5sm7294646d6.57.2024.12.05.07.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:11:35 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 05 Dec 2024 10:11:26 -0500
Subject: [PATCH] xarray: port tests to kunit
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ7CUWcC/x3MwQpAQBCA4VfRnE3tbEJeRQ6LwaSWZhFp393m+
 B3+/4XAKhygyV5QviTI5hMoz2BYnJ8ZZUwGa2xB1hR4O1X34Hp6OXDf9MC64pJK6gdyPaRuV57
 k/p9tF+MHncqtGmMAAAA=
X-Change-ID: 20241204-xarray-kunit-port-87e6161bc1ab
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Minimally rewrite the XArray unit tests to use kunit. This integrates
nicely with existing kunit tools which produce nicer human-readable
output compared to the existing machinery.

Running the xarray tests before this change requires an obscure
invocation

```
tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 \
  --kconfig_add CONFIG_TEST_XARRAY=y --raw_output=all nothing
```

which on failure produces

```
BUG at check_reserve:513
...
XArray: 6782340 of 6782364 tests passed
```

and exits 0.

Running the xarray tests after this change requires a simpler invocation

```
tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 \
  xarray
```

which on failure produces (colors omitted)

```
[09:50:53] ====================== check_reserve  ======================
[09:50:53] [FAILED] param-0
[09:50:53]     # check_reserve: EXPECTATION FAILED at lib/test_xarray.c:536
[09:50:53] xa_erase(xa, 12345678) != NULL
...
[09:50:53]     # module: test_xarray
[09:50:53] # xarray: pass:26 fail:3 skip:0 total:29
[09:50:53] # Totals: pass:28 fail:3 skip:0 total:31
[09:50:53] ===================== [FAILED] xarray ======================
```

and exits 1.

Use of richer kunit assertions is intentionally omitted to reduce the
scope of the change.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 arch/m68k/configs/amiga_defconfig    |   1 -
 arch/m68k/configs/apollo_defconfig   |   1 -
 arch/m68k/configs/atari_defconfig    |   1 -
 arch/m68k/configs/bvme6000_defconfig |   1 -
 arch/m68k/configs/hp300_defconfig    |   1 -
 arch/m68k/configs/mac_defconfig      |   1 -
 arch/m68k/configs/multi_defconfig    |   1 -
 arch/m68k/configs/mvme147_defconfig  |   1 -
 arch/m68k/configs/mvme16x_defconfig  |   1 -
 arch/m68k/configs/q40_defconfig      |   1 -
 arch/m68k/configs/sun3_defconfig     |   1 -
 arch/m68k/configs/sun3x_defconfig    |   1 -
 arch/powerpc/configs/ppc64_defconfig |   1 -
 lib/Kconfig.debug                    |  18 +-
 lib/Makefile                         |   2 +-
 lib/test_xarray.c                    | 669 ++++++++++++++++++++---------------
 16 files changed, 409 insertions(+), 293 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index c705247e7b5b3d67a9e0c2152f479a208d1acd44..581f0080814e92289610463f86abd9b38dab3d3f 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -629,7 +629,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 6d62b9187a58afc079cbefe126d0e2230bbc887c..25628a1e8fa1ccbc8d44398caf4d303fedf50807 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -586,7 +586,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index c3c644df852d280139828fce66e55f61eadbeca6..503a9ea526b56ae755b6e74dc02e37177a1a3886 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -606,7 +606,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 20261f8196918f0315fd29c82c97da0d581a4100..3358349898eff72b250a410940495fb55b597dfa 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -578,7 +578,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index ce4fe93a0f701958b5ec79c5d24e9e004e21f076..a5e933a7fdf9dfe16d8943032cf5da062c4c67d0 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -588,7 +588,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 040ae75f47c3957f2e5c93e19ef397fc23e3dfbd..a90676c04da6d03700a8273b16d22d65630633a7 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -605,7 +605,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 20d877cb4e308b10e48bfd872c45af795feed098..f28f7783b090e79ed6840df8e052fe43308d1302 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -692,7 +692,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 5e1c8d0d3da57de9397220b9544e0f883c4c2c30..61308c2cd96cfbf035b47ca7ac3d9366c61e1740 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -578,7 +578,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 5d1409e6a13773b43236ebe6d9a442348ac624a6..9ec8eb9ea6147c22dbeba8c90ea211404ed2dfc8 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -579,7 +579,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index e4c30e2b9bbb8753a2fec9422ab5770ecd38d8bc..5fd094391b9ecf3a7dd73f49432f8e64856f1887 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -595,7 +595,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 980843a9ea1eeda6d1d692e5772d5ad62adbeeec..5e9c9d704c2ee8df7e9fe1d73fcaef3f0ae2aa37 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -575,7 +575,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 38681cc6b598c5b433f04998d9af58ec6c2c58f2..b2f5f398fe42ae150049424e26f988cffa33062f 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -576,7 +576,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index f39c0d000c4386dc77fe36965e38a96f5f11daac..bc48063fd860627fdf24ee8dbe18cdedcec79078 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -451,7 +451,6 @@ CONFIG_TEST_PRINTF=m
 CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
-CONFIG_TEST_XARRAY=m
 CONFIG_TEST_MAPLE_TREE=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_IDA=m
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e968f083d356a53a87aa73d08caeb8471ea3603a..b53f5da22e4053dee79860c9a10d8dd26a7080d6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2456,8 +2456,22 @@ config TEST_BITMAP
 config TEST_UUID
 	tristate "Test functions located in the uuid module at runtime"
 
-config TEST_XARRAY
-	tristate "Test the XArray code at runtime"
+config XARRAY_KUNIT
+	tristate "KUnit test XArray code at runtime" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test the Xarray code at boot.
+
+	  KUnit tests run during boot and output the results to the debug log
+	  in TAP format (http://testanything.org/). Only useful for kernel devs
+	  running the KUnit test harness, and not intended for inclusion into a
+	  production build.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
 
 config TEST_MAPLE_TREE
 	tristate "Test the Maple Tree code at runtime or module load"
diff --git a/lib/Makefile b/lib/Makefile
index a8155c972f02856fcc61ee949ddda436cfe211ff..c0458ff841fe8feff840c77bb652adb2aae48678 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -94,7 +94,6 @@ GCOV_PROFILE_test_bitmap.o := n
 endif
 
 obj-$(CONFIG_TEST_UUID) += test_uuid.o
-obj-$(CONFIG_TEST_XARRAY) += test_xarray.o
 obj-$(CONFIG_TEST_MAPLE_TREE) += test_maple_tree.o
 obj-$(CONFIG_TEST_PARMAN) += test_parman.o
 obj-$(CONFIG_TEST_KMOD) += test_kmod.o
@@ -375,6 +374,7 @@ CFLAGS_bitfield_kunit.o := $(DISABLE_STRUCTLEAK_PLUGIN)
 obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
 obj-$(CONFIG_CHECKSUM_KUNIT) += checksum_kunit.o
 obj-$(CONFIG_UTIL_MACROS_KUNIT) += util_macros_kunit.o
+obj-$(CONFIG_XARRAY_KUNIT) += test_xarray.o
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_HASHTABLE_KUNIT_TEST) += hashtable_test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
diff --git a/lib/test_xarray.c b/lib/test_xarray.c
index d5c5cbba33edf30104e9bed40ec4298638e7a9e5..9d0e797b825fe308ffa3b68904e708e32d9b7857 100644
--- a/lib/test_xarray.c
+++ b/lib/test_xarray.c
@@ -6,11 +6,10 @@
  * Author: Matthew Wilcox <willy@infradead.org>
  */
 
-#include <linux/xarray.h>
-#include <linux/module.h>
+#include <kunit/test.h>
 
-static unsigned int tests_run;
-static unsigned int tests_passed;
+#include <linux/module.h>
+#include <linux/xarray.h>
 
 static const unsigned int order_limit =
 		IS_ENABLED(CONFIG_XARRAY_MULTI) ? BITS_PER_LONG : 1;
@@ -20,15 +19,12 @@ static const unsigned int order_limit =
 void xa_dump(const struct xarray *xa) { }
 # endif
 #undef XA_BUG_ON
-#define XA_BUG_ON(xa, x) do {					\
-	tests_run++;						\
-	if (x) {						\
-		printk("BUG at %s:%d\n", __func__, __LINE__);	\
-		xa_dump(xa);					\
-		dump_stack();					\
-	} else {						\
-		tests_passed++;					\
-	}							\
+#define XA_BUG_ON(xa, x) do {		\
+	if (x) {			\
+		KUNIT_FAIL(test, #x);	\
+		xa_dump(xa);		\
+		dump_stack();		\
+	}				\
 } while (0)
 #endif
 
@@ -42,13 +38,13 @@ static void *xa_store_index(struct xarray *xa, unsigned long index, gfp_t gfp)
 	return xa_store(xa, index, xa_mk_index(index), gfp);
 }
 
-static void xa_insert_index(struct xarray *xa, unsigned long index)
+static void xa_insert_index(struct kunit *test, struct xarray *xa, unsigned long index)
 {
 	XA_BUG_ON(xa, xa_insert(xa, index, xa_mk_index(index),
 				GFP_KERNEL) != 0);
 }
 
-static void xa_alloc_index(struct xarray *xa, unsigned long index, gfp_t gfp)
+static void xa_alloc_index(struct kunit *test, struct xarray *xa, unsigned long index, gfp_t gfp)
 {
 	u32 id;
 
@@ -57,7 +53,7 @@ static void xa_alloc_index(struct xarray *xa, unsigned long index, gfp_t gfp)
 	XA_BUG_ON(xa, id != index);
 }
 
-static void xa_erase_index(struct xarray *xa, unsigned long index)
+static void xa_erase_index(struct kunit *test, struct xarray *xa, unsigned long index)
 {
 	XA_BUG_ON(xa, xa_erase(xa, index) != xa_mk_index(index));
 	XA_BUG_ON(xa, xa_load(xa, index) != NULL);
@@ -83,8 +79,15 @@ static void *xa_store_order(struct xarray *xa, unsigned long index,
 	return curr;
 }
 
-static noinline void check_xa_err(struct xarray *xa)
+static inline struct xarray *xa_param(struct kunit *test)
 {
+	return *(struct xarray **)test->param_value;
+}
+
+static noinline void check_xa_err(struct kunit *test)
+{
+	struct xarray *xa = xa_param(test);
+
 	XA_BUG_ON(xa, xa_err(xa_store_index(xa, 0, GFP_NOWAIT)) != 0);
 	XA_BUG_ON(xa, xa_err(xa_erase(xa, 0)) != 0);
 #ifndef __KERNEL__
@@ -99,8 +102,10 @@ static noinline void check_xa_err(struct xarray *xa)
 //	XA_BUG_ON(xa, xa_err(xa_store(xa, 0, xa_mk_internal(0), 0)) != -EINVAL);
 }
 
-static noinline void check_xas_retry(struct xarray *xa)
+static noinline void check_xas_retry(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 	void *entry;
 
@@ -109,7 +114,7 @@ static noinline void check_xas_retry(struct xarray *xa)
 
 	rcu_read_lock();
 	XA_BUG_ON(xa, xas_find(&xas, ULONG_MAX) != xa_mk_value(0));
-	xa_erase_index(xa, 1);
+	xa_erase_index(test, xa, 1);
 	XA_BUG_ON(xa, !xa_is_retry(xas_reload(&xas)));
 	XA_BUG_ON(xa, xas_retry(&xas, NULL));
 	XA_BUG_ON(xa, xas_retry(&xas, xa_mk_value(0)));
@@ -140,12 +145,14 @@ static noinline void check_xas_retry(struct xarray *xa)
 	}
 	xas_unlock(&xas);
 
-	xa_erase_index(xa, 0);
-	xa_erase_index(xa, 1);
+	xa_erase_index(test, xa, 0);
+	xa_erase_index(test, xa, 1);
 }
 
-static noinline void check_xa_load(struct xarray *xa)
+static noinline void check_xa_load(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned long i, j;
 
 	for (i = 0; i < 1024; i++) {
@@ -167,13 +174,15 @@ static noinline void check_xa_load(struct xarray *xa)
 			else
 				XA_BUG_ON(xa, entry);
 		}
-		xa_erase_index(xa, i);
+		xa_erase_index(test, xa, i);
 	}
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_xa_mark_1(struct xarray *xa, unsigned long index)
+static noinline void check_xa_mark_1(struct kunit *test, unsigned long index)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned int order;
 	unsigned int max_order = IS_ENABLED(CONFIG_XARRAY_MULTI) ? 8 : 1;
 
@@ -193,7 +202,7 @@ static noinline void check_xa_mark_1(struct xarray *xa, unsigned long index)
 	XA_BUG_ON(xa, xa_get_mark(xa, index, XA_MARK_1));
 
 	/* Storing NULL clears marks, and they can't be set again */
-	xa_erase_index(xa, index);
+	xa_erase_index(test, xa, index);
 	XA_BUG_ON(xa, !xa_empty(xa));
 	XA_BUG_ON(xa, xa_get_mark(xa, index, XA_MARK_0));
 	xa_set_mark(xa, index, XA_MARK_0);
@@ -244,15 +253,17 @@ static noinline void check_xa_mark_1(struct xarray *xa, unsigned long index)
 		XA_BUG_ON(xa, xa_get_mark(xa, next, XA_MARK_0));
 		XA_BUG_ON(xa, xa_get_mark(xa, next, XA_MARK_1));
 		XA_BUG_ON(xa, xa_get_mark(xa, next, XA_MARK_2));
-		xa_erase_index(xa, index);
-		xa_erase_index(xa, next);
+		xa_erase_index(test, xa, index);
+		xa_erase_index(test, xa, next);
 		XA_BUG_ON(xa, !xa_empty(xa));
 	}
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_xa_mark_2(struct xarray *xa)
+static noinline void check_xa_mark_2(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 	unsigned long index;
 	unsigned int count = 0;
@@ -289,9 +300,11 @@ static noinline void check_xa_mark_2(struct xarray *xa)
 	xa_destroy(xa);
 }
 
-static noinline void check_xa_mark_3(struct xarray *xa)
+static noinline void check_xa_mark_3(struct kunit *test)
 {
 #ifdef CONFIG_XARRAY_MULTI
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0x41);
 	void *entry;
 	int count = 0;
@@ -310,19 +323,21 @@ static noinline void check_xa_mark_3(struct xarray *xa)
 #endif
 }
 
-static noinline void check_xa_mark(struct xarray *xa)
+static noinline void check_xa_mark(struct kunit *test)
 {
 	unsigned long index;
 
 	for (index = 0; index < 16384; index += 4)
-		check_xa_mark_1(xa, index);
+		check_xa_mark_1(test, index);
 
-	check_xa_mark_2(xa);
-	check_xa_mark_3(xa);
+	check_xa_mark_2(test);
+	check_xa_mark_3(test);
 }
 
-static noinline void check_xa_shrink(struct xarray *xa)
+static noinline void check_xa_shrink(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 1);
 	struct xa_node *node;
 	unsigned int order;
@@ -347,7 +362,7 @@ static noinline void check_xa_shrink(struct xarray *xa)
 	XA_BUG_ON(xa, xas_load(&xas) != NULL);
 	xas_unlock(&xas);
 	XA_BUG_ON(xa, xa_load(xa, 0) != xa_mk_value(0));
-	xa_erase_index(xa, 0);
+	xa_erase_index(test, xa, 0);
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	for (order = 0; order < max_order; order++) {
@@ -364,45 +379,49 @@ static noinline void check_xa_shrink(struct xarray *xa)
 		XA_BUG_ON(xa, xa_head(xa) == node);
 		rcu_read_unlock();
 		XA_BUG_ON(xa, xa_load(xa, max + 1) != NULL);
-		xa_erase_index(xa, ULONG_MAX);
+		xa_erase_index(test, xa, ULONG_MAX);
 		XA_BUG_ON(xa, xa->xa_head != node);
-		xa_erase_index(xa, 0);
+		xa_erase_index(test, xa, 0);
 	}
 }
 
-static noinline void check_insert(struct xarray *xa)
+static noinline void check_insert(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned long i;
 
 	for (i = 0; i < 1024; i++) {
-		xa_insert_index(xa, i);
+		xa_insert_index(test, xa, i);
 		XA_BUG_ON(xa, xa_load(xa, i - 1) != NULL);
 		XA_BUG_ON(xa, xa_load(xa, i + 1) != NULL);
-		xa_erase_index(xa, i);
+		xa_erase_index(test, xa, i);
 	}
 
 	for (i = 10; i < BITS_PER_LONG; i++) {
-		xa_insert_index(xa, 1UL << i);
+		xa_insert_index(test, xa, 1UL << i);
 		XA_BUG_ON(xa, xa_load(xa, (1UL << i) - 1) != NULL);
 		XA_BUG_ON(xa, xa_load(xa, (1UL << i) + 1) != NULL);
-		xa_erase_index(xa, 1UL << i);
+		xa_erase_index(test, xa, 1UL << i);
 
-		xa_insert_index(xa, (1UL << i) - 1);
+		xa_insert_index(test, xa, (1UL << i) - 1);
 		XA_BUG_ON(xa, xa_load(xa, (1UL << i) - 2) != NULL);
 		XA_BUG_ON(xa, xa_load(xa, 1UL << i) != NULL);
-		xa_erase_index(xa, (1UL << i) - 1);
+		xa_erase_index(test, xa, (1UL << i) - 1);
 	}
 
-	xa_insert_index(xa, ~0UL);
+	xa_insert_index(test, xa, ~0UL);
 	XA_BUG_ON(xa, xa_load(xa, 0UL) != NULL);
 	XA_BUG_ON(xa, xa_load(xa, ~1UL) != NULL);
-	xa_erase_index(xa, ~0UL);
+	xa_erase_index(test, xa, ~0UL);
 
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_cmpxchg(struct xarray *xa)
+static noinline void check_cmpxchg(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	void *FIVE = xa_mk_value(5);
 	void *SIX = xa_mk_value(6);
 	void *LOTS = xa_mk_value(12345678);
@@ -418,14 +437,16 @@ static noinline void check_cmpxchg(struct xarray *xa)
 	XA_BUG_ON(xa, xa_insert(xa, 5, FIVE, GFP_KERNEL) != -EBUSY);
 	XA_BUG_ON(xa, xa_cmpxchg(xa, 5, FIVE, NULL, GFP_KERNEL) != FIVE);
 	XA_BUG_ON(xa, xa_insert(xa, 5, FIVE, GFP_KERNEL) == -EBUSY);
-	xa_erase_index(xa, 12345678);
-	xa_erase_index(xa, 5);
+	xa_erase_index(test, xa, 12345678);
+	xa_erase_index(test, xa, 5);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_cmpxchg_order(struct xarray *xa)
+static noinline void check_cmpxchg_order(struct kunit *test)
 {
 #ifdef CONFIG_XARRAY_MULTI
+	struct xarray *xa = xa_param(test);
+
 	void *FIVE = xa_mk_value(5);
 	unsigned int i, order = 3;
 
@@ -476,8 +497,10 @@ static noinline void check_cmpxchg_order(struct xarray *xa)
 #endif
 }
 
-static noinline void check_reserve(struct xarray *xa)
+static noinline void check_reserve(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	void *entry;
 	unsigned long index;
 	int count;
@@ -494,7 +517,7 @@ static noinline void check_reserve(struct xarray *xa)
 	XA_BUG_ON(xa, xa_reserve(xa, 12345678, GFP_KERNEL) != 0);
 	XA_BUG_ON(xa, xa_store_index(xa, 12345678, GFP_NOWAIT) != NULL);
 	xa_release(xa, 12345678);
-	xa_erase_index(xa, 12345678);
+	xa_erase_index(test, xa, 12345678);
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	/* cmpxchg sees a reserved entry as ZERO */
@@ -502,7 +525,7 @@ static noinline void check_reserve(struct xarray *xa)
 	XA_BUG_ON(xa, xa_cmpxchg(xa, 12345678, XA_ZERO_ENTRY,
 				xa_mk_value(12345678), GFP_NOWAIT) != NULL);
 	xa_release(xa, 12345678);
-	xa_erase_index(xa, 12345678);
+	xa_erase_index(test, xa, 12345678);
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	/* xa_insert treats it as busy */
@@ -542,8 +565,10 @@ static noinline void check_reserve(struct xarray *xa)
 	xa_destroy(xa);
 }
 
-static noinline void check_xas_erase(struct xarray *xa)
+static noinline void check_xas_erase(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 	void *entry;
 	unsigned long i, j;
@@ -581,9 +606,11 @@ static noinline void check_xas_erase(struct xarray *xa)
 }
 
 #ifdef CONFIG_XARRAY_MULTI
-static noinline void check_multi_store_1(struct xarray *xa, unsigned long index,
+static noinline void check_multi_store_1(struct kunit *test, unsigned long index,
 		unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, index);
 	unsigned long min = index & ~((1UL << order) - 1);
 	unsigned long max = min + (1UL << order);
@@ -602,13 +629,15 @@ static noinline void check_multi_store_1(struct xarray *xa, unsigned long index,
 	XA_BUG_ON(xa, xa_load(xa, max) != NULL);
 	XA_BUG_ON(xa, xa_load(xa, min - 1) != NULL);
 
-	xa_erase_index(xa, min);
+	xa_erase_index(test, xa, min);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_multi_store_2(struct xarray *xa, unsigned long index,
+static noinline void check_multi_store_2(struct kunit *test, unsigned long index,
 		unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, index);
 	xa_store_order(xa, index, order, xa_mk_value(0), GFP_KERNEL);
 
@@ -620,9 +649,11 @@ static noinline void check_multi_store_2(struct xarray *xa, unsigned long index,
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_multi_store_3(struct xarray *xa, unsigned long index,
+static noinline void check_multi_store_3(struct kunit *test, unsigned long index,
 		unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 	void *entry;
 	int n = 0;
@@ -647,9 +678,11 @@ static noinline void check_multi_store_3(struct xarray *xa, unsigned long index,
 }
 #endif
 
-static noinline void check_multi_store(struct xarray *xa)
+static noinline void check_multi_store(struct kunit *test)
 {
 #ifdef CONFIG_XARRAY_MULTI
+	struct xarray *xa = xa_param(test);
+
 	unsigned long i, j, k;
 	unsigned int max_order = (sizeof(long) == 4) ? 30 : 60;
 
@@ -714,26 +747,28 @@ static noinline void check_multi_store(struct xarray *xa)
 	}
 
 	for (i = 0; i < 20; i++) {
-		check_multi_store_1(xa, 200, i);
-		check_multi_store_1(xa, 0, i);
-		check_multi_store_1(xa, (1UL << i) + 1, i);
+		check_multi_store_1(test, 200, i);
+		check_multi_store_1(test, 0, i);
+		check_multi_store_1(test, (1UL << i) + 1, i);
 	}
-	check_multi_store_2(xa, 4095, 9);
+	check_multi_store_2(test, 4095, 9);
 
 	for (i = 1; i < 20; i++) {
-		check_multi_store_3(xa, 0, i);
-		check_multi_store_3(xa, 1UL << i, i);
+		check_multi_store_3(test, 0, i);
+		check_multi_store_3(test, 1UL << i, i);
 	}
 #endif
 }
 
 #ifdef CONFIG_XARRAY_MULTI
 /* mimics page cache __filemap_add_folio() */
-static noinline void check_xa_multi_store_adv_add(struct xarray *xa,
+static noinline void check_xa_multi_store_adv_add(struct kunit *test,
 						  unsigned long index,
 						  unsigned int order,
 						  void *p)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, index);
 	unsigned int nrpages = 1UL << order;
 
@@ -761,10 +796,12 @@ static noinline void check_xa_multi_store_adv_add(struct xarray *xa,
 }
 
 /* mimics page_cache_delete() */
-static noinline void check_xa_multi_store_adv_del_entry(struct xarray *xa,
+static noinline void check_xa_multi_store_adv_del_entry(struct kunit *test,
 							unsigned long index,
 							unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, index);
 
 	xas_set_order(&xas, index, order);
@@ -772,12 +809,14 @@ static noinline void check_xa_multi_store_adv_del_entry(struct xarray *xa,
 	xas_init_marks(&xas);
 }
 
-static noinline void check_xa_multi_store_adv_delete(struct xarray *xa,
+static noinline void check_xa_multi_store_adv_delete(struct kunit *test,
 						     unsigned long index,
 						     unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	xa_lock_irq(xa);
-	check_xa_multi_store_adv_del_entry(xa, index, order);
+	check_xa_multi_store_adv_del_entry(test, index, order);
 	xa_unlock_irq(xa);
 }
 
@@ -814,10 +853,12 @@ static unsigned long some_val = 0xdeadbeef;
 static unsigned long some_val_2 = 0xdeaddead;
 
 /* mimics the page cache usage */
-static noinline void check_xa_multi_store_adv(struct xarray *xa,
+static noinline void check_xa_multi_store_adv(struct kunit *test,
 					      unsigned long pos,
 					      unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned int nrpages = 1UL << order;
 	unsigned long index, base, next_index, next_next_index;
 	unsigned int i;
@@ -827,7 +868,7 @@ static noinline void check_xa_multi_store_adv(struct xarray *xa,
 	next_index = round_down(base + nrpages, nrpages);
 	next_next_index = round_down(next_index + nrpages, nrpages);
 
-	check_xa_multi_store_adv_add(xa, base, order, &some_val);
+	check_xa_multi_store_adv_add(test, base, order, &some_val);
 
 	for (i = 0; i < nrpages; i++)
 		XA_BUG_ON(xa, test_get_entry(xa, base + i) != &some_val);
@@ -835,20 +876,20 @@ static noinline void check_xa_multi_store_adv(struct xarray *xa,
 	XA_BUG_ON(xa, test_get_entry(xa, next_index) != NULL);
 
 	/* Use order 0 for the next item */
-	check_xa_multi_store_adv_add(xa, next_index, 0, &some_val_2);
+	check_xa_multi_store_adv_add(test, next_index, 0, &some_val_2);
 	XA_BUG_ON(xa, test_get_entry(xa, next_index) != &some_val_2);
 
 	/* Remove the next item */
-	check_xa_multi_store_adv_delete(xa, next_index, 0);
+	check_xa_multi_store_adv_delete(test, next_index, 0);
 
 	/* Now use order for a new pointer */
-	check_xa_multi_store_adv_add(xa, next_index, order, &some_val_2);
+	check_xa_multi_store_adv_add(test, next_index, order, &some_val_2);
 
 	for (i = 0; i < nrpages; i++)
 		XA_BUG_ON(xa, test_get_entry(xa, next_index + i) != &some_val_2);
 
-	check_xa_multi_store_adv_delete(xa, next_index, order);
-	check_xa_multi_store_adv_delete(xa, base, order);
+	check_xa_multi_store_adv_delete(test, next_index, order);
+	check_xa_multi_store_adv_delete(test, base, order);
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	/* starting fresh again */
@@ -856,7 +897,7 @@ static noinline void check_xa_multi_store_adv(struct xarray *xa,
 	/* let's test some holes now */
 
 	/* hole at base and next_next */
-	check_xa_multi_store_adv_add(xa, next_index, order, &some_val_2);
+	check_xa_multi_store_adv_add(test, next_index, order, &some_val_2);
 
 	for (i = 0; i < nrpages; i++)
 		XA_BUG_ON(xa, test_get_entry(xa, base + i) != NULL);
@@ -867,12 +908,12 @@ static noinline void check_xa_multi_store_adv(struct xarray *xa,
 	for (i = 0; i < nrpages; i++)
 		XA_BUG_ON(xa, test_get_entry(xa, next_next_index + i) != NULL);
 
-	check_xa_multi_store_adv_delete(xa, next_index, order);
+	check_xa_multi_store_adv_delete(test, next_index, order);
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	/* hole at base and next */
 
-	check_xa_multi_store_adv_add(xa, next_next_index, order, &some_val_2);
+	check_xa_multi_store_adv_add(test, next_next_index, order, &some_val_2);
 
 	for (i = 0; i < nrpages; i++)
 		XA_BUG_ON(xa, test_get_entry(xa, base + i) != NULL);
@@ -883,12 +924,12 @@ static noinline void check_xa_multi_store_adv(struct xarray *xa,
 	for (i = 0; i < nrpages; i++)
 		XA_BUG_ON(xa, test_get_entry(xa, next_next_index + i) != &some_val_2);
 
-	check_xa_multi_store_adv_delete(xa, next_next_index, order);
+	check_xa_multi_store_adv_delete(test, next_next_index, order);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 #endif
 
-static noinline void check_multi_store_advanced(struct xarray *xa)
+static noinline void check_multi_store_advanced(struct kunit *test)
 {
 #ifdef CONFIG_XARRAY_MULTI
 	unsigned int max_order = IS_ENABLED(CONFIG_XARRAY_MULTI) ? 20 : 1;
@@ -900,59 +941,59 @@ static noinline void check_multi_store_advanced(struct xarray *xa)
 	 */
 	for (pos = 7; pos < end; pos = (pos * pos) + 564) {
 		for (i = 0; i < max_order; i++) {
-			check_xa_multi_store_adv(xa, pos, i);
-			check_xa_multi_store_adv(xa, pos + 157, i);
+			check_xa_multi_store_adv(test, pos, i);
+			check_xa_multi_store_adv(test, pos + 157, i);
 		}
 	}
 #endif
 }
 
-static noinline void check_xa_alloc_1(struct xarray *xa, unsigned int base)
+static noinline void check_xa_alloc_1(struct kunit *test, struct xarray *xa, unsigned int base)
 {
 	int i;
 	u32 id;
 
 	XA_BUG_ON(xa, !xa_empty(xa));
 	/* An empty array should assign %base to the first alloc */
-	xa_alloc_index(xa, base, GFP_KERNEL);
+	xa_alloc_index(test, xa, base, GFP_KERNEL);
 
 	/* Erasing it should make the array empty again */
-	xa_erase_index(xa, base);
+	xa_erase_index(test, xa, base);
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	/* And it should assign %base again */
-	xa_alloc_index(xa, base, GFP_KERNEL);
+	xa_alloc_index(test, xa, base, GFP_KERNEL);
 
 	/* Allocating and then erasing a lot should not lose base */
 	for (i = base + 1; i < 2 * XA_CHUNK_SIZE; i++)
-		xa_alloc_index(xa, i, GFP_KERNEL);
+		xa_alloc_index(test, xa, i, GFP_KERNEL);
 	for (i = base; i < 2 * XA_CHUNK_SIZE; i++)
-		xa_erase_index(xa, i);
-	xa_alloc_index(xa, base, GFP_KERNEL);
+		xa_erase_index(test, xa, i);
+	xa_alloc_index(test, xa, base, GFP_KERNEL);
 
 	/* Destroying the array should do the same as erasing */
 	xa_destroy(xa);
 
 	/* And it should assign %base again */
-	xa_alloc_index(xa, base, GFP_KERNEL);
+	xa_alloc_index(test, xa, base, GFP_KERNEL);
 
 	/* The next assigned ID should be base+1 */
-	xa_alloc_index(xa, base + 1, GFP_KERNEL);
-	xa_erase_index(xa, base + 1);
+	xa_alloc_index(test, xa, base + 1, GFP_KERNEL);
+	xa_erase_index(test, xa, base + 1);
 
 	/* Storing a value should mark it used */
 	xa_store_index(xa, base + 1, GFP_KERNEL);
-	xa_alloc_index(xa, base + 2, GFP_KERNEL);
+	xa_alloc_index(test, xa, base + 2, GFP_KERNEL);
 
 	/* If we then erase base, it should be free */
-	xa_erase_index(xa, base);
-	xa_alloc_index(xa, base, GFP_KERNEL);
+	xa_erase_index(test, xa, base);
+	xa_alloc_index(test, xa, base, GFP_KERNEL);
 
-	xa_erase_index(xa, base + 1);
-	xa_erase_index(xa, base + 2);
+	xa_erase_index(test, xa, base + 1);
+	xa_erase_index(test, xa, base + 2);
 
 	for (i = 1; i < 5000; i++) {
-		xa_alloc_index(xa, base + i, GFP_KERNEL);
+		xa_alloc_index(test, xa, base + i, GFP_KERNEL);
 	}
 
 	xa_destroy(xa);
@@ -978,11 +1019,11 @@ static noinline void check_xa_alloc_1(struct xarray *xa, unsigned int base)
 	XA_BUG_ON(xa, xa_store_index(xa, 3, GFP_KERNEL) != 0);
 	XA_BUG_ON(xa, xa_alloc(xa, &id, xa_mk_index(10), XA_LIMIT(10, 5),
 				GFP_KERNEL) != -EBUSY);
-	xa_erase_index(xa, 3);
+	xa_erase_index(test, xa, 3);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_xa_alloc_2(struct xarray *xa, unsigned int base)
+static noinline void check_xa_alloc_2(struct kunit *test, struct xarray *xa, unsigned int base)
 {
 	unsigned int i, id;
 	unsigned long index;
@@ -1018,7 +1059,7 @@ static noinline void check_xa_alloc_2(struct xarray *xa, unsigned int base)
 	XA_BUG_ON(xa, id != 5);
 
 	xa_for_each(xa, index, entry) {
-		xa_erase_index(xa, index);
+		xa_erase_index(test, xa, index);
 	}
 
 	for (i = base; i < base + 9; i++) {
@@ -1033,7 +1074,7 @@ static noinline void check_xa_alloc_2(struct xarray *xa, unsigned int base)
 	xa_destroy(xa);
 }
 
-static noinline void check_xa_alloc_3(struct xarray *xa, unsigned int base)
+static noinline void check_xa_alloc_3(struct kunit *test, struct xarray *xa, unsigned int base)
 {
 	struct xa_limit limit = XA_LIMIT(1, 0x3fff);
 	u32 next = 0;
@@ -1049,8 +1090,8 @@ static noinline void check_xa_alloc_3(struct xarray *xa, unsigned int base)
 	XA_BUG_ON(xa, xa_alloc_cyclic(xa, &id, xa_mk_index(0x3ffd), limit,
 				&next, GFP_KERNEL) != 0);
 	XA_BUG_ON(xa, id != 0x3ffd);
-	xa_erase_index(xa, 0x3ffd);
-	xa_erase_index(xa, 1);
+	xa_erase_index(test, xa, 0x3ffd);
+	xa_erase_index(test, xa, 1);
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	for (i = 0x3ffe; i < 0x4003; i++) {
@@ -1065,8 +1106,8 @@ static noinline void check_xa_alloc_3(struct xarray *xa, unsigned int base)
 
 	/* Check wrap-around is handled correctly */
 	if (base != 0)
-		xa_erase_index(xa, base);
-	xa_erase_index(xa, base + 1);
+		xa_erase_index(test, xa, base);
+	xa_erase_index(test, xa, base + 1);
 	next = UINT_MAX;
 	XA_BUG_ON(xa, xa_alloc_cyclic(xa, &id, xa_mk_index(UINT_MAX),
 				xa_limit_32b, &next, GFP_KERNEL) != 0);
@@ -1079,7 +1120,7 @@ static noinline void check_xa_alloc_3(struct xarray *xa, unsigned int base)
 	XA_BUG_ON(xa, id != base + 1);
 
 	xa_for_each(xa, index, entry)
-		xa_erase_index(xa, index);
+		xa_erase_index(test, xa, index);
 
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
@@ -1087,19 +1128,21 @@ static noinline void check_xa_alloc_3(struct xarray *xa, unsigned int base)
 static DEFINE_XARRAY_ALLOC(xa0);
 static DEFINE_XARRAY_ALLOC1(xa1);
 
-static noinline void check_xa_alloc(void)
+static noinline void check_xa_alloc(struct kunit *test)
 {
-	check_xa_alloc_1(&xa0, 0);
-	check_xa_alloc_1(&xa1, 1);
-	check_xa_alloc_2(&xa0, 0);
-	check_xa_alloc_2(&xa1, 1);
-	check_xa_alloc_3(&xa0, 0);
-	check_xa_alloc_3(&xa1, 1);
+	check_xa_alloc_1(test, &xa0, 0);
+	check_xa_alloc_1(test, &xa1, 1);
+	check_xa_alloc_2(test, &xa0, 0);
+	check_xa_alloc_2(test, &xa1, 1);
+	check_xa_alloc_3(test, &xa0, 0);
+	check_xa_alloc_3(test, &xa1, 1);
 }
 
-static noinline void __check_store_iter(struct xarray *xa, unsigned long start,
+static noinline void __check_store_iter(struct kunit *test, unsigned long start,
 			unsigned int order, unsigned int present)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE_ORDER(xas, xa, start, order);
 	void *entry;
 	unsigned int count = 0;
@@ -1123,50 +1166,54 @@ static noinline void __check_store_iter(struct xarray *xa, unsigned long start,
 	XA_BUG_ON(xa, xa_load(xa, start) != xa_mk_index(start));
 	XA_BUG_ON(xa, xa_load(xa, start + (1UL << order) - 1) !=
 			xa_mk_index(start));
-	xa_erase_index(xa, start);
+	xa_erase_index(test, xa, start);
 }
 
-static noinline void check_store_iter(struct xarray *xa)
+static noinline void check_store_iter(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned int i, j;
 	unsigned int max_order = IS_ENABLED(CONFIG_XARRAY_MULTI) ? 20 : 1;
 
 	for (i = 0; i < max_order; i++) {
 		unsigned int min = 1 << i;
 		unsigned int max = (2 << i) - 1;
-		__check_store_iter(xa, 0, i, 0);
+		__check_store_iter(test, 0, i, 0);
 		XA_BUG_ON(xa, !xa_empty(xa));
-		__check_store_iter(xa, min, i, 0);
+		__check_store_iter(test, min, i, 0);
 		XA_BUG_ON(xa, !xa_empty(xa));
 
 		xa_store_index(xa, min, GFP_KERNEL);
-		__check_store_iter(xa, min, i, 1);
+		__check_store_iter(test, min, i, 1);
 		XA_BUG_ON(xa, !xa_empty(xa));
 		xa_store_index(xa, max, GFP_KERNEL);
-		__check_store_iter(xa, min, i, 1);
+		__check_store_iter(test, min, i, 1);
 		XA_BUG_ON(xa, !xa_empty(xa));
 
 		for (j = 0; j < min; j++)
 			xa_store_index(xa, j, GFP_KERNEL);
-		__check_store_iter(xa, 0, i, min);
+		__check_store_iter(test, 0, i, min);
 		XA_BUG_ON(xa, !xa_empty(xa));
 		for (j = 0; j < min; j++)
 			xa_store_index(xa, min + j, GFP_KERNEL);
-		__check_store_iter(xa, min, i, min);
+		__check_store_iter(test, min, i, min);
 		XA_BUG_ON(xa, !xa_empty(xa));
 	}
 #ifdef CONFIG_XARRAY_MULTI
 	xa_store_index(xa, 63, GFP_KERNEL);
 	xa_store_index(xa, 65, GFP_KERNEL);
-	__check_store_iter(xa, 64, 2, 1);
-	xa_erase_index(xa, 63);
+	__check_store_iter(test, 64, 2, 1);
+	xa_erase_index(test, xa, 63);
 #endif
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_multi_find_1(struct xarray *xa, unsigned order)
+static noinline void check_multi_find_1(struct kunit *test, unsigned int order)
 {
 #ifdef CONFIG_XARRAY_MULTI
+	struct xarray *xa = xa_param(test);
+
 	unsigned long multi = 3 << order;
 	unsigned long next = 4 << order;
 	unsigned long index;
@@ -1189,15 +1236,17 @@ static noinline void check_multi_find_1(struct xarray *xa, unsigned order)
 	XA_BUG_ON(xa, xa_find_after(xa, &index, next, XA_PRESENT) != NULL);
 	XA_BUG_ON(xa, index != next);
 
-	xa_erase_index(xa, multi);
-	xa_erase_index(xa, next);
-	xa_erase_index(xa, next + 1);
+	xa_erase_index(test, xa, multi);
+	xa_erase_index(test, xa, next);
+	xa_erase_index(test, xa, next + 1);
 	XA_BUG_ON(xa, !xa_empty(xa));
 #endif
 }
 
-static noinline void check_multi_find_2(struct xarray *xa)
+static noinline void check_multi_find_2(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned int max_order = IS_ENABLED(CONFIG_XARRAY_MULTI) ? 10 : 1;
 	unsigned int i, j;
 	void *entry;
@@ -1211,17 +1260,19 @@ static noinline void check_multi_find_2(struct xarray *xa)
 					GFP_KERNEL);
 			rcu_read_lock();
 			xas_for_each(&xas, entry, ULONG_MAX) {
-				xa_erase_index(xa, index);
+				xa_erase_index(test, xa, index);
 			}
 			rcu_read_unlock();
-			xa_erase_index(xa, index - 1);
+			xa_erase_index(test, xa, index - 1);
 			XA_BUG_ON(xa, !xa_empty(xa));
 		}
 	}
 }
 
-static noinline void check_multi_find_3(struct xarray *xa)
+static noinline void check_multi_find_3(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned int order;
 
 	for (order = 5; order < order_limit; order++) {
@@ -1230,12 +1281,14 @@ static noinline void check_multi_find_3(struct xarray *xa)
 		XA_BUG_ON(xa, !xa_empty(xa));
 		xa_store_order(xa, 0, order - 4, xa_mk_index(0), GFP_KERNEL);
 		XA_BUG_ON(xa, xa_find_after(xa, &index, ULONG_MAX, XA_PRESENT));
-		xa_erase_index(xa, 0);
+		xa_erase_index(test, xa, 0);
 	}
 }
 
-static noinline void check_find_1(struct xarray *xa)
+static noinline void check_find_1(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned long i, j, k;
 
 	XA_BUG_ON(xa, !xa_empty(xa));
@@ -1272,18 +1325,20 @@ static noinline void check_find_1(struct xarray *xa)
 				else
 					XA_BUG_ON(xa, entry != NULL);
 			}
-			xa_erase_index(xa, j);
+			xa_erase_index(test, xa, j);
 			XA_BUG_ON(xa, xa_get_mark(xa, j, XA_MARK_0));
 			XA_BUG_ON(xa, !xa_get_mark(xa, i, XA_MARK_0));
 		}
-		xa_erase_index(xa, i);
+		xa_erase_index(test, xa, i);
 		XA_BUG_ON(xa, xa_get_mark(xa, i, XA_MARK_0));
 	}
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_find_2(struct xarray *xa)
+static noinline void check_find_2(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	void *entry;
 	unsigned long i, j, index;
 
@@ -1303,8 +1358,10 @@ static noinline void check_find_2(struct xarray *xa)
 	xa_destroy(xa);
 }
 
-static noinline void check_find_3(struct xarray *xa)
+static noinline void check_find_3(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 	unsigned long i, j, k;
 	void *entry;
@@ -1328,8 +1385,10 @@ static noinline void check_find_3(struct xarray *xa)
 	xa_destroy(xa);
 }
 
-static noinline void check_find_4(struct xarray *xa)
+static noinline void check_find_4(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned long index = 0;
 	void *entry;
 
@@ -1341,22 +1400,22 @@ static noinline void check_find_4(struct xarray *xa)
 	entry = xa_find_after(xa, &index, ULONG_MAX, XA_PRESENT);
 	XA_BUG_ON(xa, entry);
 
-	xa_erase_index(xa, ULONG_MAX);
+	xa_erase_index(test, xa, ULONG_MAX);
 }
 
-static noinline void check_find(struct xarray *xa)
+static noinline void check_find(struct kunit *test)
 {
 	unsigned i;
 
-	check_find_1(xa);
-	check_find_2(xa);
-	check_find_3(xa);
-	check_find_4(xa);
+	check_find_1(test);
+	check_find_2(test);
+	check_find_3(test);
+	check_find_4(test);
 
 	for (i = 2; i < 10; i++)
-		check_multi_find_1(xa, i);
-	check_multi_find_2(xa);
-	check_multi_find_3(xa);
+		check_multi_find_1(test, i);
+	check_multi_find_2(test);
+	check_multi_find_3(test);
 }
 
 /* See find_swap_entry() in mm/shmem.c */
@@ -1382,8 +1441,10 @@ static noinline unsigned long xa_find_entry(struct xarray *xa, void *item)
 	return entry ? xas.xa_index : -1;
 }
 
-static noinline void check_find_entry(struct xarray *xa)
+static noinline void check_find_entry(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 #ifdef CONFIG_XARRAY_MULTI
 	unsigned int order;
 	unsigned long offset, index;
@@ -1410,12 +1471,14 @@ static noinline void check_find_entry(struct xarray *xa)
 	xa_store_index(xa, ULONG_MAX, GFP_KERNEL);
 	XA_BUG_ON(xa, xa_find_entry(xa, xa) != -1);
 	XA_BUG_ON(xa, xa_find_entry(xa, xa_mk_index(ULONG_MAX)) != -1);
-	xa_erase_index(xa, ULONG_MAX);
+	xa_erase_index(test, xa, ULONG_MAX);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_pause(struct xarray *xa)
+static noinline void check_pause(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 	void *entry;
 	unsigned int order;
@@ -1450,8 +1513,10 @@ static noinline void check_pause(struct xarray *xa)
 	xa_destroy(xa);
 }
 
-static noinline void check_move_tiny(struct xarray *xa)
+static noinline void check_move_tiny(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 
 	XA_BUG_ON(xa, !xa_empty(xa));
@@ -1468,12 +1533,14 @@ static noinline void check_move_tiny(struct xarray *xa)
 	XA_BUG_ON(xa, xas_prev(&xas) != xa_mk_index(0));
 	XA_BUG_ON(xa, xas_prev(&xas) != NULL);
 	rcu_read_unlock();
-	xa_erase_index(xa, 0);
+	xa_erase_index(test, xa, 0);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_move_max(struct xarray *xa)
+static noinline void check_move_max(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 
 	xa_store_index(xa, ULONG_MAX, GFP_KERNEL);
@@ -1489,12 +1556,14 @@ static noinline void check_move_max(struct xarray *xa)
 	XA_BUG_ON(xa, xas_find(&xas, ULONG_MAX) != NULL);
 	rcu_read_unlock();
 
-	xa_erase_index(xa, ULONG_MAX);
+	xa_erase_index(test, xa, ULONG_MAX);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_move_small(struct xarray *xa, unsigned long idx)
+static noinline void check_move_small(struct kunit *test, unsigned long idx)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 	unsigned long i;
 
@@ -1536,13 +1605,15 @@ static noinline void check_move_small(struct xarray *xa, unsigned long idx)
 	XA_BUG_ON(xa, xas.xa_index != ULONG_MAX);
 	rcu_read_unlock();
 
-	xa_erase_index(xa, 0);
-	xa_erase_index(xa, idx);
+	xa_erase_index(test, xa, 0);
+	xa_erase_index(test, xa, idx);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_move(struct xarray *xa)
+static noinline void check_move(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, (1 << 16) - 1);
 	unsigned long i;
 
@@ -1569,7 +1640,7 @@ static noinline void check_move(struct xarray *xa)
 	rcu_read_unlock();
 
 	for (i = (1 << 8); i < (1 << 15); i++)
-		xa_erase_index(xa, i);
+		xa_erase_index(test, xa, i);
 
 	i = xas.xa_index;
 
@@ -1600,17 +1671,17 @@ static noinline void check_move(struct xarray *xa)
 
 	xa_destroy(xa);
 
-	check_move_tiny(xa);
-	check_move_max(xa);
+	check_move_tiny(test);
+	check_move_max(test);
 
 	for (i = 0; i < 16; i++)
-		check_move_small(xa, 1UL << i);
+		check_move_small(test, 1UL << i);
 
 	for (i = 2; i < 16; i++)
-		check_move_small(xa, (1UL << i) - 1);
+		check_move_small(test, (1UL << i) - 1);
 }
 
-static noinline void xa_store_many_order(struct xarray *xa,
+static noinline void xa_store_many_order(struct kunit *test, struct xarray *xa,
 		unsigned long index, unsigned order)
 {
 	XA_STATE_ORDER(xas, xa, index, order);
@@ -1633,30 +1704,34 @@ static noinline void xa_store_many_order(struct xarray *xa,
 	XA_BUG_ON(xa, xas_error(&xas));
 }
 
-static noinline void check_create_range_1(struct xarray *xa,
+static noinline void check_create_range_1(struct kunit *test,
 		unsigned long index, unsigned order)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned long i;
 
-	xa_store_many_order(xa, index, order);
+	xa_store_many_order(test, xa, index, order);
 	for (i = index; i < index + (1UL << order); i++)
-		xa_erase_index(xa, i);
+		xa_erase_index(test, xa, i);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_create_range_2(struct xarray *xa, unsigned order)
+static noinline void check_create_range_2(struct kunit *test, unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned long i;
 	unsigned long nr = 1UL << order;
 
 	for (i = 0; i < nr * nr; i += nr)
-		xa_store_many_order(xa, i, order);
+		xa_store_many_order(test, xa, i, order);
 	for (i = 0; i < nr * nr; i++)
-		xa_erase_index(xa, i);
+		xa_erase_index(test, xa, i);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_create_range_3(void)
+static noinline void check_create_range_3(struct kunit *test)
 {
 	XA_STATE(xas, NULL, 0);
 	xas_set_err(&xas, -EEXIST);
@@ -1664,9 +1739,11 @@ static noinline void check_create_range_3(void)
 	XA_BUG_ON(NULL, xas_error(&xas) != -EEXIST);
 }
 
-static noinline void check_create_range_4(struct xarray *xa,
+static noinline void check_create_range_4(struct kunit *test,
 		unsigned long index, unsigned order)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE_ORDER(xas, xa, index, order);
 	unsigned long base = xas.xa_index;
 	unsigned long i = 0;
@@ -1692,13 +1769,15 @@ static noinline void check_create_range_4(struct xarray *xa,
 	XA_BUG_ON(xa, xas_error(&xas));
 
 	for (i = base; i < base + (1UL << order); i++)
-		xa_erase_index(xa, i);
+		xa_erase_index(test, xa, i);
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_create_range_5(struct xarray *xa,
+static noinline void check_create_range_5(struct kunit *test,
 		unsigned long index, unsigned int order)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE_ORDER(xas, xa, index, order);
 	unsigned int i;
 
@@ -1715,44 +1794,46 @@ static noinline void check_create_range_5(struct xarray *xa,
 	xa_destroy(xa);
 }
 
-static noinline void check_create_range(struct xarray *xa)
+static noinline void check_create_range(struct kunit *test)
 {
 	unsigned int order;
 	unsigned int max_order = IS_ENABLED(CONFIG_XARRAY_MULTI) ? 12 : 1;
 
 	for (order = 0; order < max_order; order++) {
-		check_create_range_1(xa, 0, order);
-		check_create_range_1(xa, 1U << order, order);
-		check_create_range_1(xa, 2U << order, order);
-		check_create_range_1(xa, 3U << order, order);
-		check_create_range_1(xa, 1U << 24, order);
+		check_create_range_1(test, 0, order);
+		check_create_range_1(test, 1U << order, order);
+		check_create_range_1(test, 2U << order, order);
+		check_create_range_1(test, 3U << order, order);
+		check_create_range_1(test, 1U << 24, order);
 		if (order < 10)
-			check_create_range_2(xa, order);
-
-		check_create_range_4(xa, 0, order);
-		check_create_range_4(xa, 1U << order, order);
-		check_create_range_4(xa, 2U << order, order);
-		check_create_range_4(xa, 3U << order, order);
-		check_create_range_4(xa, 1U << 24, order);
-
-		check_create_range_4(xa, 1, order);
-		check_create_range_4(xa, (1U << order) + 1, order);
-		check_create_range_4(xa, (2U << order) + 1, order);
-		check_create_range_4(xa, (2U << order) - 1, order);
-		check_create_range_4(xa, (3U << order) + 1, order);
-		check_create_range_4(xa, (3U << order) - 1, order);
-		check_create_range_4(xa, (1U << 24) + 1, order);
-
-		check_create_range_5(xa, 0, order);
-		check_create_range_5(xa, (1U << order), order);
+			check_create_range_2(test, order);
+
+		check_create_range_4(test, 0, order);
+		check_create_range_4(test, 1U << order, order);
+		check_create_range_4(test, 2U << order, order);
+		check_create_range_4(test, 3U << order, order);
+		check_create_range_4(test, 1U << 24, order);
+
+		check_create_range_4(test, 1, order);
+		check_create_range_4(test, (1U << order) + 1, order);
+		check_create_range_4(test, (2U << order) + 1, order);
+		check_create_range_4(test, (2U << order) - 1, order);
+		check_create_range_4(test, (3U << order) + 1, order);
+		check_create_range_4(test, (3U << order) - 1, order);
+		check_create_range_4(test, (1U << 24) + 1, order);
+
+		check_create_range_5(test, 0, order);
+		check_create_range_5(test, (1U << order), order);
 	}
 
-	check_create_range_3();
+	check_create_range_3(test);
 }
 
-static noinline void __check_store_range(struct xarray *xa, unsigned long first,
+static noinline void __check_store_range(struct kunit *test, unsigned long first,
 		unsigned long last)
 {
+	struct xarray *xa = xa_param(test);
+
 #ifdef CONFIG_XARRAY_MULTI
 	xa_store_range(xa, first, last, xa_mk_index(first), GFP_KERNEL);
 
@@ -1767,26 +1848,28 @@ static noinline void __check_store_range(struct xarray *xa, unsigned long first,
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_store_range(struct xarray *xa)
+static noinline void check_store_range(struct kunit *test)
 {
 	unsigned long i, j;
 
 	for (i = 0; i < 128; i++) {
 		for (j = i; j < 128; j++) {
-			__check_store_range(xa, i, j);
-			__check_store_range(xa, 128 + i, 128 + j);
-			__check_store_range(xa, 4095 + i, 4095 + j);
-			__check_store_range(xa, 4096 + i, 4096 + j);
-			__check_store_range(xa, 123456 + i, 123456 + j);
-			__check_store_range(xa, (1 << 24) + i, (1 << 24) + j);
+			__check_store_range(test, i, j);
+			__check_store_range(test, 128 + i, 128 + j);
+			__check_store_range(test, 4095 + i, 4095 + j);
+			__check_store_range(test, 4096 + i, 4096 + j);
+			__check_store_range(test, 123456 + i, 123456 + j);
+			__check_store_range(test, (1 << 24) + i, (1 << 24) + j);
 		}
 	}
 }
 
 #ifdef CONFIG_XARRAY_MULTI
-static void check_split_1(struct xarray *xa, unsigned long index,
+static void check_split_1(struct kunit *test, unsigned long index,
 				unsigned int order, unsigned int new_order)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE_ORDER(xas, xa, index, new_order);
 	unsigned int i, found;
 	void *entry;
@@ -1822,26 +1905,30 @@ static void check_split_1(struct xarray *xa, unsigned long index,
 	xa_destroy(xa);
 }
 
-static noinline void check_split(struct xarray *xa)
+static noinline void check_split(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned int order, new_order;
 
 	XA_BUG_ON(xa, !xa_empty(xa));
 
 	for (order = 1; order < 2 * XA_CHUNK_SHIFT; order++) {
 		for (new_order = 0; new_order < order; new_order++) {
-			check_split_1(xa, 0, order, new_order);
-			check_split_1(xa, 1UL << order, order, new_order);
-			check_split_1(xa, 3UL << order, order, new_order);
+			check_split_1(test, 0, order, new_order);
+			check_split_1(test, 1UL << order, order, new_order);
+			check_split_1(test, 3UL << order, order, new_order);
 		}
 	}
 }
 #else
-static void check_split(struct xarray *xa) { }
+static void check_split(struct kunit *test) { }
 #endif
 
-static void check_align_1(struct xarray *xa, char *name)
+static void check_align_1(struct kunit *test, char *name)
 {
+	struct xarray *xa = xa_param(test);
+
 	int i;
 	unsigned int id;
 	unsigned long index;
@@ -1861,8 +1948,10 @@ static void check_align_1(struct xarray *xa, char *name)
  * We should always be able to store without allocating memory after
  * reserving a slot.
  */
-static void check_align_2(struct xarray *xa, char *name)
+static void check_align_2(struct kunit *test, char *name)
 {
+	struct xarray *xa = xa_param(test);
+
 	int i;
 
 	XA_BUG_ON(xa, !xa_empty(xa));
@@ -1881,15 +1970,15 @@ static void check_align_2(struct xarray *xa, char *name)
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
 
-static noinline void check_align(struct xarray *xa)
+static noinline void check_align(struct kunit *test)
 {
 	char name[] = "Motorola 68000";
 
-	check_align_1(xa, name);
-	check_align_1(xa, name + 1);
-	check_align_1(xa, name + 2);
-	check_align_1(xa, name + 3);
-	check_align_2(xa, name);
+	check_align_1(test, name);
+	check_align_1(test, name + 1);
+	check_align_1(test, name + 2);
+	check_align_1(test, name + 3);
+	check_align_2(test, name);
 }
 
 static LIST_HEAD(shadow_nodes);
@@ -1905,7 +1994,7 @@ static void test_update_node(struct xa_node *node)
 	}
 }
 
-static noinline void shadow_remove(struct xarray *xa)
+static noinline void shadow_remove(struct kunit *test, struct xarray *xa)
 {
 	struct xa_node *node;
 
@@ -1919,8 +2008,17 @@ static noinline void shadow_remove(struct xarray *xa)
 	xa_unlock(xa);
 }
 
-static noinline void check_workingset(struct xarray *xa, unsigned long index)
+struct workingset_testcase {
+	struct xarray *xa;
+	unsigned long index;
+};
+
+static noinline void check_workingset(struct kunit *test)
 {
+	struct workingset_testcase tc = *(struct workingset_testcase *)test->param_value;
+	struct xarray *xa = tc.xa;
+	unsigned long index = tc.index;
+
 	XA_STATE(xas, xa, index);
 	xas_set_update(&xas, test_update_node);
 
@@ -1943,7 +2041,7 @@ static noinline void check_workingset(struct xarray *xa, unsigned long index)
 	xas_unlock(&xas);
 	XA_BUG_ON(xa, list_empty(&shadow_nodes));
 
-	shadow_remove(xa);
+	shadow_remove(test, xa);
 	XA_BUG_ON(xa, !list_empty(&shadow_nodes));
 	XA_BUG_ON(xa, !xa_empty(xa));
 }
@@ -1952,9 +2050,11 @@ static noinline void check_workingset(struct xarray *xa, unsigned long index)
  * Check that the pointer / value / sibling entries are accounted the
  * way we expect them to be.
  */
-static noinline void check_account(struct xarray *xa)
+static noinline void check_account(struct kunit *test)
 {
 #ifdef CONFIG_XARRAY_MULTI
+	struct xarray *xa = xa_param(test);
+
 	unsigned int order;
 
 	for (order = 1; order < 12; order++) {
@@ -1981,8 +2081,10 @@ static noinline void check_account(struct xarray *xa)
 #endif
 }
 
-static noinline void check_get_order(struct xarray *xa)
+static noinline void check_get_order(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned int max_order = IS_ENABLED(CONFIG_XARRAY_MULTI) ? 20 : 1;
 	unsigned int order;
 	unsigned long i, j;
@@ -2001,8 +2103,10 @@ static noinline void check_get_order(struct xarray *xa)
 	}
 }
 
-static noinline void check_xas_get_order(struct xarray *xa)
+static noinline void check_xas_get_order(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 
 	unsigned int max_order = IS_ENABLED(CONFIG_XARRAY_MULTI) ? 20 : 1;
@@ -2034,8 +2138,10 @@ static noinline void check_xas_get_order(struct xarray *xa)
 	}
 }
 
-static noinline void check_xas_conflict_get_order(struct xarray *xa)
+static noinline void check_xas_conflict_get_order(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	XA_STATE(xas, xa, 0);
 
 	void *entry;
@@ -2092,8 +2198,10 @@ static noinline void check_xas_conflict_get_order(struct xarray *xa)
 }
 
 
-static noinline void check_destroy(struct xarray *xa)
+static noinline void check_destroy(struct kunit *test)
 {
+	struct xarray *xa = xa_param(test);
+
 	unsigned long index;
 
 	XA_BUG_ON(xa, !xa_empty(xa));
@@ -2126,52 +2234,59 @@ static noinline void check_destroy(struct xarray *xa)
 }
 
 static DEFINE_XARRAY(array);
+static struct xarray *arrays[] = { &array };
+KUNIT_ARRAY_PARAM(array, arrays, NULL);
+
+static struct xarray *xa0s[] = { &xa0 };
+KUNIT_ARRAY_PARAM(xa0, xa0s, NULL);
+
+static struct workingset_testcase workingset_testcases[] = {
+	{ &array, 0 },
+	{ &array, 64 },
+	{ &array, 4096 },
+};
+KUNIT_ARRAY_PARAM(workingset, workingset_testcases, NULL);
+
+static struct kunit_case xarray_cases[] = {
+	KUNIT_CASE_PARAM(check_xa_err, array_gen_params),
+	KUNIT_CASE_PARAM(check_xas_retry, array_gen_params),
+	KUNIT_CASE_PARAM(check_xa_load, array_gen_params),
+	KUNIT_CASE_PARAM(check_xa_mark, array_gen_params),
+	KUNIT_CASE_PARAM(check_xa_shrink, array_gen_params),
+	KUNIT_CASE_PARAM(check_xas_erase, array_gen_params),
+	KUNIT_CASE_PARAM(check_insert, array_gen_params),
+	KUNIT_CASE_PARAM(check_cmpxchg, array_gen_params),
+	KUNIT_CASE_PARAM(check_cmpxchg_order, array_gen_params),
+	KUNIT_CASE_PARAM(check_reserve, array_gen_params),
+	KUNIT_CASE_PARAM(check_reserve, xa0_gen_params),
+	KUNIT_CASE_PARAM(check_multi_store, array_gen_params),
+	KUNIT_CASE_PARAM(check_multi_store_advanced, array_gen_params),
+	KUNIT_CASE_PARAM(check_get_order, array_gen_params),
+	KUNIT_CASE_PARAM(check_xas_get_order, array_gen_params),
+	KUNIT_CASE_PARAM(check_xas_conflict_get_order, array_gen_params),
+	KUNIT_CASE(check_xa_alloc),
+	KUNIT_CASE_PARAM(check_find, array_gen_params),
+	KUNIT_CASE_PARAM(check_find_entry, array_gen_params),
+	KUNIT_CASE_PARAM(check_pause, array_gen_params),
+	KUNIT_CASE_PARAM(check_account, array_gen_params),
+	KUNIT_CASE_PARAM(check_destroy, array_gen_params),
+	KUNIT_CASE_PARAM(check_move, array_gen_params),
+	KUNIT_CASE_PARAM(check_create_range, array_gen_params),
+	KUNIT_CASE_PARAM(check_store_range, array_gen_params),
+	KUNIT_CASE_PARAM(check_store_iter, array_gen_params),
+	KUNIT_CASE_PARAM(check_align, xa0_gen_params),
+	KUNIT_CASE_PARAM(check_split, array_gen_params),
+	KUNIT_CASE_PARAM(check_workingset, workingset_gen_params),
+	{},
+};
+
+static struct kunit_suite xarray_suite = {
+	.name = "xarray",
+	.test_cases = xarray_cases,
+};
+
+kunit_test_suite(xarray_suite);
 
-static int xarray_checks(void)
-{
-	check_xa_err(&array);
-	check_xas_retry(&array);
-	check_xa_load(&array);
-	check_xa_mark(&array);
-	check_xa_shrink(&array);
-	check_xas_erase(&array);
-	check_insert(&array);
-	check_cmpxchg(&array);
-	check_cmpxchg_order(&array);
-	check_reserve(&array);
-	check_reserve(&xa0);
-	check_multi_store(&array);
-	check_multi_store_advanced(&array);
-	check_get_order(&array);
-	check_xas_get_order(&array);
-	check_xas_conflict_get_order(&array);
-	check_xa_alloc();
-	check_find(&array);
-	check_find_entry(&array);
-	check_pause(&array);
-	check_account(&array);
-	check_destroy(&array);
-	check_move(&array);
-	check_create_range(&array);
-	check_store_range(&array);
-	check_store_iter(&array);
-	check_align(&xa0);
-	check_split(&array);
-
-	check_workingset(&array, 0);
-	check_workingset(&array, 64);
-	check_workingset(&array, 4096);
-
-	printk("XArray: %u of %u tests passed\n", tests_passed, tests_run);
-	return (tests_run == tests_passed) ? 0 : -EINVAL;
-}
-
-static void xarray_exit(void)
-{
-}
-
-module_init(xarray_checks);
-module_exit(xarray_exit);
 MODULE_AUTHOR("Matthew Wilcox <willy@infradead.org>");
 MODULE_DESCRIPTION("XArray API test module");
 MODULE_LICENSE("GPL");

---
base-commit: ac0019f46558a127f874d0c602686af7ae498773
change-id: 20241204-xarray-kunit-port-87e6161bc1ab

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


