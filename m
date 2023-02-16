Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914D698D92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 08:10:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHR0q2Vwjz3cjC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 18:10:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XRZTGYtz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XRZTGYtz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHQzs6sRyz3bgW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 18:09:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31G6g5Mr028580;
	Thu, 16 Feb 2023 07:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ObfYPI8BxAmE67i4/uRkNGu54FbHiAuxTVgKTzbuLYc=;
 b=XRZTGYtz55XyPGqimCurGuD0mex0deOTB094g1wEzTeWyYI4w69r/6r7wFpecgm5e485
 ns9OlQVvJpmlOPui2j903I4pHyFJ3X5w+mXFM7hvrrxWWUpapiFHl014b1ePL+Av6v1L
 pOnqroY4vBN7enWpKk5+6pLJxHJrqNhxFfq1ocswemIKQgMEdrAY4GBIcYTU9mgWwpif
 BXgwpoi0MAHuAyTYOp/j+U73N3bNnquoQsxS/1KWo3niCNO0p0r3d8xbWccusHMWCdEg
 ivY/cj/vP0Eu5CnlOAPd9lVndLAwKoBixOkYdeWGqQsTbA0sy9+Xhs62MeV8dBqKIkz0 uw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsfeurn97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 07:09:26 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G13OXf007931;
	Thu, 16 Feb 2023 07:09:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3np2n6cmwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 07:09:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31G79M9a46662134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 07:09:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5726120043;
	Thu, 16 Feb 2023 07:09:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C5C20040;
	Thu, 16 Feb 2023 07:09:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Feb 2023 07:09:21 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D99AC60217;
	Thu, 16 Feb 2023 18:09:16 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, ruscur@russell.cc
Subject: [PATCH] powerpc/pseries: Fix endianness issue when parsing PLPKS secvar flags
Date: Thu, 16 Feb 2023 18:09:03 +1100
Message-Id: <20230216070903.355091-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mA2VIPttkLky_sSvFDLtm0NsGcDk2WqM
X-Proofpoint-ORIG-GUID: mA2VIPttkLky_sSvFDLtm0NsGcDk2WqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_05,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=872 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160059
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
Cc: nayna@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a user updates a variable through the PLPKS secvar interface, we take
the first 8 bytes of the data written to the update attribute to pass
through to the H_PKS_SIGNED_UPDATE hcall as flags. These bytes are always
written in big-endian format.

Currently, the flags bytes are memcpy()ed into a u64, which is then loaded
into a register to pass as part of the hcall. This means that on LE
systems, the bytes are in the wrong order.

Use be64_to_cpup() instead, to ensure the flags bytes are byteswapped if
necessary.

Reported-by: Stefan Berger <stefanb@linux.ibm.com>
Fixes: ccadf154cb00 ("powerpc/pseries: Implement secvars for dynamic secure boot")
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/plpks-secvar.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
index f6c8888f4076..257fd1f8bc19 100644
--- a/arch/powerpc/platforms/pseries/plpks-secvar.c
+++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
@@ -135,7 +135,8 @@ static int plpks_set_variable(const char *key, u64 key_len, u8 *data,
 		goto err;
 	var.namelen = rc * 2;
 
-	memcpy(&flags, data, sizeof(flags));
+	// Flags are contained in the first 8 bytes of the buffer, and are always big-endian
+	flags = be64_to_cpup((__be64 *)data);
 
 	var.datalen = data_size - sizeof(flags);
 	var.data = data + sizeof(flags);
-- 
2.39.1

