Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0693069B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 19:07:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PMlUdG6T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLvz83xv6z3cYY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 03:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PMlUdG6T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLvkX5SWzz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 02:56:36 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46DGSXu9013264;
	Sat, 13 Jul 2024 16:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=9/I9rg86zkzNM
	Ch65BzoMB/9sv8diY+qFE1patL0kRU=; b=PMlUdG6TLIVvXLw8ckxDVqkL6v+jw
	tlZA0xKoG3jkVQkXQ6gfxetajerD0cjeFvK2sZYVfhtxYXxYTD/5fMUGFDpm4O7K
	FyiqpN5OZ6i/csIQYV2a9mk0c8xSAHeV7ebZuDUWc40tdOqAp5bhnlEew1iulyss
	8ktIncAS8zNJwyfu0/+et6+kQsIEXGX4jRaC+36nxKVcRR8wU3Pj5z7GsN3lB1Sb
	DoyOH0lunfzYHBRv1okq2DFNIhcP8Pyoi8gQ88ii3eHWxI9cL6D+6EeQMqGa0V50
	fwtBcIZ/826vtfxJi+5usPVEVtinSYFX+UH3NkbZy1fAgm5LuzkNHL5SQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr1gbdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:27 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46DGuQfn018096;
	Sat, 13 Jul 2024 16:56:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr1gbde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46DGQcHx024646;
	Sat, 13 Jul 2024 16:56:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 407hrnc7vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46DGuK3u46989750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 16:56:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 642682004D;
	Sat, 13 Jul 2024 16:56:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9456F20043;
	Sat, 13 Jul 2024 16:56:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.49.134])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Jul 2024 16:56:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V7 14/18] tools/perf: Add support to use libcapstone in powerpc
Date: Sat, 13 Jul 2024 22:25:25 +0530
Message-Id: <20240713165529.59298-15-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
References: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nOf7WFRi0ANFsTey4yDNjViKtE0RkArk
X-Proofpoint-GUID: -fMMtemQEhwrJGllUrs_eRm4wMbln7DT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=895 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407130127
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now perf uses the capstone library to disassemble the instructions in
x86. capstone is used (if available) for perf annotate to speed up.
Currently it only supports x86 architecture. Patch includes changes to
enable this in powerpc. For now, only for data type sort keys, this
method is used and only binary code (raw instruction) is read. This is
because powerpc approach to understand instructions and reg fields uses
raw instruction. The "cs_disasm" is currently not enabled. While
attempting to do cs_disasm, observation is that some of the instructions
were not identified (ex: extswsli, maddld) and it had to fallback to use
objdump. Hence enabling "cs_disasm" is added in comment section as a
TODO for powerpc.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/disasm.c | 143 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index a848e6f5f05a..63681df6482b 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -1585,6 +1585,144 @@ static void print_capstone_detail(cs_insn *insn, char *buf, size_t len,
 	}
 }
 
+static int symbol__disassemble_capstone_powerpc(char *filename, struct symbol *sym,
+					struct annotate_args *args)
+{
+	struct annotation *notes = symbol__annotation(sym);
+	struct map *map = args->ms.map;
+	struct dso *dso = map__dso(map);
+	struct nscookie nsc;
+	u64 start = map__rip_2objdump(map, sym->start);
+	u64 end = map__rip_2objdump(map, sym->end);
+	u64 len = end - start;
+	u64 offset;
+	int i, fd, count;
+	bool is_64bit = false;
+	bool needs_cs_close = false;
+	u8 *buf = NULL;
+	struct find_file_offset_data data = {
+		.ip = start,
+	};
+	csh handle;
+	char disasm_buf[512];
+	struct disasm_line *dl;
+	u32 *line;
+	bool disassembler_style = false;
+
+	if (args->options->objdump_path)
+		return -1;
+
+	nsinfo__mountns_enter(dso->nsinfo, &nsc);
+	fd = open(filename, O_RDONLY);
+	nsinfo__mountns_exit(&nsc);
+	if (fd < 0)
+		return -1;
+
+	if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data,
+			    &is_64bit) == 0)
+		goto err;
+
+	if (!args->options->disassembler_style ||
+			!strcmp(args->options->disassembler_style, "att"))
+		disassembler_style = true;
+
+	if (capstone_init(maps__machine(args->ms.maps), &handle, is_64bit, disassembler_style) < 0)
+		goto err;
+
+	needs_cs_close = true;
+
+	buf = malloc(len);
+	if (buf == NULL)
+		goto err;
+
+	count = pread(fd, buf, len, data.offset);
+	close(fd);
+	fd = -1;
+
+	if ((u64)count != len)
+		goto err;
+
+	line = (u32 *)buf;
+
+	/* add the function address and name */
+	scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
+		  start, sym->name);
+
+	args->offset = -1;
+	args->line = disasm_buf;
+	args->line_nr = 0;
+	args->fileloc = NULL;
+	args->ms.sym = sym;
+
+	dl = disasm_line__new(args);
+	if (dl == NULL)
+		goto err;
+
+	annotation_line__add(&dl->al, &notes->src->source);
+
+	/*
+	 * TODO: enable disassm for powerpc
+	 * count = cs_disasm(handle, buf, len, start, len, &insn);
+	 *
+	 * For now, only binary code is saved in disassembled line
+	 * to be used in "type" and "typeoff" sort keys. Each raw code
+	 * is 32 bit instruction. So use "len/4" to get the number of
+	 * entries.
+	 */
+	count = len/4;
+
+	for (i = 0, offset = 0; i < count; i++) {
+		args->offset = offset;
+		sprintf(args->line, "%x", line[i]);
+
+		dl = disasm_line__new(args);
+		if (dl == NULL)
+			goto err;
+
+		annotation_line__add(&dl->al, &notes->src->source);
+
+		offset += 4;
+	}
+
+	/* It failed in the middle */
+	if (offset != len) {
+		struct list_head *list = &notes->src->source;
+
+		/* Discard all lines and fallback to objdump */
+		while (!list_empty(list)) {
+			dl = list_first_entry(list, struct disasm_line, al.node);
+
+			list_del_init(&dl->al.node);
+			disasm_line__free(dl);
+		}
+		count = -1;
+	}
+
+out:
+	if (needs_cs_close)
+		cs_close(&handle);
+	free(buf);
+	return count < 0 ? count : 0;
+
+err:
+	if (fd >= 0)
+		close(fd);
+	if (needs_cs_close) {
+		struct disasm_line *tmp;
+
+		/*
+		 * It probably failed in the middle of the above loop.
+		 * Release any resources it might add.
+		 */
+		list_for_each_entry_safe(dl, tmp, &notes->src->source, al.node) {
+			list_del(&dl->al.node);
+			free(dl);
+		}
+	}
+	count = -1;
+	goto out;
+}
+
 static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
 					struct annotate_args *args)
 {
@@ -1942,6 +2080,11 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
 			err = symbol__disassemble_raw(symfs_filename, sym, args);
 			if (err == 0)
 				goto out_remove_tmp;
+#ifdef HAVE_LIBCAPSTONE_SUPPORT
+			err = symbol__disassemble_capstone_powerpc(symfs_filename, sym, args);
+			if (err == 0)
+				goto out_remove_tmp;
+#endif
 		}
 	}
 
-- 
2.43.0

