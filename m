Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B4935637A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 07:50:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFYQV2GtQz3brc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 15:50:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V7PoZGkq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V7PoZGkq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFYPv6nnpz2yxn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 15:49:55 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1375XLxn111831; Wed, 7 Apr 2021 01:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=voUXV55wZ5rGFLWGS5aoysNdLTjS7e66EBBAqYPFbRs=;
 b=V7PoZGkq9HYXPLIDtLtM0EQQ+soqxOpvaN6puhLsdUKIhMJc5Ao65fKRF3RX+KWqurH7
 3xb5FO67gSfrEx8VIJGc4rUu4Lj/3F1LPSxmPELp8yQVWk3wSl/XTgWHCfnl8Ptz8Lmk
 QkLxric9mCsDdUWApx/4ot87lwQ8CGmutfv5nOVZNZJX7XrQVJ/k5HglN3kUlsk9+n8v
 cbUqbH80XNVFzsEZc4nbpNrmmvv3SP67VMD7Os9S50eNDvqaSZZX6P9JfL6LDZNedC1T
 /LOeLpQ5TVZbb4qAgB1Xhi4xupB1L8gTu/1Sz9EInveupafMSlw4HFRdVrJD8abkmJqy ew== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvn05qrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 01:49:48 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1375lA9C020577;
 Wed, 7 Apr 2021 05:49:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgchs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 05:49:45 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1375nhUF14877058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 05:49:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74449A4051;
 Wed,  7 Apr 2021 05:49:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C624A4057;
 Wed,  7 Apr 2021 05:49:41 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.44.100])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 05:49:41 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 0/4] powerpc/selftests: Add Power10 2nd DAWR selftests
Date: Wed,  7 Apr 2021 11:19:34 +0530
Message-Id: <20210407054938.312857-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: upfUNYGd_SVitN3ncxplpWkmBqcyGpLm
X-Proofpoint-ORIG-GUID: upfUNYGd_SVitN3ncxplpWkmBqcyGpLm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-07_03:2021-04-06,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070039
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, shuah@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add selftests for 2nd DAWR supported by Power10.

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
 .../selftests/powerpc/ptrace/perf-hwbreak.c   | 646 +++++++++++++++--
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c |  79 +++
 .../powerpc/ptrace/ptrace-perf-hwbreak.c      | 659 ++++++++++++++++++
 5 files changed, 1345 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c

-- 
2.27.0

