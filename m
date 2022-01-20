Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE1A4952D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 18:03:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jfpk55JNZz3bPS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 04:03:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bnGqC2M9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bnGqC2M9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfphY1S5hz30Mf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 04:02:04 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20KGg4vc029253; 
 Thu, 20 Jan 2022 17:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=faFAGZiXw89o1XTPDemJsvkGPTZrfUXh4fkm6hC9r8w=;
 b=bnGqC2M90S+pflYr7eyx8iUsHJpcndv4iNIjsvlx8MBSLCk+VxTlPbTJRX4RcoN3FGAX
 tPJmQNndE8DqesYCbZ96Y/gFzaSJZAq7yMbndxOqru9Zn0F/iYMPyDkkspf7oeN+/Dqq
 TCsSbA7SwZhu/2YLDlqxYI31DVUYwcibT2yo2KRNfwKHPiGDXibMHmml6zIggrbox9wp
 w5AnF5AjK+Lh9TzyjdAlZYZTQd+429TXLngIV4iwQhPB+83HlwpaVE7CHiZz2FJvu9LC
 1UsZg5aosWfmBcc6kcJRuSjNc6l+iMG2HYyWmyr2WG+zuGbGeSesi2wH9zLl2SKf6GLC 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqbftre39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 17:01:52 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20KGfn2g025468;
 Thu, 20 Jan 2022 17:01:51 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqbftre2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 17:01:51 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20KGwLUX020608;
 Thu, 20 Jan 2022 17:01:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3dknwc4au1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 17:01:50 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20KH1nmB28442964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 17:01:49 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75EF3BE05B;
 Thu, 20 Jan 2022 17:01:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D88DBE090;
 Thu, 20 Jan 2022 17:01:47 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.115.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Jan 2022 17:01:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm@vger.kernel.org
Subject: [PATCH 0/2] KVM: selftests: Add powerpc support
Date: Thu, 20 Jan 2022 14:01:07 -0300
Message-Id: <20220120170109.948681-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vt5lnMRW-frrE0qtwx0y1fHTa95vbB7m
X-Proofpoint-GUID: 6ID9o5tI49DXU_7cTmgwD34Rl3vS2CE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_06,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200088
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 paulus@samba.org, linux-kselftest@vger.kernel.org, pbonzini@redhat.com,
 shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds the initial support for ppc64le Book3s with Radix
MMU.

At this time I'm including only the kvm_page_table test and a dummy
test to serve as a sample of what can be done with these tests. I
intend to make a pass over the remaining common tests and add the ones
which could be built for powerpc as well.

patch 1: a prerequisite small fix for the powerpc vcpu_ioctl. It is
         the same I already sent to the ppc mailing list but I'll
         include it here to make this a complete series.

patch 2: the actual infrastructure support.

Fabiano Rosas (2):
  KVM: PPC: Book3S HV: Stop returning internal values to userspace
  KVM: selftests: Add support for ppc64le

 MAINTAINERS                                   |   3 +
 arch/powerpc/kvm/powerpc.c                    |   8 +
 tools/testing/selftests/kvm/.gitignore        |   1 +
 tools/testing/selftests/kvm/Makefile          |  14 +-
 .../selftests/kvm/include/kvm_util_base.h     |   7 +
 .../selftests/kvm/include/ppc64le/processor.h |  43 +++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   5 +
 .../testing/selftests/kvm/lib/powerpc/hcall.S |   6 +
 .../selftests/kvm/lib/powerpc/processor.c     | 343 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  67 ++++
 .../selftests/kvm/powerpc/sample_test.c       | 144 ++++++++
 11 files changed, 638 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/ppc64le/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.S
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/sample_test.c

-- 
2.34.1

