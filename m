Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50250B0D13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 12:40:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tb003Y4HzF3JD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 20:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TZtY5r2gzF3Dj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 20:36:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8CAWjVV015899; Thu, 12 Sep 2019 06:35:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uymbh052w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 06:35:55 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8CAX2pA017299;
 Thu, 12 Sep 2019 06:35:55 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uymbh052j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 06:35:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8CAU7CF005640;
 Thu, 12 Sep 2019 10:35:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2uv467nfjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 10:35:54 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8CAZrfN60948914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 10:35:53 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F879136051;
 Thu, 12 Sep 2019 10:35:53 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9698136053;
 Thu, 12 Sep 2019 10:35:52 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.237])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 10:35:52 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id F08552E47C2; Thu, 12 Sep 2019 16:05:50 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH 0/2] pseries/hotplug: Change the default behaviour of
 cede_offline
Date: Thu, 12 Sep 2019 16:05:39 +0530
Message-Id: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120112
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Kamalesh Babulal <kamaleshb@in.ibm.com>, linux-kernel@vger.kernel.org,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

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


delta tb = tb ticks elapsed in 1 second.
delta purr = sum of PURR increments on online CPUs of that core in 1
       	     second
      
SMT=off
===========================================
Core        	delta tb(apprx)  delta purr	
===========================================
core00 [  0]	512000000	69883784	
core01 [  8]	512000000	88782536	
core02 [ 16]	512000000	94296824	
core03 [ 24]	512000000	80951968	

SMT=2
===========================================
Core            delta tb(apprx)  delta purr	
===========================================
core00 [  0,1]	512000000	136147792	
core01 [  8,9]	512000000	128636784	
core02 [ 16,17]	512000000	135426488	
core03 [ 24,25]	512000000	153027520	

SMT=4
===================================================
Core                   	delta tb(apprx)  delta purr	
===================================================
core00 [  0,1,2,3]	512000000	258331616	
core01 [  8,9,10,11]	512000000	274220072	
core02 [ 16,17,18,19]	512000000	260013736	
core03 [ 24,25,26,27]	512000000	260079672	

SMT=on
===================================================================
Core                                   	delta tb(apprx)  delta purr	
===================================================================
core00 [  0,1,2,3,4,5,6,7]		512000000	512941248	
core01 [  8,9,10,11,12,13,14,15]	512000000	512936544	
core02 [ 16,17,18,19,20,21,22,23]	512000000	512931544	
core03 [ 24,25,26,27,28,29,30,31]	512000000	512923800

This patchset addresses this issue by ensuring that by default, the
offlined CPUs are returned to the Hypervisor via RTAS "stop-self" call
by changing the default value of "cede_offline_enabled" to false.

The patchset also defines a new sysfs attribute
"/sys/device/system/cpu/cede_offline_enabled" on PSeries Linux guests
to allow userspace programs to change the state into which the
offlined CPU need to be put to at runtime. This is intended for
userspace programs that fold CPUs for the purpose of saving energy
when the utilization is low. Setting the value of this attribute
ensures that subsequent CPU offline operations will put the offlined
CPUs to extended cede. However, it will cause inconsistencies in the
PURR accounting. Clearing the attribute will make the offlined CPUs
call the RTAS "stop-self" call thereby returning the CPU to the
hypervisor.

With the patches,

SMT=off
===========================================
Core        	delta tb(apprx)	 delta purr	
===========================================
core00 [  0]	512000000	 512527568	
core01 [  8]	512000000	 512556128	
core02 [ 16]	512000000	 512590016	
core03 [ 24]	512000000	 512589440	

SMT=2
===========================================
Core            delta tb(apprx)	 delta purr	
===========================================
core00 [  0,1]	512000000	512635328
core01 [  8,9]	512000000	512610416	
core02 [ 16,17]	512000000	512639360	
core03 [ 24,25]	512000000	512638720	

SMT=4
===================================================
Core                    delta tb(apprx)  delta purr	
===================================================
core00 [  0,1,2,3]	512000000	512757328	
core01 [  8,9,10,11]	512000000	512727920	
core02 [ 16,17,18,19]	512000000	512754712	
core03 [ 24,25,26,27]	512000000	512739040	

SMT=on
==============================================================
Core                               delta tb(apprx)  delta purr	
==============================================================
core00 [  0,1,2,3,4,5,6,7]	   512000000	   512920936	
core01 [  8,9,10,11,12,13,14,15]   512000000	   512878728	
core02 [ 16,17,18,19,20,21,22,23]  512000000	   512921192	
core03 [ 24,25,26,27,28,29,30,31]  512000000	   512924816	

Gautham R. Shenoy (2):
  pseries/hotplug-cpu: Change default behaviour of cede_offline to "off"
  pseries/hotplug-cpu: Add sysfs attribute for cede_offline

 Documentation/ABI/testing/sysfs-devices-system-cpu | 14 ++++
 Documentation/core-api/cpu_hotplug.rst             |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c       | 80 ++++++++++++++++++++--
 3 files changed, 88 insertions(+), 8 deletions(-)

-- 
1.9.4

