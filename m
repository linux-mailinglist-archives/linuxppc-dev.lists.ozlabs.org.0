Return-Path: <linuxppc-dev+bounces-653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4996208D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtwjY17X3z2ywC;
	Wed, 28 Aug 2024 17:17:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824209;
	cv=none; b=IWvYbQcMNaiA/KTB9uMrsNdLa8lM+8vrdSiLTtEjgEHCSTP8CYH7L/b+IoSdiCk/V2IIgcuhKdEhkWPK+lwGa1obHRa5jLwIA0cNbgUMc7QD2wBijVrI/Au3zcTgG9E+lanS1ckQja1V8HKDWtWAIM1d3utnCGA429uXWD5oQM0bh8pQ3IybVQivSVZhemKu+3Vx0Lgxx+P/63sNxxWQjdAATR0xis158DLxgr8ij2aHrbKquUlD+6OhnfVb43Mr5rJYWdN41VoXaSuS6hHP8TQEKHzkuf9vqLDELqQGBKlWkLnGvwIYOIWo5819n4aoWnL0ayw3Geyr376n5mXsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824209; c=relaxed/relaxed;
	bh=mnBGdEXd1SbkXIrtxJgk/JDNcWExLMEwccaijei9Lbw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=KtN30hNOkESoWSRgic1U77EP8RTNpuLV5YgR7Wq03D8C1K46KglLQudLE2MgKkoR9yPkFKyHquJFtop64LtIdfpULTVQDQlTo3o7A+RCIdgq5984Jz4cSBPixwKRO8yeflscObmzpJgrYnLGOr9hEhc6PPfuAoZnGCpQ9FxkcPM2B7oU+KVnyoRCc6P/5zsBVeEhyP2Uf/rk3iC07mDmAV07mE6NsRkZRwi9TioCqQNy1gPHETn+LZJ7r7vegmhhz3mqe+qKcniX7h7XOVTe87rEtwDSMzdeOqYnPOHYN1+uA+e9yhn+RVXEa6p07TmJRF/39bk5Si3yueeLkYlZeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PMaRUmmr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PMaRUmmr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WttmK078tz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:50:09 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-204f52fe74dso5247605ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824207; x=1725429007; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnBGdEXd1SbkXIrtxJgk/JDNcWExLMEwccaijei9Lbw=;
        b=PMaRUmmrPEKsce+u1wXsd/WmahiOIItHjt7U74UdsU9jozsJZHIGKI7+gt8dvxXirq
         2DZ3WlEoAKldADi5s+1mhqU7FNC49BSB0Cjl76lG98CTSjtSxdXdSIc6crhZXzetUcEi
         tb2dElOoa7eApiRm3q0auQKK6GYf9zjAit5IxCXc7YhnGGFJwW/GthC57dVBq5lOdpb+
         IA+vnZqnxvItiJnVj6QxNRECf/XBCL0inpab4zgiOEOv9BU9a6yx3viMCiYMrNqmusVB
         d5aAg9YusOMMBGOsozYX9rRf7PxROr0GVDw22jFK9+gAHN4o5k5A3AKOvLVsh5nTtMOH
         8VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824207; x=1725429007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnBGdEXd1SbkXIrtxJgk/JDNcWExLMEwccaijei9Lbw=;
        b=DbwXLlbMJ+GZv04fyrtFjmRTkYRiA5mVP3fOUo0pXSdedo2Q72UQTtZ0ubm2NX+Rhz
         zq6hpyxhusfiUmdhOaLiY8ElAoatbUYmhsygTrWfyAU3EqoSUJs4ydWyXGygfoYSElm3
         JjiVr5XziYgzeQaPB3KrUA6cOIsmPw0JI+46ssQ4fOlk7vJgz23jmgYrDg9ANyZC0qIM
         WDRx0J7pSluF0Z4fKL4PJSmOh4AwNSmmZnTaLW9Rw6Jl8pNXzx5F21b3/MW6zPw36PxJ
         n+a1XMx6rcBApMlcrmcBddTsqzFTpjC7zq4slGIe9GfyCnreoThtN8yGJyq5WCLmDUrM
         LyVg==
X-Forwarded-Encrypted: i=1; AJvYcCXmtZL73AE/ZTg4oDKnSrrAUnuShkIcVnOvFszi5nhFjHuL/Yjzay3wVkxBEalbusn1CSuwOmdT+Knf7xI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrsJxFYZOvGWAf0zat00u67OQlg7NIFeMLwMVoBOIMOPTZKkE+
	YmPEO1BdAVutMRHR6kvKEz+MVGQzN3/dQjsVcprJqH0XHnm4jFYv2OHQGpgWB6M=
X-Google-Smtp-Source: AGHT+IEsQQCnEuxvR964+0rX/KlAEG5qqvky10H/EfSUq5MJAsWWGO7Ld//wKHkIp7XPnG+kf0G25w==
X-Received: by 2002:a17:902:cf07:b0:202:60e:7700 with SMTP id d9443c01a7336-204f9a548eemr12735035ad.7.1724824207147;
        Tue, 27 Aug 2024 22:50:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:18 -0700
Subject: [PATCH 12/16] parisc: mm: Support MAP_BELOW_HINT
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-12-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2500; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=RM+/CbqQAwiDfaQaSk6aR6JgRkcXqI3LycpAEGdsrx8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQl7j2395l162Zz3ULDsob8MjXdzJ1/bXx7d7Lq5e
 d+zLQfcO0pZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIAVaGfwp5ZTFJes0Kym85
 OvJO+pR7Lg+83rfo09z/TvfTNed8SmX4751+T74tYdaFrpd5nh9q5rfzOL+4IN+53YNdoEni27c
 l3AA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/parisc/include/uapi/asm/mman.h       | 1 +
 arch/parisc/kernel/sys_parisc.c           | 9 +++++++++
 tools/arch/parisc/include/uapi/asm/mman.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 68c44f99bc93..44925ef8ac44 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -26,6 +26,7 @@
 #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
 #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 #define MAP_UNINITIALIZED 0		/* uninitialized anonymous mmap */
+#define MAP_BELOW_HINT  0x200000	/* give out address that is below (inclusive) hint address */
 
 #define MS_SYNC		1		/* synchronous memory sync */
 #define MS_ASYNC	2		/* sync memory asynchronously */
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f7722451276e..feccb60cf746 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -148,6 +148,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(info.high_limit,
+					      (addr + len) - (STACK_TOP - mm->mmap_base));
 		addr = vm_unmapped_area(&info);
 		if (!(addr & ~PAGE_MASK))
 			return addr;
@@ -163,6 +170,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_upper_limit(NULL);
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	return vm_unmapped_area(&info);
 }
 
diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc/include/uapi/asm/mman.h
index 4cc88a642e10..297acc0f7b2a 100644
--- a/tools/arch/parisc/include/uapi/asm/mman.h
+++ b/tools/arch/parisc/include/uapi/asm/mman.h
@@ -40,4 +40,5 @@
 /* MAP_32BIT is undefined on parisc, fix it for perf */
 #define MAP_32BIT	0
 #define MAP_UNINITIALIZED	0
+#define MAP_BELOW_MAP	0x200000
 #endif

-- 
2.45.0


