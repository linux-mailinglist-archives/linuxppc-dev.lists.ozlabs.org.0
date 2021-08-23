Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 977773F470B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 11:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtR6x3jW8z2yJX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 19:01:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244; helo=10.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 10.mo52.mail-out.ovh.net (10.mo52.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtR6R4WKHz2xfG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 19:00:47 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A4803290990;
 Mon, 23 Aug 2021 11:00:42 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 23 Aug
 2021 11:00:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003b42d35a6-e6aa-4550-a6d0-b0a15466c2c4,
 6C3DA580BFD2A03B9CD9C7EDF86CA127720438B1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/2] powerpc/compat_sys: Declare syscalls
Date: Mon, 23 Aug 2021 11:00:39 +0200
Message-ID: <20210823090039.166120-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823090039.166120-1-clg@kaod.org>
References: <20210823090039.166120-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8252262d-1bc2-49ca-9097-abe62e7f30d7
X-Ovh-Tracer-Id: 7186056157125250016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a compile error with W=1.

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/syscalls.h | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 398171fdcd9f..7ee66ae5444d 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -6,6 +6,7 @@
 #include <linux/compiler.h>
 #include <linux/linkage.h>
 #include <linux/types.h>
+#include <linux/compat.h>
 
 struct rtas_args;
 
@@ -18,5 +19,34 @@ asmlinkage long sys_mmap2(unsigned long addr, size_t len,
 asmlinkage long ppc64_personality(unsigned long personality);
 asmlinkage long sys_rtas(struct rtas_args __user *uargs);
 
+#ifdef CONFIG_COMPAT
+unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
+			       unsigned long prot, unsigned long flags,
+			       unsigned long fd, unsigned long pgoff);
+
+compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
+				  u32 reg6, u32 pos1, u32 pos2);
+
+compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf, compat_size_t count,
+				   u32 reg6, u32 pos1, u32 pos2);
+
+compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u32 count);
+
+int compat_sys_truncate64(const char __user *path, u32 reg4,
+			  unsigned long len1, unsigned long len2);
+
+long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u32 len1, u32 len2);
+
+int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
+			   unsigned long len2);
+
+long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
+		     size_t len, int advice);
+
+long compat_sys_sync_file_range2(int fd, unsigned int flags,
+				 unsigned int offset1, unsigned int offset2,
+				 unsigned int nbytes1, unsigned int nbytes2);
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_SYSCALLS_H */
-- 
2.31.1

