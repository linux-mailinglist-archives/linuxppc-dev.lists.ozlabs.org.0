Return-Path: <linuxppc-dev+bounces-4451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A719FAF0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 14:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH03t4mH5z301B;
	Tue, 24 Dec 2024 00:58:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734962314;
	cv=none; b=QaiKfwN8gJ6b0fi4M8X3oAllgLFtrIk4yxrLy7eqF3b9qtl0TQZumctz7x7pqtKoiNbCy6Kudsk62nxBMw1nBD+42DBapyoNzuaTyPl7VkegJN1DOLaylzOUknV0k0x0g4vfo6j4mG5vA+DSBVNZxTk1kEvD+M74yebu/LhFiejrUFoGEle2q69GGCfOADo9WIpBA+Sye5VU3TliGBpzr0A0BN5EXBR6jH0jEdUCGaoir2+JYT1HC5BEJIwiH1ofX75ojE8AmaOVCJ8pFLk90F4+Cqmc1zPS6xU2qncWHwg3jw08oET5A5ccicJqsrPTY+JBpJsUCnLCVAHnmoXCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734962314; c=relaxed/relaxed;
	bh=dgbh9h7yq+bf4IZ36hv9AeouFq+D3Q11BMyETjj4ZJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WJisoV62kgjaA+2HqV/D77SOlKYUyil7bWO4M0IMJ6FlhzPOPVaqoXIphMsmj+nNB6w8Ow/MJBJty5EACxaHIqR49FDt8MniswDz8armjHdTOSbgmJaYgRIZmm6ZYvqfBNwj+OupdIhAbTOmDxGNnHxU21CUt3Ptrz6i3dmL5kaSplxT07rxBbfen5+Zcp7KbiPLTfS60kJ4WQ+5hvr3IdQjs8PAG+Dn7oNfB7Vgw0fpw2FCtVqzQhkLkwUwC20lMx5fF8a32jV9/BZqVyX63s/UP11j81MH+GSsdJPxy8mHuq02y6v48Miu8LR7Nrl2bWCn1b2DxxV6QiqRfrG4xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q1g373r6; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q1g373r6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH03s4QyDz300g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 00:58:33 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN85pL9003922;
	Mon, 23 Dec 2024 13:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=dgbh9h7yq+bf4IZ36hv9AeouFq+D3Q11BMyETjj4Z
	JE=; b=Q1g373r6WzYBmNTQ4SK7VtCJc/qnDGkblrI577wogW7nAChWRC1fTo9X+
	HAUxgBQinfjUD7bnkyXPJ5KT+TvDQiwDdA/jChDUYjq1OuchIVxBHXTxCA+iD62K
	BBZ6gnrwRAHeI2szXPSaXKeisDF5/ilBxOlzpNddfVAS182GCYRNuaZj3EzG+jDl
	CEI/o8tuaGHTtBpu3UJ5Q+OEccLDsAk/G3K84K+0fP0pjkDEd864GyX+SyGXQyJh
	TFL2OcNL/EGh62IffZ2j0bHnRTInIf3Ubom/EYDlyZZWbQ+tqlkkRiZmmN0JdPEf
	pN+0zNMs1es3Yj0RUFlOv0klx5Z5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43q422hb8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:58:27 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BNDwQHg001932;
	Mon, 23 Dec 2024 13:58:26 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43q422hb8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:58:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9u9SY020189;
	Mon, 23 Dec 2024 13:58:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p8cy5yux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:58:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BNDwM9b65274184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Dec 2024 13:58:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5173620043;
	Mon, 23 Dec 2024 13:58:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A19462004B;
	Mon, 23 Dec 2024 13:58:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.252.112])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Dec 2024 13:58:16 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, hbathini@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH] tools/perf: Fix segfault during perf record --off-cpu when debuginfo is not enabled
Date: Mon, 23 Dec 2024 19:28:13 +0530
Message-Id: <20241223135813.8175-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _Usv8j7BfTmHTlu8xyb9b-9efpx3QpCE
X-Proofpoint-ORIG-GUID: joqh_Ar9x7orU_mJvjEJVY4aRvvpwQBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230121
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When kernel is built without debuginfo, running perf record with
--off-cpu results in segfault as below:

   ./perf record --off-cpu -e dummy sleep 1
   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
   libbpf: failed to find valid kernel BTF
   Segmentation fault (core dumped)

The backtrace pointed to:

   #0  0x00000000100fb17c in btf.type_cnt ()
   #1  0x00000000100fc1a8 in btf_find_by_name_kind ()
   #2  0x00000000100fc38c in btf.find_by_name_kind ()
   #3  0x00000000102ee3ac in off_cpu_prepare ()
   #4  0x000000001002f78c in cmd_record ()
   #5  0x00000000100aee78 in run_builtin ()
   #6  0x00000000100af3e4 in handle_internal_command ()
   #7  0x000000001001004c in main ()

Code sequence is:
   static void check_sched_switch_args(void)
   {
        struct btf *btf = btf__load_vmlinux_btf();
        const struct btf_type *t1, *t2, *t3;
        u32 type_id;

        type_id = btf__find_by_name_kind(btf, "btf_trace_sched_switch",
                                         BTF_KIND_TYPEDEF);

btf__load_vmlinux_btf fails when CONFIG_DEBUG_INFO_BTF is not enabled.
Here bpf__find_by_name_kind calls btf__type_cnt with NULL btf
value and results in segfault. To fix this, add a check to see if
btf is not NULL before invoking bpf__find_by_name_kind

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/bpf_off_cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
index a590a8ac1f9d..4269b41d1771 100644
--- a/tools/perf/util/bpf_off_cpu.c
+++ b/tools/perf/util/bpf_off_cpu.c
@@ -100,6 +100,11 @@ static void check_sched_switch_args(void)
 	const struct btf_type *t1, *t2, *t3;
 	u32 type_id;
 
+	if (!btf) {
+		pr_debug("Missing btf, check if CONFIG_DEBUG_INFO_BTF is enabled\n");
+		goto cleanup;
+	}
+
 	type_id = btf__find_by_name_kind(btf, "btf_trace_sched_switch",
 					 BTF_KIND_TYPEDEF);
 	if ((s32)type_id < 0)
-- 
2.43.5


