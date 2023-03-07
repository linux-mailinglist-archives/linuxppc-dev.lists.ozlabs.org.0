Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D26AD362
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 01:35:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxLn0TxQz3cDF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 11:35:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O6eyPYD9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O6eyPYD9;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxKn1YGTz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:34:52 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326LB4aw030294;
	Tue, 7 Mar 2023 00:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LF85H6lqu17XBLtUfPYqQiffs2hKo3ydaQrgIGANoaM=;
 b=O6eyPYD99naYkdpsIMrSKXo1IR8aj+uV7bnTA+ZPv43EobMfp08YXctmNDjiUx2UxqEX
 z9bOnsdV9qipYmm9es0qA4flbu77h1KK48FENnzyjn894KrW+rZl63DPJ9MPJxFMWa5g
 En4NBGvSwkuEaUaxE9SGBBJ7nyX3Mhg9QEYXS5JKPBK10ksUWxE2yfeUU+X3BjwjGCsM
 gL3pd1Fi/m4a6E5SfVVjnTwhzNX5VlwcqFWRlQsLKKXAGK2GC9YwT3K71AXGS3K3w96O
 Yyi69JKZoRwq6YIbTzR7dB57pY1xN0T+cuqVNb8zWyZck9aJ1nl8d+/rAqmCTwA3NJyk zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p513f3fm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 00:34:45 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3270KQP8034392;
	Tue, 7 Mar 2023 00:34:44 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p513f3fm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 00:34:44 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326N9idN010180;
	Tue, 7 Mar 2023 00:34:44 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3p419e84e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 00:34:44 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3270YfgN5112414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Mar 2023 00:34:41 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBF1B58043;
	Tue,  7 Mar 2023 00:34:41 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACD5F5805E;
	Tue,  7 Mar 2023 00:34:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.64.80])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Mar 2023 00:34:40 +0000 (GMT)
Message-ID: <d1ff8e3f1a0c107d1a047fd66d287c63411b84e1.camel@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/vas: Ignore VAS update for DLPAR if
 copy/paste is not enabled
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Mon, 06 Mar 2023 16:34:30 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w5gstzn-iEFbqYd0J3d1286Rt1GqT39Y
X-Proofpoint-GUID: z5XA-VPLVqx0bfBYeneaug5g1rHu_c7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070003
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The hypervisor supports user-mode NX from Power10. pseries_vas_dlpar_cpu()
is called from lparcfg_write() to update VAS windows for DLPAR CPU event
and the kernel gets -ENOTSUPP for HCALLs if the user-mode NX is not
supported.

This patch ignores updating VAS capabilities and returns success if the
copy/paste feature is not enabled.

Fixes: 2147783d6bf0 ("powerpc/pseries: Use lparcfg to reconfig VAS windows for DLPAR CPU")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 559112312810..dc003849d2c5 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -856,6 +856,13 @@ int pseries_vas_dlpar_cpu(void)
 {
 	int new_nr_creds, rc;
 
+	/*
+	 * NX-GZIP is not enabled. Nothing to do for DLPAR event
+	 */
+	if (!copypaste_feat)
+		return 0;
+
+
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
 				      vascaps[VAS_GZIP_DEF_FEAT_TYPE].feat,
 				      (u64)virt_to_phys(&hv_cop_caps));
@@ -1012,6 +1019,7 @@ static int __init pseries_vas_init(void)
 	 * Linux supports user space COPY/PASTE only with Radix
 	 */
 	if (!radix_enabled()) {
+		copypaste_feat = 0;
 		pr_err("API is supported only with radix page tables\n");
 		return -ENOTSUPP;
 	}
-- 
2.26.3


