Return-Path: <linuxppc-dev+bounces-10428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DA6B1467D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 04:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brfv33HWQz3064;
	Tue, 29 Jul 2025 12:49:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753757359;
	cv=none; b=amkmzx5cgL4iU1yW/p2EvRdwo0CIH2T/QDTaQfI2Pb5rqP6dhSYThrZxnV97//yg4crGpU56Q2/mBaGcJfoJIf4s7T4EpFvm3VNLeiwvUryyn2ptomf31HjDRyZ6N6jjtLgjFChPJ3qvXSQ3XG4cmVhg4A3Hsn5BwlyIUy0KNqp491Fke5caesFXrlVPCUQXo6wsLsRc5H3PNelKRaADl3bOhDX90RsJ7FFC2CcJkfTuJOv08qy6CvNmuaLZkFwVtB6146v4rxAbBY9cbj5wViv/klbp6gOsDIfTkFXcWDxB8AyTstxmhimOCmaNfXt/YkkWsjYrNVi3DRVMMragMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753757359; c=relaxed/relaxed;
	bh=vWKLNb6FQtBBtLEIfC2eYQrv/RDmtgX7d8f2vIajXtA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ToLjCpz9IvRyMavGujSmP0jdrQnstp2sDvAv7c3Q5A566fuedxDO5BocVv0+5Cff8htv+xmZhYOoXpZXeyAP3zyTXGyatI9DZeswLd2HpeRxAlBLETmjrffEn1npL+0Tas4g0bI8PtFdYpceoEfN+tdxtdnKsRqPwomXCFxGQSxecsUY2xjqOIfk5caAQq1uASeSAjNWZkvR3/wAQ7rTzRruAN5kbQZ3r7SooRS4fJYq6z6uXlEMY9BKiN8KVijHIWHg1HcUiXEEZssORp651QLc/ovsMBMgHYc2QA325n+VStlXwD5RTtYviMraN8wLC18X3qObrusbyglISX7FIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSQmAXP4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSQmAXP4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brfv00Dyvz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 12:49:15 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFnm8o009413;
	Tue, 29 Jul 2025 02:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=vWKLNb6FQtBBtLEIfC2eYQrv/RDm
	tgX7d8f2vIajXtA=; b=YSQmAXP41ICG637zqoGHxGr5NeGb4UVgJ4yQSdnyjcVh
	Eyzsk9sbft8OUhbPIMwkilj1r21m08CR44KyqFtmZEsQpwTuMySmxow4gfpSrSQq
	Vv7I1ZGg60WfnMd9FhXXav65XIW1AJF6Z96c/erB+P1/58Q7A6w2KMedbyRETUfP
	FMbRkYxbOuLx+yRSbn5fnjMh8F+N47K0NCt8wnzkN3K85V41Hwb/2ebRkaVbRjRT
	N5GBKF6v9saW/Q41KxRtFOe6YjhEU2anzZG6c84Gfbabex022/QGsaBA0QMMS3YU
	tCnpN+FIbt6dMlwGDJyqbe+fGg1VC7w2nz7uTdLLXg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6hj9ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 02:48:55 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56T2m8l3027061;
	Tue, 29 Jul 2025 02:48:55 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6hj9a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 02:48:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56T012hB015940;
	Tue, 29 Jul 2025 02:48:54 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485aumgdmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 02:48:54 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56T2mqIc25625202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Jul 2025 02:48:52 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4AA558055;
	Tue, 29 Jul 2025 02:48:52 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81B0E58043;
	Tue, 29 Jul 2025 02:48:47 +0000 (GMT)
Received: from [9.124.208.135] (unknown [9.124.208.135])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Jul 2025 02:48:47 +0000 (GMT)
Message-ID: <dc911086-ea2d-477f-8f07-7df19e37e61d@linux.ibm.com>
Date: Tue, 29 Jul 2025 08:18:45 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ajd@linux.ibm.com, ankitchauhan2065@gmail.com, christophe.leroy@csgroup.eu,
        donettom@linux.ibm.com, fourier.thomas@gmail.com, gautam@linux.ibm.com,
        haren@linux.ibm.com, johan.korsnes@gmail.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        paulus@ozlabs.org, segher@kernel.crashing.org, sshegde@linux.ibm.com,
        ssrish@linux.ibm.com, thomas.weissschuh@linutronix.de,
        thuth@redhat.com, vineethr@linux.ibm.com,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.17-1 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mjx-f_ZmbdbYm3_OVSKMvo3m6tPF0N6q
X-Authority-Analysis: v=2.4 cv=Mbtsu4/f c=1 sm=1 tr=0 ts=68883697 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=HZ94RT62inKFrRbv3m0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wT0u4m6gSRpaWXp7AAYYBPXg8C4bA14p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAxOSBTYWx0ZWRfX6ex9DC2442+g
 jL1XEa6fyyhnQsgmqL7CSFQSAvjq//phYBg29STfzq4CUUbrvC584i+y0zxTx+DqUj7hGOFEdPN
 YyOoxH+dtYoPsmRJGL5YinOEwVrwCdu/Ig/565y/KBQlZnZYAzdofzZzolhO6SXkPpSNHcA9sdU
 9gAu5vy0p8nitrwHf8HCbrFvgDQ9cvOxjHZcJ1fUQIwExcnxQvLS9uosUmza1iuEOgy83mnhKw2
 6EB0mk+4lLzk4OUN6ODx5rZi5lBavcGVv+sJqQsfeeFbM95k0QFO73HD8G4O5c/jQ4xIGQyWXoG
 83TnP04li54D2rW9j5LnEC/QP68/y8QfPXcBSCTZolrKqDUYpASK337tX+QKO+EXmcLUM0YgIM7
 d5dAUQMSSGjRbs9T43ofL1qCEDyD+m1apLSMAD6RDgvkHqGw+Jt5TB1Leq+35QhxdJ2rP3E+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=881
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc updates for 6.17:

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-1

for you to fetch changes up to da30705c4621fc82d68483f114f5a395a5f472d2:

  arch/powerpc: Remove .interp section in vmlinux (2025-07-22 14:21:19 +0530)

- ------------------------------------------------------------------
powerpc updates for 6.17

 - CONFIG_HZ changes to move the base_slice from 10ms to 1ms

 - Patchset to move some of the mutex handling to lock guard

 - Expose secvars relevant to the key management mode

 - Misc cleanups and fixes

Thanks to: Ankit Chauhan, Christophe Leroy, Donet Tom, Gautam Menghani, Haren
Myneni, Johan Korsnes, Madadi Vineeth Reddy, Paul Mackerras, Shrikanth Hegde,
Srish Srinivasan, Thomas Fourier, Thomas Huth, Thomas Weißschuh, Souradeep,
Amit Machhiwal, R Nageswara Sastry, Venkat Rao Bagalkote, Andrew Donnellan,
Greg Kroah-Hartman, Mimi Zohar, Mukesh Kumar Chaurasiya, Nayna Jain, Ritesh
Harjani (IBM), Sourabh Jain, Srikar Dronamraju, Stefan Berger, Tyrel Datwyler,
Kowshik Jois

- ------------------------------------------------------------------
Ankit Chauhan (1):
      misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs show functions

Christophe Leroy (1):
      arch/powerpc: Remove .interp section in vmlinux

Donet Tom (2):
      book3s64/radix : Handle error conditions properly in radix_vmemmap_populate
      book3s64/radix : Optimize vmemmap start alignment

Gautam Menghani (1):
      KVM: PPC: Book3S HV: Add H_VIRT mapping for tracing exits

Haren Myneni (1):
      powerpc/pseries/dlpar: Search DRC index from ibm,drc-indexes for IO add

Johan Korsnes (1):
      arch: powerpc: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX

Madadi Vineeth Reddy (1):
      powerpc/defconfigs: Set HZ=1000 on ppc64 and powernv defconfigs

Madhavan Srinivasan (1):
      powerpc/configs/64s: Enable CONFIG_KALLSYMS_ALL

Paul Mackerras (1):
      powerpc/microwatt: Correct ISA version number in device tree

Shrikanth Hegde (6):
      powerpc: eeh: use lock guard for mutex
      powerpc: rtas: use lock guard for mutex
      powerpc: fadump: use lock guard for mutex
      powerpc: book3s: vas: use lock guard for mutex
      powerpc: powernv: ocxl: use lock guard for mutex
      powerpc: sysdev: use lock guard for mutex

Srish Srinivasan (3):
      powerpc/pseries: Correct secvar format representation for static key management
      powerpc/secvar: Expose secvars relevant to the key management mode
      integrity/platform_certs: Allow loading of keys in the static key management mode

Thomas Fourier (2):
      powerpc: floppy: Add missing checks after DMA map
      (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer

Thomas Huth (1):
      powerpc: Drop GPL boilerplate text with obsolete FSF address

Thomas Weißschuh (1):
      powerpc: Don't use %pK through printk


 Documentation/ABI/testing/sysfs-secvar           |  17 +++-
 arch/powerpc/Makefile                            |   2 +-
 arch/powerpc/boot/dts/microwatt.dts              |   2 +-
 arch/powerpc/configs/powernv_defconfig           |   3 +-
 arch/powerpc/configs/ppc64_defconfig             |   3 +-
 arch/powerpc/configs/ppc6xx_defconfig            |   1 -
 arch/powerpc/include/asm/floppy.h                |   5 +-
 arch/powerpc/include/uapi/asm/eeh.h              |  13 ---
 arch/powerpc/include/uapi/asm/kvm.h              |  13 ---
 arch/powerpc/include/uapi/asm/kvm_para.h         |  13 ---
 arch/powerpc/include/uapi/asm/ps3fb.h            |  13 ---
 arch/powerpc/kernel/eeh.c                        |  20 ++--
 arch/powerpc/kernel/eeh_driver.c                 |   2 +-
 arch/powerpc/kernel/fadump.c                     |  11 +--
 arch/powerpc/kernel/rtas_flash.c                 |  64 ++++--------
 arch/powerpc/kvm/trace_book3s.h                  |   1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c         |  31 +++---
 arch/powerpc/perf/hv-24x7.c                      |   8 +-
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c    |   6 +-
 arch/powerpc/platforms/book3s/vas-api.c          |  32 +++---
 arch/powerpc/platforms/powernv/ocxl.c            |  12 +--
 arch/powerpc/platforms/pseries/dlpar.c           |  52 +++++++++-
 arch/powerpc/platforms/pseries/plpks-secvar.c    | 104 +++++++++++++-------
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c      |  14 +--
 drivers/misc/ocxl/sysfs.c                        |  12 +--
 security/integrity/platform_certs/load_powerpc.c |   5 +-
 26 files changed, 230 insertions(+), 229 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmiINg0ACgkQpnEsdPSH
ZJT5Ow//Vv3gnGYHRyk9MIWedwChpkaI4iiW7MUCVFMs/Ek/lKp3Mtz/4g4Syh3b
5HZ8/NAzYRcj09Ovrgrdqs3p5I68kDZ1CpJKGJLmd++MVRukeSDQJ3YLTxpVsHvx
ZlJ7oL55I6y8sxftomVPY12qFxtGWScF6VR7920r1fcwiZaEat/ZOQIZs2edtmaE
1yZa8MJ6kO/W7X1sHCdZmaQXnx5ecqlyh42NqUTDzM2tkPlMgJW6YDgP50N9jmK9
HZwfcl01qahvkDYvnA8aaqgqSFMaCLazlEdDm78+uLsV2FSMX/7Gtq/SPHdRoRg8
AUnIF97iNK76FL/qAto5sPnYFjBZkUtFyXXQ32lSHV0/v1o4nRWkDC4uOoXr7T/v
1s6EopsQj/jGe58bN/uYs2S97lEnlKw+Hbk4HBFfvmewxvlnyy27tJ27Zdi8XA+N
r/a2OmRwhFM1MrVzjo5LJfswgVwz46Ks6lfpGJKXoJ1lgLkclNwB3qt/XmjJBg40
j9r3PPSIZOAvWL9AC3vnX/rM6d4ANSHqpG0yFQih+LRcU67yyEs7ZWBztRcjzTHM
D3/RzcLdFGkNygFSLqQOzTgp0y64HOGbN2lkiZ0xMkgQl3RnpEnsPIAc/Bbf0c9W
nsgLtGfhm5N0W1LCJh77dzHuHs1fVkZt4a1XUJFDFxnE9Lorwm4=
=+bvZ
-----END PGP SIGNATURE-----

