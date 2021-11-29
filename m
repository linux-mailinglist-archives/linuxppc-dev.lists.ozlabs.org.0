Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E04616F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:47:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2mr46hJTz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 00:47:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bVJLzlJj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bVJLzlJj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2mqG2Yhkz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 00:46:49 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATDKS9G004864
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 13:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=b+nAvchDqIgKKyj5+puGrN0h+4yOemQYx1uWFGryATI=;
 b=bVJLzlJjfpWNFHjdjLIlUBO/jN5/D9irr+RNem9+j7h92lyV4kJr7nHB9Wu1ncRburXI
 f4R57gG7cw/6Go9x6NlYwKVJgAk9XlYEXFQiVGj1KHjtwYJ/KoIy95FBVigSulALD1qu
 7nj4F1rId6MnnEYSf3KYtdEp79ToQKxrnDAaF6WJ7kbcOpW/5M5V24BxLMM0gWGijl+p
 X2AQrszPY2e4qREKcAouCAGY2UbNKCybX8zIj8SjWqWmsh0EYRtGyOajw4OOEH90ab/P
 CyPipP7E3fdNejGjY+eXdxHN2dCtpfDTB7VdBcCnJ1XQ1VNWYAVMOCHyaznShXRr7fJG xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmynhgm68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 13:46:45 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATDKRVD004829
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 13:46:45 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmynhgm5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 13:46:45 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATDg6HB031821;
 Mon, 29 Nov 2021 13:46:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3ckcaa23h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 13:46:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATDkh8E58523908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 13:46:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E51F112062;
 Mon, 29 Nov 2021 13:46:43 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 282E3112075;
 Mon, 29 Nov 2021 13:46:42 +0000 (GMT)
Received: from localhost (unknown [9.211.119.53])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 29 Nov 2021 13:46:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 15/17] powerpc/64s: Make hash MMU support configurable
In-Reply-To: <20211129030803.1888161-16-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
 <20211129030803.1888161-16-npiggin@gmail.com>
Date: Mon, 29 Nov 2021 10:46:39 -0300
Message-ID: <877dcrqdkw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N-6TBv501eLFkRDr2eS2NYDoXIay1mTK
X-Proofpoint-GUID: EROkXlaa0xUt4du6nQw3Rls812lWZhA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_08,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290068
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This adds Kconfig selection which allows 64s hash MMU support to be
> disabled. It can be disabled if radix support is enabled, the minimum
> supported CPU type is POWER9 (or higher), and KVM is not selected.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/Kconfig                     |  3 ++-
>  arch/powerpc/include/asm/mmu.h           | 16 +++++++++++++---
>  arch/powerpc/kernel/dt_cpu_ftrs.c        | 14 ++++++++++----
>  arch/powerpc/kvm/Kconfig                 |  1 +
>  arch/powerpc/mm/init_64.c                | 13 +++++++++++--
>  arch/powerpc/platforms/Kconfig.cputype   | 23 +++++++++++++++++++++--
>  arch/powerpc/platforms/cell/Kconfig      |  1 +
>  arch/powerpc/platforms/maple/Kconfig     |  1 +
>  arch/powerpc/platforms/microwatt/Kconfig |  2 +-
>  arch/powerpc/platforms/pasemi/Kconfig    |  1 +
>  arch/powerpc/platforms/powermac/Kconfig  |  1 +
>  arch/powerpc/platforms/powernv/Kconfig   |  2 +-

powernv_defconfig brings CONFIG_CXL=3Dm

../drivers/misc/cxl/main.c: In function =E2=80=98cxl_alloc_sst=E2=80=99:=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
../drivers/misc/cxl/main.c:127:45: error: =E2=80=98mmu_linear_psize=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98mmu_virt=
ual_psize=E2=80=99?=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
  127 |  sstp0 |=3D (SLB_VSID_KERNEL | mmu_psize_defs[mmu_linear_psize].sll=
p) << 50;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
      |                                             ^~~~~~~~~~~~~~~~=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
      |                                             mmu_virtual_psize=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
../drivers/misc/cxl/main.c:127:45: note: each undeclared identifier is repo=
rted only once for each function it appears in=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
make[4]: *** [../scripts/Makefile.build:287: drivers/misc/cxl/main.o] Error=
 1=20

