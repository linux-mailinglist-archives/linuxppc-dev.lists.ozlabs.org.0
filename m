Return-Path: <linuxppc-dev+bounces-16792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNySNCDwi2nPdgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 03:57:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094E120D31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 03:57:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9jlb3P2Bz2xlk;
	Wed, 11 Feb 2026 13:57:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770778651;
	cv=none; b=YerqSQyIclbfwHMFoUuNBLGjU/S9k2K8IJ0BD5YASlbw5XSVYhyoIttKy/GUiTT5XzgXch6rURGxcKln40ZpM8Z6/BOZ5Em0VV+o1ljU3h54ey+yENgX1GlY1vdJ7jQ1WTiY0dXIeOaLgh7N3J+2XoKDZvEXQblyaLcliPvoWoKYPdEj0qihkSbVvpJJNecgPrL+Dzsf9aph5xCXMzTCaux+SZt4/d1fgShmv3bbt3m9k8kCHMVZ2jyDgonfQrepCoc6LDHO3Yli9HYp9oNwxe8QE8xkVFDrr5cLibXLyEcVmCbxKM3Zp3dxBc5x5GVKfzjdIzL7QVbq9VrZEDK9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770778651; c=relaxed/relaxed;
	bh=UDH4hT2boAFA0xbqxxbu7aae2h9ihZuJ5hrBzNjUA+0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=niBfi5pI346KpnthTXXuRcMtTsPWDpmIdI23YhQbyeV2fbqw9JDAJWR2NGew5E+A4YlyL1o90N16wSWS5ZgHuwAQuVmtu0iTVERiTF1KVVJUqD5RPtIIIbiDT8lH+tHsvWpMWugM8Z8LfjiuvP66O4cw2Dp2vc/QcEDunGN1pyLwR3d46VyEEpuEBLI6GIzxawtzpEFoacMVHx3r+Uv6UuF8WD7NS6tuMW9Z/g7FizJ5CTrZEM7azwldxD/lbNpMdJvt3D798Id1kz/WVLA544TyVN50VYK7Wag/C/iD6RHYg87zvpeet2TPUjg+Vm1Jxf9BODnpprH0jtUojGFznQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Av8EZ1zg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Av8EZ1zg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9jlY4yrGz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 13:57:28 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AI12r33738413;
	Wed, 11 Feb 2026 02:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=UDH4hT2boAFA0xbqxxbu7aae2h9i
	hZuJ5hrBzNjUA+0=; b=Av8EZ1zgHUJZjYJjRkDx+KU1KXWGrRI2jkoJn0ZBuZC3
	gS2VSOP2FFdNKe8X2LX0eJT94GwzxGYu6V0NDGkqo491+Uc8az5VqBSbdkAAnr/g
	WAFVBJiWBS3mAIV67Bby3Y/3Z+QVna0XhQEeC4XPNX0FKOVkvlN9REaFzE/G5l2v
	XSOFw5wKeLnlGZn/UEY+mPqCkOytHZJxwPsOZ4mGrca9ZesMZZ0XEQNTU7ZOD81o
	agbmvWNfS0wh7N9CGH1v8tBfuJIChQ3wfz4d4OWS4d56yGpUmzZ+F/R85RvYRGPt
	H3hxZ7kM8s1J1XzQql5Y5Y+7GTcEdhvLU81gmaJPvw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696v4wb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 02:57:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61AMwRZd001427;
	Wed, 11 Feb 2026 02:57:09 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6gqn45gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 02:57:09 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61B2v7uj29295234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Feb 2026 02:57:08 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D989858056;
	Wed, 11 Feb 2026 02:57:07 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 942B65803F;
	Wed, 11 Feb 2026 02:57:02 +0000 (GMT)
Received: from [9.109.209.83] (unknown [9.109.209.83])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Feb 2026 02:57:02 +0000 (GMT)
Message-ID: <bc20cf24-03ec-4bf8-ba5e-94dc3cc5c1de@linux.ibm.com>
Date: Wed, 11 Feb 2026 08:27:00 +0530
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
Cc: adubey@linux.ibm.com, christophe.leroy@csgroup.eu, gbatra@linux.ibm.com,
        hbathini@linux.ibm.com, lgs201920130244@gmail.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, mikisabate@gmail.com, mpe@ellerman.id.au,
        namcao@linutronix.de, naveen@kernel.org, nayna@linux.ibm.com,
        nilay@linux.ibm.com, nnmlinux@linux.ibm.com, npiggin@gmail.com,
        skb99@linux.ibm.com, ssrish@linux.ibm.com
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-7.0-1 tag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kPZ6T0EKFnVi_VNZuDDU2n7f0E-q0VUM
X-Proofpoint-ORIG-GUID: IiEn4-daFUVgQPskt1bCUAGsV79vZE0M
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=698bf006 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=kIh0tF8vsjXWtstxbtUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyMiBTYWx0ZWRfX4moqR2+FqfX0
 9dmCCQStOPmr8puGhypuiCQ1G1ZFo4OQud8DipOvL8RXFxmp7mdPOc+WZK2F4U1iN0faTJ9ZuhC
 C2w4BZ7oB42aMRiqQ2s3nk2j3yEs+a2ixQ83xRKBRWkW0GqOY2bsTljjOSSDstxtlloJKSVXRvk
 JHZiFWLhBP270eFCfwMW2akXR7gZJHHi3sgM6nAzPdN70ZIjANAqc51NU9RrzH851YV3zJ2UAFL
 Zs9p0MZ8G216VSWjoW0Kw0GEM18kETzUL/ROMO7zlhXZYtpGtzHM8h/nTWnrl7kwCi5497ZpBns
 IgGC5WQyREk4UpDq6E65HxVzTMJI9lXrIw64Xm/jWHykNgIFm7IOCih//u7/W+vYnr/MlNtgRIJ
 3vwUxk+acH4Bhk4FauRYKYnHd/HcY102txgGwju+wFnaY0CpbpnD2pJAGhlAew7aJ/YUr3eITKC
 kvUgPa8bB6fFgIaRIOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110022
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16792-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:adubey@linux.ibm.com,m:christophe.leroy@csgroup.eu,m:gbatra@linux.ibm.com,m:hbathini@linux.ibm.com,m:lgs201920130244@gmail.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mikisabate@gmail.com,m:mpe@ellerman.id.au,m:namcao@linutronix.de,m:naveen@kernel.org,m:nayna@linux.ibm.com,m:nilay@linux.ibm.com,m:nnmlinux@linux.ibm.com,m:npiggin@gmail.com,m:skb99@linux.ibm.com,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maddy@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linux.ibm.com,csgroup.eu,gmail.com,vger.kernel.org,lists.ozlabs.org,ellerman.id.au,linutronix.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maddy@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4094E120D31
X-Rspamd-Action: no action

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc updates for 7.0:

Notable out of area changes:
   Documentation/ABI/testing/sysfs-firmware-plpks        # 447eb1d5ef00 
pseries/plpks: expose PowerVM wrapping features via the sysfs
   Documentation/ABI/testing/sysfs-secvar                # 40850c909fcf 
powerpc/pseries: move the PLPKS config inside its own sysfs directory
   Documentation/admin-guide/kernel-parameters.txt       # 1d72a02d65a7 
docs: trusted-encryped: add PKWM as a new trust source
   Documentation/security/keys/trusted-encrypted.rst     # 1d72a02d65a7 
docs: trusted-encryped: add PKWM as a new trust source
   include/linux/dma-map-ops.h                           # 1471c517cf7d 
powerpc/iommu: bypass DMA APIs for coherent allocations for pre-mapped 
memory
   kernel/dma/mapping.c                                  # 1471c517cf7d 
powerpc/iommu: bypass DMA APIs for coherent allocations for pre-mapped 
memory
   # c99fcb0d735b keys/trusted_keys: establish PKWM as a trusted source:
     include/keys/trusted-type.h
     include/keys/trusted_pkwm.h
     security/keys/trusted-keys/Kconfig
     security/keys/trusted-keys/Makefile
     security/keys/trusted-keys/trusted_core.c
     security/keys/trusted-keys/trusted_pkwm.c
     Documentation/ABI/testing/sysfs-firmware-plpks
     include/keys/trusted_pkwm.h
     security/keys/trusted-keys/trusted_pkwm.c

Thanks

The following changes since commit 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb:

   Linux 6.19-rc4 (2026-01-04 14:41:55 -0800)

are available in the git repository at:

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
tags/powerpc-7.0-1

for you to fetch changes up to e2071f9ce42b6985a40feaf98d2f5f7ce0fca006:

   powerpc/pseries: plpks: export plpks_wrapping_is_supported 
(2026-02-11 07:53:54 +0530)

- ------------------------------------------------------------------
powerpc updates for 7.0

  - Implement masked user access
  - Add support for internal only per-CPU instructions and inline the 
bpf_get_smp_processor_id() and bpf_get_current_task()
  - Fix pSeries MSI-X allocation failure when quota is exceeded
  - Fix recursive pci_lock_rescan_remove locking in EEH event handling
  - Support tailcalls with subprogs & BPF exceptions on 64bit
  - Extend "trusted" keys to support the PowerVM Key Wrapping Module (PKWM)

Thanks to: Abhishek Dubey, Christophe Leroy, Gaurav Batra, Guangshuo Li, 
Jarkko
Sakkinen, Mahesh Salgaonkar, Mimi Zohar, Miquel Sabaté Solà, Nam Cao, 
Narayana
Murty N, Nayna Jain, Nilay Shroff, Puranjay Mohan, Saket Kumar Bhaskar, 
Sourabh
Jain, Srish Srinivasan, Venkat Rao Bagalkote,

- ------------------------------------------------------------------
Abhishek Dubey (6):
       powerpc64/bpf: Moving tail_call_cnt to bottom of frame
       powerpc64/bpf: Support tailcalls with subprogs
       powerpc64/bpf: Avoid tailcall restore from trampoline
       powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
       powerpc64/bpf: Support exceptions
       powerpc64/bpf: Additional NVR handling for bpf_throw

Christophe Leroy (7):
       powerpc/uaccess: Move barrier_nospec() out of 
allow_read_{from/write}_user()
       powerpc/uaccess: Remove unused size and from parameters from 
allow_access_user()
       powerpc/uaccess: Remove 
{allow/prevent}_{read/write/read_write}_{from/to/}_user()
       powerpc/uaccess: Refactor user_{read/write/}_access_begin()
       powerpc/32s: Fix segments setup when TASK_SIZE is not a multiple 
of 256M
       powerpc/32: Automatically adapt TASK_SIZE based on constraints
       powerpc/uaccess: Implement masked user access

Gaurav Batra (1):
       powerpc/iommu: bypass DMA APIs for coherent allocations for 
pre-mapped memory

Guangshuo Li (1):
       powerpc/smp: Add check for kcalloc() failure in parse_thread_groups()

Miquel Sabaté Solà (1):
       powerpc: kgdb: Remove OUTBUFMAX constant

Nam Cao (1):
       powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded

Narayana Murty N (1):
       powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH 
event handling

Nayna Jain (1):
       docs: trusted-encryped: add PKWM as a new trust source

Saket Kumar Bhaskar (2):
       powerpc64/bpf: Support internal-only MOV instruction to resolve 
per-CPU addrs
       powerpc64/bpf: Inline bpf_get_smp_processor_id() and 
bpf_get_current_task/_btf()

Srish Srinivasan (6):
       pseries/plpks: fix kernel-doc comment inconsistencies
       powerpc/pseries: move the PLPKS config inside its own sysfs directory
       pseries/plpks: expose PowerVM wrapping features via the sysfs
       pseries/plpks: add HCALLs for PowerVM Key Wrapping Module
       keys/trusted_keys: establish PKWM as a trusted source
       powerpc/pseries: plpks: export plpks_wrapping_is_supported


  Documentation/ABI/testing/sysfs-firmware-plpks    |  58 ++
  Documentation/ABI/testing/sysfs-secvar            |  65 --
  Documentation/admin-guide/kernel-parameters.txt   |   1 +
  Documentation/arch/powerpc/papr_hcalls.rst        |  43 ++
  Documentation/security/keys/trusted-encrypted.rst |  50 ++
  MAINTAINERS                                       |   9 +
  arch/powerpc/Kconfig                              |   3 +-
  arch/powerpc/include/asm/barrier.h                |   2 +-
  arch/powerpc/include/asm/book3s/32/kup.h          |   3 +-
  arch/powerpc/include/asm/book3s/32/mmu-hash.h     |   5 +-
  arch/powerpc/include/asm/book3s/32/pgtable.h      |   4 -
  arch/powerpc/include/asm/book3s/64/kup.h          |   6 +-
  arch/powerpc/include/asm/eeh.h                    |   2 +
  arch/powerpc/include/asm/hvcall.h                 |   4 +-
  arch/powerpc/include/asm/kgdb.h                   |   1 -
  arch/powerpc/include/asm/kup.h                    |  52 +-
  arch/powerpc/include/asm/nohash/32/kup-8xx.h      |   3 +-
  arch/powerpc/include/asm/nohash/32/mmu-8xx.h      |   4 -
  arch/powerpc/include/asm/nohash/kup-booke.h       |   3 +-
  arch/powerpc/include/asm/plpks.h                  |  95 +--
  arch/powerpc/include/asm/secvar.h                 |   1 -
  arch/powerpc/include/asm/task_size_32.h           |  28 +-
  arch/powerpc/include/asm/uaccess.h                | 132 +++-
  arch/powerpc/kernel/asm-offsets.c                 |   2 +-
  arch/powerpc/kernel/dma-iommu.c                   |  30 +-
  arch/powerpc/kernel/eeh_driver.c                  |  11 +-
  arch/powerpc/kernel/eeh_pe.c                      |  74 ++-
  arch/powerpc/kernel/head_book3s_32.S              |   6 +-
  arch/powerpc/kernel/secvar-sysfs.c                |  21 +-
  arch/powerpc/kernel/smp.c                         |   2 +
  arch/powerpc/mm/book3s32/mmu.c                    |   4 +-
  arch/powerpc/mm/mem.c                             |   2 -
  arch/powerpc/mm/nohash/8xx.c                      |   2 -
  arch/powerpc/mm/ptdump/segment_regs.c             |   2 +-
  arch/powerpc/net/bpf_jit.h                        |  16 +
  arch/powerpc/net/bpf_jit_comp.c                   | 102 ++-
  arch/powerpc/net/bpf_jit_comp64.c                 | 297 +++++++--
  arch/powerpc/platforms/pseries/Makefile           |   2 +-
  arch/powerpc/platforms/pseries/iommu.c            |   6 +-
  arch/powerpc/platforms/pseries/msi.c              |  44 +-
  arch/powerpc/platforms/pseries/plpks-secvar.c     |  29 -
  arch/powerpc/platforms/pseries/plpks-sysfs.c      |  96 +++
  arch/powerpc/platforms/pseries/plpks.c            | 688 
+++++++++++++++++++-
  include/keys/trusted-type.h                       |   7 +-
  include/keys/trusted_pkwm.h                       |  33 +
  include/linux/dma-map-ops.h                       |   4 +
  kernel/dma/mapping.c                              |   4 +-
  security/keys/trusted-keys/Kconfig                |   8 +
  security/keys/trusted-keys/Makefile               |   2 +
  security/keys/trusted-keys/trusted_core.c         |   6 +-
  security/keys/trusted-keys/trusted_pkwm.c         | 190 ++++++
  51 files changed, 1850 insertions(+), 414 deletions(-)
  create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
  create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
  create mode 100644 include/keys/trusted_pkwm.h
  create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmmL720ACgkQpnEsdPSH
ZJR/oQ//SPHeL/p8ju9RL+m4kBiNo/8ZjJMUokey4JmbM4wHX/royp/ACSDbEod7
nJgQLVO0iwwGXUkK2HGQ3iv0yaFrMdrVG0JurujVVwe0/sP8SvRXccx4TcXFrcZ+
D6tRKrOqH7BgQvTTmimB5hOeywrdvp4o+UqJ3uRVUf+3vQRmSUkXPCFjFibKoDiW
gUygdVAI68oWEYge9LHETJGsLGPF8u6kXdwF9gP6wv1Y9Da3PoeODHuAFSxAAvsl
wOTaSk/oEDoAJ83xsc5EIoYhGua4tpaLnzkKoM3gvIE5rGx89k4LqrM6sSqCAwys
KJOD1Svn4sTIxioBJIR64YA8PI+gamVpoak3ppGChygddeq4/csvtkDYhgDWaRF8
asYNiEKqmlr3wnxf/tEHOkEb6woXzu2wpFxkdamhgPKnWCmzeFQXnwkmjMEY+Moq
bpE2fdb+O/1i7mI2Br/JakOdGfMm4h8JJZ5HPadncjIHqHk0y4IaNibawzT0tmqy
+YwPKavbntDeQyWdin8tPrqSpnr0Rft2wgWkNlv+QMl2/+YHucgrmM7CIUco6gMG
+GIqm0Sl6DZaY9F5spO0i5FYWOf2N+9rqkBzD/RcPiJH5f6vCeXCprNGv3Ejc+DP
aP0Sxo+b9EYBPS9uiMVpXo/OK+Tu+qrkC6ZHiv3yRy2j97+rjV8=
=6LfR
-----END PGP SIGNATURE-----

