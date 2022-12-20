Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB260651B6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 08:18:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbnwb5Bx4z3c8d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 18:18:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SQc5joOx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SQc5joOx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbnvg0RVnz3bSn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 18:17:18 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK79Hwv030418;
	Tue, 20 Dec 2022 07:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=N9zeEuLA4wGi0exsaW0YY9KsnK1MgT1P7KLvo2XSR0Q=;
 b=SQc5joOx5PfXOrpIDqkK3aNKy0MI1VftvPZ6i7DboiYbwVG/W0rMFYcLfhCn5wY/+gsb
 bJEC+O4zh2XyX4h7Wa9weN+J69SxYQQ1QDR0bBydMwK1rUhGnZXQgVIi2dBX17A5C/w6
 peZN0JLdtWRGDkoFIC/qy44mnyqvmHEh4ahVo2GgRVdLeGsE1kZExu7mjw3mq94Fs58U
 tFwI2ctJWs02bjRO5rKJ5aMiuIR0BgNK0BsauV1RefwF0GqLWVWTBYff+6/qK/IGR1Ol
 F43o90jCxzMA4ebZcyglKvn5qLrF1585nle6Mn9sSwSKBcA48RfQ4OQ1c8WnryL0rlhl OA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk7r9116a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 07:17:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJLdWli016045;
	Tue, 20 Dec 2022 07:17:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mh6yy3ks2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 07:17:13 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BK7HAfZ24379712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Dec 2022 07:17:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A53BC20043;
	Tue, 20 Dec 2022 07:17:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23A4A20040;
	Tue, 20 Dec 2022 07:17:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Dec 2022 07:17:10 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2E57F6043C;
	Tue, 20 Dec 2022 18:17:07 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] PLPKS bugfixes and enhancements
Date: Tue, 20 Dec 2022 18:16:22 +1100
Message-Id: <20221220071626.1426786-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PAC_4KOD0tHz_RFLoWjAYRjt3b8Ya2N5
X-Proofpoint-ORIG-GUID: PAC_4KOD0tHz_RFLoWjAYRjt3b8Ya2N5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=878
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200058
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
Cc: nayna@linux.ibm.com, gjoyce@linux.ibm.com, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes a few miscellaneous bugs in the plpks driver, and adds some
additional internal APIs that will be used by some patches that are coming
imminently.

This supersedes Nayna's earlier patch at:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221106210744.603240-2-nayna@linux.ibm.com/

Many thanks to Russell Currey and Ben Gray for their help on this series.

Andrew Donnellan (2):
  powerpc/pseries: Fix handling of PLPKS object flushing timeout
  powerpc/pseries: Fix alignment of PLPKS structures and buffers

Nayna Jain (2):
  powerpc/pseries: Expose PLPKS config values, support additional fields
  powerpc/pseries: Implement signed update for PLPKS objects

 arch/powerpc/include/asm/hvcall.h      |   3 +-
 arch/powerpc/platforms/pseries/plpks.c | 220 ++++++++++++++++++++++---
 arch/powerpc/platforms/pseries/plpks.h |  63 +++++++
 3 files changed, 259 insertions(+), 27 deletions(-)

-- 
2.38.1

