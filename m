Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3511C6B44E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 04:06:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pLH81xB6zDqB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 12:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sifive.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=palmer@sifive.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.b="TtgNwfwO"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pKRz3S6LzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 11:29:19 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id f17so5987820pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 18:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=zh7WuypBzbiCD4LyIt7zsx5ys0tmSuJ0Pu/F9tBbNb8=;
 b=TtgNwfwOuHBDNTfx27GSbA0wFIrCvlbVGtdERIvJL/dSLC5xPpLlJI4ctZLa3TVein
 m1Ld3VYM2o6ueHoC6BUTFi9EVV6J5vkp4hpaFwv0dPbBJg9MASm8xTShMxxaAzUL/Jw1
 yobYTWBD9UKgKC/3jAft6L0U9j7pvTLZjv31FKweocqdpx2vkhnuxZ+uMEE08KmXnwWp
 MDibt88Ug776sq1vC021FOOnrkapoxyW0QFe5XnOb4pcNUD+8H30J/7ffiSmGu/QBmfL
 Lf5Mr3bXn6TcVlfMc3YJknlSPM+nNqQHh7HdfX52k6Q7byimg1KGRVq64zQHLDP1akT9
 VhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=zh7WuypBzbiCD4LyIt7zsx5ys0tmSuJ0Pu/F9tBbNb8=;
 b=QvaK9jYX03P8H/veeDEhG5j67KcQ86arDBaneJD0MhR4+NGBWzP4JCFtfwL3wgaAgH
 8oNymDWeHWEh6neX7MoL87nd+oCPh/wo5G1rmU/p0qD9hSDj1rERgnq2GDZsQVlY3Zsj
 l5/3Li/4Mrwals9uZ+NuwQdMFsNc6wHeF7WBwN/L1yhco2qm6P3Xd2A/XH0YkIi6QvXH
 Aqljxi7Jlw/7X7Bujabui4d+vGctE8Q0US2eGCiktqBsvnFUzyEOJLIcKP1Kq6UMcpG3
 QtQlq5OtTrXZoWlBUIgtNvluZoK2UOiuWs16pFNjeDtmb2d2+MKShwH7Sqg1uWEqqvxr
 6ELA==
X-Gm-Message-State: APjAAAXp48Qcs+zN3wroNZ5XcIFABRVMUWbEZvvpHz9U2QdMSdnHA+9E
 IysyMRM5xOSRVQpl3hmuUCCeGw==
X-Google-Smtp-Source: APXvYqwq9WjP5TET/3LfzOmuS30fZSvNWSh5XVAb3DJ+QlmFexoJZUHIITMkaN+oV660FeaCLs/SbQ==
X-Received: by 2002:a63:5b1d:: with SMTP id p29mr36130504pgb.297.1563326956692; 
 Tue, 16 Jul 2019 18:29:16 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a128sm19045628pfb.185.2019.07.16.18.29.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 18:29:16 -0700 (PDT)
Subject: [PATCH v2 3/4] arch: Register fchmodat4, usually as syscall 434
Date: Tue, 16 Jul 2019 18:27:18 -0700
Message-Id: <20190717012719.5524-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190717012719.5524-1-palmer@sifive.com>
References: <20190717012719.5524-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Wed, 17 Jul 2019 11:58:48 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 peterz@infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 heiko.carstens@de.ibm.com, stefan@agner.ch,
 James.Bottomley@HansenPartnership.com, namhyung@kernel.org,
 kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>,
 ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org,
 mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, jolsa@redhat.com,
 tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, luto@kernel.org, alexander.shishkin@linux.intel.com,
 tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk,
 dhowells@redhat.com, monstr@monstr.eu, tony.luck@intel.com,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com,
 bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This registers the new fchmodat4 syscall in most places as nuber 434,
with alpha being the exception where it's 544.  I found all these sites
by grepping for fspick, which I assume has found me everything.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
 arch/arm/tools/syscall.tbl                  | 1 +
 arch/arm64/include/asm/unistd32.h           | 2 ++
 arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
 arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
 arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
 arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
 arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
 arch/s390/kernel/syscalls/syscall.tbl       | 1 +
 arch/sh/kernel/syscalls/syscall.tbl         | 1 +
 arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
 arch/x86/entry/syscalls/syscall_32.tbl      | 1 +
 arch/x86/entry/syscalls/syscall_64.tbl      | 1 +
 include/uapi/asm-generic/unistd.h           | 5 ++++-
 17 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 9e7704e44f6d..6c4ef43c8b52 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -473,3 +473,4 @@
 541	common	fsconfig			sys_fsconfig
 542	common	fsmount				sys_fsmount
 543	common	fspick				sys_fspick
+544	common	fcmodat4			sys_fchmodat4
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index aaf479a9e92d..c008b76fbf92 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -447,3 +447,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
index aa995920bd34..049471b468c1 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -875,6 +875,8 @@ __SYSCALL(__NR_fsconfig, sys_fsconfig)
 __SYSCALL(__NR_fsmount, sys_fsmount)
 #define __NR_fspick 433
 __SYSCALL(__NR_fspick, sys_fspick)
+#define __NR_fchmodat4 434
+__SYSCALL(__NR_fchmodat4, sys_fchmodat4)
 
 /*
  * Please add new compat syscalls above this comment and update
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index e01df3f2f80d..d16e9801fe82 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -354,3 +354,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 7e3d0734b2f3..1bbff1a9153c 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -433,3 +433,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index 26339e417695..3ed878cb10a3 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -439,3 +439,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 0e2dd68ade57..916cdb808e62 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -372,3 +372,4 @@
 431	n32	fsconfig			sys_fsconfig
 432	n32	fsmount				sys_fsmount
 433	n32	fspick				sys_fspick
+434	n32	fchmodat4			sys_fchmodat4
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 5eebfa0d155c..48b4badb1914 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -348,3 +348,4 @@
 431	n64	fsconfig			sys_fsconfig
 432	n64	fsmount				sys_fsmount
 433	n64	fspick				sys_fspick
+434	n64	fchmodat4			sys_fchmodat4
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 3cc1374e02d0..0a2ec339882a 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -421,3 +421,4 @@
 431	o32	fsconfig			sys_fsconfig
 432	o32	fsmount				sys_fsmount
 433	o32	fspick				sys_fspick
+434	o32	fchmodat4			sys_fchmodat4
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index c9e377d59232..07d38477f8f7 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -430,3 +430,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 103655d84b4b..3542b33d1bf3 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -515,3 +515,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index e822b2964a83..cf7b3086ffaa 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -436,3 +436,4 @@
 431  common	fsconfig		sys_fsconfig			sys_fsconfig
 432  common	fsmount			sys_fsmount			sys_fsmount
 433  common	fspick			sys_fspick			sys_fspick
+434  common	fchmodat4		sys_fchmodat4			sys_fchmodat4
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index 016a727d4357..5afa9fb9b4d3 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -436,3 +436,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index e047480b1605..ff19eb8185f3 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -479,3 +479,4 @@
 431	common	fsconfig			sys_fsconfig
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
+434	common	fchmodat4			sys_fchmodat4
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index ad968b7bac72..39609fa3536d 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -438,3 +438,4 @@
 431	i386	fsconfig		sys_fsconfig			__ia32_sys_fsconfig
 432	i386	fsmount			sys_fsmount			__ia32_sys_fsmount
 433	i386	fspick			sys_fspick			__ia32_sys_fspick
+434	i386	fchmodat4		sys_fchmodat4			__ia32_sys_fchmodat4
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index b4e6f9e6204a..b92d5b195e66 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -355,6 +355,7 @@
 431	common	fsconfig		__x64_sys_fsconfig
 432	common	fsmount			__x64_sys_fsmount
 433	common	fspick			__x64_sys_fspick
+434	common	fchmodat4		__x64_sys_fchmodat4
 
 #
 # x32-specific system call numbers start at 512 to avoid cache impact
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index a87904daf103..6a7ba1e69e42 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -845,8 +845,11 @@ __SYSCALL(__NR_fsmount, sys_fsmount)
 #define __NR_fspick 433
 __SYSCALL(__NR_fspick, sys_fspick)
 
+#define __NR_fchmodat4 434
+__SYSCALL(__NR_fchmodat4, sys_fchmodat4)
+
 #undef __NR_syscalls
-#define __NR_syscalls 434
+#define __NR_syscalls 435
 
 /*
  * 32 bit systems traditionally used different
-- 
2.21.0

