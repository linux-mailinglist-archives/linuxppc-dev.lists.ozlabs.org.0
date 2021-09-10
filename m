Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E6406D8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 16:20:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5dM43hwSz2yZp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 00:20:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pTcvMsCW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pTcvMsCW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5dLM0Pckz2yHb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 00:19:54 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18AE5ji5039716; Fri, 10 Sep 2021 10:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=PfIERT94r8KWB7wKTizxKr3P2nXViGr51CxIZH0y6sM=;
 b=pTcvMsCW47ShOucmyi/PUqr1v1syhRuYjKO5KbyDQrNaPLva7MLOK50dtJS7RIoVmFZm
 hN1hcwpHuUbOXEU0F5a32Cll6jsZjmRhzEhD/6dBhklfQLH2d8iG7uaeLaZEl6i+S2W9
 ajbqhDUxBXf46+HwVntkS070O7DaVQ38jBzT2SCIb9TJAi9wxUQUegDC6chMvt6cbMIM
 nJk4Jfqw31+NP4lR7SNGZ/Qmbet9HthkjvMLY1vcVsC37Uoo+rnlUv8CP3Eukxxc48nY
 0bDnSlNn1GDBciBN3kpvfTuDC9lc0G1dmG3TrMBzseNnsQsufuJ78I5/kRJTAzxiSqiC cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b03w6f6m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 10:19:46 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18AEHO9w095809;
 Fri, 10 Sep 2021 10:19:46 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b03w6f6kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 10:19:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18AEHSdf023042;
 Fri, 10 Sep 2021 14:19:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3axcnqh3xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 14:19:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18AEJeaW19399044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:19:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A35A042045;
 Fri, 10 Sep 2021 14:19:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44D6942042;
 Fri, 10 Sep 2021 14:19:40 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 10 Sep 2021 14:19:40 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/1] Arch use of pci_dev_is_added()
Date: Fri, 10 Sep 2021 16:19:39 +0200
Message-Id: <20210910141940.2598035-1-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: by-YoMG8o-pqUpc-DA3c6dWzN51QqSPj
X-Proofpoint-ORIG-GUID: fjJriTmyYKZbUNw-sVUpT5p2YdvAISYe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-10_04:2021-09-09,
 2021-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=810 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100081
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn, Hi Michael,

In my proposal to make pci_dev_is_added() more regularly usable by arch code
you mentioned[0] that you believe the uses in arch/powerpc are not necessary
anymore. From code reading I agree and so does Oliver O'Halloran[1].

So as promised here is a patch removing them. I only compile tested this as
I don't have access to a powerpc system.

I've also looked a bit more into our use in s390 and as dicussed previously
I don't think we can cleanly get rid of the existing one in
arch/s390/pci_sysfs.c:recover_store() because we need to distinguish an already
removed pdev just by looking at the pdev itself.

As for new uses I think in the upcoming automatic recovery code we can rely on
the fact that a removed device has pdev->driver == NULL and don't need
pci_dev_is_added() but it would make things clearer. I also noticed that before
commit 44bda4b7d26e9 ("PCI: Fix is_added/is_busmaster race condition") there
was simply a pdev->is_added flag that was cleanly accessible by arch code. So
I wanted to ask for your advice.

Thanks,
Niklas

[0] https://lore.kernel.org/lkml/20210825190444.GA3593752@bjorn-Precision-5520/
[1] https://lore.kernel.org/lkml/CAOSf1CFyuf9FaeSNparj+7W0mKTPvtcM8vxjHDSFsNDC6k_7xQ@mail.gmail.com/

Niklas Schnelle (1):
  powerpc: Drop superfluous pci_dev_is_added() calls

 arch/powerpc/platforms/powernv/pci-sriov.c | 6 ------
 arch/powerpc/platforms/pseries/setup.c     | 3 +--
 2 files changed, 1 insertion(+), 8 deletions(-)

-- 
2.25.1

