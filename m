Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629F13C6B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 15:56:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yVkt1pyZzDqSg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 01:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mwb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yVhd6rwMzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:54:09 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00FEbr5c093089; Wed, 15 Jan 2020 09:54:03 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xhbpsksaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 09:54:03 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00FEe4dM032635;
 Wed, 15 Jan 2020 14:54:02 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2xf74yqa43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 14:54:02 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00FEs0cK28836190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 14:54:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF3AC78068;
 Wed, 15 Jan 2020 14:54:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C3207805F;
 Wed, 15 Jan 2020 14:53:59 +0000 (GMT)
Received: from oc8380061452.ibm.com (unknown [9.80.230.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jan 2020 14:53:59 +0000 (GMT)
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Gustavo Walbon
 <gwalbon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
From: Michael Bringmann <mwb@linux.ibm.com>
Subject: [PATCH v2] Fix display of Maximum Memory
Openpgp: preference=signencrypt
Organization: IBM Linux Technology Center
Message-ID: <5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com>
Date: Wed, 15 Jan 2020 08:53:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-15_02:2020-01-15,
 2020-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001150119
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Correct overflow problem in calculation+display of Maximum Memory
value to syscfg where 32bits is insufficient.

Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index e33e8bc..f00411c 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -433,12 +433,12 @@ static void parse_em_data(struct seq_file *m)
 
 static void maxmem_data(struct seq_file *m)
 {
-	unsigned long maxmem = 0;
+	u64 maxmem = 0;
 
-	maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
-	maxmem += hugetlb_total_pages() * PAGE_SIZE;
+	maxmem += (u64)drmem_info->n_lmbs * drmem_info->lmb_size;
+	maxmem += (u64)hugetlb_total_pages() * PAGE_SIZE;
 
-	seq_printf(m, "MaxMem=%ld\n", maxmem);
+	seq_printf(m, "MaxMem=%llu\n", maxmem);
 }
 
 static int pseries_lparcfg_data(struct seq_file *m, void *v)
-- 
1.8.3.1

