Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9BD8407C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 15:03:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNqlB0pYpz3cSH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 01:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 948 seconds by postgrey-1.37 at boromir; Tue, 30 Jan 2024 01:02:53 AEDT
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNqkj1LRjz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:02:49 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TNqMD0tZpz1xmlw;
	Mon, 29 Jan 2024 21:46:00 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E5831A016D;
	Mon, 29 Jan 2024 21:46:58 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 21:46:55 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, Robin
 Murphy <robin.murphy@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Alexander Viro
	<viro@zeniv.linux.org.uk>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v10 1/6] uaccess: add generic fallback version of copy_mc_to_user()
Date: Mon, 29 Jan 2024 21:46:47 +0800
Message-ID: <20240129134652.4004931-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129134652.4004931-1-tongtiangen@huawei.com>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

x86/powerpc has it's implementation of copy_mc_to_user(), we add generic
fallback in include/linux/uaccess.h prepare for other architechures to
enable CONFIG_ARCH_HAS_COPY_MC.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 1 +
 arch/x86/include/asm/uaccess.h     | 1 +
 include/linux/uaccess.h            | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index f1f9890f50d3..4bfd1e6f0702 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -381,6 +381,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 
 	return n;
 }
+#define copy_mc_to_user copy_mc_to_user
 #endif
 
 extern long __copy_from_user_flushcache(void *dst, const void __user *src,
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 5c367c1290c3..fd56282ee9a8 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -497,6 +497,7 @@ copy_mc_to_kernel(void *to, const void *from, unsigned len);
 
 unsigned long __must_check
 copy_mc_to_user(void __user *to, const void *from, unsigned len);
+#define copy_mc_to_user copy_mc_to_user
 #endif
 
 /*
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 3064314f4832..550287c92990 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -205,6 +205,15 @@ copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
 }
 #endif
 
+#ifndef copy_mc_to_user
+static inline unsigned long __must_check
+copy_mc_to_user(void *dst, const void *src, size_t cnt)
+{
+	check_object_size(src, cnt, true);
+	return raw_copy_to_user(dst, src, cnt);
+}
+#endif
+
 static __always_inline void pagefault_disabled_inc(void)
 {
 	current->pagefault_disabled++;
-- 
2.25.1

