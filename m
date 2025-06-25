Return-Path: <linuxppc-dev+bounces-9749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B407CAE8555
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3M355PNz307K;
	Wed, 25 Jun 2025 23:58:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845169;
	cv=none; b=ayxSnZMy2FJ80yyqG/AsN+1K1TskmLqlxtR1qO7cUUuFubZVGvpkMYoZ6dMll2likNIYrNHunq0UOoRtMC+XPYkO8rpWH7UOsLmXURcF4Te2RQevMwozLclRKSc3zrOfGsmyHb6j2p47YBnOmG9M8T2dgYILHMfiMeK0kefXYN3wg/oilcyRd4ssuqDALT3SYVQAf4TPRbMsNeAF2fYA5WiVHlujWsj6x33VqP3VED5hOZZAZeAeqsT1Rpajes56itGeTFYW7jW0uq/Pc5pXO2D3ygFrQjWapcd7pXZkqJbc4g9EP3VxdnV2BVvFKd+q+y3mjt1DMTPNNOLfDVsDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845169; c=relaxed/relaxed;
	bh=7imy3yTxK1noZpQDmXpRegf9/Y5dUmZKs6ukLVxlc1E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TlHwBByDb1vdrYLh1XF/1KCBNQkkYaJ1jJBFZvDIgZLSzy9K2kjYy/afYK0DfO36a0ccNkVH4548sE53AYDYw4nHo7CJWtWZwhrZWiUdlDSiGpi79Jok70R2pENRL7m7MLLATsTAUTaclpg8tBP2xumEsjI1MWt/Qo0AcjN8r3d+fP8UnQbm3v8rXvSUTDcPvzzISWr33w2YfCwGRfQbek8BjRJ/ypcyhQcATebqOPmlcIJwTTEnwclONkw55UEVbPDdTi3MTaoCo/+LrsJLYPIIi19/MhU3k3Fkwyoihdgm7Gwyv618KNZ3t4zmmRkIDH+KxTZkYmE31JISJGvGEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NhFKRCCu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NhFKRCCu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxvM5jXzz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:52:46 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32ade3723adso74264691fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845162; x=1751449962; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7imy3yTxK1noZpQDmXpRegf9/Y5dUmZKs6ukLVxlc1E=;
        b=NhFKRCCuTA6kcmqBe67ZwoNSRfqUld2+xU0RVnDpGWSBhLeyeHkFcRB6OlJAtgdRlI
         GSw/5gPaZMj+27IqTZUHhWtVsX6u7cD/RlEEjOBWOvgxTmjScO4cI3lToijeqkOiNf6d
         vabyQeyTAtgAlADgKXdR9LzccdvYjmK1qtDYfYZAj84JDXctUbRxPOe5jWHPCGrl2Hw6
         xHKXfg9VGgWIjniCMGUGU2Zqan971YncACAd2PDUv+WeWczN/ugKAxl2vpY7E2ZCvqkt
         I5wcJxkppxnkt2XfQHh/6mVQkFziygMZGOnv1c4u+nCNZPNQ6/XWp0/5XaqHCU3J6n2U
         Jmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845162; x=1751449962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7imy3yTxK1noZpQDmXpRegf9/Y5dUmZKs6ukLVxlc1E=;
        b=kJTKzhdpmYu/S+Jzpe2wB7sh5xnQU6GCmmsBWBP8qeyzIN4FvKpc/O50/614XcHecM
         T+3FnupJs/xOisYCxnJ53h3DcrT4yHqllmGqcFf0cyOb4bgnL7JtcK7460QvWuqnIRmM
         dLDjAYVxxB7ZJMuvnrYTaVw4BofrTgDdmZQi+OyncOw6YDEqCpu/4UkdWEgsfPv9+HnJ
         ObO94P+cRKQUoALsvNMOorP5ImETNzHOeysYzxOIG1LARkxdc4OCAvl7K/uKo+82ZUpi
         pR71MBrE2fJd8CXGQ04XYhmYx2qeBy5KLFtwMrF7GtX+gosfSM5xUyjZ/6/jyX46J6ZE
         AC5A==
X-Forwarded-Encrypted: i=1; AJvYcCVfwZJz3o7JHT644wfmq6vQsJ1LcBMKltt8WxLYgVAVi5JbMw7bdWR6dT9nE2cvUHNXIIFLBgjF8AMAVoY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWJ1ZscB80iNy5BkSF9Es5dOvthuQH69hjxoBYt10O4rQ6iM6M
	I4Lk2BZv5yWRn9dRW9bVe2O5s5RZfeJlj2Q4BC83L4aQtaAyxGI4AT/B
X-Gm-Gg: ASbGnctPgnm2YijOHJYXiNA+WCFCT+ZYUCv7+F6huVkwE1jTptbhB1UySOEbYc1Fzbe
	JQwoOHuW4vkQ1GSP05bBBQUKG3WbSZNffGN974fuc2Q+BtNKhGEBfXMv4V9gq9V2dSSWaKcq26j
	MFYcqDYs0gLH2TsgOHSGnX6qaHodD+I0kNGbmqlPILtndYydgZAxq7AneHz/WI0XfDMB3Y9ZeD2
	Lg05dWgR/EZhsLK/YCSjDnSMqX/RLK2ENr4GJ3JXiSw1SWZyJLN7zvaNV3MRxGifR1N7vpyWWto
	DpsynD0zz27MYn/5IdXXJy8ihj8gDT2u5bPJPcJfNzmB5bFcgzZ2aL+B/v8Vbo+dCcMqxkjjkIL
	RBFboLWqs0TCuBDw2uUoV1ynFVDSgRA==
X-Google-Smtp-Source: AGHT+IH5ApOZ+lbBvE2ggWIBLKt7ZlvSOrm/LIiyhhxX4cx6KdoLX4TpLfXvTX3dCD4pGEuZuPz4ow==
X-Received: by 2002:a2e:be03:0:b0:32b:3879:ce7f with SMTP id 38308e7fff4ca-32cc63451f0mr7075061fa.0.1750845161589;
        Wed, 25 Jun 2025 02:52:41 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:52:41 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 0/9] kasan: unify kasan_arch_is_ready with kasan_enabled
Date: Wed, 25 Jun 2025 14:52:15 +0500
Message-Id: <20250625095224.118679-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series unifies the kasan_arch_is_ready() and kasan_enabled()
interfaces by extending the existing kasan_enabled() infrastructure to
work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).

Currently, kasan_enabled() only works for HW_TAGS mode using a static key,
while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-time
constant) or rely on architecture-specific kasan_arch_is_ready()
implementations with custom static keys and global variables.

This leads to:
- Code duplication across architectures  
- Inconsistent runtime behavior between KASAN modes
- Architecture-specific readiness tracking

After this series:
- All KASAN modes use the same kasan_flag_enabled static key
- Consistent runtime enable/disable behavior across modes
- Simplified architecture code with unified kasan_init_generic() calls
- Elimination of arch specific kasan_arch_is_ready() implementations
- Unified vmalloc integration using kasan_enabled() checks

This addresses the bugzilla issue [1] about making
kasan_flag_enabled and kasan_enabled() work for Generic mode,
and extends it to provide true unification across all modes.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=217049

=== Current mainline KUnit status

To see if there is any regression, I've tested first on the following
commit 739a6c93cc75 ("Merge tag 'nfsd-6.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux").

Tested via compiling a kernel with CONFIG_KASAN_KUNIT_TEST and running
QEMU VM. There are failing tests in SW_TAGS and GENERIC modes in arm64:

arm64 CONFIG_KASAN_HW_TAGS:
	# kasan: pass:62 fail:0 skip:13 total:75
	# Totals: pass:62 fail:0 skip:13 total:75
	ok 1 kasan

arm64 CONFIG_KASAN_SW_TAGS=y:
	# kasan: pass:65 fail:1 skip:9 total:75
	# Totals: pass:65 fail:1 skip:9 total:75
	not ok 1 kasan
	# kasan_strings: EXPECTATION FAILED at mm/kasan/kasan_test_c.c:1598
	KASAN failure expected in "strscpy(ptr, src + KASAN_GRANULE_SIZE, KASAN_GRANULE_SIZE)", but none occurred

arm64 CONFIG_KASAN_GENERIC=y, CONFIG_KASAN_OUTLINE=y:
	# kasan: pass:61 fail:1 skip:13 total:75
	# Totals: pass:61 fail:1 skip:13 total:75
	not ok 1 kasan
	# same failure as above

x86_64 CONFIG_KASAN_GENERIC=y:
	# kasan: pass:58 fail:0 skip:17 total:75
	# Totals: pass:58 fail:0 skip:17 total:75
	ok 1 kasan

=== Testing with the patches:

* arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results.
* x86_64 (GENERIC): no regression, no errors

=== NB

I haven't tested on the following arch. due to the absence of qemu-system-
support on those arch on my machine. So I defer this to relevant arch
people to test KASAN initialization:
- loongarch
- s390
- um
- xtensa
- powerpc

Sabyrzhan Tasbolatov (9):
  kasan: unify static kasan_flag_enabled across modes
  kasan: replace kasan_arch_is_ready with kasan_enabled
  kasan/arm64: call kasan_init_generic in kasan_init
  kasan/xtensa: call kasan_init_generic in kasan_init
  kasan/loongarch: call kasan_init_generic in kasan_init
  kasan/um: call kasan_init_generic in kasan_init
  kasan/x86: call kasan_init_generic in kasan_init
  kasan/s390: call kasan_init_generic in kasan_init
  kasan/powerpc: call kasan_init_generic in kasan_init

 arch/arm64/mm/kasan_init.c             |  4 +---
 arch/loongarch/include/asm/kasan.h     |  7 -------
 arch/loongarch/mm/kasan_init.c         |  7 ++-----
 arch/powerpc/include/asm/kasan.h       | 14 --------------
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 arch/s390/kernel/early.c               |  2 +-
 arch/um/include/asm/kasan.h            |  5 -----
 arch/um/kernel/mem.c                   |  4 ++--
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 22 ++++++++++++++++------
 include/linux/kasan.h                  |  6 ++++++
 mm/kasan/common.c                      | 15 +++++++++++----
 mm/kasan/generic.c                     | 17 ++++++++++++++---
 mm/kasan/hw_tags.c                     |  7 -------
 mm/kasan/kasan.h                       |  6 ------
 mm/kasan/shadow.c                      | 15 +++------------
 mm/kasan/sw_tags.c                     |  2 ++
 18 files changed, 61 insertions(+), 82 deletions(-)

-- 
2.34.1


