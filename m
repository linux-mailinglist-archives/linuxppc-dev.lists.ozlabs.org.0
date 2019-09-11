Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F122AFF46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 16:55:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4hk2gG5zF3Cm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:55:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4Vb4qNgzF3Bb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:47:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4Vb3W4Fz8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:47:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4Vb2hJCz9sNF; Thu, 12 Sep 2019 00:47:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4VZ5YNGz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:47:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEijKD141774
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:47:00 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy2assrwv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:47:00 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:46:58 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:46:57 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEktdL50724968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:46:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FBD04C058;
 Wed, 11 Sep 2019 14:46:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 858054C064;
 Wed, 11 Sep 2019 14:46:53 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:46:53 +0000 (GMT)
Subject: [PATCH v6 03/36] powerpc/fadump: declare helper functions in
 internal header file
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:16:52 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0016-0000-0000-000002AA0E91
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0017-0000-0000-0000330A9B6E
Message-Id: <156821320487.5656.2660730464212209984.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Declare helper functions, that can be reused by multiple platforms,
in the internal header file.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Declare helper functions in internal header while keeping the definitions
    in arch/powerpc/kernel/fadump.c itself.


 arch/powerpc/include/asm/fadump-internal.h |    8 ++++++++
 arch/powerpc/kernel/fadump.c               |   16 ++++++++--------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 16e2781..e004c89 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -83,4 +83,12 @@ struct fw_dump {
 	unsigned long	nocma:1;
 };
 
+/* Helper functions */
+s32 fadump_setup_cpu_notes_buf(u32 num_cpus);
+void fadump_free_cpu_notes_buf(void);
+u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
+void fadump_update_elfcore_header(char *bufp);
+bool is_fadump_boot_mem_contiguous(void);
+bool is_fadump_reserved_mem_contiguous(void);
+
 #endif /* _ASM_POWERPC_FADUMP_INTERNAL_H */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index e2b83a9..eb0745e 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -234,7 +234,7 @@ static bool is_fadump_mem_area_contiguous(u64 d_start, u64 d_end)
  * Returns true, if there are no holes in boot memory area,
  * false otherwise.
  */
-static bool is_boot_memory_area_contiguous(void)
+bool is_fadump_boot_mem_contiguous(void)
 {
 	return is_fadump_mem_area_contiguous(0, fw_dump.boot_memory_size);
 }
@@ -243,7 +243,7 @@ static bool is_boot_memory_area_contiguous(void)
  * Returns true, if there are no holes in reserved memory area,
  * false otherwise.
  */
-static bool is_reserved_memory_area_contiguous(void)
+bool is_fadump_reserved_mem_contiguous(void)
 {
 	u64 d_start, d_end;
 
@@ -617,9 +617,9 @@ static int register_fw_dump(struct fadump_mem_struct *fdm)
 			" dump. Hardware Error(%d).\n", rc);
 		break;
 	case -3:
-		if (!is_boot_memory_area_contiguous())
+		if (!is_fadump_boot_mem_contiguous())
 			pr_err("Can't have holes in boot memory area while registering fadump\n");
-		else if (!is_reserved_memory_area_contiguous())
+		else if (!is_fadump_reserved_mem_contiguous())
 			pr_err("Can't have holes in reserved memory area while"
 			       " registering fadump\n");
 
@@ -749,7 +749,7 @@ fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
 	return reg_entry;
 }
 
-static u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
+u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
 {
 	struct elf_prstatus prstatus;
 
@@ -764,7 +764,7 @@ static u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
 	return buf;
 }
 
-static void fadump_update_elfcore_header(char *bufp)
+void fadump_update_elfcore_header(char *bufp)
 {
 	struct elfhdr *elf;
 	struct elf_phdr *phdr;
@@ -815,7 +815,7 @@ static void fadump_free_buffer(unsigned long vaddr, unsigned long size)
 	__free_pages(page, order);
 }
 
-static s32 fadump_setup_cpu_notes_buf(u32 num_cpus)
+s32 fadump_setup_cpu_notes_buf(u32 num_cpus)
 {
 	/* Allocate buffer to hold cpu crash notes. */
 	fw_dump.cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
@@ -834,7 +834,7 @@ static s32 fadump_setup_cpu_notes_buf(u32 num_cpus)
 	return 0;
 }
 
-static void fadump_free_cpu_notes_buf(void)
+void fadump_free_cpu_notes_buf(void)
 {
 	if (!fw_dump.cpu_notes_buf_vaddr)
 		return;

