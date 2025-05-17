Return-Path: <linuxppc-dev+bounces-8626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03381ABAA27
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 15:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b03xQ33bxz300B;
	Sat, 17 May 2025 23:01:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747486906;
	cv=none; b=DQsRs6bBIWPU1U4vXrk7wylHubfA+W24A8Bw3nsbkFgYddlE+8SJ5ChXSN/iyJQ2xJBdTC9fzMRetRuGjpZevpbwQv7uHAzqp/PYoSOGJX88NdOCu/nY47e07RoiCIZ149tBHkWImn+jiswSe16Vfkw3Uc+ySbxFrqoE3TBrOc8/aJlS+Hra5GzO+B2qOeKweaDzi5tpIG9oo4Gv57LJZUPsH7iqfzoyDxBHc7Grcb/I5sRDsQrzOyem5miyA6kq94MWOO0/WowzGL4PXHKmczCVKtTO58SvvyhhMWTShrfkH15t3E1iF3MzmQXVc02D2YtsP2Gl+UH+Uu/l5pvX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747486906; c=relaxed/relaxed;
	bh=WIbKSwCYsCTCU4ZAr2VOIQ93eekYXV3ibAlWtorV7R4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBU14UYSEgHDAxRLwOJDtViNRKdFR0TCvMe/vK1hdOHXeb7fgnqJ5NsSOp5l1Rl2KYie4kMRwxxxNE7PIoeTGto/G+9aXhRv1PxUdhf6DOwYMSUeWEHJtfdrJBw4pGYqYnl7ZGaKS7vdsBqZF0QsoYW08LdQfEIYayDSzgbMqwQoAHHFxfOenp8kceVJR3iZYMAaUypWYLJdCU1VHq8wrAwguTkQ4FLrlYHy2XD+KTcYAOZMcF1l7HfW4kljl+psHnIeG0tsgPE+D/DUHzUr9a9Ib08iwp2uRClrXxuFLOqWW8LvAtWbKETYVotWoY6mLAwqq4f3PuWLvZSsVz5XAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T2uKLySS; dkim-atps=neutral; spf=pass (client-ip=95.215.58.188; helo=out-188.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T2uKLySS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.188; helo=out-188.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b03xL4Kfhz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 23:01:42 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747486876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WIbKSwCYsCTCU4ZAr2VOIQ93eekYXV3ibAlWtorV7R4=;
	b=T2uKLySSMrAnMBqimeW4wwjhdKSEjpp9YvCe6cAhJ4+2MtrJvIU+Y8F0A9Qdv1P0Q03jFh
	vUCFqolm0HXgbbEMkfbsPnjkHx+5NCAvseTXpvp6XiiHSoMgdNFpWPdxBMQvT0JMowrr8d
	bcE8fhgUD+LcZeVVhIMz1siRXJxxHvU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Fix indentation and replace typedef with struct name
Date: Sat, 17 May 2025 14:58:31 +0200
Message-ID: <20250517125834.421088-2-thorsten.blum@linux.dev>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Indent several struct members using tabs instead of spaces.

Replace the typedef alias AOUTHDR with an explicit struct name to
silence a checkpatch warning.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/boot/hack-coff.c |  2 +-
 arch/powerpc/boot/rs6000.h    | 84 +++++++++++++++++------------------
 2 files changed, 41 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/boot/hack-coff.c b/arch/powerpc/boot/hack-coff.c
index a010e124ac4b..6bf0c94302f5 100644
--- a/arch/powerpc/boot/hack-coff.c
+++ b/arch/powerpc/boot/hack-coff.c
@@ -31,7 +31,7 @@ main(int ac, char **av)
     int i, nsect;
     int aoutsz;
     struct external_filehdr fhdr;
-    AOUTHDR aout;
+    struct aouthdr aout;
     struct external_scnhdr shdr;
 
     if (ac != 2) {
diff --git a/arch/powerpc/boot/rs6000.h b/arch/powerpc/boot/rs6000.h
index a9d879155ef9..584c7f9c1912 100644
--- a/arch/powerpc/boot/rs6000.h
+++ b/arch/powerpc/boot/rs6000.h
@@ -36,32 +36,30 @@ struct external_filehdr {
 /********************** AOUT "OPTIONAL HEADER" **********************/
 
 
-typedef struct
-{
-  unsigned char	magic[2];	/* type of file			*/
-  unsigned char	vstamp[2];	/* version stamp		*/
-  unsigned char	tsize[4];	/* text size in bytes, padded to FW bdry */
-  unsigned char	dsize[4];	/* initialized data "  "	*/
-  unsigned char	bsize[4];	/* uninitialized data "   "	*/
-  unsigned char	entry[4];	/* entry pt.			*/
-  unsigned char	text_start[4];	/* base of text used for this file */
-  unsigned char	data_start[4];	/* base of data used for this file */
-  unsigned char	o_toc[4];	/* address of TOC */
-  unsigned char	o_snentry[2];	/* section number of entry point */
-  unsigned char	o_sntext[2];	/* section number of .text section */
-  unsigned char	o_sndata[2];	/* section number of .data section */
-  unsigned char	o_sntoc[2];	/* section number of TOC */
-  unsigned char	o_snloader[2];	/* section number of .loader section */
-  unsigned char	o_snbss[2];	/* section number of .bss section */
-  unsigned char	o_algntext[2];	/* .text alignment */
-  unsigned char	o_algndata[2];	/* .data alignment */
-  unsigned char	o_modtype[2];	/* module type (??) */
-  unsigned char o_cputype[2];	/* cpu type */
-  unsigned char	o_maxstack[4];	/* max stack size (??) */
-  unsigned char o_maxdata[4];	/* max data size (??) */
-  unsigned char	o_resv2[12];	/* reserved */
-}
-AOUTHDR;
+struct aouthdr {
+	unsigned char	magic[2];	/* type of file			*/
+	unsigned char	vstamp[2];	/* version stamp		*/
+	unsigned char	tsize[4];	/* text size in bytes, padded to FW bdry */
+	unsigned char	dsize[4];	/* initialized data "  "	*/
+	unsigned char	bsize[4];	/* uninitialized data "   "	*/
+	unsigned char	entry[4];	/* entry pt.			*/
+	unsigned char	text_start[4];	/* base of text used for this file */
+	unsigned char	data_start[4];	/* base of data used for this file */
+	unsigned char	o_toc[4];	/* address of TOC */
+	unsigned char	o_snentry[2];	/* section number of entry point */
+	unsigned char	o_sntext[2];	/* section number of .text section */
+	unsigned char	o_sndata[2];	/* section number of .data section */
+	unsigned char	o_sntoc[2];	/* section number of TOC */
+	unsigned char	o_snloader[2];	/* section number of .loader section */
+	unsigned char	o_snbss[2];	/* section number of .bss section */
+	unsigned char	o_algntext[2];	/* .text alignment */
+	unsigned char	o_algndata[2];	/* .data alignment */
+	unsigned char	o_modtype[2];	/* module type (??) */
+	unsigned char	o_cputype[2];	/* cpu type */
+	unsigned char	o_maxstack[4];	/* max stack size (??) */
+	unsigned char	o_maxdata[4];	/* max data size (??) */
+	unsigned char	o_resv2[12];	/* reserved */
+};
 
 #define AOUTSZ 72
 #define SMALL_AOUTSZ (28)
@@ -119,10 +117,10 @@ struct external_scnhdr {
  */
 struct external_lineno {
 	union {
-		char l_symndx[4];	/* function name symbol index, iff l_lnno == 0*/
+		char l_symndx[4];	/* function name symbol index, iff l_lnno == 0 */
 		char l_paddr[4];	/* (physical) address of line number	*/
 	} l_addr;
-	char l_lnno[2];	/* line number		*/
+	char l_lnno[2];	/* line number */
 };
 
 
@@ -136,20 +134,19 @@ struct external_lineno {
 #define E_FILNMLEN	14	/* # characters in a file name		*/
 #define E_DIMNUM	4	/* # array dimensions in auxiliary entry */
 
-struct external_syment
-{
-  union {
-    char e_name[E_SYMNMLEN];
-    struct {
-      char e_zeroes[4];
-      char e_offset[4];
-    } e;
-  } e;
-  char e_value[4];
-  char e_scnum[2];
-  char e_type[2];
-  char e_sclass[1];
-  char e_numaux[1];
+struct external_syment {
+	union {
+		char e_name[E_SYMNMLEN];
+		struct {
+			char e_zeroes[4];
+			char e_offset[4];
+		} e;
+	} e;
+	char e_value[4];
+	char e_scnum[2];
+	char e_type[2];
+	char e_sclass[1];
+	char e_numaux[1];
 };
 
 
@@ -191,7 +188,7 @@ union external_auxent {
 	} x_file;
 
 	struct {
-		char x_scnlen[4];			/* section length */
+		char x_scnlen[4];	/* section length */
 		char x_nreloc[2];	/* # relocation entries */
 		char x_nlinno[2];	/* # line numbers */
 	} x_scn;
@@ -211,7 +208,6 @@ union external_auxent {
 		unsigned char x_stab[4];
 		unsigned char x_snstab[2];
 	} x_csect;
-
 };
 
 #define	SYMENT	struct external_syment
-- 
2.49.0


