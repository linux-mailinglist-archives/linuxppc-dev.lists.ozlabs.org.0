Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3843B735
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 18:29:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdy390g6Mz3blF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 03:29:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OXG6jHbR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OXG6jHbR; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdy0q4Tk7z2xYP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 03:27:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QFrdfb010243; 
 Tue, 26 Oct 2021 16:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/5FpGiAUYndvE6BpEAdYlwvaGZ2+B01ieQ5uMBIPutM=;
 b=OXG6jHbRUYEADlwtY0vWVp9j8OOv+ePlW5S6KhTZM5BqwivdnaSXvJN8pYX9LX1LuMM4
 RFx2CngNjZvP6s/R8se3y0mIF5dtmA83VPr9ip9jaQiTR3VesbhYygE1+e6w/59a0X/9
 3hO1u6U5UjVARmy/9lYt36C99Md/OS7O0SFP+2Gr/bs9ZtUmmo4fhFMk7HkrEt4f3pPq
 S6MsXkJmQqQyi2HgKd48w2Ud6eFi3e76zARnyUagyb+YXMAWDYCHy4wbU1vilxfZXrnZ
 40uc+whiE26RZPRJTVSjY/J5qWBj+dDcwzsBe7XE4Mw7igbWCOd52+UZVy30OGB/ZDCK nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k8pm71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:46 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QDrblI004620;
 Tue, 26 Oct 2021 16:27:46 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k8pm6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:46 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QGHMMt032582;
 Tue, 26 Oct 2021 16:27:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3bx4f7exav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QGRg4m49938694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 16:27:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13497A405C;
 Tue, 26 Oct 2021 16:27:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5FA6A4054;
 Tue, 26 Oct 2021 16:27:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.63.253])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Oct 2021 16:27:41 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH 0/2] powerpc prevents deadlock in the watchdog path
Date: Tue, 26 Oct 2021 18:27:38 +0200
Message-Id: <20211026162740.16283-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1cPmwLfwbbILT3CgcY1obs11vQXiW9gL
X-Proofpoint-ORIG-GUID: kzcNe-goX77fc1CjS8liausGg3IoiSCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260088
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While doing LPM on large system (for instance a Brazos system with 1024
CPUs and 12TB of memory) with an heavy load (I ran 'stress-ng --futex 500
-vm 5'), watchdog hard lockup are seen when the hypervisor is taking
too much time handling the page tables to track page's changes.

When this happens, the system may hung with a deadlock between the watchdog
lock and the console owner lock.

The first patch of this series prevents that deadlock by not calling printk
while holding the watchdog lock, and also not sending IPI (and waiting for
CPU's answer during 1s) while holding the watchdog lock.

The second patch ensures that the watchdog's data are accessed under the
protection of the watchdog lock.

Laurent Dufour (2):
  powerpc/watchdog: prevent printk and send IPI while holding the wd
    lock
  powerpc/watchdog: ensure watchdog data accesses are protected

 arch/powerpc/kernel/watchdog.c | 45 +++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 20 deletions(-)

-- 
2.33.1

