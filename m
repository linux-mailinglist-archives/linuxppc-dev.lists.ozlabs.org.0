Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0783964EB6A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 13:28:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYT0C6r2Mz3bym
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 23:28:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBDPubfQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYSzC1lVrz3bTF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 23:27:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBDPubfQ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NYSzB4b8jz4xP3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 23:27:18 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NYSzB4Twrz4xND; Fri, 16 Dec 2022 23:27:18 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBDPubfQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NYSzB1Qmfz4xMy;
	Fri, 16 Dec 2022 23:27:17 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGBhMk8018966;
	Fri, 16 Dec 2022 12:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wEoS/RqcedrWjNRe4KvKsThGfA65Zb2rli1TbSB4jvc=;
 b=dBDPubfQ09nDTatNeiOfHTKERHD41xqMuFQ7T51cR88ynBoJWR3eY4D3+B+4VpIaU1Ke
 OndH4wMmT4F2WWKm5TiW+iWIIcbzXyK6Z3hQi5rFE/V10GRMYGNMMfYXOp257w6eHcug
 RaKoORL3NJAmXTukKmVVxltx1zgba3syQXElahFWcu+O0XlpPSb8xtDVjE8nBLXrzmdw
 seO7pY0sCo6+CYEc6T0o6BoaMLOuknE6t7xUd/4yDfkuG+qmj6dAAK8H7BgovOI01CeS
 UFZuEdgetqjPKi8iiZHE6OWf/GJyZYGZ48wgF46B4uQWJ41mX2EGixUh6Xc5sWL9rrkg nA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgnv64f2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 12:27:15 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BG2Z0l8027909;
	Fri, 16 Dec 2022 12:27:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3meyqxu8vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 12:27:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BGCRBnQ24379884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Dec 2022 12:27:11 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A27920043;
	Fri, 16 Dec 2022 12:27:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68A3B20040;
	Fri, 16 Dec 2022 12:27:09 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.82.55])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Dec 2022 12:27:09 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/kexec_file: print error string on usable memory property update failure
Date: Fri, 16 Dec 2022 17:57:08 +0530
Message-Id: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8iJ59fUX55QO7unAL5oXPi3VTe4FC6WC
X-Proofpoint-GUID: 8iJ59fUX55QO7unAL5oXPi3VTe4FC6WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_07,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=719 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160107
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Print the FDT error description along with the error message if failed
to set the "linux,drconf-usable-memory" property in the kdump kernel's
FDT.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/file_load_64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 349a781cea0b3..7602f7e1e634e 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -687,7 +687,8 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
 		ret = fdt_setprop(fdt, node, "linux,drconf-usable-memory",
 				  um_info.buf, (um_info.idx * sizeof(u64)));
 		if (ret) {
-			pr_err("Failed to update fdt with linux,drconf-usable-memory property");
+			pr_err("Failed to update fdt with linux,drconf-usable-memory property: %s",
+			       fdt_strerror(ret));
 			goto out;
 		}
 	}
-- 
2.38.1

