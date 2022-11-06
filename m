Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9E61E608
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 22:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N56GB1CfJz3cJY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 08:00:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VrhwTb/C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VrhwTb/C;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N56DB0Xpfz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 07:59:04 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6KFK6g031587;
	Sun, 6 Nov 2022 20:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=FvFTbfPyRvd/vY8VFgPrjn4J/GDzu2Z7ZWemAyxPfd4=;
 b=VrhwTb/Ckg/XAJTmEwC7wBUOR8zTcM4DjFZ2gavRq6ciJhFexFyi+3BovWpdJuf2VUeH
 1EQ+/c6gjzL/PewImATX+pdazNDpyfDZiA1VGWjCJsarje7hpxfwzuri6wNib8uPR5rV
 ee6jBOlvFsvJqS5Hl/S323m20jjVA86tr80anrzVvxgjvIDCyJmZEFWLQ0YlkhUICK3f
 sh5hlO6HI5x9u+/Fztb/ZnWcjjFVEr1/2BnEsRwZqYjqLVZ8LyPcoUXQDwwsqlSi++Ea
 NZH84lvBkbpq4DOVJOQhTMg01gz2+tzj+RcaL4PQvJZ9orgq2ETNqPDCbAaXf4tsKqJa qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1gkd2vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:58:52 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A6KeQ4a013208;
	Sun, 6 Nov 2022 20:58:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1gkd2vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:58:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A6KpcNO027841;
	Sun, 6 Nov 2022 20:58:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3kngqd9nux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:58:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A6KwlBa63439286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Nov 2022 20:58:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5748842041;
	Sun,  6 Nov 2022 20:58:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4497A4203F;
	Sun,  6 Nov 2022 20:58:45 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.211.78.124])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  6 Nov 2022 20:58:45 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] powerpc/pseries - bugfixes/cleanups for PLPKS driver 
Date: Sun,  6 Nov 2022 15:58:33 -0500
Message-Id: <20221106205839.600442-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VHp81AbTRiXCLzU3LKU1MxSX6B83_cCg
X-Proofpoint-GUID: _kE0h5YU8IvGN2gK0kgnUzYqYSVu_dkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_14,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=860 suspectscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060180
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, gjoyce@linux.vnet.ibm.com, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibmcom
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset fixes some bugs and does some cleanups.

Nayna Jain (6):
  powerpc/pseries: fix the object owners enum value in plpks driver
  powerpc/pseries: Fix the H_CALL error code in PLPKS driver
  powerpc/pseries: Return -EIO instead of -EINTR for H_ABORTED error
  powerpc/pseries: cleanup error logs in plpks driver
  powerpc/pseries: replace kmalloc with kzalloc in PLPKS driver
  powerpc/pseries: fix plpks_read_var() code for different consumers

 arch/powerpc/include/asm/hvcall.h      |  3 +-
 arch/powerpc/platforms/pseries/plpks.c | 50 ++++++++++++--------------
 arch/powerpc/platforms/pseries/plpks.h |  2 +-
 3 files changed, 24 insertions(+), 31 deletions(-)

-- 
2.31.1
