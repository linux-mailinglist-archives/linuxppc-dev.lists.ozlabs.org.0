Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBBC6B453
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 04:08:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pLKH3FjkzDqGQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 12:08:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sifive.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=palmer@sifive.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.b="LRzFJFoI"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pKS06QyWzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 11:29:20 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id t132so10292088pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 18:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Zt2cGhW98jjWE3OdliFocFdkTeCj4B287sEGZ0SpTug=;
 b=LRzFJFoIhdEmL95807L32ZJIuoUYPRnejcM4WZZAS5I0UeznU/mAzk5GHoafmOmsHO
 IM1q2PeVsvlEPnevADzvUbNh7W588och2Rq5fZ7FuM8MS5EZgdQu/E3L+BqIYSfN2XU/
 fS7NBtFCaQBxI26WtshKHqrbJwSXRxg0DRH2E+7ihFfC5kinDvs9QAQl4LeKl3WMrLal
 EZk+GjuTQmWvWRkiN6fD0Uh9EK++IoK7hPKkpfs3WJ+9PYY0m//oOKVgI1hVB+8KwfWp
 /ROJj7wU7v2lVN33h5c47bRwWtpAubgsifHDAD3lPqVXVzkWPuUCHQEfzucJpkMLwZmo
 z7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Zt2cGhW98jjWE3OdliFocFdkTeCj4B287sEGZ0SpTug=;
 b=r5hcRoxTw/M4JrJ0UkxLefMxAS7bJdLVfLCH7C7W/8KLTqG1t5zzw4gHzBR305gW5H
 8cUfEoOlEq18gF0JIeotU3SPaXwMgcX7EaYYCOa6GSV69NVyw1z8a8So2bE7aLCayp4Q
 EaKbsqf2bEI1fuG5ZPZapp666QCDsywDuyU8EHFwfz5jvr6VP9PpnEFIyDFLc98geoAm
 mRgyxvSKUE821t4s4n5XI9E7RuL5lbMkoEjlAIRhqezHxiN6Zb+HwonRCQJlb8lLHZNt
 RfvQW7CZEJX6d3nAkqI3WVMvh6lABaLNrOtTuXlDHEyU5V92W4Ni+mpG+t+BMxZ5VT2d
 kiPQ==
X-Gm-Message-State: APjAAAVghtBFTVGoHpdYKm1FLtqQDXpx1c4jxuLDjRFKvbQvx2/bAENX
 Bpkg5ToKaCqgMXdVoBKePT6PmQ==
X-Google-Smtp-Source: APXvYqxMG1qk1WTJLj8KetMfpnmMGNIO6J68LTkGZfygoiTvSJog6FgoAv0IrheBQXCx4vxGr6+m3Q==
X-Received: by 2002:a63:e5a:: with SMTP id 26mr36209824pgo.3.1563326958663;
 Tue, 16 Jul 2019 18:29:18 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i3sm23567398pfo.138.2019.07.16.18.29.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 18:29:17 -0700 (PDT)
Subject: [PATCH v2 4/4] tools: Add fchmodat4
Date: Tue, 16 Jul 2019 18:27:19 -0700
Message-Id: <20190717012719.5524-5-palmer@sifive.com>
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

I'm not sure why it's necessary to add this explicitly to tools/ as well
as arch/, but there were a few instances of fspick in here so I blindly
added fchmodat4 in the same fashion.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 tools/include/uapi/asm-generic/unistd.h           | 4 +++-
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index a87904daf103..36232ea94956 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -844,9 +844,11 @@ __SYSCALL(__NR_fsconfig, sys_fsconfig)
 __SYSCALL(__NR_fsmount, sys_fsmount)
 #define __NR_fspick 433
 __SYSCALL(__NR_fspick, sys_fspick)
+#define __NR_fchmodat4 434
+__SYSCALL(__NR_fchmodat4, sys_fchmodat4)
 
 #undef __NR_syscalls
-#define __NR_syscalls 434
+#define __NR_syscalls 435
 
 /*
  * 32 bit systems traditionally used different
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index b4e6f9e6204a..b92d5b195e66 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -355,6 +355,7 @@
 431	common	fsconfig		__x64_sys_fsconfig
 432	common	fsmount			__x64_sys_fsmount
 433	common	fspick			__x64_sys_fspick
+434	common	fchmodat4		__x64_sys_fchmodat4
 
 #
 # x32-specific system call numbers start at 512 to avoid cache impact
-- 
2.21.0

