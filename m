Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D23CF400
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 07:35:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTS953SVcz3bfT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 15:35:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f8adHkqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f8adHkqG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTS8X6p2nz2ydS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 15:34:52 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16K5YHil033746; Tue, 20 Jul 2021 01:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=naVH7ZiwFw+yzM8CWdXBt8a+Uzm6fkEsFg+NLC+4m6Y=;
 b=f8adHkqGRwUJOq0LL8h1FxIxyyF8YbHNCNsuCCQrZGD3tWvL2BplhOukSiHPSpTkq43t
 EZRkc/5smfdYKBxisgD/Tp5wFYcsPa1G0IyxQOngsn4DBNLJ8EtWqoyRXs4FfRRggHuZ
 cibD+ew39cOme8pLaWB+92Kf02MIMYkLRm+JrP8XdXA2Lhu1UNNy/6fuxK1G5jfdoleU
 lVhI8e9cU17n2yUPWJHkKVsAtGjZVzd/3yx2tO5G3ZOLkWaMZUoi/o/SrLo6x5NDTlUZ
 26bB1Ina62vQeoaIu/DiP7lKNv/MqMif2r7m7YUf4md65SqVsJw6+8u2293iQOHDfrUH eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39wp21b8pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 01:34:43 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16K5YRvl034288;
 Tue, 20 Jul 2021 01:34:43 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39wp21b8nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 01:34:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16K5RChU007452;
 Tue, 20 Jul 2021 05:34:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 39upu892wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 05:34:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16K5Yc5u34406858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 05:34:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D39AA4054;
 Tue, 20 Jul 2021 05:34:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9D11A4062;
 Tue, 20 Jul 2021 05:34:35 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.199.45.122])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 05:34:35 +0000 (GMT)
From: "Pratik R. Sampat" <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 farosas@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [PATCH v6 0/1] Interface to represent PAPR firmware attributes
Date: Tue, 20 Jul 2021 11:04:33 +0530
Message-Id: <20210720053434.32921-1-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lnFmBLRClRXvt0nj-DE1s4Dy9-u4Bo9W
X-Proofpoint-ORIG-GUID: hUijSzuR0li3kE2u7xa7dSewC1vULyhj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_01:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200030
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

Changelog v5 --> v6
1. On allocation faliure of "pgs[idx].pg attributes", redirect the free
   using "goto" to a common cleanups section for consistency

Also, have implemented a POC using this interface for the powerpc-utils'
ppc64_cpu --frequency command-line tool to utilize this information
in userspace.
The POC for the new interface has been hosted here:
https://github.com/pratiksampat/powerpc-utils/tree/H_GET_ENERGY_SCALE_INFO_v2

Sample output from the powerpc-utils tool is as follows:

# ppc64_cpu --frequency
Power and Performance Mode: XXXX
Idle Power Saver Status   : XXXX
Processor Folding Status  : XXXX --> Printed if Idle power save status is supported

Platform reported frequencies --> Frequencies reported from the platform's H_CALL i.e PAPR interface
min        :    NNNN GHz
max        :    NNNN GHz
static     :    NNNN GHz

Tool Computed frequencies
min        :    NNNN GHz (cpu XX)
max        :    NNNN GHz (cpu XX)
avg        :    NNNN GHz

Pratik R. Sampat (1):
  powerpc/pseries: Interface to represent PAPR firmware attributes

 .../sysfs-firmware-papr-energy-scale-info     |  26 ++
 arch/powerpc/include/asm/hvcall.h             |  24 +-
 arch/powerpc/kvm/trace_hv.h                   |   1 +
 arch/powerpc/platforms/pseries/Makefile       |   3 +-
 .../pseries/papr_platform_attributes.c        | 312 ++++++++++++++++++
 5 files changed, 364 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
 create mode 100644 arch/powerpc/platforms/pseries/papr_platform_attributes.c

-- 
2.31.1

