Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A67B156D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:54:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OtqbYSxf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx5NB02yGz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:54:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OtqbYSxf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx5LJ6vlWz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:52:40 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38S77JvZ008653;
	Thu, 28 Sep 2023 07:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=H4uAvREpv0H0UPvfVs51xB+GBB6VVMiJ2za41fNKKdM=;
 b=OtqbYSxflbWAeHK8BVBSgo8QvbfTf4wiGnx7/y7TC5vJ7zqrW5rM33StipvCxauhJzWz
 YvEk9p1NwwUrcQvZ2tSJlb7djhfijQzJ/mAoCnYcFIbP6Nz8FikjawWYmyXp6ob6EUjt
 T6hvykmy7hXlLczZQoFGyDgBcrquEVouYI5dpTEtpgRyUQ86VO9u0N0Tt8GGO2kVlgfd
 UvbuM6G1fa5TP6jfSdh10VfMFW4Q0zyZUhENUQY9Sb+3z4TqS0xjQcsQks9wjxwWdz9V
 IcDWTBYlNj1eJ9eqBgCqboW118bAktrHTkgg/J9T9DhffUv17dTStR7sn+CVS8hJj8YE Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcvmdmygw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 07:52:30 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38S7jjpa021308;
	Thu, 28 Sep 2023 07:52:29 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcvmdmyfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 07:52:29 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38S7kv8F030409;
	Thu, 28 Sep 2023 07:52:28 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tad221vjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 07:52:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38S7qMrg47317266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Sep 2023 07:52:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B213020043;
	Thu, 28 Sep 2023 07:52:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A38A20040;
	Thu, 28 Sep 2023 07:52:20 +0000 (GMT)
Received: from athiras-mbp.in.ibm.com (unknown [9.109.214.47])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Sep 2023 07:52:20 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V5 2/3] tools/perf: Add "is_kmod" to struct dso to check if it is kernel module
Date: Thu, 28 Sep 2023 13:22:12 +0530
Message-Id: <20230928075213.84392-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230928075213.84392-1-atrajeev@linux.vnet.ibm.com>
References: <20230928075213.84392-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ox8cOUWDt8mszB-CZHBJUU2npDbGvGrp
X-Proofpoint-GUID: c2qbXnNBzNQl00ivocuq59RASnmcYVTO
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

Update "struct dso" to include new member "is_kmod".
This new field will determine if the file is a kernel
module or not.

To resolve the address from a sample, perf looks at the
DSO maps. In case of address from a kernel module, there
were some address found to be not resolved. This was
observed while running perf test for "Object code reading".
Though the ip falls beteen the start address of the loaded
module (perf map->start ) and end address ( perf map->end),
it was unresolved.

This was happening because in some cases for kernel
modules, address from sample points to stub instructions.
To identify if the DSO is a kernel module, the new field
"is_kmod" is added to "struct dso".

Reported-by: Disha Goel <disgoel@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v5:
 This patch adds is_kmod field to dso to detect if
 the dso is a kernel module

 tools/perf/util/dso.c | 2 ++
 tools/perf/util/dso.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index bdfead36b83a..1f629b6fb7cf 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -477,6 +477,7 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
 		dso->comp = m->comp;
 	}
 
+	dso->is_kmod = 1;
 	dso__set_short_name(dso, strdup(m->name), true);
 }
 
@@ -1338,6 +1339,7 @@ struct dso *dso__new_id(const char *name, struct dso_id *id)
 		dso->has_srcline = 1;
 		dso->a2l_fails = 1;
 		dso->kernel = DSO_SPACE__USER;
+		dso->is_kmod = 0;
 		dso->needs_swap = DSO_SWAP__UNSET;
 		dso->comp = COMP_ID__NONE;
 		RB_CLEAR_NODE(&dso->rb_node);
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 70fe0fe69bef..3759de8c2267 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -162,6 +162,7 @@ struct dso {
 	char		 *symsrc_filename;
 	unsigned int	 a2l_fails;
 	enum dso_space_type	kernel;
+	bool			is_kmod;
 	enum dso_swap_type	needs_swap;
 	enum dso_binary_type	symtab_type;
 	enum dso_binary_type	binary_type;
-- 
2.31.1

