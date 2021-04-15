Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398D360662
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 12:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLZg90CXDz3c0g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 20:03:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=jianlin.lv@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FLZ041X5zz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 19:33:22 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6837612FC;
 Thu, 15 Apr 2021 02:33:19 -0700 (PDT)
Received: from net-arm-thunderx2-02.shanghai.arm.com
 (net-arm-thunderx2-02.shanghai.arm.com [10.169.208.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2ACE53F694;
 Thu, 15 Apr 2021 02:33:01 -0700 (PDT)
From: Jianlin Lv <Jianlin.Lv@arm.com>
To: bpf@vger.kernel.org
Subject: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
Date: Thu, 15 Apr 2021 17:32:49 +0800
Message-Id: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Apr 2021 20:03:30 +1000
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
Cc: irogers@google.com, songliubraving@fb.com, catalin.marinas@arm.com,
 linux-doc@vger.kernel.org, zlim.lnx@gmail.com, paul.walmsley@sifive.com,
 ast@kernel.org, andrii@kernel.org, paulus@samba.org, sandipan@linux.ibm.com,
 hpa@zytor.com, sparclinux@vger.kernel.org, illusionist.neo@gmail.com,
 maheshb@google.com, will@kernel.org, nicolas.dichtel@6wind.com,
 linux-s390@vger.kernel.org, iii@linux.ibm.com, paulburton@kernel.org,
 corbet@lwn.net, mchehab+huawei@kernel.org, masahiroy@kernel.org,
 x86@kernel.org, john.fastabend@gmail.com, linux@armlinux.org.uk,
 linux-riscv@lists.infradead.org, borntraeger@de.ibm.com, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, naveen.n.rao@linux.ibm.com,
 kuba@kernel.org, tklauser@distanz.ch, linux-mips@vger.kernel.org,
 grantseltzer@gmail.com, xi.wang@gmail.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, gor@linux.ibm.com, luke.r.nels@gmail.com,
 linux-kernel@vger.kernel.org, hca@linux.ibm.com, kpsingh@kernel.org,
 iecedge@gmail.com, horms@verge.net.au, bp@alien8.de, viro@zeniv.linux.org.uk,
 yhs@fb.com, Jianlin.Lv@arm.com, tglx@linutronix.de, dvyukov@google.com,
 tsbogend@alpha.franken.de, daniel@iogearbox.net, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, udknight@gmail.com, kafai@fb.com,
 bjorn@kernel.org, palmer@dabbelt.com, quentin@isovalent.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For debugging JITs, dumping the JITed image to kernel log is discouraged,
"bpftool prog dump jited" is much better way to examine JITed dumps.
This patch get rid of the code related to bpf_jit_enable=2 mode and
update the proc handler of bpf_jit_enable, also added auxiliary
information to explain how to use bpf_jit_disasm tool after this change.

Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
---
 arch/arm/net/bpf_jit_32.c         |  4 ----
 arch/arm64/net/bpf_jit_comp.c     |  4 ----
 arch/mips/net/bpf_jit.c           |  4 ----
 arch/mips/net/ebpf_jit.c          |  4 ----
 arch/powerpc/net/bpf_jit_comp.c   | 10 ----------
 arch/powerpc/net/bpf_jit_comp64.c | 11 -----------
 arch/riscv/net/bpf_jit_core.c     |  3 ---
 arch/s390/net/bpf_jit_comp.c      |  4 ----
 arch/sparc/net/bpf_jit_comp_32.c  |  3 ---
 arch/sparc/net/bpf_jit_comp_64.c  | 13 -------------
 arch/x86/net/bpf_jit_comp.c       |  3 ---
 arch/x86/net/bpf_jit_comp32.c     |  3 ---
 net/core/sysctl_net_core.c        | 14 +++-----------
 tools/bpf/bpf_jit_disasm.c        |  2 +-
 tools/bpf/bpftool/feature.c       |  3 ---
 15 files changed, 4 insertions(+), 81 deletions(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 897634d0a67c..92d669c0b2d3 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1997,10 +1997,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	}
 	flush_icache_range((u32)header, (u32)(ctx.target + ctx.idx));
 
-	if (bpf_jit_enable > 1)
-		/* there are 2 passes here */
-		bpf_jit_dump(prog->len, image_size, 2, ctx.target);
-
 	bpf_jit_binary_lock_ro(header);
 	prog->bpf_func = (void *)ctx.target;
 	prog->jited = 1;
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index f7b194878a99..a13b83ac4ca8 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1090,10 +1090,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		goto out_off;
 	}
 
-	/* And we're done. */
-	if (bpf_jit_enable > 1)
-		bpf_jit_dump(prog->len, prog_size, 2, ctx.image);
-
 	bpf_flush_icache(header, ctx.image + ctx.idx);
 
 	if (!prog->is_func || extra_pass) {
diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index 0af88622c619..b5221282dd88 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -1250,10 +1250,6 @@ void bpf_jit_compile(struct bpf_prog *fp)
 	/* Update the icache */
 	flush_icache_range((ptr)ctx.target, (ptr)(ctx.target + ctx.idx));
 
-	if (bpf_jit_enable > 1)
-		/* Dump JIT code */
-		bpf_jit_dump(fp->len, alloc_size, 2, ctx.target);
-
 	fp->bpf_func = (void *)ctx.target;
 	fp->jited = 1;
 
diff --git a/arch/mips/net/ebpf_jit.c b/arch/mips/net/ebpf_jit.c
index 939dd06764bc..dac5a1fc2462 100644
--- a/arch/mips/net/ebpf_jit.c
+++ b/arch/mips/net/ebpf_jit.c
@@ -1910,10 +1910,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	flush_icache_range((unsigned long)ctx.target,
 			   (unsigned long)&ctx.target[ctx.idx]);
 
-	if (bpf_jit_enable > 1)
-		/* Dump JIT code */
-		bpf_jit_dump(prog->len, image_size, 2, ctx.target);
-
 	bpf_jit_binary_lock_ro(header);
 	prog->bpf_func = (void *)ctx.target;
 	prog->jited = 1;
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index e809cb5a1631..ebca629de2d1 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -646,18 +646,8 @@ void bpf_jit_compile(struct bpf_prog *fp)
 		bpf_jit_build_prologue(fp, code_base, &cgctx);
 		bpf_jit_build_body(fp, code_base, &cgctx, addrs);
 		bpf_jit_build_epilogue(code_base, &cgctx);
-
-		if (bpf_jit_enable > 1)
-			pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
-				proglen - (cgctx.idx * 4), cgctx.seen);
 	}
 
-	if (bpf_jit_enable > 1)
-		/* Note that we output the base address of the code_base
-		 * rather than image, since opcodes are in code_base.
-		 */
-		bpf_jit_dump(flen, proglen, pass, code_base);
-
 	bpf_flush_icache(code_base, code_base + (proglen/4));
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index aaf1a887f653..26243399ef2e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -1215,20 +1215,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		bpf_jit_build_prologue(code_base, &cgctx);
 		bpf_jit_build_body(fp, code_base, &cgctx, addrs, extra_pass);
 		bpf_jit_build_epilogue(code_base, &cgctx);
-
-		if (bpf_jit_enable > 1)
-			pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
-				proglen - (cgctx.idx * 4), cgctx.seen);
 	}
 
 skip_codegen_passes:
-	if (bpf_jit_enable > 1)
-		/*
-		 * Note that we output the base address of the code_base
-		 * rather than image, since opcodes are in code_base.
-		 */
-		bpf_jit_dump(flen, proglen, pass, code_base);
-
 #ifdef PPC64_ELF_ABI_v1
 	/* Function descriptor nastiness: Address + TOC */
 	((u64 *)image)[0] = (u64)code_base;
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 3630d447352c..856b84fb3947 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -142,9 +142,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	}
 	bpf_jit_build_epilogue(ctx);
 
-	if (bpf_jit_enable > 1)
-		bpf_jit_dump(prog->len, image_size, pass, ctx->insns);
-
 	prog->bpf_func = (void *)ctx->insns;
 	prog->jited = 1;
 	prog->jited_len = image_size;
diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
index 63cae0476bb4..aa8b94ba694f 100644
--- a/arch/s390/net/bpf_jit_comp.c
+++ b/arch/s390/net/bpf_jit_comp.c
@@ -1842,10 +1842,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		fp = orig_fp;
 		goto free_addrs;
 	}
-	if (bpf_jit_enable > 1) {
-		bpf_jit_dump(fp->len, jit.size, pass, jit.prg_buf);
-		print_fn_code(jit.prg_buf, jit.size_prg);
-	}
 	if (!fp->is_func || extra_pass) {
 		bpf_jit_binary_lock_ro(header);
 	} else {
diff --git a/arch/sparc/net/bpf_jit_comp_32.c b/arch/sparc/net/bpf_jit_comp_32.c
index b1dbf2fa8c0a..cb4c55422730 100644
--- a/arch/sparc/net/bpf_jit_comp_32.c
+++ b/arch/sparc/net/bpf_jit_comp_32.c
@@ -743,9 +743,6 @@ cond_branch:			f_offset = addrs[i + filter[i].jf];
 		oldproglen = proglen;
 	}
 
-	if (bpf_jit_enable > 1)
-		bpf_jit_dump(flen, proglen, pass + 1, image);
-
 	if (image) {
 		fp->bpf_func = (void *)image;
 		fp->jited = 1;
diff --git a/arch/sparc/net/bpf_jit_comp_64.c b/arch/sparc/net/bpf_jit_comp_64.c
index 4b8d3c65d266..09ebd48c4f1b 100644
--- a/arch/sparc/net/bpf_jit_comp_64.c
+++ b/arch/sparc/net/bpf_jit_comp_64.c
@@ -1546,16 +1546,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		}
 		build_epilogue(&ctx);
 
-		if (bpf_jit_enable > 1)
-			pr_info("Pass %d: size = %u, seen = [%c%c%c%c%c%c]\n", pass,
-				ctx.idx * 4,
-				ctx.tmp_1_used ? '1' : ' ',
-				ctx.tmp_2_used ? '2' : ' ',
-				ctx.tmp_3_used ? '3' : ' ',
-				ctx.saw_frame_pointer ? 'F' : ' ',
-				ctx.saw_call ? 'C' : ' ',
-				ctx.saw_tail_call ? 'T' : ' ');
-
 		if (ctx.idx * 4 == prev_image_size)
 			break;
 		prev_image_size = ctx.idx * 4;
@@ -1593,9 +1583,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		goto out_off;
 	}
 
-	if (bpf_jit_enable > 1)
-		bpf_jit_dump(prog->len, image_size, pass, ctx.image);
-
 	bpf_flush_icache(header, (u8 *)header + (header->pages * PAGE_SIZE));
 
 	if (!prog->is_func || extra_pass) {
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 9eead60f0301..0a511f42a2a7 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -2311,9 +2311,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		cond_resched();
 	}
 
-	if (bpf_jit_enable > 1)
-		bpf_jit_dump(prog->len, proglen, pass + 1, image);
-
 	if (image) {
 		if (!prog->is_func || extra_pass) {
 			bpf_tail_call_direct_fixup(prog);
diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
index 0a7a2870f111..8d36b4658076 100644
--- a/arch/x86/net/bpf_jit_comp32.c
+++ b/arch/x86/net/bpf_jit_comp32.c
@@ -2566,9 +2566,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		cond_resched();
 	}
 
-	if (bpf_jit_enable > 1)
-		bpf_jit_dump(prog->len, proglen, pass + 1, image);
-
 	if (image) {
 		bpf_jit_binary_lock_ro(header);
 		prog->bpf_func = (void *)image;
diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index c8496c1142c9..990b1720c7a4 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -273,16 +273,8 @@ static int proc_dointvec_minmax_bpf_enable(struct ctl_table *table, int write,
 
 	tmp.data = &jit_enable;
 	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
-	if (write && !ret) {
-		if (jit_enable < 2 ||
-		    (jit_enable == 2 && bpf_dump_raw_ok(current_cred()))) {
-			*(int *)table->data = jit_enable;
-			if (jit_enable == 2)
-				pr_warn("bpf_jit_enable = 2 was set! NEVER use this in production, only for JIT debugging!\n");
-		} else {
-			ret = -EPERM;
-		}
-	}
+	if (write && !ret)
+		*(int *)table->data = jit_enable;
 	return ret;
 }
 
@@ -389,7 +381,7 @@ static struct ctl_table net_core_table[] = {
 		.extra2		= SYSCTL_ONE,
 # else
 		.extra1		= SYSCTL_ZERO,
-		.extra2		= &two,
+		.extra2		= SYSCTL_ONE,
 # endif
 	},
 # ifdef CONFIG_HAVE_EBPF_JIT
diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
index c8ae95804728..efa4b17ae016 100644
--- a/tools/bpf/bpf_jit_disasm.c
+++ b/tools/bpf/bpf_jit_disasm.c
@@ -7,7 +7,7 @@
  *
  * To get the disassembly of the JIT code, do the following:
  *
- *  1) `echo 2 > /proc/sys/net/core/bpf_jit_enable`
+ *  1) Insert bpf_jit_dump() and recompile the kernel to output JITed image into log
  *  2) Load a BPF filter (e.g. `tcpdump -p -n -s 0 -i eth1 host 192.168.20.0/24`)
  *  3) Run e.g. `bpf_jit_disasm -o` to read out the last JIT code
  *
diff --git a/tools/bpf/bpftool/feature.c b/tools/bpf/bpftool/feature.c
index 40a88df275f9..98c7eec2923f 100644
--- a/tools/bpf/bpftool/feature.c
+++ b/tools/bpf/bpftool/feature.c
@@ -203,9 +203,6 @@ static void probe_jit_enable(void)
 		case 1:
 			printf("JIT compiler is enabled\n");
 			break;
-		case 2:
-			printf("JIT compiler is enabled with debugging traces in kernel logs\n");
-			break;
 		case -1:
 			printf("Unable to retrieve JIT-compiler status\n");
 			break;
-- 
2.25.1

