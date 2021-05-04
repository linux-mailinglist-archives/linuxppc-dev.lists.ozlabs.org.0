Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACA372497
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 05:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4Sd5bVZz304X
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 13:04:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h7eKCl+0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h7eKCl+0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4S66xCmz2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 13:04:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1442YNoe001145; Mon, 3 May 2021 23:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=cJxTTxW5L8WMgXDQVQBT3lVEq+6YZ898pKCFch4ZPpM=;
 b=h7eKCl+0ZQNg9ZzpzllujBtseJNjbfIkp3RJiztF1HPuUJgChOefMjaHUV9XfisA3eFd
 fwlztDn9hhNIlrs6U7cQoswxnZRB9yevRZ+Q73tjKyE1vmzVeZN/kxTUk4nb7LbVpf4s
 6xcghGuT8n4P8j1KGta9uOZHF0J+JHhfT0iCFNJF99bZ2n+OhZK0vj0ddK/B8hhbsn0B
 XHP3/WONO42jW+IrOj5WgeQT/a3NNLCaOrVV+aQy1XCDe2MWA5b4598AyyoPEcB4sBRK
 Ga+kr7eRRSt64vKld5e9R9lXvd8DFAimbOQlSkIiJdeDLwiWN3bLiKQ6pYQBV15kb8Fl nQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38av8f9wbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 23:04:00 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1442vPqB029105;
 Tue, 4 May 2021 03:03:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 388xma2j0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:03:59 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14433xpf37552468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 03:03:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A144AC059;
 Tue,  4 May 2021 03:03:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13E48AC05B;
 Tue,  4 May 2021 03:03:59 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 03:03:58 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 00/10] powerpc/rtas: improved busy and extended delay status
 handling
Date: Mon,  3 May 2021 22:03:48 -0500
Message-Id: <20210504030358.1715034-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YGhySf7oeJ8LItz1Ra8ZQHecaOOTFHHm
X-Proofpoint-ORIG-GUID: YGhySf7oeJ8LItz1Ra8ZQHecaOOTFHHm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=955 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105040018
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
Cc: aik@ozlabs.ru, ajd@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an attempt at providing clearer names as discussed here:

https://github.com/linuxppc/issues/issues/164

as well as providing better behavior for RTAS_BUSY (-2) and small
extended delay values, which in my experience seem more common than
the larger ones. In testing PREEMPT_NONE kernels with CPUs busy, I see
the elapsed time for memory add operations roughly halved, while
memory remove operations' elapsed time shrinks by about ~25%. This is
achieved without significantly more time spent on CPU:

(- is before, + is after)

  Performance counter stats for 'drmgr -c mem -a -q 10' (10 runs):

-             1,898      probe:rtas_call           #    0.003 M/sec                    ( +-  2.20% )
-            751.57 msec task-clock                #    0.289 CPUs utilized            ( +-  1.56% )
+             1,969      probe:rtas_call           #    0.003 M/sec                    ( +-  2.69% )
+            766.20 msec task-clock                #    0.688 CPUs utilized            ( +-  1.99% )

-             2.605 +- 0.148 seconds time elapsed  ( +-  5.70% )
+            1.1129 +- 0.0660 seconds time elapsed  ( +-  5.93% )

  Performance counter stats for 'drmgr -c mem -r -q 10' (10 runs):

-               673      probe:rtas_call           #    0.002 M/sec                    ( +-  0.55% )
-            318.36 msec task-clock                #    0.234 CPUs utilized            ( +-  0.42% )
+               692      probe:rtas_call           #    0.002 M/sec                    ( +-  0.73% )
+            320.87 msec task-clock                #    0.309 CPUs utilized            ( +-  0.34% )

-             1.362 +- 0.100 seconds time elapsed  ( +-  7.37% )
+            1.0372 +- 0.0468 seconds time elapsed  ( +-  4.51% )

Questions / concerns / to do:
* I don't love the new API function names.
* Introduces three new APIs when two likely would suffice.
* Need to convert eeh_pseries and scanlog.
* rtas_busy_delay() and rtas_busy_delay_time() not yet removed.

Nathan Lynch (10):
  powerpc/rtas: new APIs for busy and extended delay statuses
  powerpc/rtas: do not schedule in rtas_os_term()
  powerpc/rtas-rtc: convert get-time-of-day to rtas_force_spin_if_busy()
  powerpc/rtas-rtc: convert set-time-of-day to rtas_sched_if_busy()
  powerpc/pseries/fadump: convert to rtas_sched_if_busy()
  powerpc/pseries/msi: convert to rtas_sched_if_busy()
  powerpc/pseries/iommu: convert to rtas_sched_if_busy()
  powerpc/pseries/dlpar: convert to rtas_sched_if_busy()
  powerpc/rtas: convert to rtas_sched_if_busy()
  powerpc/rtas_flash: convert to rtas_sched_if_busy()

 arch/powerpc/include/asm/rtas.h              |   4 +
 arch/powerpc/kernel/rtas-rtc.c               |  38 +---
 arch/powerpc/kernel/rtas.c                   | 178 ++++++++++++++++++-
 arch/powerpc/kernel/rtas_flash.c             |   4 +-
 arch/powerpc/platforms/pseries/dlpar.c       |   2 +-
 arch/powerpc/platforms/pseries/iommu.c       |   2 +-
 arch/powerpc/platforms/pseries/msi.c         |   4 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c |  22 +--
 8 files changed, 190 insertions(+), 64 deletions(-)

-- 
2.30.2

