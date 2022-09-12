Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981A5B561E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR07t0mfLz3fGs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:27:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bNUt6cg7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bNUt6cg7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR01q3Dq6z3cB3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:21:51 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6hIIh019656;
	Mon, 12 Sep 2022 08:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HlIWah+UUHq9SUa0rbY/ZhI2MEjFKo4f0r/nmY/tjXM=;
 b=bNUt6cg7eos2Gu9LDx6ju5pROyMoRbYkO0+Kd3AGg8W0pojomzLCAbMJywqcFrz1WE3O
 q3hNB9wWdf54Y/ecfvONO3x6EmRF9mdpjpyqVWcbhrD6JUhw0froLqwTSyEENbBR6q0J
 feRdZpxhb/Xr4dGb7PWHKHOLn2sjHW0E8t94iJe58VF3pHIYH1GBSqt9HzTw+DUblwht
 4osQ6j33Wymd2HbzooT8o3xXGoIoUitOgleXu5KSmLkPX9uuRmh7liSoiH6KQVdN3QB2
 7sC7qohrVyYwy0Q5yw1+eZD8y1HbF+HBknVUAvRPUYYXj7VOZ6trpJTjAdcnNluHM4VT /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhyre2xn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:32 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28C80Q0X030442;
	Mon, 12 Sep 2022 08:21:31 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhyre2xm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C86X43006212;
	Mon, 12 Sep 2022 08:21:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3jghuja3vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:29 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C8HkXa18678228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 08:17:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70A17A4040;
	Mon, 12 Sep 2022 08:21:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4965A404D;
	Mon, 12 Sep 2022 08:21:22 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.91.220])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 08:21:22 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/16] objtool: Use target file class size instead of a compiled constant
Date: Mon, 12 Sep 2022 13:50:14 +0530
Message-Id: <20220912082020.226755-11-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220912082020.226755-1-sv@linux.ibm.com>
References: <20220912082020.226755-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S-BMpyE_QLe-g_Vs9FakR8Ue0O_7SNCb
X-Proofpoint-GUID: v-_z0ut3KYCb7WWr-bYJLxM5f1D_lPf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=958 phishscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120027
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
index c36e7a020d80..738de23cb9e8 100644
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
index c25e957c1e52..40c6d53b081f 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1124,6 +1124,7 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
 {
 	char *relocname;
 	struct section *sec;
+	int addrsize = elf_class_addrsize(elf);
 
 	relocname = malloc(strlen(base->name) + strlen(".rela") + 1);
 	if (!relocname) {
@@ -1133,7 +1134,10 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
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
@@ -1142,7 +1146,7 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
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

