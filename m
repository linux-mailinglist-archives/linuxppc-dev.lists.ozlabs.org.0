Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F13AADB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:35:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5DPP5ZDSz3c1P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:35:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZcIJ+2Ij;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZcIJ+2Ij; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5DNt1FJxz2xYp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:35:25 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H7XHWY166700; Thu, 17 Jun 2021 03:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=gRcooKOGKSxUZk5Eop2u8zy/HGuXyxjvKW9RZCz79kw=;
 b=ZcIJ+2IjqGB5xEDgcEdRbSvP163IXfbovm7cQuvKm0HX3xFGXltRHJrt7XL6/Qqr2r8Y
 vYHLaqoWCsCB7gJnr/ICcb7eBVNaLzxchFjqKKWu6giaIXtpsJ5/TsZC3kG7a7bWcz5Y
 YWfcyl3PcxBBso4i/SVn4Jd5+MKItzlfe7HjiwZaEiY7Dvb/AwhWguCTpZAGJ/ihGlA3
 v4OQAJ2Rry7WxGQ4mCvOCxn9RdmBrWEJ6D98JBn3BI3SeUIk/2zC2YQ2OAy3gEUrIYue
 APu/6MdThEbxlQjvEr+5/OYG6yUVCcYwlvpkKgCNbLk1z6+dS6+e486/zKAWylZg7ssa gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3981m991de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:14 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15H7XH2G166648;
 Thu, 17 Jun 2021 03:35:13 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3981m991cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15H7YLT9021069;
 Thu, 17 Jun 2021 07:35:12 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 394mjarf7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:35:12 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15H7ZCgM30277934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 07:35:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1227112073;
 Thu, 17 Jun 2021 07:35:11 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2657E11206D;
 Thu, 17 Jun 2021 07:35:09 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.31.110])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 07:35:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 0/8] Add support for FORM2 associativity
Date: Thu, 17 Jun 2021 13:04:50 +0530
Message-Id: <20210617073458.510545-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kC8sq4ZHoCShknZ6_8bE27gz3W1C0GHx
X-Proofpoint-GUID: QYddWJ2ykoqlod9PwCAVeiXIXtEj5Uge
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_02:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170052
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
than what is provided by Form1. This also allows PAPR SCM device
to use better associativity when using the device as DAX KMEM
device. More details can be found in patch 7.

$ ndctl list -N -v
[
  {
    "dev":"namespace0.0",
    "mode":"devdax",
    "map":"dev",
    "size":1071644672,
    "uuid":"37dea198-ddb5-4e42-915a-99a915e24188",
    "raw_uuid":"148deeaa-4a2f-41d1-8d74-fd9a942d26ba",
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
    "numa_node":1
  }
]

$ numactl -H
...
node distances:
node   0   1   2   3 
  0:  10  11  222  33 
  1:  44  10  55  66 
  2:  77  88  10  99 
  3:  101  121  132  10 
$

After DAX KMEM
# numactl -H
available: 5 nodes (0-4)
...
node distances:
node   0   1   2   3   4 
  0:  10  11  22  33  255 
  1:  44  10  55  66  255 
  2:  77  88  10  99  255 
  3:  101  121  132  10  255 
  4:  255  255  255  255  10 
# 

The above output is with a Qemu command line

-numa node,nodeid=4 \
-numa dist,src=0,dst=1,val=11 -numa dist,src=0,dst=2,val=22 -numa dist,src=0,dst=3,val=33 -numa dist,src=0,dst=4,val=255 \
-numa dist,src=1,dst=0,val=44 -numa dist,src=1,dst=2,val=55 -numa dist,src=1,dst=3,val=66 -numa dist,src=1,dst=4,val=255 \
-numa dist,src=2,dst=0,val=77 -numa dist,src=2,dst=1,val=88 -numa dist,src=2,dst=3,val=99 -numa dist,src=2,dst=4,val=255 \
-numa dist,src=3,dst=0,val=101 -numa dist,src=3,dst=1,val=121 -numa dist,src=3,dst=2,val=132 -numa dist,src=3,dst=4,val=255 \
-numa dist,src=4,dst=0,val=255 -numa dist,src=4,dst=1,val=255 -numa dist,src=4,dst=2,val=255 -numa dist,src=4,dst=3,val=255 \
-object memory-backend-file,id=memnvdimm1,prealloc=yes,mem-path=$PMEM_DISK,share=yes,size=${PMEM_SIZE}  \
-device nvdimm,label-size=128K,memdev=memnvdimm1,id=nvdimm1,slot=4,uuid=72511b67-0b3b-42fd-8d1d-5be3cae8bcaa,node=4,device-node=1

Qemu changes can be found at https://lore.kernel.org/qemu-devel/20210616011944.2996399-1-danielhb413@gmail.com/

Changes from v2:
* Add nvdimm list to Cc:
* update PATCH 8 commit message.

Changes from v1:
* Update FORM2 documentation.
* rename max_domain_index to max_associativity_domain_index

Aneesh Kumar K.V (8):
  powerpc/pseries: rename min_common_depth to primary_domain_index
  powerpc/pseries: rename distance_ref_points_depth to
    max_associativity_domain_index
  powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
  powerpc/pseries: Consolidate DLPAR NUMA distance update
  powerpc/pseries: Consolidate NUMA distance update during boot
  powerpc/pseries: Add a helper for form1 cpu distance
  powerpc/pseries: Add support for FORM2 associativity
  powerpc/papr_scm: Use FORM2 associativity details

 Documentation/powerpc/associativity.rst       | 177 +++++++
 arch/powerpc/include/asm/firmware.h           |   7 +-
 arch/powerpc/include/asm/prom.h               |   3 +-
 arch/powerpc/kernel/prom_init.c               |   3 +-
 arch/powerpc/mm/numa.c                        | 436 ++++++++++++++----
 arch/powerpc/platforms/pseries/firmware.c     |   3 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
 .../platforms/pseries/hotplug-memory.c        |   2 +
 arch/powerpc/platforms/pseries/papr_scm.c     |  26 +-
 arch/powerpc/platforms/pseries/pseries.h      |   2 +
 10 files changed, 560 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/powerpc/associativity.rst

-- 
2.31.1

