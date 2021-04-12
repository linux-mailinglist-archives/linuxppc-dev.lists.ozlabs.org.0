Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA735C4F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:23:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJmYv4kkYz3bww
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 21:22:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cPnrUfab;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cPnrUfab; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJmYS3ltlz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 21:22:35 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CB4Cth083416; Mon, 12 Apr 2021 07:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=PKnSXYnYIXX6x4rWJ2ELY2b7xTxW364niR2QUwL16Zw=;
 b=cPnrUfabOrD6VfTDZWliSk4LhAVAQC0+uVkaiSdgPSdTdtxB0Cl+BVeax4RGPuS7Uuuo
 YpfYTsS5DKuHhnpPr6862DwQAyVjfMtg2XDhb97asdsKSsyICdTsHEF4LE/dEPxesuLe
 8/3XZM7yt4UHYXLZKUUE9dZxRHMpVVRrAANG1lIiHGvswYV9JXDDk+XlsJpB0YivrzSe
 v3Htq49p0bKsnJe1TAPGLeONKK4jASddGdSf089Zo5PyJDAJnNEZ/GpKR2eVeemVLAoT
 rODcrht0S7wxHTNbZSb2jhNeZfO0Gc0UZrG5rnbdIUTBL85q46PZnlCx6+wXUO/g3RMe 9A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vkddvada-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 07:22:27 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13CBHuCv017491;
 Mon, 12 Apr 2021 11:22:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n89rb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 11:22:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13CBM0oJ15204648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 11:22:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7860CAE056;
 Mon, 12 Apr 2021 11:22:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67FFAAE04D;
 Mon, 12 Apr 2021 11:22:20 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.145])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Apr 2021 11:22:20 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 0/4] powerpc/selftests: Add Power10 2nd DAWR selftests
Date: Mon, 12 Apr 2021 16:52:14 +0530
Message-Id: <20210412112218.128183-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2r83auvufwAdzzv_NBVBfG_pC63ad425
X-Proofpoint-ORIG-GUID: 2r83auvufwAdzzv_NBVBfG_pC63ad425
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_09:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120074
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Power10 introduced 2nd watchpoint (DAWR). ISA 3.1, Book 3S, Ch 9 -
'Debug Facilities' covers the feature in detail. Kernel patches to
enable the 2nd DAWR are already in[1], including kvm enablement[2].
These patches adds selftests for 2nd DAWR. 

[1]: https://git.kernel.org/torvalds/c/deb2bd9bcc8428d4b65b6ba640ba8b57c1b20b17
[2]: https://git.kernel.org/torvalds/c/bd1de1a0e6eff4bde5ceae969673b85b8446fd6a

v2: https://lore.kernel.org/r/20210407054938.312857-1-ravi.bangoria@linux.ibm.com
v2->v3:
 - Fixed some checkpatch warnings

v1: https://lore.kernel.org/r/20200723102058.312282-1-ravi.bangoria@linux.ibm.com
v1->v2:
 - Kvm patches are already upstream
 - Rebased selftests to powerpc/next

Ravi Bangoria (4):
  powerpc/selftests/ptrace-hwbreak: Add testcases for 2nd DAWR
  powerpc/selftests/perf-hwbreak: Coalesce event creation code
  powerpc/selftests/perf-hwbreak: Add testcases for 2nd DAWR
  powerpc/selftests: Add selftest to test concurrent perf/ptrace events

 .../selftests/powerpc/ptrace/.gitignore       |   1 +
 .../testing/selftests/powerpc/ptrace/Makefile |   2 +-
 .../selftests/powerpc/ptrace/perf-hwbreak.c   | 631 +++++++++++++++--
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c |  79 +++
 .../powerpc/ptrace/ptrace-perf-hwbreak.c      | 659 ++++++++++++++++++
 5 files changed, 1330 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c

-- 
2.27.0

