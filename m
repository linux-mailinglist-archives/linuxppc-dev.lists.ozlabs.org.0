Return-Path: <linuxppc-dev+bounces-6205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86035A367D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 22:52:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvm4n24tFz2yvh;
	Sat, 15 Feb 2025 08:52:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739569977;
	cv=none; b=HCP7q1kNN8kSdn5sSBkOugev2ntYPQUl1PIKHXg2nbGnAG2GUTVcaYi0CeMmzPo7Mx61mqbug0tto1Pcnv/wOJjncSRP4B3pdOSIuIAby8jnVyJOtTaJIl55QG5SAqwMTGcy8JnHPAUAV8suD/icqDmFJGGwUacnz9EGmgd8k/39nSodfbeSa30mWdUEwu3ihrnW7nuEC7VbPb6qsAv+N/3VkxHtvWUupUkGwlL1DWhi5c5Dt2GhWwdsD+VgBGe81ZoFhXrlUEBR4VkjHU4oIXQ5trIJcP+vfgXdL7k2A5NWvk4p4GP9Lr5xHq2KxcACSZy3TyCAe6YtriQybS4nHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739569977; c=relaxed/relaxed;
	bh=oelTRyiq2uUQLScUvm+yzvdL+C/sBoOcsl6Ykq5dg44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cdAVUdq3clRMoaBWg7kyCQeTkUWyFyLi8CtNQmllxM6UoOrmV03EG0gNn5TBLAu5H096QeUiTutdaDFBsWD4+ilDcovL2mp8PMXZ9yvI0DTn6CUjVZtU9HXGlBR7tCVWXQiaoypKH4cn71X7svcR15Pn2mOAxe87ybt8OesfqkgGx2nbfpfbBIiKFD1R1TsOxSUQ+Yf/h4jC5IWjmdDkj+m9iLhQgKFH32SwZol9J1/EXFP6rr67QI93aXhrsj/UmcG/qn58z6SNtiISBLq0kqX+HFWuyPEzN+SZUmMVOv7bNywFigMxSVgerrhfmKUbg73owTj/dJZDvxYajsqviw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hlwX/UQ0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hlwX/UQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yvm4m3N6Tz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 08:52:56 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e442b79de4so22658366d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739569974; x=1740174774; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oelTRyiq2uUQLScUvm+yzvdL+C/sBoOcsl6Ykq5dg44=;
        b=hlwX/UQ0bdwjG7GZT0gqkU5+Jn/pV+mWa0Bvdl0JTD1ECo9D07bIn+OFoltn8pjsEW
         hk06liNJZcR+3TRS0lEgUshiuD6Inhr1WHBKNXQiElZvNsSCi13TJV6zoBcSIfySVFJj
         Mr9f9SHXORxIHfMGbWLH0c/eXjTphsWKAHkngCfNFxdapqUVj+WJNAbPz6MYAvYW0VEv
         oGY7ZorFiunGoGZ5+cCtcrH2piFLOvZf7LZpxtNhEUMJ3DqzzTuAhXjDRH1ZR168t0lF
         GTHcrdjgSd+mT2C+dagV7StTHoKsbqYu7F7x3/7vqS0s0eossBSR0Mva8jj7LxcEELqw
         A4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569974; x=1740174774;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oelTRyiq2uUQLScUvm+yzvdL+C/sBoOcsl6Ykq5dg44=;
        b=kF27anTkCsKpdn/f2Y1XOyKX9yJ7OSyQuFnT5sJvEMwC2uYemCWf/zj3mzJn5ik/cu
         M4eXGT3Bzx93g60ztVOTfVf9LMMhdZY8bB4RAqXX6KqDqJNRHrp7uBUA6WX95crCvRj8
         NwV5D8usM/ahH2BRkbwGIt7j0kj4XHMUpebWvbbs9bW958WYY9r+F59fTpBQfwlvdmAf
         f6jNgsCNeh4VvGdffcZQvhHeCAUdGafGJWkcxDBKN6py/8nXi2PZ93+W+VZeB2ODyiF3
         ib00cvBZUtodkNsOt8a6nYrgjuOrIexs+YKyAvgQFGMnn3ZoggE6eUhcAdi0kW3OwggW
         KpFg==
X-Forwarded-Encrypted: i=1; AJvYcCVc8nmqVXSceEb8kCkCUrcadpnZHD56iRyBcMHwddfhNcHAKvYo1ripi8AmPnBvtm2EGq1CmU2LxPq+T58=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+CrxH4f5ye/ZjTGCBTJCmbid9dC11f14qwN1YkuFm5/EpI45S
	+SCMpDi8xRozO+FbJty7MZS4Na6eurXL5XeC15g/3fJK6tSTPxrj
X-Gm-Gg: ASbGncunVQU6wRRgeXh9pJHWxwqeG+s3ze+/7xl5m2LrIDWBSyvT3kL+bquGzR10MwC
	0HFLCKneh0PBBYFczbCgR5OJVb6k7ZC7GkndpDIrma5EMfOI5TsNEBBYAuHx1YxEW2Yis4h9eth
	lgeQNwYTsEOs3Wf/narv9saswGoOavvkZM6ozfIfzvzQhMkCZBul88kRp8aLOISikwm/HV1H09J
	h8pyKpsrhQ8Ko4V+g0m+QfvK+HA86LA26nqi3ULgjqO3qhsKz7FMcGObVKgmLLQpvvrnY9GUskQ
	8BNtjZWit4HMeYoQ9JHesA7x31Jz1f5iMOoeIQ==
X-Google-Smtp-Source: AGHT+IF4uKo/kzj1TcgrhYbwG/5VYUbRGcDZFwUtTMQKwOkAQIIBdKv6vbbSZxzo9Ggb97riNE72Rw==
X-Received: by 2002:a05:6214:5190:b0:6e6:617c:abb6 with SMTP id 6a1803df08f44-6e66cc7febdmr16020726d6.6.1739569973947;
        Fri, 14 Feb 2025 13:52:53 -0800 (PST)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:d4df:402c:65f0:87da])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c2af3367sm21844451cf.59.2025.02.14.13.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 13:52:52 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v4 0/3] printf: convert self-test to KUnit
Date: Fri, 14 Feb 2025 16:52:38 -0500
Message-Id: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIACa7r2cC/3XOQQ7CIBAF0KsY1mKGAWrjynsYF0gHnai0oZVoT
 O8u1Y0aXf5J5v1/Fz0lpl6sZneRKHPPbSzBzGfCH1zck+SmZIGAFpRWskschyCPl8iD9G3MlAY
 ZGgMKnUPylSivXaLA1ye72ZZ84H5o0+3ZktV0fYEI5jeYlQRJPqhdbSpnGlrvz45PC9+exQRmf
 EeWfxAsCNjlDnVdQY36G9FviII/iJ6WUOW8tQDBfiwZx/EBRqyiUEIBAAA=
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
Changes in v4:
- Add patch "implicate test line in failure messages".
- Rebase on linux-next, move scanf_kunit.c into lib/tests/.
- Link to v3: https://lore.kernel.org/r/20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com

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
Tamir Duberstein (3):
      printf: convert self-test to KUnit
      printf: break kunit into test cases
      printf: implicate test line in failure messages

 Documentation/core-api/printk-formats.rst   |   4 +-
 MAINTAINERS                                 |   2 +-
 lib/Kconfig.debug                           |  12 +-
 lib/Makefile                                |   1 -
 lib/tests/Makefile                          |   1 +
 lib/{test_printf.c => tests/printf_kunit.c} | 437 ++++++++++++----------------
 tools/testing/selftests/lib/config          |   1 -
 tools/testing/selftests/lib/printf.sh       |   4 -
 8 files changed, 200 insertions(+), 262 deletions(-)
---
base-commit: 7b7a883c7f4de1ee5040bd1c32aabaafde54d209
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


