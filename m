Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A97B1569
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:53:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VAXnmjyJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx5MD6X7Mz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VAXnmjyJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx5LJ3q7Nz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:52:40 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38S77HST008631;
	Thu, 28 Sep 2023 07:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hXT4xZm1jvUHyZQdtE3I7Kn686PANKE4tDKwTqWhck0=;
 b=VAXnmjyJ2PZ456LqIy5jXH/E+uzexym+azXnkRI3RWCLFHByhlwjxxw9pQ44utVJM20D
 AvGJGPeNeDNFSQclEz6ZBFF93VQg76JrMzK9VxCIsQYraJwI4A/rBeuYSfhv1VDXiPOo
 VrnkkTZiuCq2L2l9qUX6OMHwH9lNsrxCCvI6c3AMeJPLAhDI2NW4FBh6dg54itvpMD1L
 0asYxjTnJujRUdB3cS5kw7NybivfZJZQwBFV1X1X/MkH8ckFeV2IyG5LExGyrCkRArgi
 2URxFFwlpUMIH3Br5qt9DTMgLJAZaKFMRAIkh8CQZ/q+zb/RUqutbijMcZl/v27WGkne 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcvmdmydb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 07:52:25 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38S78GAO014190;
	Thu, 28 Sep 2023 07:52:24 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcvmdmycm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 07:52:24 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38S5NVTI030404;
	Thu, 28 Sep 2023 07:52:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tad221vja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 07:52:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38S7qK4R14025386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Sep 2023 07:52:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD17920043;
	Thu, 28 Sep 2023 07:52:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48C7220040;
	Thu, 28 Sep 2023 07:52:17 +0000 (GMT)
Received: from athiras-mbp.in.ibm.com (unknown [9.109.214.47])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Sep 2023 07:52:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V5 1/3] tools/perf: Add text_end to "struct dso" to save .text section size
Date: Thu, 28 Sep 2023 13:22:11 +0530
Message-Id: <20230928075213.84392-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qjgpvgTGZ90ellpTI5hyb6wLL-ziDsSJ
X-Proofpoint-GUID: FzXBlAs1NuWg_oj8eLxKLwouNkYblOdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_04,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 adultscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280063
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
Cc: atrajeev@linux.vnet.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update "struct dso" to include new member "text_end".
This new field will represent the offset for end of text
section for a dso. For elf, this value is derived as:
sh_size (Size of section in byes) + sh_offset (Section file
offst) of the elf header for text.

For bfd, this value is derived as:
1. For PE file,
section->size + ( section->vma - dso->text_offset)
2. Other cases:
section->filepos (file position) + section->size (size of
section)

To resolve the address from a sample, perf looks at the
DSO maps. In case of address from a kernel module, there
were some address found to be not resolved. This was
observed while running perf test for "Object code reading".
Though the ip falls beteen the start address of the loaded
module (perf map->start ) and end address ( perf map->end),
it was unresolved.

Example:

    Reading object code for memory address: 0xc008000007f0142c
    File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
    On file address is: 0x1114cc
    Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
    objdump read too few bytes: 128
    test child finished with -1

Here, module is loaded at:
    # cat /proc/modules | grep xfs
    xfs 2228224 3 - Live 0xc008000007d00000

From objdump for xfs module, text section is:
    text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4

Here the offset for 0xc008000007f0142c ie  0x112074 falls out
.text section which is up to 0x10f7bc.

In this case for module, the address 0xc008000007e11fd4 is pointing
to stub instructions. This address range represents the module stubs
which is allocated on module load and hence is not part of DSO offset.

To identify such  address, which falls out of text
section and within module end, added the new field "text_end" to
"struct dso".

Reported-by: Disha Goel <disgoel@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
---
Changelog:
v2 -> v3:
 Added Reviewed-by from Adrian

 v1 -> v2:
 Added text_end for bfd also by updating dso__load_bfd_symbols
 as suggested by Adrian.

 tools/perf/util/dso.h        | 1 +
 tools/perf/util/symbol-elf.c | 4 +++-
 tools/perf/util/symbol.c     | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index b41c9782c754..70fe0fe69bef 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -181,6 +181,7 @@ struct dso {
 	u8		 rel;
 	struct build_id	 bid;
 	u64		 text_offset;
+	u64		 text_end;
 	const char	 *short_name;
 	const char	 *long_name;
 	u16		 long_name_len;
diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 95e99c332d7e..9e7eeaf616b8 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1514,8 +1514,10 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
 	}
 
 	if (elf_section_by_name(runtime_ss->elf, &runtime_ss->ehdr, &tshdr,
-				".text", NULL))
+				".text", NULL)) {
 		dso->text_offset = tshdr.sh_addr - tshdr.sh_offset;
+		dso->text_end = tshdr.sh_offset + tshdr.sh_size;
+	}
 
 	if (runtime_ss->opdsec)
 		opddata = elf_rawdata(runtime_ss->opdsec, NULL);
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 3f36675b7c8f..f25e4e62cf25 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1733,8 +1733,10 @@ int dso__load_bfd_symbols(struct dso *dso, const char *debugfile)
 			/* PE symbols can only have 4 bytes, so use .text high bits */
 			dso->text_offset = section->vma - (u32)section->vma;
 			dso->text_offset += (u32)bfd_asymbol_value(symbols[i]);
+			dso->text_end = (section->vma - dso->text_offset) + section->size;
 		} else {
 			dso->text_offset = section->vma - section->filepos;
+			dso->text_end = section->filepos + section->size;
 		}
 	}
 
-- 
2.31.1

