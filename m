Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BD517CB56
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 03:48:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z87N00kWzF0ZR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 13:48:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z84Y6rxrzDr5b
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 13:46:02 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0272gwp1113159; Fri, 6 Mar 2020 21:45:51 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfknewm6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 21:45:50 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0272eBQo021717;
 Sat, 7 Mar 2020 02:45:50 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 2yffk77yvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Mar 2020 02:45:50 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0272jnwj54526450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 7 Mar 2020 02:45:49 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC02DAC05B;
 Sat,  7 Mar 2020 02:45:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A25CAC060;
 Sat,  7 Mar 2020 02:45:49 +0000 (GMT)
Received: from linux-td1r.aus.stglabs.ibm.com (unknown [9.40.195.185])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  7 Mar 2020 02:45:49 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries: fix of_read_drc_info_cell() to point at next
 record
Date: Fri,  6 Mar 2020 20:45:47 -0600
Message-Id: <20200307024547.5748-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.16.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_09:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=1 clxscore=1011 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003070017
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
Cc: mwb@linux.vnet.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The expectation is that when calling of_read_drc_info_cell()
repeatedly to parse multiple drc-info records that the in/out curval
parameter points at the start of the next record on return. However,
the current behavior has curval still pointing at the final value of
the record just parsed. The result of which is that if the
ibm,drc-info property contains multiple properties the parsed value
of the drc_type for any record after the first has the power_domain
value of the previous record appended to the type string.

Ex: observed the following 0xffffffff prepended to PHB

[   69.485037] drc-info: type: \xff\xff\xff\xffPHB, prefix: PHB , index_start: 0x20000001
[   69.485038] drc-info: suffix_start: 1, sequential_elems: 3072, sequential_inc: 1
[   69.485038] drc-info: power-domain: 0xffffffff, last_index: 0x20000c00

Fix by incrementing curval past the power_domain value to point at
drc_type string of next record.

Fixes: a29396653b8bf ("pseries/drc-info: Search DRC properties for CPU indexes")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/of_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/of_helpers.c b/arch/powerpc/platforms/pseries/of_helpers.c
index 66dfd8256712..23241c71ef37 100644
--- a/arch/powerpc/platforms/pseries/of_helpers.c
+++ b/arch/powerpc/platforms/pseries/of_helpers.c
@@ -88,7 +88,7 @@ int of_read_drc_info_cell(struct property **prop, const __be32 **curval,
 		return -EINVAL;
 
 	/* Should now know end of current entry */
-	(*curval) = (void *)p2;
+	(*curval) = (void *)(++p2);
 	data->last_drc_index = data->drc_index_start +
 		((data->num_sequential_elems - 1) * data->sequential_inc);
 
-- 
2.16.4

