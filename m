Return-Path: <linuxppc-dev+bounces-6813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15948A574B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 23:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8gSm0W3vz3cVH;
	Sat,  8 Mar 2025 09:10:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::729"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741385399;
	cv=none; b=aOmMayTxwVFLElLH7Azbg6aDrIGprYF6UtAuY47lqmnbRN3b8KIa09dWLcFi1uoeETdAdyYGx2XFqC58oOzhRgsMzTE8uBYTTmBOuGxvIpL2kml4qMuEDADP3lpeOgRH2+Ne9C1SeyNEVXN8z0qOH0VUJm8UW2tYxFk8DOTiUrJvBRY71combIsMdG2nBTbIsuL5gcuLp6ahei7ACjPjSxngrfLip4apD9gLbEfedcKP/e0E/E7vwxRAmZkxppsXSXVaMSeAY/2BEvc9dsslxFAcMY6csxIs1UQxlf8kAmStbcTeaEj6cSylpMPEDxuJTkPVykSktpgMl+O+XeI3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741385399; c=relaxed/relaxed;
	bh=WQDcn8+Kkg+VJ3ToAm89lGpGIwYRFzkG+NUBWjAN8J8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/vgl+Vj0VTrh0qVE/moLfRlFgQLgXLKV1EIgqWqjexz9qQ0S0oOceCcRLFJYjqOGza9yp4yxrSyFWCHSVaWz9G6NVDTlKj2B7CXRmgBa5zBC4xoHZth52CYxrtdX1M0rNtBMbQq4qtyqSlsHb0vG+ycB2WTwF/cAafOfOYGmOLlP1v0mlXky9VHZAaG7vP96Rez37zGN/04xCUkPAnk4DE2B0e4QH11kbvSzqEbabk6F7rv5jQMg1nbh5vFmSht1LkuMq7gzA+6Mb80zNVBblEYgqJAIyNcbSoV2IV/8NKHI9azG8KT+AO4NXRvn15x18VnV1DbJAeDADGykexayw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SBujEOSJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SBujEOSJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8gSj6jLHz3c7j
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 09:09:56 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c089b2e239so216726185a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 14:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741385394; x=1741990194; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQDcn8+Kkg+VJ3ToAm89lGpGIwYRFzkG+NUBWjAN8J8=;
        b=SBujEOSJsiHK1REB8sJ0Z8/G9SjWk3PVpNt1WOv0zspBS9SwxVL7L7EJbVhQGxhLpV
         jz1x2y8QM1TM73DlyugHDdN4TlRKDquaEPtD62NBFrK3R93tHI56KJi0F7SJfigoF+cW
         XnrucdNM9C80zqpHey9sQMQAHq6XvmB1i6AkNIMP9PA8FZEFRKUZVidEBO6IUMsdFWfj
         AWB2m3c1nb6nz1pGGtwzFHLErNCreCe4zpACaA3VYMSFfl/RAjt7biSrqwBGg6J8GHXC
         77i5s2FpNiT2FfdQykN9YbOO1YM3bAdV4c2vuz0JNJgvpD36RQfSCJlXxajxZMHy4Xep
         fI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741385394; x=1741990194;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQDcn8+Kkg+VJ3ToAm89lGpGIwYRFzkG+NUBWjAN8J8=;
        b=kn4qM7wUicNvRzscdb9p+EtTNfik9/L/LRDjwLcdSI2Ry4pXPm/BlYxUzAOGwG3IjC
         IDiypuwOk1CUsyjeYPIqcvRdLR4mWLazQoClExY33gJPtHCcQN+9wsM66vxheNsvSoUi
         +jsmDRH8tWwCx0IkPmqXEdv6PCWtPlCVQvcGDhDUD3olhKL3apVnHJHIQMOJ9HqeoEE8
         RF/YsVp3O1qztjtrn4xVMBFcyJWngQ7x80c6RX3QC0KYRnyrjhcclnYSJH+yB4kzM0Do
         u51DAATdg2Z8bz0vpM//0v56EqZzJBSJpPQMZ7Gvm/ni7msmiQVfhXXDK1/eKoYFK6i3
         SrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXvEJiA1DDuczWK43wYHa9SkPRt14gNZ/ImrL+ql4EdrccuiCsdU7ZHErVK0CMIPmDfUaufu2AoCVIHnk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYqwEyRd3gU/FuFh17ihSRveJi4eox2VGUdZjUmThiZlJaCvjq
	US6DbwgVm3iFMudoVSRr3mwozi+5oVJ7FmHld/JcpTd+R1Q0Gmct
X-Gm-Gg: ASbGncvkx/+Ekrwa44pivd8rVjsZYDd3nuOFAN9wZaRQNffzUPS3GwJHAZ8Mjw5aAew
	LfQq/kLwYqp6wPx5G8duQCi0+J7t3FJaNue7hG0zPZ7K2LE8j82kOfy+b5KQUBk0kbRwZITdPEg
	jpQackJfBdT2x7gIh3K9Ns0+5ABjoZ+++o+zRGSV7YOK5nz10HgYtXsnhIayxoqtH4i1lBoji4J
	y59/7euJt5kJJfhRvLcCZetv0KvnQUOWjyUXyXzkEYC21IZUd4woWhQEofQGL7Tawh0J2dbEX9t
	xkWnZZDttVTNQ9KMaXIMQOck09Pq08dHQWYquVxzymPjtqjbse2eWNG63U3MV6ijtOKh2jWgWFk
	H
X-Google-Smtp-Source: AGHT+IGQES6u145PCL7njlniOUgI19DACMWBXh7cghgv/R6KrBR+utSuxWgPw2eW3fPWcgc8Tk2fOA==
X-Received: by 2002:a05:620a:4c8a:b0:7c5:3da4:5bed with SMTP id af79cd13be357-7c53da45ccamr69321485a.17.1741385393990;
        Fri, 07 Mar 2025 14:09:53 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2600:4041:5be7:7c00:f0dd:49a0:8ab6:b3b6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a095sm295001385a.3.2025.03.07.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 14:09:53 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v6 0/3] printf: convert self-test to KUnit
Date: Fri, 07 Mar 2025 17:08:55 -0500
Message-Id: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAHduy2cC/3XQzW7DIAwH8FepOI/JGEyinfoeUw+UmBZtJRXJU
 Kcq7z7SXVC3HP+W/PPHXUycI0/ibXcXmUuc4phqsC874c8unVjGoWaBgARKK3nNMc1BfnylOEs
 /psJ5lmEwoNA5ZG9Fbb1mDvH2YN8PNZ/jNI/5+zGlqLX6CyKY/8GiJEj2QR17Y50ZeH+6uPj56
 seLWMGCLdJtIFgRoO6IurfQo35GdIMo2ED0uglb54kAAv3ZxLTI1jmmIh7JUIdBkaVnhBoEN55
 cqCI01I+ABtVpaJFlWX4A+w6Oo8wBAAA=
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
 linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is one of just 3 remaining "Test Module" kselftests (the others
being bitmap and scanf), the rest having been converted to KUnit.

I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf

I have also sent out a series converting scanf[0].

Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v6:
- Use __printf correctly on `__test`. (Petr Mladek)
- Rebase on linux-next.
- Remove leftover references to `printf.sh`.
- Update comment in `hash_pointer`. (Petr Mladek)
- Avoid overrun in `KUNIT_EXPECT_MEMNEQ`. (Petr Mladek)
- Restore trailing newlines on printk strings and add some missing ones.
  (Petr Mladek)
- Use `kunit_skip` on not-yet-initialized crng. (Petr Mladek)
- Link to v5: https://lore.kernel.org/r/20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com

Changes in v5:
- Update `do_test` `__printf` annotation (Rasmus Villemoes).
- Link to v4: https://lore.kernel.org/r/20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com

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
 Documentation/dev-tools/kselftest.rst       |   2 +-
 MAINTAINERS                                 |   2 +-
 lib/Kconfig.debug                           |  12 +-
 lib/Makefile                                |   1 -
 lib/tests/Makefile                          |   1 +
 lib/{test_printf.c => tests/printf_kunit.c} | 442 ++++++++++++----------------
 tools/testing/selftests/kselftest/module.sh |   2 +-
 tools/testing/selftests/lib/Makefile        |   2 +-
 tools/testing/selftests/lib/config          |   1 -
 tools/testing/selftests/lib/printf.sh       |   4 -
 11 files changed, 207 insertions(+), 266 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


