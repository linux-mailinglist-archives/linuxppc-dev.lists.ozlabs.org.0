Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B98EA767CCE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 09:36:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gsKFuyv+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCbsl3vbTz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 17:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gsKFuyv+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCbrl3ylSz304b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 17:35:35 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36T7VfEj003000;
	Sat, 29 Jul 2023 07:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Q7EgVlIj8WWBI961jwvSr0S3u2PuA1rGpYpxCocZk+A=;
 b=gsKFuyv+VTfoNxTMdZmwnB9n/0NDYJrDvVlX7xldot69lvnQj4KAQ1Ka9KWWq8HPgQTG
 zgZmEnaJbgjIFCwK5LTW8LTuneiAGyr8K/zlW7wn8SZbBJPG6SXxeb4tTc32xzMweYzz
 nYEod4Ev66I54fs7Luq6cdgn64MO7whWCTWZVEO+aKJrmx2eoy6rgYAZpbPcYYpdRJha
 34NEqNLxBOW4Wzvyaklw4cqz6Kb4/9hjgwDwambjHqRACW994n3J6yITVuC5Phi01AyX
 hdIjb/fuwdKcPDQ2t6DFNYhY6eT/PHWVtJQCUTrpRwNlZNDoTXHzzxrK9XhS3E2aoYTX sg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4xf0857t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:35:17 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36T6KKJd026189;
	Sat, 29 Jul 2023 07:35:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0sesw7kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:35:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36T7ZE8m45351362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Jul 2023 07:35:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFBEB20043;
	Sat, 29 Jul 2023 07:35:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA70620040;
	Sat, 29 Jul 2023 07:35:11 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.171.60.192])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 29 Jul 2023 07:35:11 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 00/10] Add sysfs interface files to hv_gpci device to expose system information
Date: Sat, 29 Jul 2023 13:04:45 +0530
Message-Id: <20230729073455.7918-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I8Wpywaubs4fkQr8LNtiWXmt0_k1PZ75
X-Proofpoint-GUID: I8Wpywaubs4fkQr8LNtiWXmt0_k1PZ75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290068
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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

Patches 2,4,6,8,10 adds details of the newly added hv_gpci
interface files listed above in the ABI documentation.

Changelog:
v3 -> v4
-> Add Reviewed-by tag from Athira Rajeev.
-> Correct typo by changing processor_bug_topology to processor_bus_topology

v2 -> v3
-> Make nit changes in documentation patches as suggested by Randy Dunlap.

v1 -> v2
-> Incase the HCALL fails with errors that can be resolve during runtime,
   then only add sysinfo interface attributes to the interface_attrs
   attribute array. Even if one of the counter request value HCALL fails,
   don't add any sysinfo attribute to the interface_attrs attribute array.
   Add the code changes to make sure sysinfo interface added only when all
   the requirements met as suggested by Michael Ellerman.
-> Make changes in documentation, adds detail of errors type
   which can be resolved at runtime as suggested by Michael Ellerman.
-> Add new enum and sysinfo_counter_request array to get required
   counter request value in hv-gpci.c file.
-> Move the macros for interface attribute array index to hv-gpci.c, as
   these macros currently only used in hv-gpci.c file.

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

 .../sysfs-bus-event_source-devices-hv_gpci    | 160 +++++
 arch/powerpc/perf/hv-gpci.c                   | 640 +++++++++++++++++-
 2 files changed, 798 insertions(+), 2 deletions(-)

-- 
2.39.3

