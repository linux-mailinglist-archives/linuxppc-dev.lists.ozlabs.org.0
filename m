Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519A30E7C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:44:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWJFC45hVzDwqd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:44:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=YVQ3mdsi; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=cExWitoE; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWJ6M2Dd7zDwpl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 10:38:44 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113N8xlG103727;
 Wed, 3 Feb 2021 23:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=qsEGKVlwuthB6IlsIaAceDAu5rgeHIJP4Sy0WStKjL4=;
 b=YVQ3mdsiofTOsSsz6szMGB1tjZoyfyhYTGQuHfiuq9fnn7O+mT2ZMf/oFEeq9m6/1Ud8
 o2l0M8hto7uYeKodKBVIBwQKP6dPH62mTjQrhTiRiwShRrcgkXTocWM10UTh5O8FaLzY
 cDm6mIFe4nrZ7wqdI5YrPfkPEWctS1yngSQqguMBRZpy9j3l72yZRsCmPLxckDD4ZdjL
 NemMVLhXDkv5uVNcDKgW0BhYnhrsw/SUIhuaT8VuFqxU0uatOGWiBOiSJC2SXIjYIKI3
 1uu01zsQ4CYwqe/cQJp7tcQCzY9P4GR47cw5tuCu6lJ4ZDws6Y24EvMaRcipWL25/sIZ DQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 36cydm2q11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NB3jw025155;
 Wed, 3 Feb 2021 23:37:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3020.oracle.com with ESMTP id 36dhc1wj19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWsB8XXRpIpWWjUxGxaqItGk4rsX0gm4lOVAzXof6dvlDsAo6PxpE9LVo2mJYQX88GxxMz/SPPYnHAGjpnetONjUMHvWPYlNYB5+K8mECnmgGR/OgoGPDM7hinW4OtGlYoheUU6AQKW2+Gk7U8E1FWdigM4y8/WdKmg1ZXA1NMJmISTZVfGOUm01hX2hqlwZpi/LPdRyovi8ZZ0dEUk06oUAKSZeCOLU2gO7EuD9JFazPloB5l4xmm3xyelKDmdnUD472lImPCb5h8YLrO2J0ghn5gFY1O1d8ixBS2xgkqbiXNpB1/35t9gRaM4EmmPo7kkV52DZyOzrO3wvhXPuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsEGKVlwuthB6IlsIaAceDAu5rgeHIJP4Sy0WStKjL4=;
 b=e7pmhtT0iG6+1IPSSPrbtp/zCk+zXY4TfkNpxVkx2o+dJmQtno2dBbDYDmSSGy4EsndZFUkazg5pxHymYmOy+Ufp94V6WDZjkriVc4dbZnMrYkoExkxG+e3F+4e2JneeWDzhNj513lROwKlisWp3mYFb2ur40JI/0dX1lRh9DmEc+yRX+knwd1LO2EyVHo7J+YmlIQiaVkfCeMy+h0HW7BUUhM8vPfXWFf6Pqv36yAxYTDB+lHTtTHEpzUuKrJA/pVIdeub0rs/mu3UGaxeamjLNVoqbOQBavlIkYptqDChoBCtnbGnR2LRqn+Tud5yGPqQCONjQ4qzl/J6RL8KT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsEGKVlwuthB6IlsIaAceDAu5rgeHIJP4Sy0WStKjL4=;
 b=cExWitoEK2u27ChY5w571nzM0Hj9zOqeABpvwhLDCdOdmoyNkuS9Pl9jgif4I26Ev2rVL2IO++rYmVZOJt/SwoVWVdXXhtpq3KnJ8ZwoCQpMEGpnkMChSKLJnq+ub5E5HpyN8sJzB0MxM1+FQQnpOjS3KgLuGx8xR2GIll4TFME=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:37:36 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 23:37:36 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RFC v1 0/6] swiotlb: 64-bit DMA buffer
Date: Wed,  3 Feb 2021 15:37:03 -0800
Message-Id: <20210203233709.19819-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: CH0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:610:b0::13) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 CH0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:b0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:37:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb1ff20-7d9b-47ac-6403-08d8c89cafd9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47843F855991F25A4A45BF6DF0B49@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LY9Lq3NT6DmOC7z0WPolLyKaKsLauZx2aBzBON7L226+ab0hT/EWg3ZiW5wlM+VnbehKdSdVWZpbBs/TbGgyX4HezNqQ5CMlR+HH/rpWlSoRmL4fXeIGRcA5vf1RTqeTAKM2YFRYOZBo7Rb41zCbdAnPBKUdIYGdeXLu5MAoybkFdWZpSussZ68XVeaMxnJQSEiGUhVeKMMwEfDGIGyHkhar0bqMbr46E3MWFmdZ9kZ7o4IqMS2dZosCg8CFI14P7CDsspaCa7SUTll8jeVG8WArKNzxJn+TUbqCjLSd75TH9TOaGjaFYnbVlbksGTPa7pqSfNaqr/79nK5uiNUJ2POLcMyTnhZq9HFlEICzAPOIn1lYEGuLax0VpiszYoDm0Vp3Xw1DiD5/v/ylc8vsKeR8rvysabStgohdaM+Or06NxxooDiBrWjU72PiHQk9zI8Rnz75OAZzmyEQ5uJjLWW0xPlzHzGVRNOp0gUFNXeDl+kzC115+kmB45dykxnqvQmrRurijE/xz1S6wLsytw91XYB/lvBRuoc7XC/cxJRQAb02illeVoDS9wkRIuIjVKejYiNGxC/1AIi5G5TSR8MGb8i6gkehd1M6JjM96xrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(6666004)(316002)(5660300002)(956004)(66946007)(6506007)(86362001)(7406005)(1076003)(66476007)(8676002)(186003)(26005)(36756003)(7416002)(478600001)(2906002)(66556008)(8936002)(6486002)(16526019)(69590400011)(4326008)(6512007)(44832011)(921005)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?14CfgRF8o8XCWWseZbNUuFwSrYhs6AQTmHA1kkzZvm8HuSSgbEinFwcxm/Ei?=
 =?us-ascii?Q?YdCxSImF5U5UcCrk3/o7TbA0bHe+tJ9GnE9vn2dKeGvgf9ErntjaWFLqBLlQ?=
 =?us-ascii?Q?WYPYUmK3PE/gPkWS6JtnZ1UCeT8h3LrPzSiq7ycKrX1zUAEvxk5t0MOpopL7?=
 =?us-ascii?Q?GJalZ9E7v4pjStDMFVbSSTVJwCVAf/hVyN0iG3cSFppknj0A2FrYwHKQn11O?=
 =?us-ascii?Q?mcB55ilx4Wdy7BzXH4dnoCPXY/KSks0n+mbGvFnkvEmH7AO19R68vmXXxjEJ?=
 =?us-ascii?Q?SSAu67eZxoUujfsENdqYp2eNxw9b2Lbgcovp7tgz5CxkLxm17M1csryrw9M8?=
 =?us-ascii?Q?g30/xAUlYRvTNHfw9G4wwlbT85/08RhpFoqbVa5pZRjZKSWpQH1ZA5Km6IRa?=
 =?us-ascii?Q?KOQ5gc8w5HeXEte/29PvfnaI64YQlv+cg9LIdslXs4irBbX1SsCeXozPAe6M?=
 =?us-ascii?Q?d0lKn0G5wH8WnxDnyUicYklTHA6MwHol1/5qxv4n2SRQ1k60vYNllTJyexlR?=
 =?us-ascii?Q?8dcmhixT07GuHj1nYE1jGn4140LzPPfSYkbzczJbmItbPJ0ZhMfjzpxzoy6o?=
 =?us-ascii?Q?VllOGJZ2SbFkPTJLp9ZNEgO9Wz6NE8d2lqQrFvjWN0dEaCHOUBjweqeC/OTz?=
 =?us-ascii?Q?coZCwbCJ16o83K9oQaEwPz5AXiX3AM7hVDlC7AIIMMg6Uci0W1pYj9fTQ5xb?=
 =?us-ascii?Q?b2EcHraiOqOgLbCldF4Hz9qDkSrKgTuPkQ9yeXN98+VndGRXkrI4bnrlydoQ?=
 =?us-ascii?Q?AqKCiGqnuiTfkvKE6hg5ODpB5h6V1NxPbaL0jBCquCpSR0sMiXB0eU2Wr7o7?=
 =?us-ascii?Q?tclMeJftJfE08BZuuUQUdWR31kjGkQA+ubPYU80Wcsp3FQekGk8uWh75KQ2w?=
 =?us-ascii?Q?HCs/bn3R455tQR8SN0b/L9s9csLTr+DTNXuILdxnXdgPC5xcHFwA9Zxd+a44?=
 =?us-ascii?Q?Syx/l8kY+zpsn/qjhLKWGJgmjveuxGGOcWVSQ/mkeODUd79uxhyTgYge8//t?=
 =?us-ascii?Q?pDUWhLDoC41G/NxpES9c5Jry+glB3shCr5cMzDr7sJLkUr0RTSolzKkYkzLo?=
 =?us-ascii?Q?YnQwYasH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb1ff20-7d9b-47ac-6403-08d8c89cafd9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:37:36.5357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjFAEv41/MntsA4fKs/ZtEmt2lYp+bejHO36bqzO1VLLyXuSm8FNEpw3/9n6Tfgy8/V89Pne75iBjlycVoHr+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030143
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030143
X-Mailman-Approved-At: Thu, 04 Feb 2021 10:42:49 +1100
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 adrian.hunter@intel.com, paulus@samba.org, hpa@zytor.com, mingo@kernel.org,
 m.szyprowski@samsung.com, sstabellini@kernel.org, joe.jin@oracle.com,
 hch@lst.de, peterz@infradead.org, mingo@redhat.com, matthew.auld@intel.com,
 bskeggs@redhat.com, thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 jani.nikula@linux.intel.com, bp@alien8.de, rodrigo.vivi@intel.com,
 bhelgaas@google.com, boris.ostrovsky@oracle.com, chris@chris-wilson.co.uk,
 jgross@suse.com, tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, bauerman@linux.ibm.com, daniel@ffwll.ch,
 akpm@linux-foundation.org, robin.murphy@arm.com, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This RFC is to introduce the 2nd swiotlb buffer for 64-bit DMA access.  The
prototype is based on v5.11-rc6.

The state of the art swiotlb pre-allocates <=32-bit memory in order to meet
the DMA mask requirement for some 32-bit legacy device. Considering most
devices nowadays support 64-bit DMA and IOMMU is available, the swiotlb is
not used for most of times, except:

1. The xen PVM domain requires the DMA addresses to both (1) <= the device
dma mask, and (2) continuous in machine address. Therefore, the 64-bit
device may still require swiotlb on PVM domain.

2. From source code the AMD SME/SEV will enable SWIOTLB_FORCE. As a result
it is always required to allocate from swiotlb buffer even the device dma
mask is 64-bit.

sme_early_init()
-> if (sev_active())
       swiotlb_force = SWIOTLB_FORCE;


Therefore, this RFC introduces the 2nd swiotlb buffer for 64-bit DMA
access.  For instance, the swiotlb_tbl_map_single() allocates from the 2nd
64-bit buffer if the device DMA mask min_not_zero(*hwdev->dma_mask,
hwdev->bus_dma_limit) is 64-bit.  With the RFC, the Xen/AMD will be able to
allocate >4GB swiotlb buffer.

With it being 64-bit, you can (not in this patch set but certainly
possible) allocate this at runtime. Meaning the size could change depending
on the device MMIO buffers, etc.


I have tested the patch set on Xen PVM dom0 boot via QEMU. The dom0 is boot
via:

qemu-system-x86_64 -smp 8 -m 20G -enable-kvm -vnc :9 \
-net nic -net user,hostfwd=tcp::5029-:22 \
-hda disk.img \
-device nvme,drive=nvme0,serial=deudbeaf1,max_ioqpairs=16 \
-drive file=test.qcow2,if=none,id=nvme0 \
-serial stdio

The "swiotlb=65536,1048576,force" is to configure 32-bit swiotlb as 128MB
and 64-bit swiotlb as 2048MB. The swiotlb is enforced.

vm# cat /proc/cmdline 
placeholder root=UUID=4e942d60-c228-4caf-b98e-f41c365d9703 ro text
swiotlb=65536,1048576,force quiet splash

[    5.119877] Booting paravirtualized kernel on Xen
... ...
[    5.190423] software IO TLB: Low Mem mapped [mem 0x0000000234e00000-0x000000023ce00000] (128MB)
[    6.276161] software IO TLB: High Mem mapped [mem 0x0000000166f33000-0x00000001e6f33000] (2048MB)

0x0000000234e00000 is mapped to 0x00000000001c0000 (32-bit machine address)
0x000000023ce00000-1 is mapped to 0x000000000ff3ffff (32-bit machine address)
0x0000000166f33000 is mapped to 0x00000004b7280000 (64-bit machine address)
0x00000001e6f33000-1 is mapped to 0x000000033a07ffff (64-bit machine address)


While running fio for emulated-NVMe, the swiotlb is allocating from 64-bit
io_tlb_used-highmem.

vm# cat /sys/kernel/debug/swiotlb/io_tlb_nslabs
65536
vm# cat /sys/kernel/debug/swiotlb/io_tlb_used
258
vm# cat /sys/kernel/debug/swiotlb/io_tlb_nslabs-highmem
1048576
vm# cat /sys/kernel/debug/swiotlb/io_tlb_used-highmem
58880


I also tested virtio-scsi (with "disable-legacy=on,iommu_platform=true") on
VM with AMD SEV enabled.

qemu-system-x86_64 -enable-kvm -machine q35 -smp 36 -m 20G \
-drive if=pflash,format=raw,unit=0,file=OVMF_CODE.pure-efi.fd,readonly \
-drive if=pflash,format=raw,unit=1,file=OVMF_VARS.fd \
-hda ol7-uefi.qcow2 -serial stdio -vnc :9 \
-net nic -net user,hostfwd=tcp::5029-:22 \
-cpu EPYC -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1 \
-machine memory-encryption=sev0 \
-device virtio-scsi-pci,id=scsi,disable-legacy=on,iommu_platform=true \
-device scsi-hd,drive=disk0 \
-drive file=test.qcow2,if=none,id=disk0,format=qcow2

The "swiotlb=65536,1048576" is to configure 32-bit swiotlb as 128MB and
64-bit swiotlb as 2048MB. We do not need to force swiotlb because AMD SEV
will set SWIOTLB_FORCE.

# cat /proc/cmdline
BOOT_IMAGE=/vmlinuz-5.11.0-rc6swiotlb+ root=/dev/mapper/ol-root ro
crashkernel=auto rd.lvm.lv=ol/root rd.lvm.lv=ol/swap rhgb quiet
LANG=en_US.UTF-8 swiotlb=65536,1048576

[    0.729790] AMD Memory Encryption Features active: SEV
... ...
[    2.113147] software IO TLB: Low Mem mapped [mem 0x0000000073e1e000-0x000000007be1e000] (128MB)
[    2.113151] software IO TLB: High Mem mapped [mem 0x00000004e8400000-0x0000000568400000] (2048MB)

While running fio for virtio-scsi, the swiotlb is allocating from 64-bit
io_tlb_used-highmem.

vm# cat /sys/kernel/debug/swiotlb/io_tlb_nslabs
65536
vm# cat /sys/kernel/debug/swiotlb/io_tlb_used
0
vm# cat /sys/kernel/debug/swiotlb/io_tlb_nslabs-highmem
1048576
vm# cat /sys/kernel/debug/swiotlb/io_tlb_used-highmem
64647


Please let me know if there is any feedback for this idea and RFC.


Dongli Zhang (6):
   swiotlb: define new enumerated type
   swiotlb: convert variables to arrays
   swiotlb: introduce swiotlb_get_type() to calculate swiotlb buffer type
   swiotlb: enable 64-bit swiotlb
   xen-swiotlb: convert variables to arrays
   xen-swiotlb: enable 64-bit xen-swiotlb

 arch/mips/cavium-octeon/dma-octeon.c         |   3 +-
 arch/powerpc/kernel/dma-swiotlb.c            |   2 +-
 arch/powerpc/platforms/pseries/svm.c         |   8 +-
 arch/x86/kernel/pci-swiotlb.c                |   5 +-
 arch/x86/pci/sta2x11-fixup.c                 |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c |   4 +-
 drivers/gpu/drm/i915/i915_scatterlist.h      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        |   2 +-
 drivers/mmc/host/sdhci.c                     |   2 +-
 drivers/pci/xen-pcifront.c                   |   2 +-
 drivers/xen/swiotlb-xen.c                    | 123 ++++---
 include/linux/swiotlb.h                      |  49 ++-
 kernel/dma/swiotlb.c                         | 382 +++++++++++++---------
 13 files changed, 363 insertions(+), 223 deletions(-)


Thank you very much!

Dongli Zhang


