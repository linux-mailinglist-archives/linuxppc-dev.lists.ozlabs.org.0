Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 588916114EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 16:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzQLL1JfDz3dvX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 01:44:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GpBYGfa8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GpBYGfa8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzQ7V4glHz3cJM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 01:35:18 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SECCYV037699;
	Fri, 28 Oct 2022 14:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lxol/Z1oMP0a92SzkCf+yWSfW4cyjgzRarpqeJ9Bjw8=;
 b=GpBYGfa8zwDCqT4eLzYxmucyyLRLDoY4m28iNuZO/+e+mqrjCgWNCk1rXV7R1zkl5P9o
 mXyCHUd8O6ZEv9bNSJZWhsd9I2aNI7QYpDTtf+ntdPLBmefHYPjLknYZUKmBQuUsuYis
 /BlbTuvUZLcK91OvMDDTfHIhbxpnLuAbd+GfTlkHyhjpoua8nKSceGaqSq2K6+Xv/8e+
 Lsrcpc/fCWUrfzialtK7WJvbks9H4nnVsaI7ArueYG1SoOTpEgOWEG86QRtRMr7W8k45
 ZKyD11bdkxQTLhBF7N21WAqtKF9+qJRpccaYbcEwrr3EbEbLrItHiwhJjJScAozWZ6kr Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kggmqgv01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 14:35:05 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SECcDh000325;
	Fri, 28 Oct 2022 14:35:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kggmqgux2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 14:35:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SEL6m4026473;
	Fri, 28 Oct 2022 14:35:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3kfahu3wxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 14:35:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29SETeXi47972650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 14:29:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA01CA404D;
	Fri, 28 Oct 2022 14:34:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7E54A4055;
	Fri, 28 Oct 2022 14:34:55 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.124.163])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 28 Oct 2022 14:34:55 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 10/16] objtool: Use target file class size instead of a compiled constant
Date: Fri, 28 Oct 2022 20:03:40 +0530
Message-Id: <20221028143346.183569-11-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221028143346.183569-1-sv@linux.ibm.com>
References: <20221028143346.183569-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RE60iflIkyrcSLZbz7bwreHJCBUT4Pme
X-Proofpoint-GUID: 9czvMr5jyTF_PWfrXh1nDSqLy9MYfkBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=965
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210280090
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

In order to allow using objtool on cross-built kernels,
determine size of long from elf data instead of using
sizeof(long) at build time.

For the time being this covers only mcount.

Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[Sathvika Vasireddy: Rename variable "size" to "addrsize" and function
"elf_class_size()" to "elf_class_addrsize()", and modify
create_mcount_loc_sections() function to follow reverse christmas tree
format to order local variable declarations.]
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/check.c               | 18 ++++++++++--------
 tools/objtool/elf.c                 |  8 ++++++--
 tools/objtool/include/objtool/elf.h |  8 ++++++++
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index ad5dab175701..b64518c7c7b4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -852,9 +852,9 @@ static int create_ibt_endbr_seal_sections(struct objtool_file *file)
 
 static int create_mcount_loc_sections(struct objtool_file *file)
 {
-	struct section *sec;
-	unsigned long *loc;
+	int addrsize = elf_class_addrsize(file->elf);
 	struct instruction *insn;
+	struct section *sec;
 	int idx;
 
 	sec = find_section_by_name(file->elf, "__mcount_loc");
@@ -871,23 +871,25 @@ static int create_mcount_loc_sections(struct objtool_file *file)
 	list_for_each_entry(insn, &file->mcount_loc_list, call_node)
 		idx++;
 
-	sec = elf_create_section(file->elf, "__mcount_loc", 0, sizeof(unsigned long), idx);
+	sec = elf_create_section(file->elf, "__mcount_loc", 0, addrsize, idx);
 	if (!sec)
 		return -1;
 
+	sec->sh.sh_addralign = addrsize;
+
 	idx = 0;
 	list_for_each_entry(insn, &file->mcount_loc_list, call_node) {
+		void *loc;
 
-		loc = (unsigned long *)sec->data->d_buf + idx;
-		memset(loc, 0, sizeof(unsigned long));
+		loc = sec->data->d_buf + idx;
+		memset(loc, 0, addrsize);
 
-		if (elf_add_reloc_to_insn(file->elf, sec,
-					  idx * sizeof(unsigned long),
+		if (elf_add_reloc_to_insn(file->elf, sec, idx,
 					  R_X86_64_64,
 					  insn->sec, insn->offset))
 			return -1;
 
-		idx++;
+		idx += addrsize;
 	}
 
 	return 0;
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 7e24b09b1163..33739865735b 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1129,6 +1129,7 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
 {
 	char *relocname;
 	struct section *sec;
+	int addrsize = elf_class_addrsize(elf);
 
 	relocname = malloc(strlen(base->name) + strlen(".rela") + 1);
 	if (!relocname) {
@@ -1138,7 +1139,10 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
 	strcpy(relocname, ".rela");
 	strcat(relocname, base->name);
 
-	sec = elf_create_section(elf, relocname, 0, sizeof(GElf_Rela), 0);
+	if (addrsize == sizeof(u32))
+		sec = elf_create_section(elf, relocname, 0, sizeof(Elf32_Rela), 0);
+	else
+		sec = elf_create_section(elf, relocname, 0, sizeof(GElf_Rela), 0);
 	free(relocname);
 	if (!sec)
 		return NULL;
@@ -1147,7 +1151,7 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
 	sec->base = base;
 
 	sec->sh.sh_type = SHT_RELA;
-	sec->sh.sh_addralign = 8;
+	sec->sh.sh_addralign = addrsize;
 	sec->sh.sh_link = find_section_by_name(elf, ".symtab")->idx;
 	sec->sh.sh_info = base->idx;
 	sec->sh.sh_flags = SHF_INFO_LINK;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index 16f4067b82ae..78b3aa2e546d 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -142,6 +142,14 @@ static inline bool has_multiple_files(struct elf *elf)
 	return elf->num_files > 1;
 }
 
+static inline int elf_class_addrsize(struct elf *elf)
+{
+	if (elf->ehdr.e_ident[EI_CLASS] == ELFCLASS32)
+		return sizeof(u32);
+	else
+		return sizeof(u64);
+}
+
 struct elf *elf_open_read(const char *name, int flags);
 struct section *elf_create_section(struct elf *elf, const char *name, unsigned int sh_flags, size_t entsize, int nr);
 
-- 
2.31.1

