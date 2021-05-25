Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81739031B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 15:52:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqFrR6KN0z3bT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 23:52:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=opMRKyC6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=opMRKyC6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqFqy49n0z2ykL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 23:51:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PDZbIt035962; Tue, 25 May 2021 09:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=iUxsDHxWHVDyQwtmFkxf3HhTnMhycUvusFQ6jx4Iavw=;
 b=opMRKyC6wkFsGYnge0GSjID60dt+Djug9bOfjUFLzqbeCIv58HrtVADzQ9WoENZFfx8d
 raQTeOXT3+iK8jFOYAip/xahzK+S+1yVKpXEZDWbTSWAxsOdyvUvMxqYfSiUjPUhqosV
 6vkDbwOPxv+sguDgIP0Ug4dsuZYjKjsEme6ApiB/Qg4487ggDsaiTKc+/36hq5Nx4O4G
 IDjX+ibsBVSHvBRXNEawiQxZs0wAHODzGerSxwVnJlZDAzRmPwAMvQ3zQGLUPqQ7ApA0
 T8zpXouTw6HCFMW+pRqD4E7rRPovYS8yBiCAxEjNTTbMcgy5lH2W2j3zncW1uudb86Np Eg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rxhw0t7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:51:50 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PDkZ0w010705;
 Tue, 25 May 2021 13:51:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 38s1r500gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 13:51:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14PDpGcf36110672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 13:51:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A25014C046;
 Tue, 25 May 2021 13:51:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D8E64C040;
 Tue, 25 May 2021 13:51:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.179.98])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 13:51:44 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 0/2] selftests/powerpc: Updates to EBB selftest for ISA v3.1
Date: Tue, 25 May 2021 09:51:41 -0400
Message-Id: <1621950703-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gg54-_yEUgDlWC6l_ojsMC2kkNjLD10c
X-Proofpoint-ORIG-GUID: gg54-_yEUgDlWC6l_ojsMC2kkNjLD10c
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=993
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250084
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
Cc: shirisha.ganta1@ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "no_handler_test" in ebb selftests attempts to read the PMU
registers after closing of the event via helper function
"dump_ebb_state". With the MMCR0 control bit (PMCCEXT) in ISA v3.1,
read access to group B registers is restricted when MMCR0 PMCC=0b00.
Hence the call to dump_ebb_state after closing of event will generate
a SIGILL, which is expected.

Test has below in logs:
<<>>
!! child died by signal 4
failure: no_handler_test
<<>>

In other platforms (like power9), the older behaviour works where
group B PMU SPRs are readable. The "dump_ebb_state" is called twice
in the test. The second call after closing of event was done inorder
to dump state of registers when the counters are frozen. But since
the counters should already be frozen by the time first dump is done,
patch1 drops the second call to "dump_ebb_state".

To address the new sigill behaviour in ISA v3.1, patch2 creates
a separate selftest.

Changelog:
v2 -> v3:
	Fixed a space issue in patch2.

v1 -> v2:
        Addressed review comments from Michael Ellerman.
        First version attempted to address the SIGILL
        behaviour in existing "no_handler_test" test itself.
        As per mpe's suggestion, moved that to a separate test
        and removed the second call to "dump_ebb_state" since
        that is actually not needed.

Athira Rajeev (2):
  selftests/powerpc: Fix "no_handler" EBB selftest
  selftests/powerpc: EBB selftest for MMCR0 control for PMU SPRs in ISA
    v3.1

 tools/testing/selftests/powerpc/pmu/ebb/Makefile   |  2 +-
 .../selftests/powerpc/pmu/ebb/no_handler_test.c    |  2 -
 .../powerpc/pmu/ebb/regs_access_pmccext_test.c     | 63 ++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/ebb/regs_access_pmccext_test.c

-- 
1.8.3.1

