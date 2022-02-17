Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF94B9DA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 11:54:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzsCC5Gkrz3cY2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 21:54:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ggvVo+vv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ggvVo+vv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzsBV3Wdjz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 21:53:38 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H9GcXc026798; 
 Thu, 17 Feb 2022 10:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=+dGH/2Qnz2ZixUXcoA7pIZfLXjXNmqKhgqtkUp3YQQs=;
 b=ggvVo+vviSD/FcGPuNBtxP/MszjQx2NM5gQyGlmpmc78rmyhjdS8C5Rl3Tfv0KPh5h2T
 7RKawWzFgJ1m8kXH2Zgugz1G3L8YWmwxK6HIlpmgeVPW3Z3uJJXqjtawrPEKXJ8a5XDH
 6uQrRl2oCwguzDLwEMuP1aKpO09/u+JN5UWgHXSoAXS/TlCuzc2Yk8qOZLEx9f2XmK9m
 UX+POvn0/p+JXnFgO6Qn1qztI7EzziNrg7SGOAfePRFe+QXOTS+AeuHZVihW4kSv2dB7
 RGdhSgvB36o4EZSIcOrNF40ufqQJ9BKBvJ+Eao/o4x4WuXRvjJFKM42UkSeTqIENQyiL eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9kkcj07h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 10:53:31 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21H9kcjk008611;
 Thu, 17 Feb 2022 10:53:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9kkcj06r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 10:53:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HAmgnV007132;
 Thu, 17 Feb 2022 10:53:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64hagwce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 10:53:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HArPHt36831530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 10:53:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47C23A4085;
 Thu, 17 Feb 2022 10:53:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 885F9A4057;
 Thu, 17 Feb 2022 10:53:22 +0000 (GMT)
Received: from pratiks-thinkpad.ibm.com (unknown [9.43.63.58])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Feb 2022 10:53:22 +0000 (GMT)
From: "Pratik R. Sampat" <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, shuah@kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, psampat@linux.ibm.com,
 pratik.r.sampat@gmail.com
Subject: [PATCH v9 0/2] Interface to represent PAPR firmware attributes
Date: Thu, 17 Feb 2022 16:23:19 +0530
Message-Id: <20220217105321.52941-1-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iaAbvffTdT58zgewYr8GXvidCzCpOK9E
X-Proofpoint-GUID: NNwDqmTIlPmevpb2Nwb8leZ4xbrwzKZp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170044
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RFC: https://lkml.org/lkml/2021/6/4/791
PATCH v1: https://lkml.org/lkml/2021/6/16/805
PATCH v2: https://lkml.org/lkml/2021/7/6/138
PATCH v3: https://lkml.org/lkml/2021/7/12/2799
PATCH v4: https://lkml.org/lkml/2021/7/16/532
PATCH v5: https://lkml.org/lkml/2021/7/19/247
PATCH v6: https://lkml.org/lkml/2021/7/20/36
PATCH v7: https://lkml.org/lkml/2021/7/23/26 
PATCH v8: https://lkml.org/lkml/2021/9/28/554

Changelog v8-->v9
1. Edited interface documentation to be in line with the current
   formatting
2. Created a parent abstraction for cleaning up the functions exporting
   energy scale information. Also commented the need to make a new hcall
   each time instead of caching objects as energy modes may change
   dynamically
3. Added a dynamically reallocating buffer for the hcall return
   attributes in the case of H_PARTIAL and H_P4
4. Added support to discover H_GET_ENERGY_SCALE_INFO feature via the
   ibm,hypertas-function device tree property
5. Removed versioning check for hcall as the PAPR documents backward
   compatibility support for this hcall
6. Decoupled allocation and registering for sysfs interfaces for
   handling faliures gracefully
7. Cleaned up functions, return codes, variable and label naming as per
   comments

Additional comment:
Currently the interface is modeled to calling it as
papr_platform_attributes.c as to keep it open to adding more attributes
in the future. However, if believed that its not necessary then I
could rename it to energy_scale_info.c instead  and remove the "papr"
parent directory from the interface as well.

Pratik R. Sampat (2):
  powerpc/pseries: Interface to represent PAPR firmware attributes
  selftest/powerpc: Add PAPR sysfs attributes sniff test

 .../sysfs-firmware-papr-energy-scale-info     |  29 ++
 arch/powerpc/include/asm/firmware.h           |   4 +-
 arch/powerpc/include/asm/hvcall.h             |   3 +-
 arch/powerpc/kvm/trace_hv.h                   |   1 +
 arch/powerpc/platforms/pseries/Makefile       |   3 +-
 arch/powerpc/platforms/pseries/firmware.c     |   1 +
 .../pseries/papr_platform_attributes.c        | 361 ++++++++++++++++++
 tools/testing/selftests/powerpc/Makefile      |   1 +
 .../powerpc/papr_attributes/.gitignore        |   2 +
 .../powerpc/papr_attributes/Makefile          |   7 +
 .../powerpc/papr_attributes/attr_test.c       | 107 ++++++
 11 files changed, 516 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
 create mode 100644 arch/powerpc/platforms/pseries/papr_platform_attributes.c
 create mode 100644 tools/testing/selftests/powerpc/papr_attributes/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/papr_attributes/Makefile
 create mode 100644 tools/testing/selftests/powerpc/papr_attributes/attr_test.c

-- 
2.34.1

