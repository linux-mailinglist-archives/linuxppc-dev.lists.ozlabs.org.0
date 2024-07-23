Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0A939C14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 09:57:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSqJC3CkRz3fnF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 17:57:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huaweicloud.com (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=zhengyejian@huaweicloud.com; receiver=lists.ozlabs.org)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnng4Mjkz3cbW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:49:43 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WSnNz71Hjz4f3lDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 14:31:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 7DF781A1417
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 14:32:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP2 (Coremail) with SMTP id Syh0CgA34wpOTp9mjImuAw--.48686S4;
	Tue, 23 Jul 2024 14:32:01 +0800 (CST)
From: Zheng Yejian <zhengyejian@huaweicloud.com>
To: masahiroy@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	mcgrof@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kent.overstreet@linux.dev,
	james.clark@arm.com,
	jpoimboe@kernel.org
Subject: [PATCH v2 2/5] module: kallsyms: Determine exact function size
Date: Tue, 23 Jul 2024 14:32:55 +0800
Message-Id: <20240723063258.2240610-3-zhengyejian@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgA34wpOTp9mjImuAw--.48686S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZr47Wry3tF4UAr4xKw47twb_yoW5Ary5pF
	45Ar4rGF48Xr47uFWxAay09ry5Gr1kur4UKasxK34fZFnIqFy093Z7t3y5C3s8Zr48GF18
	JrnagFWakF4UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjTRC2NtUUUUU
X-CM-SenderInfo: x2kh0w51hmxt3q6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Tue, 23 Jul 2024 17:56:45 +1000
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
Cc: zhengyejian@huaweicloud.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a weak type function is overridden, its symbol will be removed
from the symbol table, but its code will not been removed. It will
cause find_kallsyms_symbol() to compute a larger function size than
it actually is, just because symbol of its following weak function is
removed.

To fix this issue, check that given address is within the size of
the function found.

Signed-off-by: Zheng Yejian <zhengyejian@huaweicloud.com>
---
 include/linux/module.h   |  7 +++++++
 kernel/module/kallsyms.c | 19 +++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 4213d8993cd8..0299d79433ae 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -599,6 +599,13 @@ static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
 }
 #endif
 
+#ifndef HAVE_ARCH_KALLSYMS_SYMBOL_TYPE
+static inline unsigned int kallsyms_symbol_type(const Elf_Sym *sym)
+{
+	return ELF_ST_TYPE(sym->st_info);
+}
+#endif
+
 /* FIXME: It'd be nice to isolate modules during init, too, so they
    aren't used before they (may) fail.  But presently too much code
    (IDE & SCSI) require entry into the module during init.*/
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index bf65e0c3c86f..cce4f81b9933 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -262,6 +262,7 @@ static const char *find_kallsyms_symbol(struct module *mod,
 	unsigned long nextval, bestval;
 	struct mod_kallsyms *kallsyms = rcu_dereference_sched(mod->kallsyms);
 	struct module_memory *mod_mem;
+	const Elf_Sym *sym;
 
 	/* At worse, next value is at end of module */
 	if (within_module_init(addr, mod))
@@ -278,9 +279,10 @@ static const char *find_kallsyms_symbol(struct module *mod,
 	 * starts real symbols at 1).
 	 */
 	for (i = 1; i < kallsyms->num_symtab; i++) {
-		const Elf_Sym *sym = &kallsyms->symtab[i];
-		unsigned long thisval = kallsyms_symbol_value(sym);
+		unsigned long thisval;
 
+		sym = &kallsyms->symtab[i];
+		thisval = kallsyms_symbol_value(sym);
 		if (sym->st_shndx == SHN_UNDEF)
 			continue;
 
@@ -292,6 +294,13 @@ static const char *find_kallsyms_symbol(struct module *mod,
 		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
 			continue;
 
+		if (kallsyms_symbol_type(sym) == STT_FUNC &&
+		    addr >= thisval && addr < thisval + sym->st_size) {
+			best = i;
+			bestval = thisval;
+			nextval = thisval + sym->st_size;
+			goto found;
+		}
 		if (thisval <= addr && thisval > bestval) {
 			best = i;
 			bestval = thisval;
@@ -303,6 +312,12 @@ static const char *find_kallsyms_symbol(struct module *mod,
 	if (!best)
 		return NULL;
 
+	sym = &kallsyms->symtab[best];
+	if (kallsyms_symbol_type(sym) == STT_FUNC && sym->st_size &&
+	    addr >= kallsyms_symbol_value(sym) + sym->st_size)
+		return NULL;
+
+found:
 	if (size)
 		*size = nextval - bestval;
 	if (offset)
-- 
2.25.1

