Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280834B0A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 21:40:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Ykz5zmQz3c6W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 07:40:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z9BrV8Eu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z9BrV8Eu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6YkX5TLRz30Cb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 07:40:03 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QKWsDp081357; Fri, 26 Mar 2021 16:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : reply-to :
 cc : subject : date : message-id : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=BHZoSNW9qmgtNXmNPJRG2LKwwg1rquCENaW6zCF//Yw=;
 b=Z9BrV8Eunrj/C393HtWukyThEYbjE5LIHjLpaQKJ9q4hkntGqXcFvFXhUxvgMQJn4kJe
 +jh/WyDozU0VmobEk/95aw8Q3XZQZGvRZXtUcGw68HtKYWXGBHWgmIpbuaIjrV+TtjYh
 PO3zMa5wFnx55lxw+9GcHvbV6yOOndoTvQrKVOBb2FLGx5NCHnrkm6vpGAJuKpc7UISH
 IHPB0lquQ2VKVcQS8VWA8sAf7JlopS05C5M+tEtRwoaiu+2IRgWDWPOEjssU61Xxyemz
 2zVFRzmY25EELdhJaLQOKqZU4h6srd3M3A/KiSCHjtqYz26POooL8Mlxh30rXHMQp/3X sg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhp0ruxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 16:39:55 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QKZlIZ007475;
 Fri, 26 Mar 2021 20:39:55 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 37h14wquc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 20:39:55 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QKdsQb34013456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 20:39:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A94A4AC067;
 Fri, 26 Mar 2021 20:39:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEF0DAC05F;
 Fri, 26 Mar 2021 20:39:53 +0000 (GMT)
Received: from localhost (unknown [9.160.98.127])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Mar 2021 20:39:53 +0000 (GMT)
From: Murilo Opsfelder =?ISO-8859-1?Q?Ara=FAjo?= <muriloo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm/book3s64: Use the correct storage key value
 when calling H_PROTECT
Date: Fri, 26 Mar 2021 17:39:26 -0300
Message-ID: <11736956.O9o76ZdvQC@localhost.localdomain>
Organization: IBM
In-Reply-To: <20210326070755.304625-1-aneesh.kumar@linux.ibm.com>
References: <20210326070755.304625-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EnHtTyABP8Vr-4VbSJqfNa-UTYIO_6kK
X-Proofpoint-GUID: EnHtTyABP8Vr-4VbSJqfNa-UTYIO_6kK
Content-Transfer-Encoding: 7Bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_11:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 clxscore=1011 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260152
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
Reply-To: muriloo@linux.ibm.com
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday, March 26, 2021 4:07:55 AM -03 Aneesh Kumar K.V wrote:
> H_PROTECT expect the flag value to include
> flags: AVPN, pp0, pp1, pp2, key0-key4, Noexec, CMO Option flags
>
> This patch updates hpte_updatepp() to fetch the storage key value from the
> linux page table and use the same in H_PROTECT hcall.
>
> native_hpte_updatepp() is not updated because the kernel doesn't clear the
> existing storage key value there. The kernel also doesn't use
> hpte_updatepp() callback for updating storage keys.
>
> This fixes the below kernel crash observed with KUAP enabled.
>
>  BUG: Unable to handle kernel data access on write at 0xc009fffffc440000
>  Faulting instruction address: 0xc0000000000b7030
>  Key fault AMR: 0xfcffffffffffffff IAMR: 0xc0000077bc498100
>  Found HPTE: v = 0x40070adbb6fffc05 r = 0x1ffffffffff1194
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> .........
>  CFAR: c000000000010100 DAR: c009fffffc440000 DSISR: 02200000 IRQMASK: 0
> ..........
>  NIP [c0000000000b7030] memset+0x68/0x104
>  LR [c0000000003ef00c] pcpu_alloc+0x54c/0xb50
>  Call Trace:
>  [c00000001c7534f0] [c0000000003ef01c] pcpu_alloc+0x55c/0xb50 (unreliable)
>  [c00000001c753600] [c0000000008bb214] blk_stat_alloc_callback+0x94/0x150
>  [c00000001c753650] [c0000000008b7a04]
> blk_mq_init_allocated_queue+0x64/0x560 [c00000001c7536b0]
> [c0000000008b8024] blk_mq_init_queue+0x54/0xb0 [c00000001c7536e0]
> [c000000000b87650] scsi_mq_alloc_queue+0x30/0xa0 [c00000001c753710]
> [c000000000b88b2c] scsi_alloc_sdev+0x1cc/0x300 [c00000001c7537b0]
> [c000000000b897b0] scsi_probe_and_add_lun+0xb50/0x1020 [c00000001c753950]
> [c000000000b8a35c] __scsi_scan_target+0x17c/0x790 [c00000001c753a80]
> [c000000000b8ab90] scsi_scan_channel+0x90/0xe0 [c00000001c753ad0]
> [c000000000b8ae48] scsi_scan_host_selected+0x148/0x1f0 [c00000001c753b60]
> [c000000000b8b31c] do_scan_async+0x2c/0x2a0
>  [c00000001c753be0] [c000000000187a18] async_run_entry_fn+0x78/0x220
>  [c00000001c753c70] [c000000000176a74] process_one_work+0x264/0x540
>  [c00000001c753d10] [c000000000177338] worker_thread+0xa8/0x600
>  [c00000001c753da0] [c0000000001807b0] kthread+0x190/0x1a0
>  [c00000001c753e10] [c00000000000d8f0] ret_from_kernel_thread+0x5c/0x6c
>
> With KUAP enabled the kernel uses storage key 3 for all its translations.
> But as shown by the debug print, in this specific case we have the hash
> page table entry created with key value 0.
>
> [    2.249497] Found HPTE: v = 0x40070adbb6fffc05 r = 0x1ffffffffff1194
>
> and DSISR indicates a key fault.
>
> This can happen due to parallel fault on the same EA by different CPUs
>
> CPU 0					CPU 1
> fault on X
>
> H_PAGE_BUSY set
> 					fault on X
>
> finish fault handling and
> clear H_PAGE_BUSY
> 					check for H_PAGE_BUSY
> 					continue with fault 
handling.
>
> This implies CPU1 will end up calling hpte_updatepp for address X
> and the kernel updated the hash pte entry with key 0
>
> Fixes: d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3 for kernel mapping
> with hash translation")
>
> Debugged-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---

I've tested this on top of commit db24726bfefa68c606947a86132591568a06bfb4
("Merge tag 'integrity-v5.12-fix' of git://git.kernel.org/pub/scm/linux/
kernel/git/zohar/linux-integrity"),
and the reported issue did not manifest.

Thank you, Michael and Aneesh, for the help.

Tested-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

--
Murilo

