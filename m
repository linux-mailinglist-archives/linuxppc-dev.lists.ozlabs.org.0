Return-Path: <linuxppc-dev+bounces-5312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0EA12EA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:50:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLn026V2z3cfW;
	Thu, 16 Jan 2025 09:50:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981428;
	cv=none; b=gaEEfttCrkN6O6CQSYeqGBWmfJ361WCuVakn7In3CO3kcbVC9dmG6rah1PLnBgn1EykMytLFzH0dpiQepQIeFYfxDUmB1BL0IsZozM0RYmeeO66AWS8KEMWgNRsbdDkmaw2+KtCVYe5DgNt7nWoCMna7newVSfRygabc4wYBP9qsAMThCfb9IEBsi44QRJ7Rtiqn28ZZ407kCmLptLvcBfABrDxBQATLT2QDCmtUOgU19NrqDLOHo00DoQ4OJlZLYX8VQK9G8CJLsiAun+lMhT/P8QpxYcnh8flqwo+JwFPRtSJDEzBA8GSlF2MOUZylW6Xb+KFFfkb35iFO4giwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981428; c=relaxed/relaxed;
	bh=w3pEqXIJ37a1r1gf2aOefvCb5yij03CSKQzT22dw9dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPdlzb0zzX46tKXkdqzK+aJLuoNXrnskIG72ldlmN9gC+7xNVTHIknUxiOo+sTDs7KV2mYEwrPy/3hmALWNEoX4FrCFC/o3Ntrnp1bGxuEf/sR0RZSZSTFdd1LSSMaZu2JPggoiWB7VOxRjnmuEm5Yq4pLVfMXgUkVUB27Bgz532tjgsMW0j3n//h/MXIFLQ8ZUkeTDvCksdkjA7s9fGdUUzh0VGdolmC0UeM/1v/u+Ujo1Hw7i8K1yjdcvB875qP16p8BIX71iJclVibFCXRT+5a0CV99WsPKVIly8VYykmO+t2dnkQb5y6dfPrBebhlC76S9J28X9mBVktQH6aTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLmz5PkMz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:27 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcn297Rz9sSh;
	Wed, 15 Jan 2025 23:43:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuPRgmlINGTC; Wed, 15 Jan 2025 23:43:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcn13D6z9sSg;
	Wed, 15 Jan 2025 23:43:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 13A798B77A;
	Wed, 15 Jan 2025 23:43:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TTrr0vm5x28f; Wed, 15 Jan 2025 23:43:20 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E1CBB8B774;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 12/15] objtool: Add support for more complex UACCESS control
Date: Wed, 15 Jan 2025 23:42:52 +0100
Message-ID: <64a6921ec7bc78c4b25561cf13e8147f26e884a6.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=3081; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jUmgRhfOUOKcm47vVLJz0Uk+vweVINDmw47p9P553do=; b=PvDeZ1WUGIKvE/gRmmck4Oiaz1dQxNwL0Klut/cRBsip4QjA8Cuhi0vktmLlI0qxgq4GTnG0y eXtRWgLdHSeApvZuNEn1PuyKh8XD4VLq3y6BPOz72m6IFeg10tqv7oo
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On x86, UACCESS is controlled by two instructions: STAC and CLAC.
STAC instruction enables UACCESS while CLAC disables UACCESS.
This is simple enough for objtool to locate UACCESS enable and
disable.

But on powerpc it is a bit more complex, the same instruction is
used for enabling and disabling UACCESS, and the same instruction
can be used for many other things. It would be too complex to use
exclusively instruction decoding.

To help objtool, annotate such instructions, on the same principle as
reachable/unreachable instructions. And add ANNOTATE_UACCESS_BEGIN
and ANNOTATE_UACCESS_END macros to be used in inline assembly code to
annotate UACCESS enable and UACCESS disable instructions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Use generic annotation infrastructure
---
 include/linux/objtool.h             | 3 +++
 include/linux/objtool_types.h       | 2 ++
 tools/include/linux/objtool_types.h | 2 ++
 tools/objtool/check.c               | 8 ++++++++
 4 files changed, 15 insertions(+)

diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index c722a921165b..7efd731da2a2 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -183,6 +183,9 @@
  */
 #define ANNOTATE_REACHABLE(label)	__ASM_ANNOTATE(label, ANNOTYPE_REACHABLE)
 
+#define ANNOTATE_UACCESS_BEGIN		ASM_ANNOTATE(ANNOTYPE_UACCESS_BEGIN)
+#define ANNOTATE_UACCESS_END		ASM_ANNOTATE(ANNOTYPE_UACCESS_END)
+
 #else
 #define ANNOTATE_NOENDBR		ANNOTATE type=ANNOTYPE_NOENDBR
 #define ANNOTATE_RETPOLINE_SAFE		ANNOTATE type=ANNOTYPE_RETPOLINE_SAFE
diff --git a/include/linux/objtool_types.h b/include/linux/objtool_types.h
index df5d9fa84dba..28da3d989e65 100644
--- a/include/linux/objtool_types.h
+++ b/include/linux/objtool_types.h
@@ -65,5 +65,7 @@ struct unwind_hint {
 #define ANNOTYPE_IGNORE_ALTS		6
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
+#define ANNOTYPE_UACCESS_BEGIN		9
+#define ANNOTYPE_UACCESS_END		10
 
 #endif /* _LINUX_OBJTOOL_TYPES_H */
diff --git a/tools/include/linux/objtool_types.h b/tools/include/linux/objtool_types.h
index df5d9fa84dba..28da3d989e65 100644
--- a/tools/include/linux/objtool_types.h
+++ b/tools/include/linux/objtool_types.h
@@ -65,5 +65,7 @@ struct unwind_hint {
 #define ANNOTYPE_IGNORE_ALTS		6
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
+#define ANNOTYPE_UACCESS_BEGIN		9
+#define ANNOTYPE_UACCESS_END		10
 
 #endif /* _LINUX_OBJTOOL_TYPES_H */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 91436f4b3622..54625f09d831 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2422,6 +2422,14 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
 		insn->dead_end = false;
 		break;
 
+	case ANNOTYPE_UACCESS_BEGIN:
+		insn->type = INSN_STAC;
+		break;
+
+	case ANNOTYPE_UACCESS_END:
+		insn->type = INSN_CLAC;
+		break;
+
 	default:
 		WARN_INSN(insn, "Unknown annotation type: %d", type);
 		break;
-- 
2.47.0


