Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4221D4769
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 09:53:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ngdv6HPnzDr2g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 17:53:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eaVvs3iG; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NgcN4mYhzDqwv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 17:52:34 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id j145so1457807oib.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TWyNPE49i3YWKaExG0H25/93wc8S2iD+z9uDvSo3CCM=;
 b=eaVvs3iGYODhchsSRGwSbahgr4n+n9UMkSWxWIhzySQ553ZyG/H4BgJn7rgh2CeFNd
 eth7nsuC+iFK8PAZIx2xjZthikL1Y12dTFx8A2f++mIT0oJsPVbplDXxIUUSk47aTnFZ
 evznm9wZh/fhqIiO2nZHXexCnPIQWJ/VfD8o/O3F0T/fYwVqkC8iVjFZ4aatijsVZ4a1
 jHXMTGgQSj6P0ZbIF1lpqWIXFWHWiNd74HmnCrqYKm/Gwz8LBa/0sqZ0HYRm5sVVujbo
 FyhMCy5SqaeAZEpy5zvwHT8v+WoTi0RVPGozVA5RFW6il8yvFvkbwNwuptJdDzGdlvdy
 wmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TWyNPE49i3YWKaExG0H25/93wc8S2iD+z9uDvSo3CCM=;
 b=H/YEgckfVgTCUbLGsvHsHqMtoGCEVAEwoyEe5LwAozG/ZtEcyT76SgHO++1LLgz2U3
 qWtKWrXHLtsD3nQxXwZqim6wFrItwKHdbPhs7kL72bmIYpBo8peHtXl3DPjy0U9kpL9T
 MohmPI7J64yCsty2M764UGo3KMzKbqXN7JD3t3IjOXskX2E60j4FiWFF8nBN2ULYMmKl
 rvRl34LigWFcFR1fJ5H78rPT1D1RuEMUtfzgn+Uk7imT18ONdaGJ9iRGVHE55DYMexXR
 MA88Uy1AHsOopjt1JcKS4jXhB6y06nUeEGO/e03HSfoN2Y0ZpAT6w6+JlK7//jvQB8M3
 3wnQ==
X-Gm-Message-State: AOAM532JL81J0LOvaLv8adcAc3l9Kl8mSsHZ5oFVUP0Nqm6r2y5RTh1R
 VffXAPT0PpibWoigCDpgz+pQv8vfcakgSqP2dJM=
X-Google-Smtp-Source: ABdhPJx4lbZ9De3aHGzoCzfsNbotrDS48NnZQXuoW36jMAlxGwfA9Conn9lk6/eP/T2IG12nKS6sGQ917uypNv1hwas=
X-Received: by 2002:aca:d6c1:: with SMTP id n184mr1201804oig.126.1589529151050; 
 Fri, 15 May 2020 00:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-24-jniethe5@gmail.com>
 <56ca6bcb-c719-a049-63b0-aae73023bde5@csgroup.eu>
 <871rnmasnn.fsf@mpe.ellerman.id.au>
In-Reply-To: <871rnmasnn.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 15 May 2020 17:52:19 +1000
Message-ID: <CACzsE9qLSr3yJZG-_P5dVwxw94amv+ASVCq9en6whV8Kvo3Fig@mail.gmail.com>
Subject: Re: [PATCH v8 23/30] powerpc: Add prefixed instructions to
 instruction data type
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey mpe, fixes for the issues highlighted by Christophe, except KUAP
as discussed. Will make the optprobe change as a preceding patch.

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -11,9 +11,9 @@

 struct ppc_inst {
     u32 val;
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
     u32 suffix;
-#endif /* __powerpc64__ */
+#endif /* CONFIG_PPC64 */
 } __packed;

 static inline u32 ppc_inst_val(struct ppc_inst x)
@@ -26,7 +26,7 @@ static inline int ppc_inst_primary_opcode(struct ppc_inst x)
     return get_op(ppc_inst_val(x));
 }

-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 #define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })

 #define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
@@ -52,7 +52,7 @@ static inline struct ppc_inst ppc_inst_read(const
struct ppc_inst *ptr)
     u32 val, suffix;

     val = *(u32 *)ptr;
-    if ((val >> 26) == 1) {
+    if ((get_op(val)) == OP_PREFIX) {
         suffix = *((u32 *)ptr + 1);
         return ppc_inst_prefix(val, suffix);
     } else {
@@ -94,7 +94,7 @@ static inline bool ppc_inst_equal(struct ppc_inst x,
struct ppc_inst y)
     return ppc_inst_val(x) == ppc_inst_val(y);
 }

-#endif /* __powerpc64__ */
+#endif /* CONFIG_PPC64 */

 static inline int ppc_inst_len(struct ppc_inst x)
 {
diff --git a/arch/powerpc/include/asm/uaccess.h
b/arch/powerpc/include/asm/uaccess.h
index e9027b3c641a..ac36a82321d4 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -105,7 +105,7 @@ static inline int __access_ok(unsigned long addr,
unsigned long size,
 #define __put_user_inatomic(x, ptr) \
     __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))

-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 #define __get_user_instr(x, ptr)            \
 ({                            \
     long __gui_ret = 0;                \
@@ -113,7 +113,7 @@ static inline int __access_ok(unsigned long addr,
unsigned long size,
     struct ppc_inst __gui_inst;            \
     unsigned int prefix, suffix;            \
     __gui_ret = __get_user(prefix, (unsigned int __user *)__gui_ptr);    \
-    if (!__gui_ret && (prefix >> 26) == OP_PREFIX) {    \
+    if (!__gui_ret && (get_op(prefix)) == OP_PREFIX) {    \
         __gui_ret = __get_user(suffix,        \
                        (unsigned int __user *)__gui_ptr + 1);    \
         __gui_inst = ppc_inst_prefix(prefix, suffix);    \
@@ -131,7 +131,7 @@ static inline int __access_ok(unsigned long addr,
unsigned long size,
     struct ppc_inst __gui_inst;            \
     unsigned int prefix, suffix;            \
     __gui_ret = __get_user_inatomic(prefix, (unsigned int __user
*)__gui_ptr);    \
-    if (!__gui_ret && (prefix >> 26) == OP_PREFIX) {    \
+    if (!__gui_ret && (get_op(prefix)) == OP_PREFIX) {    \
         __gui_ret = __get_user_inatomic(suffix,    \
                         (unsigned int __user *)__gui_ptr + 1);    \
         __gui_inst = ppc_inst_prefix(prefix, suffix);    \
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index a8e66603d12b..3ac105e7faae 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -283,10 +283,8 @@ int arch_prepare_optimized_kprobe(struct
optimized_kprobe *op, struct kprobe *p)
      * 3. load instruction to be emulated into relevant register, and
      */
     temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
-    patch_imm64_load_insns(ppc_inst_val(temp) |
-                   ((u64)ppc_inst_suffix(temp) << 32),
-                   4,
-                   buff + TMPL_INSN_IDX);
+    patch_imm64_load_insns(ppc_inst_val(temp) |
((u64)ppc_inst_suffix(temp) << 32),
+                   4, buff + TMPL_INSN_IDX);

     /*
      * 4. branch back from trampoline
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 58b67b62d5d3..bfd4e1dae0fb 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -26,8 +26,6 @@ static int __patch_instruction(struct ppc_inst
*exec_addr, struct ppc_inst instr

     if (!ppc_inst_prefixed(instr)) {
         __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
-        if (err)
-            return err;
     } else {
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
         __put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
@@ -36,12 +34,13 @@ static int __patch_instruction(struct ppc_inst
*exec_addr, struct ppc_inst instr
         __put_user_asm((u64)ppc_inst_val(instr) << 32 |
                    ppc_inst_suffix(instr), patch_addr, err, "std");
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
-        if (err)
-            return err;
     }
+    if (err)
+        return err;

     asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
                                 "r" (exec_addr));
+
     return 0;
 }

diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
index e5e589994097..3c3851ffdb36 100644
--- a/arch/powerpc/lib/inst.c
+++ b/arch/powerpc/lib/inst.c
@@ -7,7 +7,7 @@
 #include <linux/uaccess.h>
 #include <asm/inst.h>

-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 int probe_user_read_inst(struct ppc_inst *inst,
              struct ppc_inst *nip)
 {
@@ -17,9 +17,8 @@ int probe_user_read_inst(struct ppc_inst *inst,
     err = probe_user_read(&val, nip, sizeof(val));
     if (err)
         return err;
-    if ((val >> 26) == OP_PREFIX) {
-        err = probe_user_read(&suffix, (void *)nip + 4,
-                      sizeof(unsigned int));
+    if (get_op(val) == OP_PREFIX) {
+        err = probe_user_read(&suffix, (void *)nip + 4, 4);
         *inst = ppc_inst_prefix(val, suffix);
     } else {
         *inst = ppc_inst(val);
@@ -36,9 +35,8 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
     err = probe_kernel_read(&val, src, sizeof(val));
     if (err)
         return err;
-    if ((val >> 26) == OP_PREFIX) {
-        err = probe_kernel_read(&suffix, (void *)src + 4,
-                    sizeof(unsigned int));
+    if (get_op(val) == OP_PREFIX) {
+        err = probe_kernel_read(&suffix, (void *)src + 4, 4);
         *inst = ppc_inst_prefix(val, suffix);
     } else {
         *inst = ppc_inst(val);
@@ -67,4 +65,4 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
     *inst = ppc_inst(val);
     return err;
 }
-#endif /* __powerpc64__ */
+#endif /* CONFIG_PPC64 */
-- 
2.17.1
