Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A0264197
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 11:24:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnD3n50sczDqZm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 19:24:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AtJd4BZN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnD1k6dLZzDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 19:22:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08A92jxi016335; Thu, 10 Sep 2020 05:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XV+b+l4EK1i++0wxPJ2Ef+aZ1FchdQdLkP57dxe0STQ=;
 b=AtJd4BZNeENMAcMdUCLP8F39dmPhGUXHWqrxmH6P16iPDqxoU0VDmEUB9CsDPF8aFDoG
 OrN/l+bSqcsBxjdWplYN6Xx8d5p6qahYLoImeD3SwUKmNXfYPcdj9ZBlmdjdaUqWJK1L
 53+0GQ2dMyLBpKtgeXctx4ZOd7bJegOsLkX3p7JNijKfa6SQ7284IHESXmzFxDYQbo+E
 YVrbOdWqcb97ESUdBxHzObLTs6biAmp4JQ94dvMlH6BIUTvJJ/QvP+rHtcj2LwRVO5cS
 +nbw89UF5AT+QAD7BnmP3ADjbXjQrFn+7hw1wy8Gi0Ppbg7vcWO9ipkwphD4xbI1KE8C 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33fg9ejbvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 05:22:26 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08A93bvL019978;
 Thu, 10 Sep 2020 05:22:25 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33fg9ejbuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 05:22:24 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08A9Cfpf030248;
 Thu, 10 Sep 2020 09:22:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 33c2a8dvdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 09:22:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08A9MJlf37880154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 09:22:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74761A405F;
 Thu, 10 Sep 2020 09:22:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 994F4A405B;
 Thu, 10 Sep 2020 09:22:15 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.112.148])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Sep 2020 09:22:15 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 10 Sep 2020 14:52:14 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH] powerpc/papr_scm: Fix warning triggered by perf_stats_show()
Date: Thu, 10 Sep 2020 14:52:12 +0530
Message-Id: <20200910092212.107674-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_01:2020-09-10,
 2020-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1011 adultscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100080
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A warning is reported by the kernel in case perf_stats_show() returns
an error code. The warning is of the form below:

 papr_scm ibm,persistent-memory:ibm,pmemory@44100001:
 	  Failed to query performance stats, Err:-10
 dev_attr_show: perf_stats_show+0x0/0x1c0 [papr_scm] returned bad count
 fill_read_buffer: dev_attr_show+0x0/0xb0 returned bad count

On investigation it looks like that the compiler is silently truncating the
return value of drc_pmem_query_stats() from 'long' to 'int', since the
variable used to store the return code 'rc' is an 'int'. This
truncated value is then returned back as a 'ssize_t' back from
perf_stats_show() to 'dev_attr_show()' which thinks of it as a large
unsigned number and triggers this warning..

To fix this we update the type of variable 'rc' from 'int' to
'ssize_t' that prevents the compiler from truncating the return value
of drc_pmem_query_stats() and returning correct signed value back from
perf_stats_show().

Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance
       stats from PHYP')
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index a88a707a608aa..9f00b61676ab9 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -785,7 +785,8 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 static ssize_t perf_stats_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	int index, rc;
+	int index;
+	ssize_t rc;
 	struct seq_buf s;
 	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
-- 
2.26.2

