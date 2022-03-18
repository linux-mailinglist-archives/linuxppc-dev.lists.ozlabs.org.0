Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94F4DD92A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 12:43:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKhx62Pg5z3bVx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 22:43:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AJRthOow;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AJRthOow; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKhvk0Jxdz3069
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 22:42:41 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IA1AkH010450; 
 Fri, 18 Mar 2022 11:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=PLM4n8qjJqrE3Cjj5JCJoGMbbopc5RimsQ9g3vFE+/0=;
 b=AJRthOow6U7CeltWc3QIx82nrXQ9Rr+KBMRe2qeh2yoZD22J3Nqf6i7NTNc54e2sYco6
 ZK0jf444F6QHwQtTWDYTu6luj7SP1WrKclrnkJDb7EjUztV82VKL0i1DoPR9Zf7/GCX/
 n5hiugVJcPnDlpU27y51Zbm5bY2JBnRD8LsenxlPF5ko5xNgabjZYEDkpWiHcNJ7ztGm
 DXtVp1TWRaUhScP40WHZzWOBdzoctvxYBjGUI2zd21uBis9/RWjNZoZ+bOkXeXO6T0e/
 qK4xPjKbniMc09Zlpx980d9ME5PiV30H7/JTSsfYpSQB1lkgma/EhfbY4R8WBi9IA4Ad Wg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3euwuj82fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 11:42:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IBWkOl002984;
 Fri, 18 Mar 2022 11:42:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3erk58ue6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 11:42:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22IBg77Q45678926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 11:42:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDCFC5204E;
 Fri, 18 Mar 2022 11:42:04 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.108.37])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 41C285204F;
 Fri, 18 Mar 2022 11:41:58 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 peterz@infradead.org, dan.j.williams@intel.com, ira.weiny@intel.com,
 vishal.l.verma@intel.com, sfr@canb.auug.org.au
Subject: [PATCH 2/2] powerpc/papr_scm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
Date: Fri, 18 Mar 2022 17:11:33 +0530
Message-Id: <20220318114133.113627-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220318114133.113627-1-kjain@linux.ibm.com>
References: <20220318114133.113627-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y20dBBu5ydz6wAu1HCWxEEOO44rvR380
X-Proofpoint-GUID: y20dBBu5ydz6wAu1HCWxEEOO44rvR380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_08,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180064
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, linux-mm@kvack.org, atrajeev@linux.vnet.ibm.com,
 kjain@linux.ibm.com, vaibhav@linux.ibm.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following build failure occures when CONFIG_PERF_EVENTS is not set
as generic pmu functions are not visible in that scenario.

arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: ‘struct perf_event’ has no member named ‘attr’
         p->nvdimm_events_map[event->attr.config],
                                   ^~
In file included from ./include/linux/list.h:5,
                 from ./include/linux/kobject.h:19,
                 from ./include/linux/of.h:17,
                 from arch/powerpc/platforms/pseries/papr_scm.c:5:
arch/powerpc/platforms/pseries/papr_scm.c: In function ‘papr_scm_pmu_event_init’:
arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: ‘struct perf_event’ has no member named ‘pmu’
  struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
                                                 ^~
./include/linux/container_of.h:18:26: note: in definition of macro ‘container_of’
  void *__mptr = (void *)(ptr);     \
                          ^~~
arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion of macro ‘to_nvdimm_pmu’
  struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
                              ^~~~~~~~~~~~~
In file included from ./include/linux/bits.h:22,
                 from ./include/linux/bitops.h:6,
                 from ./include/linux/of.h:15,
                 from arch/powerpc/platforms/pseries/papr_scm.c:5:

Fix the build issue by adding check for CONFIG_PERF_EVENTS config option
and disabling the papr_scm perf interface support incase this config
is not set

Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") (Commit id
based on linux-next tree)
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

---
- This fix patch changes are added and tested on top of linux-next tree
  on the 'next-20220315' branch.
---
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 4f65bc0fb861..ffe85aeb4127 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -19,7 +19,10 @@
 #include <asm/papr_pdsm.h>
 #include <asm/mce.h>
 #include <asm/unaligned.h>
+
+#ifdef CONFIG_PERF_EVENTS
 #include <linux/perf_event.h>
+#endif
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -69,7 +72,9 @@
 #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
 #define PAPR_SCM_PERF_STATS_VERSION 0x1
 
+#ifdef CONFIG_PERF_EVENTS
 #define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
+#endif
 
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
@@ -127,8 +132,10 @@ struct papr_scm_priv {
 	/* The bits which needs to be overridden */
 	u64 health_bitmap_inject_mask;
 
+#ifdef CONFIG_PERF_EVENTS
 	 /* array to have event_code and stat_id mappings */
 	char **nvdimm_events_map;
+#endif
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -349,6 +356,7 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 	return 0;
 }
 
+#ifdef CONFIG_PERF_EVENTS
 static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev, u64 *count)
 {
 	struct papr_scm_perf_stat *stat;
@@ -560,6 +568,7 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 pmu_err_print:
 	dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
 }
+#endif
 
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
@@ -1537,7 +1546,10 @@ static int papr_scm_probe(struct platform_device *pdev)
 		goto err2;
 
 	platform_set_drvdata(pdev, p);
+
+#ifdef CONFIG_PERF_EVENTS
 	papr_scm_pmu_register(p);
+#endif
 
 	return 0;
 
@@ -1557,11 +1569,14 @@ static int papr_scm_remove(struct platform_device *pdev)
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
 
+#ifdef CONFIG_PERF_EVENTS
 	if (pdev->archdata.priv)
 		unregister_nvdimm_pmu(pdev->archdata.priv);
 
 	pdev->archdata.priv = NULL;
 	kfree(p->nvdimm_events_map);
+#endif
+
 	kfree(p->bus_desc.provider_name);
 	kfree(p);
 
-- 
2.31.1

