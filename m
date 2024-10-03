Return-Path: <linuxppc-dev+bounces-1742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A898E9C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 08:38:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UAI18LAM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK27M1wR2z2yRd;
	Thu,  3 Oct 2024 16:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727937503;
	cv=none; b=n4s2CRp4G8viLp7y636Hg4M/3lhFpRoOgVMbfzaCDVNRctIOPTwNBiZaqee7f8LXE7XYjWTCL29edePNTOkzEv3pizHmdvwYgOvwwBJvmuRmi9qTCd+52/au+kuzZF5wJWpc11vFagQeBcusv7cAkgycwdP2bQue5kzrvP4I0iNIWAxAwmhw4lSlVGb8e9rxPTCWN9KHdUunlacsd8gFvRtpgaHbeeUTO/jUukEapf8xNvVWzwbz+NzFbhT7uV/126Lc2ngPMC7p7PkdAB9uOngg+dvtg1hy0orzkrBfNKo8hVY45FC9G3qdYAs4MW95Mr15/wm+/LirVSoV7b9bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727937503; c=relaxed/relaxed;
	bh=b+gzo4utoDfKCg2QIw2CU0gA0a/fOr1VNQALEIVPkkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScyfQ+Mry7rW0PRt6w+zPUKy6/o5XnYxrHmllRdta4uLMuolHnEyMT4A1aYLimRM6Clm2vGtCF/WbSQmB8aOtFq8FrmO+KIj/YaaBFRjmiBBcFoyeq4FcaLeXOy+RR11KpPD8o5/wqm8EAsO9kzpJ39JFmqb92tLfXW2ewbEQuej0tSBb3fv0IqxuKML2ZtgbuSX2AcIFJCVKA7tx/9ReT6py0+4m/+KgbysdBIP2+HHO/4FQbXwm9UPm+Y3f0ojNZ6wBSKblACVYmGyp/KPa8xpxl/VKxudZUN/xI/zSSgCbCNegZvn+6dUPBgI6jlCIaY/nHDlvARLFCdAE4Idbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UAI18LAM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UAI18LAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK27J6RY2z2yNP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 16:38:20 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4936Nw82019701;
	Thu, 3 Oct 2024 06:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=b
	+gzo4utoDfKCg2QIw2CU0gA0a/fOr1VNQALEIVPkkk=; b=UAI18LAMg03LKnFGM
	Q4xc3i0Pqg9YIW/ZJEhz6m0pMkNFzF/Nrk7reYbXV5skpnTqvl/VIKrUrB1e2Jjp
	i4D1ro7OjQz43X0BaGAa9xF8HHUUE2gVvvVWmkKpyzqrGyqEUfmAzOS0QyNm4oN2
	jCrggGdMze8vDKltmXKuB2qI+t3OYNsFM/NAOtwllrSgNGTfAUI/NwnIlKQhOZrF
	dW94iNQHlYbfogGAsVOxVuC7nxOUBfPaZ4l8VOsf3iLU2zAZrHWUxrCMa0PXTbWv
	RfK3l0uPOm9I9Lj+FoQAJxXgu4J0JKDJKvp6WxM/LufuCngDqtJVnz6XCPt9Goer
	8GLwQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 421nyc0257-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 06:38:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4936X6N5012246;
	Thu, 3 Oct 2024 06:38:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 421nyc024n-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 06:38:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4934TsiL018356;
	Thu, 3 Oct 2024 06:19:37 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xw4n6bm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 06:19:37 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4936JbN251249672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Oct 2024 06:19:37 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8D1958055;
	Thu,  3 Oct 2024 06:19:36 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BDDF5805E;
	Thu,  3 Oct 2024 06:19:31 +0000 (GMT)
Received: from [9.43.46.102] (unknown [9.43.46.102])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Oct 2024 06:19:29 +0000 (GMT)
Message-ID: <eabd6384-0b3f-4112-92d4-7cae4bc3f61f@linux.ibm.com>
Date: Thu, 3 Oct 2024 11:49:27 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: Kernel NULL pointer dereference on read at 0x00000000 in
 pnv_get_random_long()
To: Corentin LABBE <clabbe@baylibre.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, olivia@selenic.com,
        herbert@gondor.apana.org.au
References: <Zv02AMOBJ5a2lrF0@Red>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <Zv02AMOBJ5a2lrF0@Red>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y4Jw8El7YCzrBI6fpKR-VV6Ztb3aVOrx
X-Proofpoint-ORIG-GUID: ybG4ByxBZfIO1UFcUfiZ60cJ-iRDoWus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-03_04,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=659 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030043
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/2/24 5:31 PM, Corentin LABBE wrote:
> Hello
> 
> I have a 8335-GCA POWER8 which got a kernel crash during boot:
> [   11.754238] Kernel attempted to read user page (0) - exploit attempt? (uid: 0)
> [   11.754437] BUG: Kernel NULL pointer dereference on read at 0x00000000
> [   11.754499] Faulting instruction address: 0xc0000000000c3758
> [   11.754518] Oops: Kernel access of bad area, sig: 11 [#1]
> [   11.754534] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
> [   11.754699] Modules linked in: powernv_rng(+) ecb ctr sr_mod hid ofpart fb_sys_fops cdrom i2c_algo_bit powernv_flash sg mtd vmx_crypto(+) ipmi_powernv ipmi_devintf at24(+) ipmi_msghandler opal_prd regmap_i2c nfsd gf128mul auth_rpcgss nfs_acl lockd grace sunrpc drm fuse configfs loop drm_panel_orientation_quirks ip_tables x_tables autofs4 uas usb_storage ext4 crc16 mbcache jbd2 crc32c_generic dm_mod xhci_pci xhci_hcd sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_generic crct10dif_common usbcore tg3 libphy crc32c_vpmsum ahci usb_common libahci
> [   11.754869] CPU: 25 PID: 1332 Comm: (udev-worker) Not tainted 6.1.106 #4 
> [   11.754890] Hardware name: 8335-GCA POWER8 (raw) 0x4d0200 opal:skiboot-5.4.8-5787ad3 PowerNV
> [   11.754926] NIP:  c0000000000c3758 LR: c0000000000c3754 CTR: 0000000000000000
> [   11.754947] REGS: c00000000ec3af70 TRAP: 0300   Not tainted  (6.1.106)
> [   11.754966] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44222282  XER: 20000000
> [   11.755168] CFAR: c0000000001dfbb4 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0 
>                GPR00: c0000000000c3754 c00000000ec3b210 c00000000113cd00 000000000000002c 
>                GPR04: 00000000ffff7fff c00000000ec3b010 c00000000ec3b008 0000000ff57e0000 
>                GPR08: 0000000000000027 c000000ff7907f98 0000000000000001 0000000000002200 
>                GPR12: 0000000000000000 c000000ffffeaf00 0000000000000020 0000000022000000 
>                GPR16: 0000000000000000 0000000000000000 0000000000000009 000000013c86f5d8 
>                GPR20: 0000000000000000 000001002cd75d90 0000000000000000 0000000000000005 
>                GPR24: 000001002cd794a0 000001002cd75d90 c00000000285e6fc c000000000f9e4a0 
>                GPR28: 0000000000000003 0000000000000004 0000000000000000 c0000010103ca180 
> [   11.755363] NIP [c0000000000c3758] pnv_get_random_long+0x88/0x170
> [   11.755386] LR [c0000000000c3754] pnv_get_random_long+0x84/0x170
> [   11.755407] Call Trace:
> [   11.755416] [c00000000ec3b210] [c0000000000c3754] pnv_get_random_long+0x84/0x170 (unreliable)
> [   11.755444] [c00000000ec3b280] [c008000021c50130] powernv_rng_read+0x98/0x120 [powernv_rng]
> [   11.755473] [c00000000ec3b300] [c00000000091ac88] add_early_randomness+0x88/0x150
> [   11.755577] [c00000000ec3b340] [c00000000091b2c4] hwrng_register+0x344/0x420
> [   11.755678] [c00000000ec3b3a0] [c00000000091b408] devm_hwrng_register+0x68/0xf0
> [   11.755703] [c00000000ec3b3e0] [c008000021c5003c] powernv_rng_probe+0x34/0x90 [powernv_rng]
> [   11.755728] [c00000000ec3b450] [c000000000949218] platform_probe+0x78/0x110
> [   11.755750] [c00000000ec3b4d0] [c0000000009442d8] really_probe+0x108/0x590
> [   11.755773] [c00000000ec3b560] [c000000000944814] __driver_probe_device+0xb4/0x230
> [   11.755799] [c00000000ec3b5e0] [c0000000009449e4] driver_probe_device+0x54/0x130
> [   11.755824] [c00000000ec3b620] [c0000000009456d8] __driver_attach+0x158/0x2b0
> [   11.755850] [c00000000ec3b6a0] [c000000000940764] bus_for_each_dev+0xb4/0x140
> [   11.755874] [c00000000ec3b700] [c000000000943734] driver_attach+0x34/0x50
> [   11.755896] [c00000000ec3b720] [c000000000942d88] bus_add_driver+0x218/0x300
> [   11.755921] [c00000000ec3b7b0] [c000000000946b84] driver_register+0xb4/0x1c0
> [   11.755947] [c00000000ec3b820] [c000000000948b98] __platform_driver_register+0x38/0x50
> [   11.755969] [c00000000ec3b840] [c008000021c501e8] powernv_rng_driver_init+0x30/0x4c [powernv_rng]
> [   11.755997] [c00000000ec3b860] [c0000000000121b0] do_one_initcall+0x80/0x320
> [   11.756020] [c00000000ec3b940] [c0000000002198bc] do_init_module+0x6c/0x290
> [   11.756042] [c00000000ec3b9c0] [c00000000021d118] __do_sys_finit_module+0xd8/0x190
> [   11.756066] [c00000000ec3baf0] [c00000000002b038] system_call_exception+0x138/0x260
> [   11.756091] [c00000000ec3be10] [c00000000000c654] system_call_common+0xf4/0x258
> [   11.756117] --- interrupt: c00 at 0x7fffaae9a9e4
> [   11.756134] NIP:  00007fffaae9a9e4 LR: 00007fffab110500 CTR: 0000000000000000
> [   11.756153] REGS: c00000000ec3be80 TRAP: 0c00   Not tainted  (6.1.106)
> [   11.762944] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24222248  XER: 00000000
> [   11.765251] IRQMASK: 0 
>                GPR00: 0000000000000161 00007ffff4b57210 00007fffaafa6f00 0000000000000006 
>                GPR04: 00007fffab11be88 0000000000000000 0000000000000006 0000000000000000 
>                GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>                GPR12: 0000000000000000 00007fffab1fe240 0000000000000020 0000000022000000 
>                GPR16: 0000000000000000 0000000000000000 0000000000000009 000000013c86f5d8 
>                GPR20: 0000000000000000 000001002cd75d90 0000000000000000 0000000000000005 
>                GPR24: 000001002cd794a0 000001002cd75d90 0000000022000000 000001002cd32120 
>                GPR28: 00007fffab11be88 0000000000020000 0000000000000000 000001002cd75d90 
> [   11.773845] NIP [00007fffaae9a9e4] 0x7fffaae9a9e4
> [   11.774334] LR [00007fffab110500] 0x7fffab110500
> [   11.774347] --- interrupt: c00
> [   11.779698] Instruction dump:
> [   11.779711] e88952f8 38634198 3bde52f8 4811c439 60000000 e94d0030 3c62ffe4 386341c0 
> [   11.779739] 7fcaf02a 7fc4f378 4811c41d 60000000 <e93e0000> 7c0004ac e9490000 0c0a0000 
> [   11.779782] ---[ end trace 0000000000000000 ]---
> 
> This happen on stock debian 6.1.0-23-powerpc64le.

I am not able to recreate this in my setup. 
Have tried stable 6.1.106, 6.1.100 and also latest upstream with powernv_defconfig.
Can you share the config file. 

Maddy

> 
> I debugged a bit and the crash happen in arch/powerpc/platforms/powernv/rng.c in pnv_get_random_long()
> The call rng = get_cpu_var(pnv_rng) return null and so rng is dereferenced via ->regs just after.
> 
> I have no real idea on how to fix properly (appart adding a "!rng return 0" test)
> 
> Regards
> 


