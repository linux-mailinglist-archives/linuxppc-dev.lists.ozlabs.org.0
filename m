Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CB3AB9F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 18:51:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Skz0jXSz3c3p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 02:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jefOUYdP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jefOUYdP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5SkS2YXXz307x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 02:51:27 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HGYa3U143192; Thu, 17 Jun 2021 12:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=TJrIjCgwNXrnQAF2eJf/Y5Tt/ovH5gnvZp+Osn/9NU0=;
 b=jefOUYdPaHEylOJYILD+NR9K7FeYTisnmEu7TuChZLIInu3K9zRHpTh1PJnR+8kYOI+U
 OS/0SxNKZQmj81/Qs1QJikRLTtxdGD2sLm5Bo548htdXuXlVwoHj9OdGHAPr6DYQ+VNL
 zO3Zopychk3hJ5YI77u2T1tlx7xFNfMbhfyRSswV5P4HiTVAIIppAxqsia9HJNg4eb9u
 bJ7DOjs/CNi3uw1Pcncojgk6HaisAsGZVrLJENWQb+pP64hhAi2CO6R9aeohbJ9nw2zq
 UMsK6qipdAsmMg1FKAgeTtBYI8wIbn1zrR4MW/yq0Mj6aZpO6InaWPZEfuOIV4wgL80Z 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3989rg8wwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 12:51:15 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HGYb3t143258;
 Thu, 17 Jun 2021 12:51:14 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3989rg8wwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 12:51:14 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HGlrNj013617;
 Thu, 17 Jun 2021 16:51:14 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 394mjad2mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:51:14 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HGpDGo19661118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 16:51:13 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2528B2072;
 Thu, 17 Jun 2021 16:51:12 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5338DB206E;
 Thu, 17 Jun 2021 16:51:10 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.39.101])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 16:51:09 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 0/7] Add support for FORM2 associativity
Date: Thu, 17 Jun 2021 22:20:58 +0530
Message-Id: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EMFsAgBIjohbpzGuJ63HmXikka8pr6QS
X-Proofpoint-GUID: BgONwuDISp1uhjUX-nxwkh7dkqHgk9V9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170104
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, dan.j.williams@intel.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Form2 associativity adds a much more flexible NUMA topology layout
than what is provided by Form1. More details can be found in patch 7.

$ numactl -H
...
node distances:
node   0   1   2   3 
  0:  10  11  222  33 
  1:  44  10  55  66 
  2:  77  88  10  99 
  3:  101  121  132  10 
$

After DAX kmem memory add
# numactl -H
available: 5 nodes (0-4)
...
node distances:
node   0   1   2   3   4 
  0:  10  11  222  33  240 
  1:  44  10  55  66  255 
  2:  77  88  10  99  255 
  3:  101  121  132  10  230 
  4:  255  255  255  230  10 


PAPR SCM now use the numa distance details to find the numa_node and target_node
for the device.

kvaneesh@ubuntu-guest:~$ ndctl  list -N -v 
[
  {
    "dev":"namespace0.0",
    "mode":"devdax",
    "map":"dev",
    "size":1071644672,
    "uuid":"d333d867-3f57-44c8-b386-d4d3abdc2bf2",
    "raw_uuid":"915361ad-fe6a-42dd-848f-d6dc9f5af362",
    "daxregion":{
      "id":0,
      "size":1071644672,
      "devices":[
        {
          "chardev":"dax0.0",
          "size":1071644672,
          "target_node":4,
          "mode":"devdax"
        }
      ]
    },
    "align":2097152,
    "numa_node":3
  }
]
kvaneesh@ubuntu-guest:~$ 


The above output is with a Qemu command line

-numa node,nodeid=4 \
-numa dist,src=0,dst=1,val=11 -numa dist,src=0,dst=2,val=222 -numa dist,src=0,dst=3,val=33 -numa dist,src=0,dst=4,val=240 \
-numa dist,src=1,dst=0,val=44 -numa dist,src=1,dst=2,val=55 -numa dist,src=1,dst=3,val=66 -numa dist,src=1,dst=4,val=255 \
-numa dist,src=2,dst=0,val=77 -numa dist,src=2,dst=1,val=88 -numa dist,src=2,dst=3,val=99 -numa dist,src=2,dst=4,val=255 \
-numa dist,src=3,dst=0,val=101 -numa dist,src=3,dst=1,val=121 -numa dist,src=3,dst=2,val=132 -numa dist,src=3,dst=4,val=230 \
-numa dist,src=4,dst=0,val=255 -numa dist,src=4,dst=1,val=255 -numa dist,src=4,dst=2,val=255 -numa dist,src=4,dst=3,val=230 \
-object memory-backend-file,id=memnvdimm1,prealloc=yes,mem-path=$PMEM_DISK,share=yes,size=${PMEM_SIZE}  \
-device nvdimm,label-size=128K,memdev=memnvdimm1,id=nvdimm1,slot=4,uuid=72511b67-0b3b-42fd-8d1d-5be3cae8bcaa,node=4

Qemu changes can be found at https://lore.kernel.org/qemu-devel/20210616011944.2996399-1-danielhb413@gmail.com/

Changes from v3:
* Drop PAPR SCM specific changes and depend completely on NUMA distance information.

Changes from v2:
* Add nvdimm list to Cc:
* update PATCH 8 commit message.

Changes from v1:
* Update FORM2 documentation.
* rename max_domain_index to max_associativity_domain_index

Aneesh Kumar K.V (7):
  powerpc/pseries: rename min_common_depth to primary_domain_index
  powerpc/pseries: rename distance_ref_points_depth to
    max_associativity_domain_index
  powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
  powerpc/pseries: Consolidate DLPAR NUMA distance update
  powerpc/pseries: Consolidate NUMA distance update during boot
  powerpc/pseries: Add a helper for form1 cpu distance
  powerpc/pseries: Add support for FORM2 associativity

 Documentation/powerpc/associativity.rst       | 135 ++++++
 arch/powerpc/include/asm/firmware.h           |   7 +-
 arch/powerpc/include/asm/prom.h               |   3 +-
 arch/powerpc/kernel/prom_init.c               |   3 +-
 arch/powerpc/mm/numa.c                        | 410 ++++++++++++++----
 arch/powerpc/platforms/pseries/firmware.c     |   3 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
 .../platforms/pseries/hotplug-memory.c        |   2 +
 arch/powerpc/platforms/pseries/pseries.h      |   1 +
 9 files changed, 474 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/powerpc/associativity.rst

-- 
2.31.1

