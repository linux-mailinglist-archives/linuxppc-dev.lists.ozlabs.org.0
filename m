Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EE490333
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JckgQ5Qv7z2yPs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:53:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BvzsETgr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BvzsETgr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jckff6lXzz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 18:53:14 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H7hDJ0023581; 
 Mon, 17 Jan 2022 07:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5i+MUfiKXp8lPljLcP3gk/e/t8wAAop3YvO3YFruja0=;
 b=BvzsETgrV+9tHJEyMUi9hjUaD2/tiyNKXWmlBupvhkvPi50JFgAFXV7fGWfG75lBkdHV
 sX85R4IE2f064WkTrTwFAJ0JsqdR+uc93awRHxuC7ai6E1FbWEbvesuDW3o0U/BMM5hz
 2JmfJD1QWPm/Sqk1yWIJzk1qtq93+MApSux553lp0hR24lQpRxROu0FuEDpsjIrZziYA
 EO5/NFASywyHsi/Mc2oGZK8ga8s6HC0NDVaVNueePn4g2m9Mw3aHWVM5ww0g4QVPUOf4
 RuRKDvfIB2ARec3XRjVIDqLpXvRK0y2aNm0e9zdPoF9WreaN8fwcT3NLw5ufOdu9PWv7 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn0jk4451-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:03 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20H7asUZ007404;
 Mon, 17 Jan 2022 07:53:02 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn0jk444f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H7niWr002298;
 Mon, 17 Jan 2022 07:53:00 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3dknw999v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H7qvrG36307318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 07:52:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F367A4055;
 Mon, 17 Jan 2022 07:52:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6E7EA4059;
 Mon, 17 Jan 2022 07:52:52 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.1.44])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 07:52:52 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/2] powerpc/fadump: handle CMA activation failure
 appropriately
Date: Mon, 17 Jan 2022 13:22:44 +0530
Message-Id: <20220117075246.36072-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AaFkl6K75zkADBvvs1KXXwu12OO51sBh
X-Proofpoint-ORIG-GUID: GQQxQZMvz3tcPs-p0-8uiULOMcvHFX75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170048
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
Cc: mike.kravetz@oracle.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de
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

Changes in v3:
* Dropped NULL check in cma_reserve_pages_on_error().
* Dropped explicit initialization of cma->reserve_pages_on_error to
  'false' in cma_init_reserved_mem().
* Added review tags from David.

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
 mm/cma.c                     | 11 +++++++++--
 mm/cma.h                     |  1 +
 4 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.34.1

