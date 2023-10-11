Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA657C4944
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:38:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QtaoWmAl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51lN0Bxnz3cbP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:38:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QtaoWmAl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51kP6X55z3bpd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:37:33 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5WQbn012289
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CovSbjEo4pXDHPirUPh+fQUHP6AcszmTSyL/Og/fHSA=;
 b=QtaoWmAlG64wN3/JAl6rBwkmVZiCi5cklyb1q1IeunoC4OY+jFd+TpGmiY+q7h8w6xFd
 P+UB1CJLmUZAaeu+kyFmZu1CJPC32cySAjll4m/b7Npm4AI8K3SKCegxnetc1PEKxs06
 bemTrK9nISZRg/QSs5FzaLTyFXCsRTIoiQIEO0RfcuYCzIBtmfTVQuhOhXOIsZZ7qV26
 p2lLMWIpdsGhpWEjhvIP4Oqdsg00WwdyGzoXMMQGl58TX6N4wTPgTkB0EKca45qRci3g
 Tpb0QZiZQsiWOfqMAp4TlQpvVsPltaSHiReCUjSLt/4107AtNbjI5JbuvNzKw4bwjLdC +Q== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnn2g4rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B2ODS3025891
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnndw4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bRe023397112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AD0B20043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A35F2004B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:26 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7CC5D60531;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/12] powerpc/pseries: Restructure hvc_get_chars() endianness
Date: Wed, 11 Oct 2023 16:37:01 +1100
Message-ID: <20231011053711.93427-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PIGUHhzw8R01G3rMwp_amvJQokfQfn_L
X-Proofpoint-GUID: PIGUHhzw8R01G3rMwp_amvJQokfQfn_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_03,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310110050
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports an endian mismatch in hvc_get_chars().

At first it seemed like the retbuf should be __be64[], but actually
retbuf holds serialized registers returned by the hypervisor call, so
it's correctly CPU endian typed.

Instead, it is the be64_to_cpu() that's misleading. The intent is to do
a byte swap on a little endian CPU. The swap is required because we
wanted to store the register values to memory without 'swapping' bytes,
so that the high order byte of the first register is the first byte
in the result buffer.

In diagram form, on a LE CPU with the letters representing the return
string bytes:

    (register bytes) A B C D E F G H   I J K L M N O P
  (retbuf mem bytes) H G F E D C B A   P O N M L K J I
(buf/lbuf mem bytes) A B C D E F G H   I J K L M N O P

So retbuf stores the registers in CPU endian, and buf always stores in
big endian.

So replace the byte swap function with cpu_to_be64() and cast lbuf as an
array of __be64 to match the semantics closer.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hvconsole.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvconsole.c b/arch/powerpc/platforms/pseries/hvconsole.c
index 1ac52963e08b..647718a15e78 100644
--- a/arch/powerpc/platforms/pseries/hvconsole.c
+++ b/arch/powerpc/platforms/pseries/hvconsole.c
@@ -29,11 +29,11 @@ int hvc_get_chars(uint32_t vtermno, char *buf, int count)
 {
 	long ret;
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
-	unsigned long *lbuf = (unsigned long *)buf;
+	__be64 *lbuf = (__be64 __force *)buf;
 
 	ret = plpar_hcall(H_GET_TERM_CHAR, retbuf, vtermno);
-	lbuf[0] = be64_to_cpu(retbuf[1]);
-	lbuf[1] = be64_to_cpu(retbuf[2]);
+	lbuf[0] = cpu_to_be64(retbuf[1]);
+	lbuf[1] = cpu_to_be64(retbuf[2]);
 
 	if (ret == H_SUCCESS)
 		return retbuf[0];
-- 
2.39.2

