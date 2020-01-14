Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90813B5A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 00:09:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47y5ky6XCqzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 10:09:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mwb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47y32409sQzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 08:07:33 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EKvfcs114748; Tue, 14 Jan 2020 16:07:27 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xhfexe6my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 16:07:27 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00EL5qr7018058;
 Tue, 14 Jan 2020 21:07:32 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 2xf7507vn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 21:07:32 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00EL7P8657344270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jan 2020 21:07:25 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1E716A04D;
 Tue, 14 Jan 2020 21:07:25 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C17B6A054;
 Tue, 14 Jan 2020 21:07:24 +0000 (GMT)
Received: from oc8380061452.ibm.com (unknown [9.53.179.191])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jan 2020 21:07:24 +0000 (GMT)
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
From: Michael Bringmann <mwb@linux.ibm.com>
Subject: [PATCH] Fix display of Maximum Memory
Openpgp: preference=signencrypt
Organization: IBM Linux Technology Center
Message-ID: <55f25626-20ca-0acb-3571-ff636ca4632c@linux.ibm.com>
Date: Tue, 14 Jan 2020 15:07:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_06:2020-01-14,
 2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=992 clxscore=1011
 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001140161
X-Mailman-Approved-At: Wed, 15 Jan 2020 10:07:48 +1100
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
Cc: Gustavo Walbon <gwalbon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
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
index 4ee2594..183aeb7 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -435,12 +435,12 @@ static void parse_em_data(struct seq_file *m)

 static void maxmem_data(struct seq_file *m)
 {
-       unsigned long maxmem = 0;
+       unsigned long long maxmem = 0;

-       maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
-       maxmem += hugetlb_total_pages() * PAGE_SIZE;
+       maxmem += (unsigned long long)drmem_info->n_lmbs * (unsigned long long)drmem_info->lmb_size;
+       maxmem += (unsigned long long)hugetlb_total_pages() * (unsigned long long)PAGE_SIZE;

-       seq_printf(m, "MaxMem=%ld\n", maxmem);
+       seq_printf(m, "MaxMem=%llu\n", maxmem);
 }

 static int pseries_lparcfg_data(struct seq_file *m, void *v)
-- 
1.8.3.1
