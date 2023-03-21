Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC746C2855
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 03:51:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgbhn2S31z3chb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 13:51:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kpwrrBOR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kpwrrBOR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgbgq44p8z303P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 13:50:30 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L0q1H4014684;
	Tue, 21 Mar 2023 02:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TC882UMOQrwawaXoFlWdNZjcau9JYRZSiFhibGxj7G4=;
 b=kpwrrBORexW2eHS0ZLB5bYg8kGMr4JB90bY7kUrZthVFdmxbpDnCc0BCWZuWiwf+9NDK
 N+WPpI6AIysgn0vbOZ0XcOrzJVVLk+pw5l6LYNMJF1CLrRDfZAA0uSoSIDxngka7zNfq
 3ZGWEarAVrKJKgfUdWtzpF9SJOJwXLa50TyFLa6Ja1W2nkKmeZc6sIxC8fpv42pvMxiS
 hTRGzX3cv/RqmUuYKJdQUe/sEUy/IrCDvCkyH5WlGGuXznNsx4BA/bzjMnNxHzlvpnPT
 qVgPMO+eScDHB65HenGGJ42ITZBwHaBYuhG9ee9Qlq2J9qrubO6hWr8x8MVIaoG3iS5s /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pf2de1ufw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 02:50:23 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32L2WxJ1024240;
	Tue, 21 Mar 2023 02:50:23 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pf2de1uff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 02:50:23 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32KNeZp6023986;
	Tue, 21 Mar 2023 02:50:22 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x706hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 02:50:22 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32L2oJOI28180874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Mar 2023 02:50:20 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6A4B58054;
	Tue, 21 Mar 2023 02:50:19 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A10F45805E;
	Tue, 21 Mar 2023 02:50:18 +0000 (GMT)
Received: from sig-9-65-247-153.ibm.com (unknown [9.65.247.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Mar 2023 02:50:18 +0000 (GMT)
Message-ID: <1d0e727e7dbd9a28627ef08ca9df9c86a50175e2.camel@linux.ibm.com>
Subject: [PATCH v2] powerpc/pseries/vas: Ignore VAS update for DLPAR if
 copy/paste is not enabled
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Mon, 20 Mar 2023 19:50:08 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GGHBoYS6aKMWYSUAIzR_VvlC3R7fBC16
X-Proofpoint-ORIG-GUID: s5Lt5RG1P_KJalwd5OCH3hx1ARMyV2bV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_18,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303210018
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
is called from lparcfg_write() to update VAS windows for DLPAR event in
shared processor mode and the kernel gets -ENOTSUPP for HCALLs if the
user-mode NX is not supported. The current VAS implementation also
supports only with Radix page tables. Whereas in dedicated processor
mode, pseries_vas_notifier() is registered only if the copy/paste
feature is enabled. So instead of displaying HCALL error messages,
update VAS capabilities if the copy/paste feature is available.

This patch ignores updating VAS capabilities in pseries_vas_dlpar_cpu()
and returns success if the copy/paste feature is not enabled.
Then lparcfg_write() completes the processor DLPAR operations
without any failures.

Fixes: 2147783d6bf0 ("powerpc/pseries: Use lparcfg to reconfig VAS windows for DLPAR CPU")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
v2: Use bool for copypaste_feat and expand commit message on handling failures

 arch/powerpc/platforms/pseries/vas.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 559112312810..513180467562 100644
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
+		copypaste_feat = false;
 		pr_err("API is supported only with radix page tables\n");
 		return -ENOTSUPP;
 	}
-- 
2.26.3


