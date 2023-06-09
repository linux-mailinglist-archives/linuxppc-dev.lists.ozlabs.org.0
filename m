Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48C72984E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 13:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QczhK1gQfz3fQG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:42:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PXoiN08e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PXoiN08e;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QczfQ0Nx6z3f0H
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 21:40:29 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359BKmm8013987;
	Fri, 9 Jun 2023 11:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lcQc0LY1M03kICAnjdZ7VaQHBnYgmouOekKVxeUyXUI=;
 b=PXoiN08evz2xJX01SDfp8wM9swH7xyWQ29Y3DL7Rrd8o3u97s0OycDeqDhMw46aIlJox
 vaBaL9lsH7k8JRgI+FGNUdkD1tYAURASuFmMnQ988KDamjqsPm+R++Q84ndeAJ3iQAqg
 pj2wZsFh/5JBJEKVIF1AEeSntxWVJDks2K22MuSzaWgSmRC/PRVpLrpk/UT075aWm6hE
 X5vt/8YgRBRi0/XsaoXePdxDoW+o+8WhD5mZfkc3xJOYSYPN5QWlctkMDM2/fKhLEZzb
 OZGL0ZDPcuouwUHdNGpUXCdO2pZiy8PbYkstafDG/tSPCavk8XKOyseeF1oRo6gEXhP0 5A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r434hrknp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:23 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3590JQfg025304;
	Fri, 9 Jun 2023 11:40:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3r2a78sx4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359BeGbI15270518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 11:40:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D5ED20043;
	Fri,  9 Jun 2023 11:40:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 059F720067;
	Fri,  9 Jun 2023 11:40:14 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.70.150])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 11:40:13 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 00/10] Add sysfs interface files to hv_gpci device to expose system information
Date: Fri,  9 Jun 2023 17:09:51 +0530
Message-Id: <20230609114001.169235-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cLeDK3NIOyyHnz0z7xMfLB_c7rWshBPr
X-Proofpoint-GUID: cLeDK3NIOyyHnz0z7xMfLB_c7rWshBPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_07,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 mlxlogscore=969 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090097
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
Cc: disgoel@linux.ibm.com, kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hcall H_GET_PERF_COUNTER_INFO can be used to get data related to
chips, dimms and system topology, by passing different counter request
values.
Patchset adds sysfs files to "/sys/devices/hv_gpci/interface/"
of hv_gpci pmu driver, which will expose system topology information
using H_GET_PERF_COUNTER_INFO hcall. The added sysfs files are
available for power10 and above platforms and needs root access
to read the data.

Patches 1,3,5,7,9 adds sysfs interface files to the hv_gpci
pmu driver, to get system topology information.

List of added sysfs files:
-> processor_bus_topology (Counter request value : 0xD0)
-> processor_config (Counter request value : 0x90)
-> affinity_domain_via_virtual_processor (Counter request value : 0xA0)
-> affinity_domain_via_domain (Counter request value : 0xB0)
-> affinity_domain_via_partition (Counter request value : 0xB1)

Patches 2,4,6,8,10 adds details of the newly added hv_gpci
interface files listed above in the ABI documentation.

Kajol Jain (10):
  powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show
    processor bus topology information
  docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document
    processor_bus_topology sysfs interface file
  powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show
    processor config information
  docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document
    processor_config sysfs interface file
  powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity
    domain via virtual processor information
  docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document
    affinity_domain_via_virtual_processor sysfs interface file
  powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity
    domain via domain information
  docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document
    affinity_domain_via_domain sysfs interface file
  powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity
    domain via partition information
  docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document
    affinity_domain_via_partition sysfs interface file

 .../sysfs-bus-event_source-devices-hv_gpci    |  89 +++
 arch/powerpc/perf/hv-gpci.c                   | 584 +++++++++++++++++-
 arch/powerpc/perf/hv-gpci.h                   |  15 +
 3 files changed, 686 insertions(+), 2 deletions(-)

-- 
2.35.3

