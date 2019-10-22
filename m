Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F3E022C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 12:35:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y8zJ3dWszDqK9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 21:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y8x96cbNzDqGc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 21:33:30 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9MAWqZK140796; Tue, 22 Oct 2019 06:33:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vsygbhejn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 06:33:21 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9MAXLuU142572;
 Tue, 22 Oct 2019 06:33:21 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vsygbheja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 06:33:21 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9MAUoQ9014531;
 Tue, 22 Oct 2019 10:33:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 2vqt47dhma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 10:33:20 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9MAXJk223855480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2019 10:33:19 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A3826A051;
 Tue, 22 Oct 2019 10:33:19 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B8596A058;
 Tue, 22 Oct 2019 10:33:19 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.210])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 22 Oct 2019 10:33:19 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 12DC42E31BD; Tue, 22 Oct 2019 16:03:17 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamaleshb@in.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH v2 0/1] pseries/hotplug: Change the default behaviour of
 cede_offline
Date: Tue, 22 Oct 2019 16:03:10 +0530
Message-Id: <1571740391-3251-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220095
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

This is the v2 of the fix to change the default behaviour of cede_offline.
The previous version can be found here: https://lkml.org/lkml/2019/9/12/222

The main change from v1 is that the patch2 to create a sysfs file to
report and control the value of cede_offline_enabled has been dropped.

Problem Description:
====================
Currently on Pseries Linux Guests, the offlined CPU can be put to one
of the following two states:
   - Long term processor cede (also called extended cede)
   - Returned to the Hypervisor via RTAS "stop-self" call.

This is controlled by the kernel boot parameter "cede_offline=on/off".

By default the offlined CPUs enter extended cede. The PHYP hypervisor
considers CPUs in extended cede to be "active" since the CPUs are
still under the control fo the Linux Guests. Hence, when we change the
SMT modes by offlining the secondary CPUs, the PURR and the RWMR SPRs
will continue to count the values for offlined CPUs in extended cede
as if they are online.

One of the expectations with PURR is that the for an interval of time,
the sum of the PURR increments across the online CPUs of a core should
equal the number of timebase ticks for that interval.

This is currently not the case.

In the following data (Generated using
https://github.com/gautshen/misc/blob/master/purr_tb.py):

SD-PURR = Sum of PURR increments on online CPUs of that core in 1 second
      
SMT=off
===========================================
Core            SD-PURR         SD-PURR
                (expected)      (observed)
===========================================
core00 [  0]	512000000	69883784	
core01 [  8]	512000000	88782536	
core02 [ 16]	512000000	94296824	
core03 [ 24]	512000000	80951968	

SMT=2
===========================================
Core            SD-PURR         SD-PURR
                (expected)      (observed)
===========================================
core00 [  0,1]	512000000	136147792	
core01 [  8,9]	512000000	128636784	
core02 [ 16,17]	512000000	135426488	
core03 [ 24,25]	512000000	153027520	

SMT=4
===================================================
Core			SD-PURR         SD-PURR
                	(expected)      (observed)
===================================================
core00 [  0,1,2,3]	512000000	258331616	
core01 [  8,9,10,11]	512000000	274220072	
core02 [ 16,17,18,19]	512000000	260013736	
core03 [ 24,25,26,27]	512000000	260079672	

SMT=on
===================================================================
Core					SD-PURR         SD-PURR
                			(expected)      (observed)
===================================================================
core00 [  0,1,2,3,4,5,6,7]		512000000	512941248	
core01 [  8,9,10,11,12,13,14,15]	512000000	512936544	
core02 [ 16,17,18,19,20,21,22,23]	512000000	512931544	
core03 [ 24,25,26,27,28,29,30,31]	512000000	512923800

This patchset addresses this issue by ensuring that by default, the
offlined CPUs are returned to the Hypervisor via RTAS "stop-self" call
by changing the default value of "cede_offline_enabled" to false.

With the patches, we see that the observed value of the sum of the
PURR increments across the the online threads of a core in 1-second
matches the number of tb-ticks in 1-second.

SMT=off
===========================================
Core            SD-PURR         SD-PURR
                (expected)      (observed)
===========================================
core00 [  0]	512000000	 512527568	
core01 [  8]	512000000	 512556128	
core02 [ 16]	512000000	 512590016	
core03 [ 24]	512000000	 512589440	

SMT=2
===========================================
Core            SD-PURR         SD-PURR
                (expected)      (observed)
===========================================
core00 [  0,1]	512000000	512635328
core01 [  8,9]	512000000	512610416	
core02 [ 16,17]	512000000	512639360	
core03 [ 24,25]	512000000	512638720	

SMT=4
===================================================
Core		        SD-PURR         SD-PURR
                	(expected)      (observed)
===================================================
core00 [  0,1,2,3]	512000000	512757328	
core01 [  8,9,10,11]	512000000	512727920	
core02 [ 16,17,18,19]	512000000	512754712	
core03 [ 24,25,26,27]	512000000	512739040	

SMT=on
==============================================================
Core				   SD-PURR         SD-PURR
                		   (expected)      (observed)
==============================================================
core00 [  0,1,2,3,4,5,6,7]	   512000000	   512920936	
core01 [  8,9,10,11,12,13,14,15]   512000000	   512878728	
core02 [ 16,17,18,19,20,21,22,23]  512000000	   512921192	
core03 [ 24,25,26,27,28,29,30,31]  512000000	   512924816	

Further, the patch
   gives an improvement of 5% in offlining of a core on POWER8,
   gives an improvement of 18% in offlining of a core on POWER9,
   causes a regression of 2.5% in onlining of a core on POWER8,
   causes a regression of 4.5% in onlining of a core on POWER9.
                 
POWER8
======================================================================
| Operation | Patch status |#Samples|Min |Max  |Median|Avg    |Stddev|
|           |              |        |(ms)|(ms) | (ms) |(ms)   |      |
======================================================================
| Offline   | Without Patch| 20     | 822| 1232| 972  | 986.8 |112.58|
| Offline   | With Patch   | 20     | 831| 1152| 941  | 938.6 | 80.33|
| --------- | -------------|--------|----| ----|------|-------|------|
| Online    | Without Patch| 20     |1460| 1760| 1620 |1591.2 | 82.72|
| Online    | With Patch   | 20     |1489| 1839| 1629 |1629.6 | 94.90|
======================================================================

POWER9
======================================================================
| Operation | Patch status |#Samples|Min |Max  |Median|Avg    |Stddev|
|           |              |        |(ms)|(ms) | (ms) |(ms)   |      |
======================================================================
| Offline   | Without Patch| 20     |1120|1653 | 1394 |1392.9 |133.63|
| Offline   | With Patch   | 20     | 930|1316 | 1161 |1130.8 |117.76|
| --------- | -------------|--------|----| ----|------|-------|------|
| Online    | Without Patch| 20     |1652|2108 | 1903 |1891.6 |130.74|
| Online    | With Patch   | 20     |1824|2222 | 1960 |1976.1 | 93.98|
======================================================================

Gautham R. Shenoy (1):
  pseries/hotplug-cpu: Change default behaviour of cede_offline to "off"

 Documentation/core-api/cpu_hotplug.rst       |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
1.9.4

