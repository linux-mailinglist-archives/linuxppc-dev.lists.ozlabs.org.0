Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A22461BCD3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 22:15:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BXvX1vXpzDqtd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 06:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BXrj2wcLzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 06:13:08 +1000 (AEST)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MDPqi-1jMP2o3Hzq-00ATWb; Tue, 28 Apr 2020 22:12:36 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] fixup! signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Date: Tue, 28 Apr 2020 21:56:26 +0200
Message-Id: <20200428195645.1365019-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200428074827.GA19846@lst.de>
References: <20200428074827.GA19846@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BfAvDKI9SSwe2+766/MLLDP63p+G4VcCD7Yw0qKaGd8OUqaUT93
 dwH8xVn4vZsTRFeogGQBryDkMAtZhL/IwptYefT+c2aXPjcEz5uTnU2EG4jQFqC7tXJu6aI
 zCBIqYyBnd7fw9eQBUeGBrjuXIv5c7SEEMf1FJ2sh6kYQdnfTdA0fGrL+AZjCrwKtkdpY6R
 90AVtj8sxaI5oar4YkYug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1tDfrCfOWcg=:ovEhwjJ6ujR0mMOB5D8EOH
 B5zD5kobkoVigp1N2g4eMDKMxOSadhJbGhdEw0CQVDJ1vkyvIv6W+pSeWcNE66pBl4VBGQ/c/
 bS74pjPam9DQBuT9Y5m2o7J92y8bl98lMWvWSG3m6vh3sE0G5BsPXMP4yPxDL8Qsgxfn2FZQX
 6VZORuKsnB4wTAt5gaJTP7b0LoUuz4jt+GQhpbRiSyMqyxCPVtstT8DZ1oL8leQ6gzgO3hHli
 2WNSw3PeHQT2e8gQamUauF1zfzvEq1ofp4di5MHNGvDGdQJWJJHk4XR+5JYvcI6N70d2HFt2/
 8bgn3YwxpkfetX3aJdVazMk9L6u4q+QbyEW2c27f9EFLLduOeAsAB7aikO//xxpt+7AUAPZhc
 sDjYu7kiv6OtK006xBC3w3qdcyoYJVCvI2Ce3FscGMbXbs/JKKeZU7iRGvpcNZe/+EuDcz77n
 /FAI6PG5Bhosqa1rIuEvqljEvQSxMU13CxliZJjllvYWIyaSmUMyfksAxzmxkqaFCmxWA6TuU
 PKZ4dgBLueswpTEfvx61h9RbqlJgedfW9UQkUrKzDSy5b5V5D0f3FYeE9LaRJ1miBotCfHkys
 /krTikRNKotidsbOYcjjwzxVclZZaY1h0Ji+ypppPVvqHaxqOwXKQo1r1Nr3EIbr4iOuQgr/W
 HYpHhTAHcVkyfQ6e2CSlaLXFjSuNiaPcDSd/RV1Wc2yFXrLdoIvFk2SXacgY3mr6Iu4mB4Glt
 tdEgJv/7xdpAsIUqVwsx42CGS71Mr5aVOmQsOuBw1/BDPITZyd2WFgQNVJsIOHtZ82TlWg2SG
 ec3W+ApX2f478booY6auUhabsLFhMrGLs2P0XdFUENiaJqXPTk=
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jeremy Kerr <jk@ozlabs.org>,
 linux-kernel@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I think I found a way to improve the x32 handling:

This is a simplification over Christoph's "[PATCH 2/7] signal: factor
copy_siginfo_to_external32 from copy_siginfo_to_user32", reducing the
x32 specifics in the common code to a single #ifdef/#endif check, in
order to keep it more readable for everyone else.

Christoph, if you like it, please fold into your patch.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jeremy Kerr <jk@ozlabs.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/compat.h | 10 ++++++++++
 arch/x86/kernel/signal.c      | 23 +++++++++++++++++++++++
 kernel/signal.c               | 15 ++-------------
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 52e9f3480f69..9341ea3da757 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -214,7 +214,17 @@ static inline bool in_compat_syscall(void)
 #endif
 
 struct compat_siginfo;
+#ifdef CONFIG_X86_X32_ABI
 int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
 		const kernel_siginfo_t *from, bool x32_ABI);
+#else
+int copy_siginfo_to_user32(struct compat_siginfo __user *to,
+		const kernel_siginfo_t *from);
+static inline int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
+		const kernel_siginfo_t *from, bool x32_ABI)
+{
+	return copy_siginfo_to_user32(to, from);
+}
+#endif
 
 #endif /* _ASM_X86_COMPAT_H */
diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index 83b74fb38c8f..0e166571d28b 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -511,6 +511,29 @@ static int __setup_rt_frame(int sig, struct ksignal *ksig,
 }
 #endif /* CONFIG_X86_32 */
 
+#ifdef CONFIG_X86_X32_ABI
+int copy_siginfo_to_user32(struct compat_siginfo __user *to,
+			   const struct kernel_siginfo *from)
+{
+	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
+}
+
+int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
+			     const struct kernel_siginfo *from, bool x32_ABI)
+{
+	struct compat_siginfo new;
+
+	copy_siginfo_to_external32(&new, from);
+	if (x32_ABI && from->si_signo == SIGCHLD) {
+		new._sifields._sigchld_x32._utime = from->si_utime;
+		new._sifields._sigchld_x32._stime = from->si_stime;
+	}
+	if (copy_to_user(to, &new, sizeof(struct compat_siginfo)))
+		return -EFAULT;
+	return 0;
+}
+#endif
+
 static int x32_setup_rt_frame(struct ksignal *ksig,
 			      compat_sigset_t *set,
 			      struct pt_regs *regs)
diff --git a/kernel/signal.c b/kernel/signal.c
index 1a81602050b4..935facca4860 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3318,29 +3318,18 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
 	}
 }
 
+#ifndef CONFIG_X86_X32_ABI
 int copy_siginfo_to_user32(struct compat_siginfo __user *to,
 			   const struct kernel_siginfo *from)
-#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
-{
-	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
-}
-int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
-			     const struct kernel_siginfo *from, bool x32_ABI)
-#endif
 {
 	struct compat_siginfo new;
 
 	copy_siginfo_to_external32(&new, from);
-#ifdef CONFIG_X86_X32_ABI
-	if (x32_ABI && from->si_signo == SIGCHLD) {
-		new._sifields._sigchld_x32._utime = from->si_utime;
-		new._sifields._sigchld_x32._stime = from->si_stime;
-	}
-#endif
 	if (copy_to_user(to, &new, sizeof(struct compat_siginfo)))
 		return -EFAULT;
 	return 0;
 }
+#endif
 
 static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
 					 const struct compat_siginfo *from)
-- 
2.26.0

