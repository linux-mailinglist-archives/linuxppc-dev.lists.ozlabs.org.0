Return-Path: <linuxppc-dev+bounces-5021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E0A09F05
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:11:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJpW2Hnmz3cV3;
	Sat, 11 Jan 2025 11:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534458;
	cv=none; b=CM9GQD6skdtvFGmb7Sm8LZKgBGU9N8pFMFQQibbCyv7SPN814iqDtAQx5YBUNJqJzj6gzHa18B62a+ET3BtHRKKb62GYTZ+7LerWr1XVWPjWBcn8gWkpqVVjfXKLDI0zo3faMgqfSsKW44O/6rspWOTZagusoTyOlR0Rv8IdqgGlxL+KmjLDnj7YbbegAR4zjloNST4Yju0DgqAIP1VMEr5RTzvBlU/bDysceMoKLEUFkZSmE2Okw0srhleyFUTRKt7kFi/+K8LuWobVFIpwl6+bNEmVaBfxxCUCwHj8gS8VSrkvHYyvq4sgLdhH0d9wBphOKk2Uwiu772icBI2Kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534458; c=relaxed/relaxed;
	bh=LLeVb0ZgyFkqRQqFmxHZC1txeWSVEDEElINoAb1GRXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lBz44odAxLDg1ikNdT+TyGf16Gjgilc7taSTGPRIzFlJ4DFGp16rZDYso5wiK18UfCZlq0L26AO5Pg2MLT1fGitCEqt7uexu6HtNn8gtZaWCOUyfQ+JcLaKE4I5asjEEsYBTYl8dS/ybiYUxFX9jJQDKMQOdKhlDuBrkafhHVUFGXa95j3LjQ0Pp+KxGob/3GrdzDsf3CisTt+LvBQHC04lC3x/uOW32Jxj4+ACJBEPoll8GN0jcwQVCYSnfMfu1eCPL18A6uqDFXhbF/7W/8Q3qH8vkDXXKR8kVMKkjKTFwA8/gfbZMdV8rXP4OM4x/QqTjQyRSNhigT9A3mK46pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=p5XGwlzQ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3smmbzwgkdm02tv35t6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=p5XGwlzQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3smmbzwgkdm02tv35t6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9TN5Vwrz3cZM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:40:55 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43619b135bcso12091075e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534450; x=1737139250; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLeVb0ZgyFkqRQqFmxHZC1txeWSVEDEElINoAb1GRXw=;
        b=p5XGwlzQvDnJP5B/RYJauJlzYZ6GLtVCP67+CS8AZqIYTEoYTUv3loVQyqpX7xVmgg
         8GPAmoLuxlqTbIuDt9l3e7ys4N3ubQGbA8Vlshi0PGOzC1ZfKwLPDomgseQvYCh2IqUE
         jCBEk3F/fRP+rlbOb0HlcLJMHAZsHMPdOePv6qtKq048bpu33q14K/w/spbtWWt97gdt
         asm0n/pGjS/yELmSxk3DBN1/8MPzrgtvS1lRe9kgmET3pyGyWjehFKbA9SxVlFIiEr6G
         jjqUD9DRipkYkM7Ze2hu44daKuoq8ZwPhrEYz65YBs+PYBIFVwoSgLp+mVgZwX5wQ8ry
         dXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534450; x=1737139250;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLeVb0ZgyFkqRQqFmxHZC1txeWSVEDEElINoAb1GRXw=;
        b=aWMiLh+T3ZizRKDicNoS2CD+Exdd0Eu+A7rrXRBvg8s/8N43CxtMEBG8HRSLv2VCKa
         VArnrQ9SZeurLRg2Chz2gtQm3A9yBs9LXtY+L6Xjjwe2nNzGjL8qejfAYSMPJFYYrPOG
         9E3+lQomrzGpTwF7Tdg33kpIGYLJ0sMF/f01cPHiN/8BoB5pfnbCP4o67cGnv+3D7w7J
         kFJh7CJHu+7x11ygvZktv+pmP94hhV5Lvp5k98s482tyMfo7mAFci+JITe6K6mnpLp4G
         MrTqp5kNzFECnpefKqMez2HLF98o3Sloz1lWN9dYWqLz5Q7fq72uF5tTolNHmOiAPpWP
         vasA==
X-Forwarded-Encrypted: i=1; AJvYcCUaNj0Ytw05+RtjCgnDwS3X5q3g1Z/9yygOC1DAh0jTsJ0HzNNcQLe9vuk9S6c2/XEVrv3ZAOwJ972GSds=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEB3MiO7rX68wZ73rd5wpR7tddwC1U0eJhiuSH4L69iO0zhvN9
	E5LZjyJJ1utj/toPrBVhrnYl5ONIp8RCYIlAhh25RBUOo0rImGqEC5V5J9Sfxih/TWRqULkWZf/
	vxkeaPnrDSw==
X-Google-Smtp-Source: AGHT+IEYbvktq49LdsReUEtwVFMZ4u0AErNwMdQm9eBuwPrj68sv++2uU8TAXJvwJwbpoJD68/9N90LfrlOyOw==
X-Received: from wmbay14.prod.google.com ([2002:a05:600c:1e0e:b0:434:a8d7:e59b])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d07:b0:434:9934:575 with SMTP id 5b1f17b1804b1-436e26a8f4dmr128290085e9.16.1736534450259;
 Fri, 10 Jan 2025 10:40:50 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:28 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
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
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-2-8419288bc805@google.com>
Subject: [PATCH RFC v2 02/29] x86: Create CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Junaid Shahid <junaids@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently a nop config. Keeping as a separate commit for easy review of
the boring bits. Later commits will use and enable this new config.

This config is only added for non-UML x86_64 as other architectures do
not yet have pending implementations. It also has somewhat artificial
dependencies on !PARAVIRT and !KASAN which are explained in the Kconfig
file.

Co-developed-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/alpha/include/asm/Kbuild      |  1 +
 arch/arc/include/asm/Kbuild        |  1 +
 arch/arm/include/asm/Kbuild        |  1 +
 arch/arm64/include/asm/Kbuild      |  1 +
 arch/csky/include/asm/Kbuild       |  1 +
 arch/hexagon/include/asm/Kbuild    |  1 +
 arch/loongarch/include/asm/Kbuild  |  3 +++
 arch/m68k/include/asm/Kbuild       |  1 +
 arch/microblaze/include/asm/Kbuild |  1 +
 arch/mips/include/asm/Kbuild       |  1 +
 arch/nios2/include/asm/Kbuild      |  1 +
 arch/openrisc/include/asm/Kbuild   |  1 +
 arch/parisc/include/asm/Kbuild     |  1 +
 arch/powerpc/include/asm/Kbuild    |  1 +
 arch/riscv/include/asm/Kbuild      |  1 +
 arch/s390/include/asm/Kbuild       |  1 +
 arch/sh/include/asm/Kbuild         |  1 +
 arch/sparc/include/asm/Kbuild      |  1 +
 arch/um/include/asm/Kbuild         |  2 +-
 arch/x86/Kconfig                   | 14 ++++++++++++++
 arch/xtensa/include/asm/Kbuild     |  1 +
 include/asm-generic/asi.h          |  5 +++++
 22 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/Kbuild b/arch/alpha/include/asm/Kbuild
index 396caece6d6d99c7a428f439322a0a18452e1a42..ca72ce3baca13a32913ac9e01a8f86ef42180b1c 100644
--- a/arch/alpha/include/asm/Kbuild
+++ b/arch/alpha/include/asm/Kbuild
@@ -5,3 +5,4 @@ generic-y += agp.h
 generic-y += asm-offsets.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
+generic-y += asi.h
diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index 49285a3ce2398cc7442bc44172de76367dc33dda..68604480864bbcb58d896da6bdf71591006ab2f6 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -6,3 +6,4 @@ generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += parport.h
 generic-y += user.h
+generic-y += asi.h
diff --git a/arch/arm/include/asm/Kbuild b/arch/arm/include/asm/Kbuild
index 03657ff8fbe3d202563184b8902aa181e7474a5e..1e2c3d8dbbd99bdf95dbc6b47c2c78092c68b808 100644
--- a/arch/arm/include/asm/Kbuild
+++ b/arch/arm/include/asm/Kbuild
@@ -6,3 +6,4 @@ generic-y += parport.h
 
 generated-y += mach-types.h
 generated-y += unistd-nr.h
+generic-y += asi.h
diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
index 4e350df9a02dd8de387b912740af69035da93e34..15f8aaaa96b80b5657b789ecf3529b1f18d16d80 100644
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@ -14,6 +14,7 @@ generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += parport.h
 generic-y += user.h
+generic-y += asi.h
 
 generated-y += cpucap-defs.h
 generated-y += sysreg-defs.h
diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 9a9bc65b57a9d73dadc9d597700d7229f8554ddf..4f497118fb172d1f2bf0f9e472479f24227f42f4 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -11,3 +11,4 @@ generic-y += qspinlock.h
 generic-y += parport.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
+generic-y += asi.h
diff --git a/arch/hexagon/include/asm/Kbuild b/arch/hexagon/include/asm/Kbuild
index 8c1a78c8f5271ebd47f1baad7b85e87220d1bbe8..b26f186bc03c2e135f8d125a4805b95a41513655 100644
--- a/arch/hexagon/include/asm/Kbuild
+++ b/arch/hexagon/include/asm/Kbuild
@@ -5,3 +5,4 @@ generic-y += extable.h
 generic-y += iomap.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
+generic-y += asi.h
diff --git a/arch/loongarch/include/asm/Kbuild b/arch/loongarch/include/asm/Kbuild
index 5b5a6c90e6e20771b1074a6262230861cc51bcb4..dd3d0c6891369a9dfa35ccfb8b81c8697c2a3e90 100644
--- a/arch/loongarch/include/asm/Kbuild
+++ b/arch/loongarch/include/asm/Kbuild
@@ -11,3 +11,6 @@ generic-y += ioctl.h
 generic-y += mmzone.h
 generic-y += statfs.h
 generic-y += param.h
+generic-y += asi.h
+generic-y += posix_types.h
+generic-y += resource.h
diff --git a/arch/m68k/include/asm/Kbuild b/arch/m68k/include/asm/Kbuild
index 0dbf9c5c6faeb30eeb38bea52ab7fade99bbd44a..faf0f135df4ab946ef115f3a2fc363f370fc7491 100644
--- a/arch/m68k/include/asm/Kbuild
+++ b/arch/m68k/include/asm/Kbuild
@@ -4,3 +4,4 @@ generic-y += extable.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += spinlock.h
+generic-y += asi.h
diff --git a/arch/microblaze/include/asm/Kbuild b/arch/microblaze/include/asm/Kbuild
index a055f5dbe00a31616592c3a848b49bbf9ead5d17..012e4bf83c13497dc296b66cd5e0fd519274306b 100644
--- a/arch/microblaze/include/asm/Kbuild
+++ b/arch/microblaze/include/asm/Kbuild
@@ -8,3 +8,4 @@ generic-y += parport.h
 generic-y += syscalls.h
 generic-y += tlb.h
 generic-y += user.h
+generic-y += asi.h
diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 7ba67a0d6c97b2879fb710aca05ae1e2d47c8ce2..3191699298d80735920481eecc64dd2d1dbd2e54 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -13,3 +13,4 @@ generic-y += parport.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += user.h
+generic-y += asi.h
diff --git a/arch/nios2/include/asm/Kbuild b/arch/nios2/include/asm/Kbuild
index 0d09829ed14454f2f15a32bf713fa1eb213e85ea..03a5ec74e28b3679a5ef7271606af3c07bb7a198 100644
--- a/arch/nios2/include/asm/Kbuild
+++ b/arch/nios2/include/asm/Kbuild
@@ -7,3 +7,4 @@ generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += spinlock.h
 generic-y += user.h
+generic-y += asi.h
diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
index cef49d60d74c0f46f01cf46cc35e1e52404185f3..6a81a58bf59e20cafa563c422df4dfa6f9f791ec 100644
--- a/arch/openrisc/include/asm/Kbuild
+++ b/arch/openrisc/include/asm/Kbuild
@@ -9,3 +9,4 @@ generic-y += spinlock.h
 generic-y += qrwlock_types.h
 generic-y += qrwlock.h
 generic-y += user.h
+generic-y += asi.h
diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index 4fb596d94c8932dd1e12a765a21af5b5099fbafd..3cbb4eb14712c7bd6c248dd26ab91cc41da01825 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -5,3 +5,4 @@ generic-y += agp.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += user.h
+generic-y += asi.h
diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index e5fdc336c9b22527f824ed30d06b5e8c0fa8a1ef..e86cc027f35564c7b301c283043bde0e5d2d3b6a 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -7,3 +7,4 @@ generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
 generic-y += early_ioremap.h
+generic-y += asi.h
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 1461af12da6e2bbbff6cf737a7babf33bd298cdd..82060ed50d9beb1ea72d3570ad236d1e08d9d8c6 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -13,3 +13,4 @@ generic-y += qrwlock.h
 generic-y += qrwlock_types.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
+generic-y += asi.h
diff --git a/arch/s390/include/asm/Kbuild b/arch/s390/include/asm/Kbuild
index 297bf7157968907d6e4c4ff8b65deeef02dbd630..e15c2a138392b57b186633738ddda913474aa8c4 100644
--- a/arch/s390/include/asm/Kbuild
+++ b/arch/s390/include/asm/Kbuild
@@ -8,3 +8,4 @@ generic-y += asm-offsets.h
 generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
 generic-y += mmzone.h
+generic-y += asi.h
diff --git a/arch/sh/include/asm/Kbuild b/arch/sh/include/asm/Kbuild
index fc44d9c88b41915a7021042eb8b462517cfdbd2c..ea19e4515828552f436d67f764607dd5d15cb19f 100644
--- a/arch/sh/include/asm/Kbuild
+++ b/arch/sh/include/asm/Kbuild
@@ -3,3 +3,4 @@ generated-y += syscall_table.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += parport.h
+generic-y += asi.h
diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
index 43b0ae4c2c2112d4d4d3cb3c60e787b175172dea..cb9062c9be17fe276cc92d2ac99d8b165f6297bf 100644
--- a/arch/sparc/include/asm/Kbuild
+++ b/arch/sparc/include/asm/Kbuild
@@ -4,3 +4,4 @@ generated-y += syscall_table_64.h
 generic-y += agp.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
+generic-y += asi.h
diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
index 18f902da8e99769da857d34af43141ea97a0ca63..6054972f1babdaebae64040b05ab48893915cb04 100644
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@ -27,4 +27,4 @@ generic-y += trace_clock.h
 generic-y += kprobes.h
 generic-y += mm_hooks.h
 generic-y += vga.h
-generic-y += video.h
+generic-y += asi.h
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7b9a7e8f39acc8e9aeb7d4213e87d71047865f5c..5a50582eb210e9d1309856a737d32b76fa1bfc85 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2519,6 +2519,20 @@ config MITIGATION_PAGE_TABLE_ISOLATION
 
 	  See Documentation/arch/x86/pti.rst for more details.
 
+config MITIGATION_ADDRESS_SPACE_ISOLATION
+	bool "Allow code to run with a reduced kernel address space"
+	default n
+	depends on X86_64 && !PARAVIRT && !UML
+	help
+	  This feature provides the ability to run some kernel code
+	  with a reduced kernel address space. This can be used to
+	  mitigate some speculative execution attacks.
+
+	  The !PARAVIRT dependency is only because of lack of testing; in theory
+	  the code is written to work under paravirtualization. In practice
+	  there are likely to be unhandled cases, in particular concerning TLB
+	  flushes.
+
 config MITIGATION_RETPOLINE
 	bool "Avoid speculative indirect branches in kernel"
 	select OBJTOOL if HAVE_OBJTOOL
diff --git a/arch/xtensa/include/asm/Kbuild b/arch/xtensa/include/asm/Kbuild
index fa07c686cbcc2153776a478ac4093846f01eddab..07cea6902f98053be244d026ed594fe7246755a6 100644
--- a/arch/xtensa/include/asm/Kbuild
+++ b/arch/xtensa/include/asm/Kbuild
@@ -8,3 +8,4 @@ generic-y += parport.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += user.h
+generic-y += asi.h
diff --git a/include/asm-generic/asi.h b/include/asm-generic/asi.h
new file mode 100644
index 0000000000000000000000000000000000000000..c4d9a5ff860a96428422a15000c622aeecc2d664
--- /dev/null
+++ b/include/asm-generic/asi.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_ASI_H
+#define __ASM_GENERIC_ASI_H
+
+#endif

-- 
2.47.1.613.gc27f4b7a9f-goog


