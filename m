Return-Path: <linuxppc-dev+bounces-6380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA3A40108
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2025 21:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z021F2FH1z30Tk;
	Sat, 22 Feb 2025 07:34:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740170081;
	cv=none; b=ngxf/PUTdH2+5a/g/QnIVDPlJTgO+UM9ao3BRMfe4m5OohdJTcZ6D3FHyX5qNAnofCUD0GXRR3MMpWjc3SNLl8r1MZRsLCU5VRkPEEAwbFNxglL1Y3C8kG9rQ7p6L/j6hzpYmh0/cAc0mwVjdBEBd+dhQyXPpzTUH/nDeKidPF3PPV09EcFyDrd0YPCv310G2mp9yN0jq6WxAxhSr8sMV9t9qzNr5Yv4qp/Dr19OBNWbqtL5w5Xrzkc9o6ezdk/hRAE9fs/i0+N6Pq8zaVv9XEDJA9hpvLYBiLKjAZWh5ldNCjxybOGU6vinf6M2kDAn0mLkeZYHN4bkiZKBb3ahSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740170081; c=relaxed/relaxed;
	bh=m2QU0nOb5+Ymoq25Hm5zfDRVAmAik5t7toGKHPu7gD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GTThnICBj0ggs7wDiYp4uJN4hR8wOemABlFBZeVlTddPCn/NeBh21u4ItVLR21Deg5eyRQHv0f/a181Qwv8SBtsdB4J6knH/LzLxta7Ta+t60HzqjTLb0IehPxWgYg2jfxg/upT8IvowNGFD9l221LBUClCJP8wkd1rG9LI2eujqdqIEa4KDvlAVIQ/rhkkLaW9auS6gZtMnmUX9e7H86rAssuaQpCT/d6is65JizyPH6FcShiSwZKXi5F3aBev+0q62eqNMpf+ym4+q3dZ6YIzZ9p7KRS6rn9PjAsrmFpUbOUrk5WkwZ2Nskv0a8vFqfkdz/KWPBey7NiKYE6uFhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CgQMeSEw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CgQMeSEw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z021C3swtz30C5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2025 07:34:38 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e67f377236so19921166d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2025 12:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740170075; x=1740774875; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2QU0nOb5+Ymoq25Hm5zfDRVAmAik5t7toGKHPu7gD4=;
        b=CgQMeSEwz5EjxVtBLGyWb8GYkbDh9XRNKI85osfAvEVTczfTolZk02rKXBPsLzHOqD
         b0XRkZBN4t1tcFzPqeLjZbf88SQciZlbDSMYOwVdlM2nw9HHyK7vCy9zdERKIPQk+EAQ
         YUpesSie1st37FeJ7GSgWuzVjzU+epEAJhMeyWpDSp1XTYtq2yspZeYQDNu6oVYW2aGq
         znXRzauUPhfqKUldNpWXTtzcLxKDgXLT1K2LViYyMI2is1APSeRqmmh/zOWpecp5fFBR
         XhD229sS/ZW2PsYQ8Tf64CpfBIDmKUuvUv/OcrajFRkbz1tVUsz09RVHowqEWjVlFHHT
         k/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740170075; x=1740774875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2QU0nOb5+Ymoq25Hm5zfDRVAmAik5t7toGKHPu7gD4=;
        b=FFVgifc2E9XiYMT+xhp+2ie7dngrOVjX8EO7YJO+6nfUDv4TyILjxssgGesjzax8PY
         OqTYtC4Rvib2jQ2zhqGNTQQT69S7UaQPWr/uZQrTyjaXxwzwgbhkqxadlY3F9EGJfhXf
         BV0xW25IJR9QiUSNbibbpuO2OpOE41j3/dBm+UVOiqgtu84blVVXTAtf5IIxH+O7Ao6H
         Kk5gJ6GLdQkHLrk7GFbjnPK9/TaqfG8xg0Iub1dGubUFn21v8w2u/IVRp2XntRnwv+z5
         FDipntqBm7xbUomFVsPqiwWoHx4bI7oyIS39HgNxBFY0Yz/VKS68Z0/umg8ECcl8KJpU
         BB2A==
X-Forwarded-Encrypted: i=1; AJvYcCUAkOUq0pNHB9r4kOUY+nG36gEk3yE2Se+Y671KTxSUCwEPc6YbuBYxevZ9QgGST3R0VCPf/6swpBr/mEQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz59qnMaZKy69Wh51lpoq6rNZ8khgsHavkzsuyC0hT8Dr5qOS8f
	2NHM9qjEIhfJ1eMoqfPsy895hKo/dtuQM7oxQAGEmDVAvE+3+AWT
X-Gm-Gg: ASbGncuKYT8I52a/ANCX10CoqCH0MsFGUMqaMKoA/QHUUUwF0SKrfdqVLRBp6mtnNHP
	5JnuoKoceYrssFojNhvEYQ9HqC/OmfVksk/Z4dgElMeIINk7B+Bu1s30acG2iTK6mvuN/yXXww8
	dSAaGMF3vh7SX860iUJmVJsMPNKSP8NhDc29PKmZeGGncbEj+I/XLE5HVxFpnYu0aKuDOFeYd0z
	WC5ZIR3BIIcg5k47+X6NaJShOs/nP2/2zDW1Xr+CC2937i420FFzRlXyChuydhXTniK5s4UL/wc
	yIWU2qsWkQ7ZSERe8LYj0WlV03f0Xn5BNXX5LjiBuv/4VAfhqA==
X-Google-Smtp-Source: AGHT+IHGad2s1TxSW80R91JGuuyplh1yLb8ON8Nsn5tAfbzywmLJ9mTYusIE0wz9lRGU2BfVKo1N8Q==
X-Received: by 2002:ad4:5aa8:0:b0:6d8:848e:76c8 with SMTP id 6a1803df08f44-6e6b01d78ddmr55815896d6.42.1740170075129;
        Fri, 21 Feb 2025 12:34:35 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:880f:47d4:56c6:b852])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f36easm101677546d6.74.2025.02.21.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:34:33 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v5 0/3] printf: convert self-test to KUnit
Date: Fri, 21 Feb 2025 15:34:29 -0500
Message-Id: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFXjuGcC/3XPwU7DMAwG4FeZcibIceK04sR7IA5Z6mwWLJ3SE
 oGmvjvpuFRAj78lf/59UxMX4Uk9HW6qcJVJxtwCPRxUPId8Yi1DywoBCYw1+lokz0m/fWSZdRx
 z5TLrNDgwGAJy9KqtXgsn+byzL68tn2Wax/J1v1LNOv0BEdz/YDUaNMdkjr3zwQ38fLoEeX+M4
 0WtYMUt0u0g2BCg7oi299Cj/Y3YDWJgB7FrE/YhEgEk+tPEbZG9d1xDIpKjDpMhT1tkWZZvvMB
 DE4cBAAA=
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
 MAINTAINERS                                 |   2 +-
 lib/Kconfig.debug                           |  12 +-
 lib/Makefile                                |   1 -
 lib/tests/Makefile                          |   1 +
 lib/{test_printf.c => tests/printf_kunit.c} | 437 ++++++++++++----------------
 tools/testing/selftests/lib/config          |   1 -
 tools/testing/selftests/lib/printf.sh       |   4 -
 8 files changed, 200 insertions(+), 262 deletions(-)
---
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


