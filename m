Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ACE1C24CA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:42:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnL85b6nzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UoH6KiMP; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqh1D7JzDr4r
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:19:59 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id l25so3545208pgc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6BLoEI0vXgQhm4LV6P7dwhEfUdtuqzK2lGdy4tmego=;
 b=UoH6KiMPW6x66W28P/Ud76jL9ADSibi4Azwaod1O6Tz0d+EjdOInSPlabXJzTjj1Ky
 pzT8w+GKdgNNZUNTSoePklCCErS9/feG+jw821pR4qG6u/0GB7N7ozbZWSiXAY2zYnSF
 m8u6PbuHrKxCDzIU2s7ukieHxR12gXOu+Sd7UOYtG/QD04j+vViBtQX8v7klP8LqKDfp
 SMVQcI5WecQRSx2mWqg0N5kbsmaRZ6LQC1TLh1Gs5jZwsOtUeCG8F1AlOKoxcsFVCtya
 yjfqfEmeaJlCkfuQLDr1CpmqlU8nuYHZEBu5hvuyFpOUYw+HhdzgLCZ/Vt/PIyDqMl/b
 MctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6BLoEI0vXgQhm4LV6P7dwhEfUdtuqzK2lGdy4tmego=;
 b=ShSAO/sYNaa3XJ7tJqOYJI5LFJYxCDYXpOvAaAljJ41e9D9e9nL7QwIsdpha2oGkrB
 +kmKey3ttBkhYqKOKXnlBahmEBXIk+FhSwAeNUqcucoQGjzh2u/sLfT6pCWIx8sEqMcK
 kG6++CNmS2OJsS2DwDeunTxsRYB9jS89otPjqc44UJg/HEXB4KnjBUvYHjnJRA6RvOcY
 SMkjf0JCvK8TwWYMKZohS9KPscc8F98malKIk8eZSTm5OiJcX8Bbzn71ENQgVb0OhtBo
 3DMzcRoYeijHJHmJgRzg3sN9/kydk/QXqA0kkQFRwqcKlp05euZqHPSv89vCPv3YmArl
 r7EQ==
X-Gm-Message-State: AGi0PubibpRlHZ1D1wlsZ4U3XD7gPKUtAXD0hjceJ3ctIhx+AKFNDmeK
 2zGr9pa3kywYwpxIMG2PJ7lITOUW
X-Google-Smtp-Source: APiQypLZ8cNE96VM3qwaFx+i3n8B+624qt6LiF3OMliOEgBsmIj1+oxbVWNCT+PXdmExIlQKrRvDTg==
X-Received: by 2002:a63:5413:: with SMTP id i19mr8860389pgb.213.1588418396658; 
 Sat, 02 May 2020 04:19:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:19:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 02/10] powerpc/powernv: Wire up OPAL address lookups
Date: Sat,  2 May 2020 21:19:06 +1000
Message-Id: <20200502111914.166578-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use ARCH_HAS_SYMBOL_LOOKUP to look up the opal symbol table. This
allows crashes and xmon debugging to print firmware symbols.

  Oops: System Reset, sig: 6 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc2-dirty #903
  NIP:  0000000030020434 LR: 000000003000378c CTR: 0000000030020414
  REGS: c0000000fffc3d70 TRAP: 0100   Not tainted  (5.6.0-rc2-dirty)
  MSR:  9000000002101002 <SF,HV,VEC,ME,RI>  CR: 28022284  XER: 20040000
  CFAR: 0000000030003788 IRQMASK: 3
  GPR00: 000000003000378c 0000000031c13c90 0000000030136200 c0000000012cfa10
  GPR04: c0000000012cfa10 0000000000000010 0000000000000000 0000000031c10060
  GPR08: c0000000012cfaaf 0000000030003640 0000000000000000 0000000000000001
  GPR12: 00000000300e0000 c000000001490000 0000000000000000 c00000000139c588
  GPR16: 0000000031c10000 c00000000125a900 0000000000000000 c0000000012076a8
  GPR20: c0000000012a3950 0000000000000001 0000000031c10060 c0000000012cfaaf
  GPR24: 0000000000000019 0000000030003640 0000000000000000 0000000000000000
  GPR28: 0000000000000010 c0000000012cfa10 0000000000000000 0000000000000000
  NIP [0000000030020434] .dummy_console_write_buffer_space+0x20/0x64 [OPAL]
  LR [000000003000378c] opal_entry+0x14c/0x17c [OPAL]

This won't unwind the firmware stack (or its Linux caller) properly if
firmware and kernel endians don't match, but that problem could be solved
in powerpc's unwinder.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                       |  1 +
 arch/powerpc/include/asm/opal-api.h        |  4 ++-
 arch/powerpc/include/asm/opal.h            |  3 ++
 arch/powerpc/platforms/powernv/opal-call.c |  2 ++
 arch/powerpc/platforms/powernv/opal.c      | 40 ++++++++++++++++++++++
 5 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 924c541a9260..0be717291e38 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -115,6 +115,7 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 	select ARCH_32BIT_OFF_T if PPC32
+	select ARCH_HAS_SYMBOL_LOOKUP		if PPC_POWERNV
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 1dffa3cb16ba..8eb31b9aeb27 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -214,7 +214,9 @@
 #define OPAL_SECVAR_GET				176
 #define OPAL_SECVAR_GET_NEXT			177
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
-#define OPAL_LAST				178
+#define OPAL_ADDR_TO_SYM			181
+#define OPAL_SYM_TO_ADDR			182
+#define OPAL_LAST				182
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e2..56b6994aefb7 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -312,6 +312,9 @@ s64 opal_mpipl_query_tag(enum opal_mpipl_tags tag, u64 *addr);
 s64 opal_signal_system_reset(s32 cpu);
 s64 opal_quiesce(u64 shutdown_type, s32 cpu);
 
+int64_t opal_addr_to_sym(uint64_t addr, __be64 *symaddr, __be64 *symsize, char *namebuf, uint64_t buflen);
+int64_t opal_sym_to_addr(const char *name, __be64 *symaddr, __be64 *symsize);
+
 /* Internal functions */
 extern int early_init_dt_scan_opal(unsigned long node, const char *uname,
 				   int depth, void *data);
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f..2233a58924cb 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -293,3 +293,5 @@ OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);
 OPAL_CALL(opal_secvar_get,			OPAL_SECVAR_GET);
 OPAL_CALL(opal_secvar_get_next,			OPAL_SECVAR_GET_NEXT);
 OPAL_CALL(opal_secvar_enqueue_update,		OPAL_SECVAR_ENQUEUE_UPDATE);
+OPAL_CALL(opal_addr_to_sym,			OPAL_ADDR_TO_SYM);
+OPAL_CALL(opal_sym_to_addr,			OPAL_SYM_TO_ADDR);
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2b3dfd0b6cdd..1bf2e0b31ecf 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -107,6 +107,46 @@ void opal_configure_cores(void)
 		cur_cpu_spec->cpu_restore();
 }
 
+const char *arch_symbol_lookup_address(unsigned long addr,
+			    unsigned long *symbolsize,
+			    unsigned long *offset,
+			    char **modname, char *namebuf)
+{
+	__be64 symaddr;
+	__be64 symsize;
+
+	if (!firmware_has_feature(FW_FEATURE_OPAL))
+		return NULL;
+
+	if (opal_addr_to_sym(addr, &symaddr, &symsize, namebuf,
+			cpu_to_be64(KSYM_NAME_LEN)) != OPAL_SUCCESS)
+		return NULL;
+
+	*symbolsize = be64_to_cpu(symsize);
+	*offset = addr - be64_to_cpu(symaddr);
+	*modname = "OPAL";
+
+	return namebuf;
+}
+
+unsigned long arch_symbol_lookup_name(const char *name)
+{
+	__be64 addr;
+	__be64 size;
+
+	if (!firmware_has_feature(FW_FEATURE_OPAL))
+		return 0;
+
+	/* opal: prefix allows lookup of symbols that clash with kernel */
+	if (!strncasecmp(name, "opal:", strlen("opal:")))
+		name += strlen("opal:");
+
+	if (opal_sym_to_addr(name, &addr, &size) != OPAL_SUCCESS)
+		return 0;
+
+	return be64_to_cpu(addr);
+}
+
 int __init early_init_dt_scan_opal(unsigned long node,
 				   const char *uname, int depth, void *data)
 {
-- 
2.23.0

