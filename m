Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4268CC61
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 02:59:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9mX61z7vz3cgv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 12:59:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vr8iEW0x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vr8iEW0x;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9mW8526Bz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 12:58:28 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3170m5JE009454;
	Tue, 7 Feb 2023 01:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ovIrOP+fj/2xJeTsmhERh6nR1jLwMF3nBjAeRmOnr+A=;
 b=Vr8iEW0x35awNHF6EKyocaRao3LIs63Cv5hMbCyWMaxOtJkTNBJILg9glsYugyFDSQiV
 OFbAdN3aeXox5Pyl0QQSFjifFWIircdfPlCYKNc9SD3YrK+ngoGU8n+xaYJa5qG+42r1
 1M38qwVpMBbN3yiglQhNo7xKhFyXf/VN44w5/w6/q+YjmSWnv42COhJr5WT1sJMsGbTv
 o4dAMASW+zgT+HhQcF9eeQNi3kC7OqnOkYzA5FgM3kAF0fsMvojmcAh0CairRtMJAtnE
 N0RIsHYfQTT0GG/q38LQ7r+gLYDavYvXQX1Tjb7/6rSzgCbYHlrEy66g2ehBGpZc+49r Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkb5faygn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:23 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3171wMDC004165;
	Tue, 7 Feb 2023 01:58:22 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkb5fayg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:22 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 316HMtcb001926;
	Tue, 7 Feb 2023 01:58:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06k067-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3171wHt440829364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Feb 2023 01:58:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D496520040;
	Tue,  7 Feb 2023 01:58:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 514E920043;
	Tue,  7 Feb 2023 01:58:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Feb 2023 01:58:17 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8355160125;
	Tue,  7 Feb 2023 12:58:15 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] Add generic data patching functions
Date: Tue,  7 Feb 2023 12:56:40 +1100
Message-Id: <20230207015643.590684-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T6i8QyqBJkUk6Sc_PQv3fTEYgh-kqlaT
X-Proofpoint-ORIG-GUID: SLaysTH9P0RLZf4S2xjIOV8ZVSQ6XfXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=761 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070012
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
Cc: erhard_f@mailbox.org, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are issues on ppc64 with using patch_instruction() for arbitrary data.
Add dedicated functions for patching data. More details in the first patch.

Just to explain a couple of quirks:

* ppc32 patch_instruction() is noinline to prevent a mis-optimisation where
  patch_memory() is inlined into patch_branch(), preventing it from being
  inlined into patch_instruction().
* The val32 variable is a big endian workaround. The alternative would be to
  pass the data indirectly through a void*, which would probably not optimise
  as well.
* IS_ENABLED(CONFIG_PPC64) is required to help the ppc32 code optimise out
  the is_dword param.

Benjamin Gray (3):
  powerpc/code-patching: Add generic memory patching
  powerpc/64: Convert patch_instruction() to patch_u32()
  powerpc/32: Convert patch_instruction() to patch_uint()

 arch/powerpc/include/asm/code-patching.h | 33 ++++++++++++
 arch/powerpc/kernel/module_64.c          |  5 +-
 arch/powerpc/kernel/static_call.c        |  2 +-
 arch/powerpc/lib/code-patching.c         | 69 +++++++++++++++++-------
 arch/powerpc/platforms/powermac/smp.c    |  2 +-
 5 files changed, 88 insertions(+), 23 deletions(-)


base-commit: 0bfb97203f5f300777624a2ad6f8f84aea3e8658
--
2.39.1
