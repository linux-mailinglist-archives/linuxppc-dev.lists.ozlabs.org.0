Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439E3E3F62
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 07:25:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gjl0W0HN1z3bYH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 15:25:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apH3NFww;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=apH3NFww; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gjkzp0TBqz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 15:24:53 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17954IVV047697; Mon, 9 Aug 2021 01:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=mMBy7WvuW6bJ4j5bXsKQCxUMBYPffs7zRLOsqmlyZQo=;
 b=apH3NFwww7pdRIaPKSpCwxm3f0rcn5K1W9i/9c4rK+FcZOt74IrQeVGoVW6lxXXbwOOz
 108EvNXOV5H5Dl8NQKX+yaEXplh6ecLO8twH7KViQDpLg0nPTyUFXTpJZ+53r24Mf3ZL
 s3r3yddaLexo0YP2LQVzoQVNJOaipzMvELJ0WlxV58GDWkZZ7BbP6umgKczy+t4ViEVl
 FS7uVp5x0eWk29c41wY2LbbjJF0mxJyyIod4bxnxfDiX/OwMQF7pQFXEoNsh0GuSjH12
 IFFH8dlF81bj7OH7g9ZEMF5xR0VpvXsVxKcdVBPXcLIy3VQPDKp2TtzzqWQcgKV50EMC 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa7myvf5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:24:44 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17955XfU051359;
 Mon, 9 Aug 2021 01:24:44 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa7myvf5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:24:44 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1795Gx1n028961;
 Mon, 9 Aug 2021 05:24:43 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3a9htaac16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 05:24:43 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1795Ogev11600734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 05:24:42 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E2C7B2064;
 Mon,  9 Aug 2021 05:24:42 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6885AB2065;
 Mon,  9 Aug 2021 05:24:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.58.86])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Aug 2021 05:24:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 0/6] Add support for FORM2 associativity
Date: Mon,  9 Aug 2021 10:54:28 +0530
Message-Id: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I6zxnQlzPPO_PhsX0s8wotdlC5JqGT1n
X-Proofpoint-ORIG-GUID: 1aqKatwpbr5FdnOK8g3OBKl2turlBWIz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_01:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090040
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
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

Changes from v6:
* Address review feedback 

Changes from v5:
* Fix build error reported by kernel test robot
* Address review feedback 

Changes from v4:
* Drop DLPAR related device tree property for now because both Qemu nor PowerVM
  will provide the distance details of all possible NUMA nodes during boot.
* Rework numa distance code based on review feedback.

Changes from v3:
* Drop PAPR SCM specific changes and depend completely on NUMA distance information.

Changes from v2:
* Add nvdimm list to Cc:
* update PATCH 8 commit message.

Changes from v1:
* Update FORM2 documentation.
* rename max_domain_index to max_associativity_domain_index


Aneesh Kumar K.V (6):
  powerpc/pseries: rename min_common_depth to primary_domain_index
  powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
  powerpc/pseries: Consolidate different NUMA distance update code paths
  powerpc/pseries: Add a helper for form1 cpu distance
  powerpc/pseries: Add support for FORM2 associativity
  powerpc/pseries: Consolidate form1 distance initialization into a
    helper

 Documentation/powerpc/associativity.rst       | 103 +++++
 arch/powerpc/include/asm/firmware.h           |   7 +-
 arch/powerpc/include/asm/prom.h               |   3 +-
 arch/powerpc/include/asm/topology.h           |   6 +-
 arch/powerpc/kernel/prom_init.c               |   3 +-
 arch/powerpc/mm/numa.c                        | 433 ++++++++++++++----
 arch/powerpc/platforms/pseries/firmware.c     |   3 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
 .../platforms/pseries/hotplug-memory.c        |   2 +
 arch/powerpc/platforms/pseries/lpar.c         |   4 +-
 10 files changed, 455 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/powerpc/associativity.rst

-- 
2.31.1

