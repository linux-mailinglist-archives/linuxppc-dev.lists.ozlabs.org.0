Return-Path: <linuxppc-dev+bounces-646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F450962081
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwhd1rbjz2yk7;
	Wed, 28 Aug 2024 17:17:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824186;
	cv=none; b=FFJ6k43RtbzcCkg9PJwxAsl0/4Ge7cS2qtHdpvZaqiGNenMJ6JnKNbib4ZO8BV/5CGfJ3ETcFZbt/ZSuhrweK+0fs/lHICivpqTT2Hz8fRY+dXsZe0xltEYWad7ztl/NjjM7aK2fEfAJpvhf82FDRXB8rUMgVDEJS53+QxvalZxKLhaDrs5qeKSl3N97fpPzvYZpnv0mdA1pD1GCnU3pq7995tztUHtKBpOStdNKtIaQD6yCnJ/FuQc9qFzlRb8BNscpA8mcsA4vQPBzd3blvatNwoN2DCDOAXUS18FwhklMkxEe3hNAgPzWC8Vi2q9g0krUvepy4oHOS0FLAR1AaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824186; c=relaxed/relaxed;
	bh=Q5srBcKEXlmg65Adrhp9lVjL7ktMhhBJWYWob6ko31g=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=TJ038FZqpjmNHcoOr5gb/dG/Rgca54UnGsgrxgtnLGvEFCqHH60cP7yX4cFypvYzpsaefk7zikFD4/ziwkheBuGgmc0l5e2iuZxuFZK7CTxPpgM+UmupQ5cenkRsSwqF6J/WmgQtaTJK6lXSB2fx/LVnS9tEwRE1vBUztv4E1wWMqkC7Z1aITR5oZ5M/HHXxS8anFgZjxVSx+YTvY7YG4Bsuh4ke3ktyUjDFNMoeZc+W6Ky2vYgp+zuFo1RXP08TAZ3yhM8jTxhpaM6rTjNkeu7Ceq4iwBXzILPBh15JgDOnIMgbN9/N1rvLTkBNjsmc7RG6aq3hmgQE3RlPWe+YDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mXES7vwf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mXES7vwf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttlt1KYvz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:46 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-202376301e6so49035285ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824183; x=1725428983; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5srBcKEXlmg65Adrhp9lVjL7ktMhhBJWYWob6ko31g=;
        b=mXES7vwfWLLqpllCvdAJ5SvaAA0dJL8Y0gVAU36cR5Ezw2Sr9yXLb2x78njOoia3JV
         SwtSOlP3wpw1bCvsE1KG6h2ttdrwM489z0TWBuOYyol2UcJN2N4Kll8TJxuwZnoOkuvJ
         vN6tqeYI1oaeVfGFJ/i57/A7sCVOKfHZSIbu80zDMN5+u7sxsYXMAqBgFdxoWgu3cYUv
         EQKTMTTiDBxHBVBoySpwebQ/3KK3ZvBZ1zalGLUUuHagF5piXAjtUmsoWJ5luboruTzb
         Vs3cLqXTSyuwLxZ45tAdAEdDF3NGE/vTvrCc3PGpR79ZqapzwcLIbDnDvqTmezC4eD28
         0nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824183; x=1725428983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5srBcKEXlmg65Adrhp9lVjL7ktMhhBJWYWob6ko31g=;
        b=XzFn3YbbgK3cWZQpKlDB41Uqw4rt6mjHNeSGvMJ7nEKNqiDAXitoFKun4G4mf7MDSH
         AIaRPWcmVm/11YFUQlyY+8tgbW5QMUp/GovyzC8ehISN060U9dhfUHnnKETyjm6y+5T2
         7piV011qIcUo46h1N8bkRYaY6nEklqleco5jXmOaK/zscXqSiaE43gSOw01c0FYtAEXd
         aSpN1vLuP7+QgYnHAfdAC/2klUQ3+INuRfP3S2vEx7NWf9WaI9LXP0LD/E/kdymJatmq
         4CNguatIw0zfLu8l/90kpVdnucmFHfhwfMrMtlHGc8vgxZ4W+MiFx3OB9r7tgaWWD/Mk
         dh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfXQTgqIrekX1656wIzwWzeLt9U+X8o+cIxP3LHzZao8FxwglKCnR8b9/RwcEMnRpU4k8Ct6R+plos99w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw/P4Gs6zhA27sUVKOvtV6H7HOEYeNgdpNYcQLbj9ykUTzXZjiN
	suks56pU/9dHivqYQOf6HCY9EVIwot1GDrocrdXqPV2dqg1o8ERDcKYCILk6ts4=
X-Google-Smtp-Source: AGHT+IGHu+eM9GywkA2KKhkiXH1gwQVKDtYtrmu0o3xp962KqVz7yKVZ3UFfIj7ogPOJug6LrKMhnQ==
X-Received: by 2002:a17:902:e54c:b0:1fb:3474:9500 with SMTP id d9443c01a7336-2039e4ab846mr148619915ad.27.1724824183237;
        Tue, 27 Aug 2024 22:49:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:11 -0700
Subject: [PATCH 05/16] riscv: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-5-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=921; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=h9Jl0isly8hfO1RunVOJNqZoeZvdanuDoXET0lufwJg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XXFHufOLGl2Wf1oQkLR82ZWndTOfPt314eCzeyv3r
 BZKWtO7oKOUhUGMg0FWTJGF51oDc+sd/bKjomUTYOawMoEMYeDiFICJNPxjZOjefGX9Tl/G6Irp
 nxS+dN0zOpEeMVEk78LzG1JnNgQw8RYzMpwwaro+TU52Snefw54npdeqTGoNrXMnik1KMY5Wjl7
 KxwgA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

When adding support for MAP_BELOW_HINT, the riscv implementation becomes
identical to the default implementation, so arch_get_mmap_base() and
arch_get_mmap_end() can be removed.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 7ff559bf46f2..20b4ba7d32be 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,16 +14,6 @@
 
 #include <asm/ptrace.h>
 
-#define arch_get_mmap_end(addr, len, flags)			\
-({								\
-	STACK_TOP_MAX;						\
-})
-
-#define arch_get_mmap_base(addr, len, base, flags)		\
-({								\
-	base;							\
-})
-
 #ifdef CONFIG_64BIT
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
 #define STACK_TOP_MAX		TASK_SIZE_64

-- 
2.45.0


