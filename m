Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9B48CC08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 20:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYySc0CF1z30Mf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 06:34:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FDVXwC9G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FDVXwC9G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYyRp4Yndz2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 06:34:13 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CH9CR6016707; 
 Wed, 12 Jan 2022 19:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=flgLZFiDaZaFarRPt2sOe6tusr9r0ONHRTGPPUMeB9c=;
 b=FDVXwC9GlGqQ+QhEDEKc3Q7ANSqSg1woH3S93u4URANwEIby/xmSRFb46SrH96ylClPs
 fOoGBxBGKem9R4/So7MudFrCnYe8HzMsMJKGSloplCXZAVaf4bzJ2zRu+BHE1RWg9Tn7
 6QJNsAKppOpFeq02veztCoCQyDs+u1y3xR2OGPzV0sgZjxP+J491GSkymH9+itBDQkuD
 /AM1/FpZ5qvKwU3L6mmPzSvnLgwD4xVnQVKwBtDDImOGl12AUnzgdhjBzC0/h3NWUJqV
 Afc/IJGXtOKSRRUTnZVhSE8dk4Sy01esvV7BStioiPMhBsVg16ji7MxX0VNjNZmLDE7b rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dj0s2x8c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:02 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CJY1Xb027295;
 Wed, 12 Jan 2022 19:34:01 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dj0s2x8bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:01 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CJMMlR015226;
 Wed, 12 Jan 2022 19:33:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3df289mvf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:33:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CJOqo249873216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 19:24:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 621AAAE04D;
 Wed, 12 Jan 2022 19:33:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90FE3AE055;
 Wed, 12 Jan 2022 19:33:51 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.19.140])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 19:33:51 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc/fadump: handle CMA activation failure
 appropriately
Date: Thu, 13 Jan 2022 01:03:38 +0530
Message-Id: <20220112193340.149020-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aUbcMrs3jZINGIJonUwPz5PSXE-NameG
X-Proofpoint-GUID: tfYbYqAmFZ1OXI6KsQ4wf0kDKKDiHvXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_05,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120114
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, mike.kravetz@oracle.com,
 mahesh@linux.ibm.com, sourabhjain@linux.ibm.com, osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While commit a4e92ce8e4c8 ("powerpc/fadump: Reservationless firmware
assisted dump"), introduced Linux kernel's Contiguous Memory Allocator
(CMA) based reservation for fadump, it came with the assumption that
the memory remains reserved even if CMA activation fails. It ensures
no kernel pages reside in the reserved memory region, which can't be
mapped into the /proc/vmcore.

But commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
activation of an area fails") started returning all pages to buddy
allocator if CMA activation fails. This led to warning messages like
below while running crash-utility on vmcore of a kernel having above
two commits:

  crash: seek error: kernel virtual address: <from reserved region>

as reserved memory region ended up having kernel pages crash-utility
was looking for. Fix this by introducing an option in CMA, to opt out
from exposing pages to buddy allocator, on CMA activation failure.

Changes in v2:
* Replaced cma->free_pages_on_error with cma->reserve_pages_on_error
  & cma_dont_free_pages_on_error() with cma_reserve_pages_on_error()
  to avoid confusion and make the expectation on failure clearer.


Hari Bathini (2):
  mm/cma: provide option to opt out from exposing pages on activation
    failure
  powerpc/fadump: opt out from freeing pages on cma activation failure

 arch/powerpc/kernel/fadump.c |  6 ++++++
 include/linux/cma.h          |  2 ++
 mm/cma.c                     | 15 +++++++++++++--
 mm/cma.h                     |  1 +
 4 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.34.1

