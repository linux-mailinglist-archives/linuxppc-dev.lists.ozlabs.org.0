Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B95B561B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR06P64T2z3f9v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:25:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qunY8BtR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qunY8BtR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR01p5chRz3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:21:50 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C7pjmI032519;
	Mon, 12 Sep 2022 08:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=b6v73vyubPiJlRtYNgucKdjOkgMS2VZEDRWMPVRV5hM=;
 b=qunY8BtRa/xRIfzbi6XvHaYRexff/xkz8gtlvanA5jJRo/wZHHrXqGu/xRWDZjlRy5vn
 0d4R0horjqHDQ4LtN7heNMjeXH4BqgMsBcWq7W4WIYMP4AgHXOx9uV0hG1RLPutpqkc4
 ZZnwoe4y1o+lUPg4kCyPEREZYAIgqHcALM3TApMnovqXYnV0mXhbs+zVTlDhCwsd3Dx9
 Ii6CqArXL+PkwT54jSuWg4jjYaxzZoZI9je5vO86LaOUT3KbbxU5WmF5Jq/z87zEczhU
 x8QOFEculwymj34Z6wWh8qLxKVXxQehOjV+HRXM3/l0pvF5qEbKYZDH2klmVFUFKFyfE Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj0rk8svs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:04 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28C7uAWY014900;
	Mon, 12 Sep 2022 08:21:03 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj0rk8suc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:03 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C86eHZ015969;
	Mon, 12 Sep 2022 08:21:01 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3jgj79j33e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C8LMNa23986638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 08:21:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A622EA404D;
	Mon, 12 Sep 2022 08:20:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 748B2A4051;
	Mon, 12 Sep 2022 08:20:54 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.91.220])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 08:20:54 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/16] powerpc: Skip objtool from running on drivers/crypto/vmx/aesp8-ppc.o
Date: Mon, 12 Sep 2022 13:50:09 +0530
Message-Id: <20220912082020.226755-6-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220912082020.226755-1-sv@linux.ibm.com>
References: <20220912082020.226755-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u0YWb1H5U7xGnX856zcOASZG6C8Fst9E
X-Proofpoint-ORIG-GUID: HbCZqxNtpT5TDsI62XNhsjl5YxDTbAEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120027
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With objtool enabled, below warnings are seen when trying to build:
drivers/crypto/vmx/aesp8-ppc.o: warning: objtool: aes_p8_set_encrypt_key+0x44: unannotated intra-function call
drivers/crypto/vmx/aesp8-ppc.o: warning: objtool: .text+0x2448: unannotated intra-function call
drivers/crypto/vmx/aesp8-ppc.o: warning: objtool: .text+0x2d68: unannotated intra-function call

Skip objtool from running on drivers/crypto/vmx/aesp8-ppc.o file for the
following reasons:

- Since this file comes from OpenSSL, and since it is a perl file which
  generates a .S file, it may not be the best choice to make too many
  code changes to such files, unless absolutely necessary.

- As far as the objtool --mcount functionality is concerned, we do not
  have to run objtool on this file because there are no calls to
  _mcount.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 drivers/crypto/vmx/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 2560cfea1dec..7b41f0da6807 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -9,3 +9,5 @@ targets += aesp8-ppc.S ghashp8-ppc.S
 
 $(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perl)
+
+OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
-- 
2.31.1

