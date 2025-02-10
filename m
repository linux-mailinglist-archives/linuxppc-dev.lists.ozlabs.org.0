Return-Path: <linuxppc-dev+bounces-6044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F990A2F6D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 19:23:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsCcx6zMgz306l;
	Tue, 11 Feb 2025 05:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739211809;
	cv=none; b=V3Xg5Hv9CQsZOZPlLv8E8WcnVHpLo9SLnHrY9pMGCS6UnLljxaCmPEqCAGeXnr+Z7RliqKhGR0I61VuY+tvS/UdZgja8OeXPy53sRsU8kvoB0QX/xu8oXqdypmWw1FVTKOVXRXhyGzbhRfAnNZUoAvlwTcll2h1rk8NrW2+8i0q7N5JRgbGzqdlqlX35G5ULrZQ3sKZUXuoONdNo2dKnTLPntr+baB0JNkoz24vhtFEGRpHcJgI3dZnHhOxbEhwXShWivLx1oIffokXIaqpOaCU7l53e1G2oTkRjlGxQRTNFwyAuhfRKPuZx7ZBwiUq4QEQQWK90HYm9u+TTDyhBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739211809; c=relaxed/relaxed;
	bh=zywqNIFDXEwlE7hLyD+JRB5FcKOg2ioCGIncmY+HT84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WRMEspMcsHVjeUBSrsOR5awZomFaDNZb6ZQ0BOTXzutdwruW0cl/FnfMa3Xsgr5EGZA5XsmLCdGuJ6uegpHngsnh8Zgms7B10CfkMSos8Unj1JtQJaPFqtGBsiL1OxNAx/Y4oZjCvg7Ggb1l5E/Dv0Yus3Xz+l9BFlLkYxJzxCjff+hIk6j4egaWYFHCwfdIO2FNX9lNoJengJnPxQTY7fOT/ImE5BYKvUL7FykWRVTK+8wmMEjHLv5Qg1APz/VOnJKX4nROZplRID+RI9flnkek4P+L+O7sVCQKopJsOJI+la/eMmJBQLJi+ymirSWwU9BaxQagyervEpIE3mmb/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NGZV79Yd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NGZV79Yd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsCcw2Tl1z3054
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 05:23:27 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6d8e8445219so37832676d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739211804; x=1739816604; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zywqNIFDXEwlE7hLyD+JRB5FcKOg2ioCGIncmY+HT84=;
        b=NGZV79YdTOuD6SuwBGKM7M/+NBPzjH5KTbkkCDAWUJZ7lircAmnf3DKyIfrfyhrg73
         YS6n3M/T+YHaTeZU4qlps0fVA6gQ0CaUvcwCguBZXcsWt/viUuWqbfQZA6UMp3iNfx+n
         fKa0Us/j7inp6gde+YrlgQIeW7nfiwbXEeOLDrSoUtd3BpY8cUKBO+4YBOIlwYAIHlRB
         jYK25UInKouqnBMjNGOC42MXZ3vfQ0eo7/tXsMRaC8X+Es+iztcz90chKmHFGBHwE7/O
         LJiJWHbwRzjpWPh4DaSx6iPnBddWvEXv5PDwprzUA4+tler3DTzkt6WMlKFhoia6n+7e
         okSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211804; x=1739816604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zywqNIFDXEwlE7hLyD+JRB5FcKOg2ioCGIncmY+HT84=;
        b=JPsdkt25Wf/568r+sFdAflj/z9aVBRqqEPmLxQePFHH3JgeCHZfs6cgW/cmlzlKfn/
         i9vswZH3C9paZuW9Mt/tdSOkf7XWvzY/ndHkBNFKOeIe7r9wUhHdnK0xT6mtDJJSapV6
         d7CAZB1hr93h6adLqN+SNOEmm7oVO2YghT7uEmD41JcnXMUrT6wG8N23WD61DlElrV4e
         zQJEdEVfm2xnXzRiEY2B4CZBO1gj9ighnVYMv+DgZu7jvwLjP5U27Tb1a0QWUti2DWpI
         +KAwQ/t8WNnXSmrVO7BULomAJbtZ8omvqyVadoh0C7iHfnQszoU0fyKjzHn91zTklUqt
         +zKg==
X-Forwarded-Encrypted: i=1; AJvYcCXarXyBf0vj7iumShY+UOqFh1IIeCa8X9TNXLX2KOLlBmCqc5s97M+CSP1jQecTJny3+Kr6lF6IOzgv1ao=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlRyQTKruMTr0le4ih8DCsAPP417lkSfc5oHsew7Lu/HN0kVcY
	8veGnReQk4laq9azYiZDOa91toRT8j4QLCobqFYzwQ5+cEK5pIBV
X-Gm-Gg: ASbGnctQdVyF90xi2L86dE5fkp9+HFUQFiecAJ1L7X6AKwm31FvJ5tNZZUJ7q8G74qU
	tUUfV9CIedg+JvE5mqfhfMoJ4c7d39keqdBPYR4rK/hDKZb6UNkIgnIgwUOI0Dqwe/Ro0Z4vhL+
	21chIMwzuE1lKZORQfc2UYtCIhPm5yrOEhTtLSa6AnW9keA0u28YOQUR7wGN8S0pV1be3kku61j
	3D+2av1m3bXIBU+WifeTkexBaBzqQ+oogXGNMTHuSEQi0k9cWFSSM9L0VRdYXUDGf22Bt4zxKNg
	Lk69vFj+rcSKMcLbDs04xtMixPzuDRRH8VWS/nQgkYIwpmiDa0UO1Vt5S5zq25rRd8iu5YGti3k
	V9iJ2ojblJpP8I+ms23gjU7pq
X-Google-Smtp-Source: AGHT+IHJUbDxjdCsNNj+OQxZXpiKoN2yODdzK86kuSDraz80IM/wj9UOVb/ft5Ok46q9atDDV1Hi/g==
X-Received: by 2002:ad4:5dea:0:b0:6e4:29f5:b8b3 with SMTP id 6a1803df08f44-6e44562d887mr219755746d6.20.1739211804219;
        Mon, 10 Feb 2025 10:23:24 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e440d902d3sm45436456d6.7.2025.02.10.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:23:23 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v3 0/2] printf: convert self-test to KUnit
Date: Mon, 10 Feb 2025 13:23:21 -0500
Message-Id: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABlEqmcC/3XNTQ6CMBCG4auQrq1pp+UnrryHcVHKABO1JQUbD
 eHuFtyw0OX7JfPMzEYMhCM7ZTMLGGkk71KoQ8Zsb1yHnJrUDATkQirJh0Buavnt6Wji1ruIYeJ
 to4UEYwBtwdLpELCl18Zerql7Gicf3tuXKNf1C4LQv8EoueBoW1lXujC6wXP3MHQ/Wv9gKxhhj
 5R/EEiIyMsaVFWICtQeWZblA0B3Ep79AAAA
X-Change-ID: 20250131-printf-kunit-convert-fd4012aa2ec6
To: Arpitha Raghunandan <98.arpi@gmail.com>, 
 David Gow <davidgow@google.com>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is one of just 3 remaining "Test Module" kselftests (the others
being bitmap and scanf), the rest having been converted to KUnit.

I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf

I have also sent out a series converting scanf[0].

Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v3:
- Remove extraneous trailing newlines from failure messages.
- Replace `pr_warn` with `kunit_warn`.
- Drop arch changes.
- Remove KUnit boilerplate from CONFIG_PRINTF_KUNIT_TEST help text.
- Restore `total_tests` counting.
- Remove tc_fail macro in last patch.
- Link to v2: https://lore.kernel.org/r/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com

Changes in v2:
- Incorporate code review from prior work[0] by Arpitha Raghunandan.
- Link to v1: https://lore.kernel.org/r/20250204-printf-kunit-convert-v1-0-ecf1b846a4de@gmail.com

Link: https://lore.kernel.org/lkml/20200817043028.76502-1-98.arpi@gmail.com/t/#u [0]

---
Tamir Duberstein (2):
      printf: convert self-test to KUnit
      printf: break kunit into test cases

 Documentation/core-api/printk-formats.rst |   2 +-
 MAINTAINERS                               |   2 +-
 lib/Kconfig.debug                         |  12 +-
 lib/Makefile                              |   2 +-
 lib/{test_printf.c => printf_kunit.c}     | 429 +++++++++++++-----------------
 tools/testing/selftests/lib/config        |   1 -
 tools/testing/selftests/lib/printf.sh     |   4 -
 7 files changed, 192 insertions(+), 260 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


