Return-Path: <linuxppc-dev+bounces-5825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48CA27AD4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 20:05:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnXrV2L5vz2ymg;
	Wed,  5 Feb 2025 06:05:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738695946;
	cv=none; b=RgGzdE0jo8XJg50d9+eHgEEx9IVWI+yJ97UQdxrSwttuv/NE1oaph1120Yuo/9P3VVUFu39l022qfB51Cac05PDHBVnWBpmdJqHH62k+XleATi/doZQyk2AyCS1dymuTMccvhPIKcmu4/y0AX2z5Ag14e/WYPVCuQS/hjuCgHoDr0gw855sLzwMl+d8N38BNkBn6l0SWnAtvVtBbvozjzIYJnHaewD/XEKHJTBpEIMDifxT7Ep7TRK+VtrhNkq6xdO9HpZhTt9/Jwnpr7+RWxeEWGDGYDMX7nYfiZFrkoYS0fDeHcBn+r4gGAphOLXhoDUBXWxF+GLVCxhaDnomnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738695946; c=relaxed/relaxed;
	bh=VQvJsxOkh/tsDRGqgjYYqknT1lxDU/Cy3UKqu5GNj8g=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ky3/t8Q/DIQbueUc8SG66/C0g+eRtRhDvgpgJ6BSSqRXQzdYvMp25oF97fURrt3RSm3tVJGioZe1Lyujn64Q/N5E6gt/qug4UKnp+wl3lOU+tuuuaJHZbR5wuf4f6JXOeGhaig0hggUAgfeuF+YbEQ2orsOYD0BGEufHgN9Ywp11AYDWz4YRVbNWv+HciHEH709P0H+Pb3lywMGjeowsbEK1fP6WxbcZrguxX4cahirvXAOXSrc+XFs7wlLbs7yQA34UNTS7aTA4WMInHsWfxF0cq6EfbqysdYx93yC1AwRtBaeWlkM3c1+4IUusYLmBrIEBghysrmEsLQJ+Dt68Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ELOM1YCg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ELOM1YCg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnXrT0Jnsz2yXd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 06:05:44 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GEm3j030548
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Feb 2025 19:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=VQvJsxOkh/tsDRGqgjYYqknT1lxD
	U/Cy3UKqu5GNj8g=; b=ELOM1YCg/Pfy1q+lA/PZQLW3jA3Vvy+kF0uI37nXiM6C
	lponycRGDWvLWGNonjvmnNoWOy+0BU06ML9/1w13GagzSMaZGjfaK8qQeE4Z0kGW
	3HsvxhzdKi87bP4VAoVq9pADOd/1uNEIqwQhwjKS9qAlnRUvuZItYbfz6JouDliZ
	oHDIfvGzuOCtrUB683L2M7DcfRlSUDkzUtHPeVSNqb4RKgNwzUPMajF/cm+LY4bM
	w4aiL+ldQ0ClQeBe4cnIWXRYBTHMJaRXXz5SyXMCM89TrCN3an8Rx70dPHURtc/G
	xPjTmQ9bgCnSPrf0MA569I7FJKZ6iROlc5dK5PI3Hw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44kekp3avh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Feb 2025 19:05:41 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 514IxTIe012590
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Feb 2025 19:05:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44kekp3avd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 19:05:41 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514G5Wxu024510;
	Tue, 4 Feb 2025 19:05:40 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxn51w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 19:05:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514J5bZk28705392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 19:05:37 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D67CE58059;
	Tue,  4 Feb 2025 19:05:37 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BE4C58043;
	Tue,  4 Feb 2025 19:05:37 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 19:05:37 +0000 (GMT)
Message-ID: <c683fcdc-38e7-4bed-8bfe-dcf6f122da6a@linux.ibm.com>
Date: Tue, 4 Feb 2025 14:05:37 -0500
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: ritesh.list@gmail.com, masriniv@in.ibm.com
From: Stefan Berger <stefanb@linux.ibm.com>
Subject: kexec failing with KVM on Power8 baremetal host
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Gu_9gm3NJoFz15StCxRIZr26TVo0dhq2
X-Proofpoint-GUID: Cux_FIUZqUb-lfqBxzv2kYKHfCzX4mXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040140
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

I bisected Linux between 6.13.0 and 6.12.0 due to failing kexec on a 
Power8 baremetal host on 6.13.0:

8fec58f503b296af87ffca3898965e3054f2b616 is the first bad commit
commit 8fec58f503b296af87ffca3898965e3054f2b616
Author: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Date:   Fri Oct 18 22:59:50 2024 +0530

     book3s64/hash: Add kfence functionality

     Now that linear map functionality of debug_pagealloc is made generic,
     enable kfence to use this generic infrastructure.

     1. Define kfence related linear map variables.
        - u8 *linear_map_kf_hash_slots;
        - unsigned long linear_map_kf_hash_count;
        - DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
     2. The linear map size allocated in RMA region is quite small
        (KFENCE_POOL_SIZE >> PAGE_SHIFT) which is 512 bytes by default.
     3. kfence pool memory is reserved using memblock_phys_alloc() which has
        can come from anywhere.
        (default 255 objects => ((1+255) * 2) << PAGE_SHIFT = 32MB)
     4. The hash slot information for kfence memory gets added in linear map
        in hash_linear_map_add_slot() (which also adds for debug_pagealloc).

     Reported-by: Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
     Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
     Link: 
https://patch.msgid.link/5c2b61941b344077a2b8654dab46efa0322af3af.1729271995.git.ritesh.list@gmail.com

  arch/powerpc/include/asm/kfence.h     |   5 ---
  arch/powerpc/mm/book3s64/hash_utils.c | 162 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
  2 files changed, 149 insertions(+), 18 deletions(-)


Reverting part of this patch by applying the following changes to 6.13.0 
resolves the issue:


diff --git a/arch/powerpc/include/asm/kfence.h 
b/arch/powerpc/include/asm/kfence.h
index 1f7cab58ab2c..e7981719313c 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -10,6 +10,7 @@

  #include <linux/mm.h>
  #include <asm/pgtable.h>
+#include <asm/mmu.h>

  #ifdef CONFIG_PPC64_ELF_ABI_V1
  #define ARCH_FUNC_PREFIX "."
@@ -25,6 +26,10 @@ static inline void disable_kfence(void)

  static inline bool arch_kfence_init_pool(void)
  {
+#ifdef CONFIG_PPC64
+       if (!radix_enabled())
+               return false;
+#endif
         return !kfence_disabled;
  }



