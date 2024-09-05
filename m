Return-Path: <linuxppc-dev+bounces-1069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C176096E4C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 23:16:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0BxG6bScz2yxj;
	Fri,  6 Sep 2024 07:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725570978;
	cv=none; b=cc3qwO4ExHuNYMboTNKuNOkv67tSIt/QcSHAMofiDeyu07K6D7f/083udQbbjRdCG57TjkDDk9/Yc9ZJbjviF7Fsh5lekLw4LIj9dYQ5GRTRP/JAXwYZnsyTSf+hCxcby2G75BfpBupFrvk2K9wtOUd3+E6vQevzanL4ZXYquy5JNiicrFT7jlfRHkrAe9CNzTuz4Kdl0nir8T/JJMYT5OlqK3OI2GQgl9e3XYd6qFHBGitENqgVfzG+TjoeDoSSr/0hfWinZMoe9QJDUpQ4HiSfJJGgPEiWlOsbFC6kLDN2TyIMbCIUExt56V4HPm9maCNQvaF30BoFZ8BEW+1hSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725570978; c=relaxed/relaxed;
	bh=f6U8xmtXOad/vlvI1PiwvXKTTO0WQVhDEUoOSf42FlI=;
	h=DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc; b=WNNpbAEyhD5270Zr/4p0YtBztgtZYxi/bHkPGKtrbnADlmY9dAL5DQOXgVIG7c+FpCgT0A/bkF3WHKZpbiQXZr7vt7ZM2kaHjvkrOBCHnHr/vmpqpy/6QEgYQjBcx5R4rOHSGbs44q0Z9dNM80OSU6bq9L0nwAjqLZJeWADbf+zyQzYtlqx8kNmF+TFpQR8kU0n2uHw4EDn97fA0IlXYc6b/DTKBxruWp7tjljECNgRG4x+4FKHip3DDRV8ouedAj5Dd0zqduXWY3RmlnAT5sSs2GMTDi7aGUc/CmdowvDZJvFFc/fGrpOqlWTYBXNkfpCyfeQVxDP/Lq76L7qtn/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=h4Y6Vyp5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=h4Y6Vyp5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0BxG4ggcz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 07:16:18 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-70b3b62025dso961585a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725570976; x=1726175776; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6U8xmtXOad/vlvI1PiwvXKTTO0WQVhDEUoOSf42FlI=;
        b=h4Y6Vyp5SyGR/juvy6+qKDRiq8KauLXUNIfgttjd9Rc8nHWAdmwTNuIzVC5mTOaC+S
         oCZcfIcqj5H3CjCqGW3zjwEk0BdKnD02ySBlH0NMD429/Ea7nxWszXVK4lHj4/sVeADH
         WiXalGc2xe+EvJDFb8pIwlD+wIEwxXP28U/tKxkRcUtN0/OfqmEjLryiJUF2S450frib
         p3PEOHUXg9IWPSIdTvisLkagu9wcZPwtj+Y4NhL3Hq+tRE8UHiQv5Hcqkm+3vP5qHlKs
         lnprnF0O10qnPgMlRO8d07N6iE/fzAVmsBPahAt7qQkgfPnmTKa5kRe9JvrjsJmU91aJ
         +3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725570976; x=1726175776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6U8xmtXOad/vlvI1PiwvXKTTO0WQVhDEUoOSf42FlI=;
        b=UOgnhOrDyzHuooGPCmfMIzjUM4hR6OOqVYWsb3GYD6SECea7MebnI1ZGqIWiH/j7O1
         QC0tr2poJHlmq+RpgK8RRSFNwBO8dBhjoXYdcqrHRnuuaoIcAjas/Pxmnb4JyrgSbOSe
         xlO10HTsd0sOaPWkZx9iZzQErEwpcehgccZK+ER4ZmfPT0oJ6h1pXipKi1AXSmuP5B5N
         yGTJq+ZxXcG82GSHxElLOW7kAn7Dv3NfpOKWm8H1Goxtztka3eHFQ81n07H8ciBi7VoW
         Hbm4BFFQ95YikQCMWjJ2hirfTIisHnwl4b2huVdF0sN9L1mmdcAn/cLkok1gyBbPeBXP
         lX/g==
X-Forwarded-Encrypted: i=1; AJvYcCWb6H6OVR+C2n2Lt3iJCZDtZ24F/iU2rAjQ9MD+YCjF9p5qJL3SZZg2iWTapBOiYreTXoVoDc37DTdDqGY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHfy+tV91G6NrlYiPeN0rAiduSQwC8ITvmFGoW/NWUp9cLO7VE
	8he04dVduWnO/fnfagAZvENud7t5JXr+QEGaOJQsw8Xod1P73/5TzHHpREiDpd4=
X-Google-Smtp-Source: AGHT+IHmMPDz3EnCCj73XeYdf9AhtZ+Ct4KejhsVi5dvIA4rh768bjpktZjdCxUayXeGPhLE3R+w8Q==
X-Received: by 2002:a05:6358:4287:b0:1b5:be34:9ad5 with SMTP id e5c5f4694b2df-1b83866e08bmr73366455d.15.1725570975653;
        Thu, 05 Sep 2024 14:16:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbda7abesm3775746a12.61.2024.09.05.14.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 14:16:14 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 05 Sep 2024 14:15:51 -0700
Subject: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47
 bits
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
Message-Id: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
In-Reply-To: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
 "Kirill A. Shutemov" <kirill@shutemov.name>, 
 Chris Torek <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=B2nFsYQPUa93R6MPC6rybC4BjlmBU89eB/xyA3tmSh8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9ot+em/OZQnfrnX8ed38Mt7a5qeTLghH2JpoLVOM/lWE
 E9Dee3VjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbS9pyRoX//nRvvVlydp7Xm
 8/1ihzrxA51eb31tEvRWPpi166jgtMMM/2Pui4Sr/NDPPh503bbDcC77kZANfKUH/kz3LrfLiU2
 exg4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Create a personality flag ADDR_LIMIT_47BIT to support applications
that wish to transition from running in environments that support at
most 47-bit VAs to environments that support larger VAs. This
personality can be set to cause all allocations to be below the 47-bit
boundary. Using MAP_FIXED with mmap() will bypass this restriction.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/uapi/linux/personality.h | 1 +
 mm/mmap.c                        | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
index 49796b7756af..cd3b8c154d9b 100644
--- a/include/uapi/linux/personality.h
+++ b/include/uapi/linux/personality.h
@@ -22,6 +22,7 @@ enum {
 	WHOLE_SECONDS =		0x2000000,
 	STICKY_TIMEOUTS	=	0x4000000,
 	ADDR_LIMIT_3GB = 	0x8000000,
+	ADDR_LIMIT_47BIT = 	0x10000000,
 };
 
 /*
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..a5c7544853e5 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1766,6 +1766,9 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 {
 	unsigned long addr;
 
+	if (current->personality & ADDR_LIMIT_47BIT)
+		info->high_limit = MIN(info->high_limit, BIT(47) - 1);
+
 	if (info->flags & VM_UNMAPPED_AREA_TOPDOWN)
 		addr = unmapped_area_topdown(info);
 	else

-- 
2.45.0


