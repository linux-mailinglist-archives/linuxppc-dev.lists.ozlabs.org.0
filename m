Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C89390251
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 15:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqFFm6xm0z3cKn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 23:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TMxGdCHu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TMxGdCHu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqFF65zFcz303b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 23:25:14 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PD4Zw8182052; Tue, 25 May 2021 09:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=+vT5Z/jJvHuZa6PGOubcnpd4m95ybDTYjN6RuvR16ls=;
 b=TMxGdCHu9XvPhT78SSYZQ6+lYpB++vyKsa/VVlE53ypZTySjlKLtLxSZrLyK9lo4AC2z
 EUBiP78rs4Jq+E08GLNq4f9Ftjk9QNHWPrLLXI1baIIImAE0CaGj8807EJTtHYZ05N5q
 JxaSN22hnP94Hg6UsTz+IGf51NgUYaeEnkCdiNTLJppAy+VmwCtu+VQHI8/oCRwNOkKX
 sH1SXjdwiU1qA50HnCYjb0ceHK6lMabdZR4Qs4Yqv6Z5qhCEE23VuSUVnVFxgH9a8sgq
 M1eHK2BFe3qcgyni3nnRQgLMNqXYKBu1Zqo0Kkaejs3okrlWlDx/yGyHaTH7bAyP5+a8 Wg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s1h5sf1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:25:07 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PDE3sW027851;
 Tue, 25 May 2021 13:25:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 38s1ssr068-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 13:25:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14PDOXBd37552410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 13:24:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69BFF4C04E;
 Tue, 25 May 2021 13:25:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 078564C046;
 Tue, 25 May 2021 13:25:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.179.98])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 13:25:00 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [V2 0/2] selftests/powerpc: Updates to EBB selftest for ISA v3.1
Date: Tue, 25 May 2021 09:24:57 -0400
Message-Id: <1621949099-1470-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DoXEjXlQxpS2hYz_nUS9B-g6KJivoY4E
X-Proofpoint-GUID: DoXEjXlQxpS2hYz_nUS9B-g6KJivoY4E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=934 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105250081
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

