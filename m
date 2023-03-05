Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B716AB24E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 21:57:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDYm5KJ7z3cXf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 07:57:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fYF9dMtk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fYF9dMtk;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXp6vj0z3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:56:56 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id i34so30761997eda.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNEkm4zOMdJBSU8KKqreG62DLRxeXn3Xkh8biCMSrGQ=;
        b=fYF9dMtkj1YXiWLjWXVi108GaUsP78YWiLOBcqczOwcGB1KS3hFQGdzMmnPB40ydKb
         CJBU4IAcJ0MjxZbPRv/XnGoAjuT4JRbTP5/rspAGr1pVqCKhRoeHY3MISmOrijMZ/1Zu
         bzRGM/41AcDVAq0R82jvDwaNabVWUjpb24UlLxEmo/ypXHTY5dkWwNInk9ZHOiAeRtfv
         /SV5xswkUyIS+kqp65TKME9k1EuFNhsY+K7YcAsF17i/iTmekg08B/ESrHCvrUtCJFsT
         l473Q2p3EZjGHpQi0fM7RSy1MdpNqnqxaUQ0X1U1Z9yt4tvfwyH//k4NXO64wBvCP+Pa
         DoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNEkm4zOMdJBSU8KKqreG62DLRxeXn3Xkh8biCMSrGQ=;
        b=vAlmxu48cc5aPbHFkg520uzhv7PH0vOw6BvNh0UpLVxU1w7KLqX1PkG9HLcL05QqRX
         OAmH0GvrSu3WKDJ1a2LjjJkC0SzYDHA5G2FQCjfj0V4gwx3ucdB+6FVhusNLSktf5756
         DRVrTtPO4UiimLefsn+esSB8H0j5XHGvrSAzC4Wgd+n4ppAJDx0w9ruYOjtMcvAGSy5K
         GDVztjC8QpsmDsCsWoh9crGykTlO7E+Z9bxmaoCR53PsvGIYXfDUL+c2C+LCideJmJZA
         7J6v7kPk4/9Ni1YYYrWU/PQsC4bGavri9khSQwWtN5UmUHAIAztH2rkgyhcjDqs8V2ox
         cczQ==
X-Gm-Message-State: AO0yUKWJCMVoSwGeyRPcS6cE7JQpk250OtwLNwFqE9Q5WWeo/vgyZ6B+
	O9o0KioKW3+UVOcQ9RSECl0=
X-Google-Smtp-Source: AK7set/RUb5/XHQZd/krFNbQoHv4XST5YnFdb9U8YR6v6o3hVBIJ8gVcKyFZsXQGz5Rhs9cjnpYrzA==
X-Received: by 2002:a17:906:384a:b0:8f0:143d:ee28 with SMTP id w10-20020a170906384a00b008f0143dee28mr8887420ejc.16.1678049808165;
        Sun, 05 Mar 2023 12:56:48 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:56:47 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 00/10] locking: Introduce local{,64}_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:18 +0100
Message-Id: <20230305205628.27385-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiri Olsa <jolsa@kernel.org>, Borislav Petkov <bp@alien8.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add generic and target specific support for local{,64}_try_cmpxchg
and wire up support for all targets that use local_t infrastructure.

The patch enables x86 targets to emit special instruction for
local_try_cmpxchg and also local64_try_cmpxchg for x86_64.

The last patch changes __perf_output_begin in events/ring_buffer
to use new locking primitive and improves code from

     4b3:	48 8b 82 e8 00 00 00 	mov    0xe8(%rdx),%rax
     4ba:	48 8b b8 08 04 00 00 	mov    0x408(%rax),%rdi
     4c1:	8b 42 1c             	mov    0x1c(%rdx),%eax
     4c4:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
     4c8:	85 c0                	test   %eax,%eax
     ...
     4ef:	48 89 c8             	mov    %rcx,%rax
     4f2:	48 0f b1 7a 28       	cmpxchg %rdi,0x28(%rdx)
     4f7:	48 39 c1             	cmp    %rax,%rcx
     4fa:	75 b7                	jne    4b3 <...>

to

     4b2:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
     4b6:	48 8b 82 e8 00 00 00 	mov    0xe8(%rdx),%rax
     4bd:	48 8b b0 08 04 00 00 	mov    0x408(%rax),%rsi
     4c4:	8b 42 1c             	mov    0x1c(%rdx),%eax
     4c7:	85 c0                	test   %eax,%eax
     ...
     4d4:	48 89 c8             	mov    %rcx,%rax
     4d7:	48 0f b1 72 28       	cmpxchg %rsi,0x28(%rdx)
     4dc:	0f 85 d0 00 00 00    	jne    5b2 <...>
     ...
     5b2:	48 89 c1             	mov    %rax,%rcx
     5b5:	e9 fc fe ff ff       	jmp    4b6 <...>

Please note that in addition to removed compare, the load from
0x28(%rdx) gets moved out of the loop and the code is rearranged
according to likely/unlikely tags in the source.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jun Yi <yijun@loongson.cn>

Uros Bizjak (10):
  locking/atomic: Add missing cast to try_cmpxchg() fallbacks
  locking/atomic: Add generic try_cmpxchg{,64}_local support
  locking/alpha: Wire up local_try_cmpxchg
  locking/loongarch: Wire up local_try_cmpxchg
  locking/mips: Wire up local_try_cmpxchg
  locking/powerpc: Wire up local_try_cmpxchg
  locking/x86: Wire up local_try_cmpxchg
  locking/generic: Wire up local{,64}_try_cmpxchg
  locking/x86: Enable local{,64}_try_cmpxchg
  perf/ring_buffer: use local_try_cmpxchg in __perf_output_begin

 arch/alpha/include/asm/local.h              |  2 ++
 arch/loongarch/include/asm/local.h          |  2 ++
 arch/mips/include/asm/local.h               |  2 ++
 arch/powerpc/include/asm/local.h            | 11 ++++++
 arch/x86/include/asm/cmpxchg.h              |  6 ++++
 arch/x86/include/asm/local.h                |  2 ++
 include/asm-generic/local.h                 |  1 +
 include/asm-generic/local64.h               |  2 ++
 include/linux/atomic/atomic-arch-fallback.h | 40 ++++++++++++++++-----
 include/linux/atomic/atomic-instrumented.h  | 20 ++++++++++-
 kernel/events/ring_buffer.c                 |  5 +--
 scripts/atomic/gen-atomic-fallback.sh       |  6 +++-
 scripts/atomic/gen-atomic-instrumented.sh   |  2 +-
 13 files changed, 87 insertions(+), 14 deletions(-)

-- 
2.39.2

