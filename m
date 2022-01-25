Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB949BE12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 22:58:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk12H5Wlsz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 08:58:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AZfRyI0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AZfRyI0Z; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jk10n5khqz30Kn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 08:57:13 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PJkO8n015006; 
 Tue, 25 Jan 2022 21:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=0mrf7Qomld2WUjTZeBMh2VC+njJpP1+no3VInVyTuKk=;
 b=AZfRyI0Zz/QxJE1EvOAUkw2Wmx77lTmZWr3o1t1X5rqiN6DO1jCmZYyMVYBKPvCjMhn1
 Vzv3QtMwu6lfeVUS+UrghF8oxK05VQCI1P9UD62cGBnrTYmrt2j5D99nOEb2dZBKI2Lz
 FEthWNu3OO9EMwXBQTS6ydvYYqXi55qHkrIyaSFlbhe6CRb39N2gF4Qp/5yAtxrrugpv
 J7KdNVQzANr4COkfw332FhH2oJZRyveZWI9+kcFDtKWjycZawaHhqBfj5JxUWmS+SjCB
 IG2ypeZUSBOtjj035jfgXnWK9xHBjKR27pgO+/6BfQulbWb95Rnm3gYNGkZ0Mfrh1J0h Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtqnjt33n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 21:57:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PLV5uZ028290;
 Tue, 25 Jan 2022 21:57:04 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtqnjt33g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 21:57:04 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PLroSk028544;
 Tue, 25 Jan 2022 21:57:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3dr9ja6cee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 21:57:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PLv2xQ18743602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 21:57:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C768C605D;
 Tue, 25 Jan 2022 21:57:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39A19C6057;
 Tue, 25 Jan 2022 21:57:01 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.21.20])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 21:57:00 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 0/5] KVM: PPC: MMIO fixes
Date: Tue, 25 Jan 2022 18:56:50 -0300
Message-Id: <20220125215655.1026224-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bT3wk8G56S32zlJZ2DPkY9hRRt07eqT8
X-Proofpoint-GUID: kP2AqJEw6Hai4ndAo4YLZaNor1J8hHZn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_05,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=635 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201250128
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes from v4:

-patch 4: switched to kvm_debug_ratelimited.

-patch 5: kept the Program interrupt for BookE.

v4:
https://lore.kernel.org/r/20220121222626.972495-1-farosas@linux.ibm.com

v3:
https://lore.kernel.org/r/20220107210012.4091153-1-farosas@linux.ibm.com

v2:
https://lore.kernel.org/r/20220106200304.4070825-1-farosas@linux.ibm.com

v1:
https://lore.kernel.org/r/20211223211528.3560711-1-farosas@linux.ibm.com

Fabiano Rosas (5):
  KVM: PPC: Book3S HV: Stop returning internal values to userspace
  KVM: PPC: Fix vmx/vsx mixup in mmio emulation
  KVM: PPC: mmio: Reject instructions that access more than mmio.data
    size
  KVM: PPC: mmio: Return to guest after emulation failure
  KVM: PPC: Book3s: mmio: Deliver DSI after emulation failure

 arch/powerpc/kvm/emulate_loadstore.c | 10 ++---
 arch/powerpc/kvm/powerpc.c           | 56 ++++++++++++++++++++--------
 2 files changed, 43 insertions(+), 23 deletions(-)

-- 
2.34.1

