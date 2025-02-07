Return-Path: <linuxppc-dev+bounces-5950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F6FA2CDE9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 21:14:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqQD669MGz30VF;
	Sat,  8 Feb 2025 07:14:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::729"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738959254;
	cv=none; b=CvazlPYxjLZbJcyIyAQFPeRmjDpsCvCsNBoQMZSv5XD94k+EZaX6s04bW+pHtwjd90iVMIgMaYsFdeJzvMgDf2ZJwvktBtXEr9u/HGpda3OTHrMJNU0WLoM8c3LDYlApVUTjfTmZ1ND60nLb/JekQGuLoXqGwxiV4WIfndGoetjU0dYbkkAF8VhujgKOKh3v0w6Jaio+POYFnii3VFOg5gb9tW4Os+W8gewbNwAi8eRb1r2RVNedjRAX/H++LPE2peclYKEXSUSYAO+zCZlJQF5Y9Brhp6APB8IswZfBnoUZfQtRnmCY85zSG1FmUcVkEHErrGDgfSETSi856CoOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738959254; c=relaxed/relaxed;
	bh=InMP3iob4ePV8GF0GnOu+F67bMQE3/48J3tUdjgvoYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IZVaJTgt/E1JXa+JX2R8eAikFCRxulofaU6cNJoETTT4q7qWr1YL+CNVgVaXpQmG6EVUd9IbH/X4P5zbiT/QB7nC3w+/z91wCqUF3DJWMtBV/RsL4DlghONWcHwUFSiptVKtlnheDE4HGOZ6HNTEGPJiNgWUirWxDhNA8hw7U2ePWUZtNI0TVg4QKzVHL8/n8Ugwq282PtkSZFpL15CgRJTK/y3uIrvpcKEYQG73QUES/kYmYBCPjcBol/mMBLRMcyWcPDmBUapYrfJi+6lrGnXycqodnQniz+El0OrtYfhyX48DfDjrWmMYH64DdXXHDXiQ51u4VzhJiNwJBjcIQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B6zxsstN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B6zxsstN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqQD54WdYz30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 07:14:12 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7b6f95d2eafso275060985a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2025 12:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738959248; x=1739564048; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InMP3iob4ePV8GF0GnOu+F67bMQE3/48J3tUdjgvoYQ=;
        b=B6zxsstN8y0vTXRfGGIfrc/uvYaWxYc5R0d4x15QPQEJWvVZrotaWDXk5rUCE9h9aL
         Y/fjaz783j7fq/TN85Vfyju3Q5KyWfbjXKSX/IGvh2K0Fiaqqqzkeu5oC//x6J9N7Owd
         4CqKWy49c5drvfxG+DN1bb2twM+O58Sp97CIpwN3Xn5xii1XUdi55VA8m12lMsexU4CJ
         le78I6hh5u6j0Sn5ZY/VFGi9L2tFyGFa8XJdiH4+mQDC+HZ4NisJhBSC+jEg+h846OMc
         4mB94xNpm43YnjljxiE6SfBu+wU5c0y27TmZpZz9LK06TpR8wyBa8AHUeeoinP7NMVbF
         D+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959248; x=1739564048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InMP3iob4ePV8GF0GnOu+F67bMQE3/48J3tUdjgvoYQ=;
        b=SVivOoGfyMVbNksKL29XS9OO267Sp1jmgH8RG4cLcfo6nXqg6rEBWM+ecMeWGxZcQA
         LdmzcrAilAGmZ8f2Al/Br/PyHXph5O8JxtW6XcwOXAc9urCCmrvImYUiRrPQOtYan0u+
         KAwdkE/fLTQKc8yxr1Pq50i0Q98cHwhmfwsNgKaix6vwI2eW03NEoIllR5h+ey3CEZZc
         uHzdTlfAcL7ggm8/fy4CHrRjccgTxvaosTc1NSQHDGN2Jyo7/FwKQZve9skyLeGGqtac
         v2ybAMjjd8TaOE6eu05aYklJS6Ouc2eKPmc+bdWdZi0Al/ujDR2Wh/Btem3n+bMq26Hg
         ykwg==
X-Forwarded-Encrypted: i=1; AJvYcCWBmHjcAa081uysH15JBdQZLy2Qkdw/5j5mbpiCldSZsO0ZNdJ6IEa7CO3MVLe6YGMRFwhYK8Z5hs7B/qw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznS//pXAS/LrGwDXSdb3/iVi1EUcGu0PKPbf4fD56DV49A7qRk
	u4k5vwEEc1s2ebKokSjKIPfvwO2hWyOfun1fRtiNQklaNSlLkXgS
X-Gm-Gg: ASbGncsAzvB//yBi7Yc0yB0WydX40y4LW/upjtO4Lq389auwJyGEOgw+kKJImmdhQS/
	s4nWXpdt04NWviPevvc5ylt7DDXankTj/6OxW7eaS2SfarSs6q+F0pKsMUBSwkNOE5efngecrDY
	Wd9pnfmd8BuRajGXO7UtYTkw/MURy3Yrnl0wD9JQ72/h2N4GrOqNbhtCL6rb7n9dyb0IaAqxQ/z
	DXSYf7awMmS4EXPuXcqfW/FP3GUimoXKNv743/mebKRaWelrt13je30AgA9gD2uqHB3XFE2Q+WO
	8R3lDL71TZUtyMlHuuKnGpztelBjqJs7oRMmpaw7A2T1DZmhanq5JplBsX0MoetgZnstn1oV6jT
	2vSRJIBU+g2FacHZ7GEtk8URV7e0RYppbsGVRJg==
X-Google-Smtp-Source: AGHT+IF9/EZlG7CYstG/RAX4Cebsc2v6V7/CwkGisOAz02Bj/HKRkvBl3RnAIQYOfaIOw465jlPEvA==
X-Received: by 2002:a05:620a:40cc:b0:7b6:e9db:3b21 with SMTP id af79cd13be357-7c047bba9afmr576565385a.14.1738959248476;
        Fri, 07 Feb 2025 12:14:08 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4041:5be7:7c00:c58e:ed03:1b60:c56d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e13895sm228851285a.58.2025.02.07.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:14:08 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/3] bitmap: convert self-test to KUnit
Date: Fri, 07 Feb 2025 15:14:01 -0500
Message-Id: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAIlppmcC/x3MQQqEMBAF0atIr6chtoo4VxlmEfWrjRgliSKId
 ze4fIuqiwK8ItA3u8jj0KCrS8g/GXWTdSNY+2QSI5URU3OrcbEbz7vTyN3qDvjIjfRFXtatAKC
 Ubh6Dnu/297/vByCSwpNmAAAA
X-Change-ID: 20250207-bitmap-kunit-convert-92d3147b2eee
To: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is one of just 3 remaining "Test Module" kselftests (the others
being printf and scanf), the rest having been converted to KUnit.

I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 bitmap.

I've already sent out a conversion series for each of printf[0] and scanf[1].

There was a previous attempt[2] to do this in July 2024. Please bear
with me as I try to understand and address the objections from that
time. I've spoken with Muhammad Usama Anjum, the author of that series,
and received their approval to "take over" this work. Here we go...

On 7/26/24 11:45 PM, John Hubbard wrote:
> 
> This changes the situation from "works for Linus' tab completion
> case", to "causes a tab completion problem"! :)
> 
> I think a tests/ subdir is how we eventually decided to do this [1],
> right?
> 
> So:
> 
>     lib/tests/bitmap_kunit.c
> 
> [1] https://lore.kernel.org/20240724201354.make.730-kees@kernel.org

This is true and unfortunate, but not trivial to fix because new
kallsyms tests were placed in lib/tests in commit 84b4a51fce4c
("selftests: add new kallsyms selftests")  *after* the KUnit filename
best practices were adopted.

I propose that the KUnit maintainers blaze this trail using
`string_kunit.c` which currently still lives in lib/ despite the KUnit
docs giving it as an example at lib/tests/.

On 7/27/24 12:24 AM, Shuah Khan wrote:
> 
> This change will take away the ability to run bitmap tests during
> boot on a non-kunit kernel.
> 
> Nack on this change. I wan to see all tests that are being removed
> from lib because they have been converted - also it doesn't make
> sense to convert some tests like this one that add the ability test
> during boot.

This point was also discussed in another thread[3] in which:

On 7/27/24 12:35 AM, Shuah Khan wrote:
> 
> Please make sure you aren't taking away the ability to run these tests during
> boot. 
>
> It doesn't make sense to convert every single test especially when it
> is intended to be run during boot without dependencies - not as a kunit test
> but a regression test during boot.
> 
> bitmap is one example - pay attention to the config help test - bitmap
> one clearly states it runs regression testing during boot. Any test that
> says that isn't a candidate for conversion.
> 
> I am going to nack any such conversions.

The crux of the argument seems to be that the config help text is taken
to describe the author's intent with the fragment "at boot". I think
this may be a case of confirmation bias: I see at least the following
KUnit tests with "at boot" in their help text:
- CPUMASK_KUNIT_TEST
- BITFIELD_KUNIT
- CHECKSUM_KUNIT
- UTIL_MACROS_KUNIT

It seems to me that the inference being made is that any test that runs
"at boot" is intended to be run by both developers and users, but I find
no evidence that bitmap in particular would ever provide additional
value when run by users.

There's further discussion about KUnit not being "ideal for cases where
people would want to check a subsystem on a running kernel", but I find
no evidence that bitmap in particular is actually testing the running
kernel; it is a unit test of the bitmap functions, which is also stated
in the config help text.

David Gow made many of the same points in his final reply[4], which was
never replied to.

Link: https://lore.kernel.org/all/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com/T/#u [0]
Link: https://lore.kernel.org/all/20250207-scanf-kunit-convert-v4-0-a23e2afaede8@gmail.com/T/#u [1]
Link: https://lore.kernel.org/all/20240726110658.2281070-1-usama.anjum@collabora.com/T/#u [2]
Link: https://lore.kernel.org/all/327831fb-47ab-4555-8f0b-19a8dbcaacd7@collabora.com/T/#u [3]
Link: https://lore.kernel.org/all/CABVgOSmMoPD3JfzVd4VTkzGL2fZCo8LfwzaVSzeFimPrhgLa5w@mail.gmail.com/ [4]

Thanks for your attention.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (3):
      bitmap: remove _check_eq_u32_array
      bitmap: convert self-test to KUnit
      bitmap: break kunit into test cases

 MAINTAINERS                           |   2 +-
 arch/m68k/configs/amiga_defconfig     |   1 -
 arch/m68k/configs/apollo_defconfig    |   1 -
 arch/m68k/configs/atari_defconfig     |   1 -
 arch/m68k/configs/bvme6000_defconfig  |   1 -
 arch/m68k/configs/hp300_defconfig     |   1 -
 arch/m68k/configs/mac_defconfig       |   1 -
 arch/m68k/configs/multi_defconfig     |   1 -
 arch/m68k/configs/mvme147_defconfig   |   1 -
 arch/m68k/configs/mvme16x_defconfig   |   1 -
 arch/m68k/configs/q40_defconfig       |   1 -
 arch/m68k/configs/sun3_defconfig      |   1 -
 arch/m68k/configs/sun3x_defconfig     |   1 -
 arch/powerpc/configs/ppc64_defconfig  |   1 -
 lib/Kconfig.debug                     |  24 +-
 lib/Makefile                          |   2 +-
 lib/{test_bitmap.c => bitmap_kunit.c} | 454 +++++++++++++---------------------
 tools/testing/selftests/lib/bitmap.sh |   3 -
 tools/testing/selftests/lib/config    |   1 -
 19 files changed, 195 insertions(+), 304 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-bitmap-kunit-convert-92d3147b2eee

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


