Return-Path: <linuxppc-dev+bounces-11846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779FB47940
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Sep 2025 08:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKLWD4b4cz306d;
	Sun,  7 Sep 2025 16:57:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757228264;
	cv=none; b=Op2FyVSZ7pIejzr5iTrvZhX2tNr+mftpSnp16rv76FlAv7wKmsAUgAGEW3NdnldTwaODoi4/J14CNxB/3bHyiuMDsmFMOEftPWSzhEN3PKllX3ZOm2+b5rn4mRBEe1IxCAiyNhCovlkf59PrkSEs0Orz7hPLCKL8WU1PLHvf8ru6uvzk2HNrDmKojzogct0ASAZiJ7Bv9jO8fC+QMZN90ubCnXRjGmz6oM9EXxuzzny3t4lGWniM5DxaHOgKVO26KMwh2RUmr+vuSh7L4CfUU15IAzo6/XV47anTVwl1L+2Bj3CJ60MrZUaZMBmQLECGtk/uVA5s5aPNcEjBXXdulw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757228264; c=relaxed/relaxed;
	bh=fcOegec+dWHgrE3rU2IxKqcl1x/A+LDx/msLaTJDHXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=b95nCjxCLqQxgFzpdGWnp1gvNIuuj62iPOAGHfX5XdrjGTosmm90RbTZneAeJxoWzxUR/tGCEHYOfd3aksI4YPsdg1aX+nNeRTaooNif/dEHbwVeqpeRDBDQP/aBdTXYaH1btiiBY3g8/iDE3SclNPNR/UetWECM+EqHP6g4y+ain7uvv/HsXpgOneEcpkESXzBgECTj4bFNluqy9oERPQPrdVSqY1ELk3Z2HLhgWGYhhE4tC/zE3MFborZMtGbm1n7dhTEkMQdP+k/SyQuVo/mAbDfKjdpjlK9nBwb/SMQKeIe2TjYzIpj/60cXYC/hjX/vM96Y0RAlgTHOA3ovMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lhRmE/dF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lhRmE/dF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cKLWC2WXVz305D
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 16:57:42 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5875xMl0001952;
	Sun, 7 Sep 2025 06:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fcOege
	c+dWHgrE3rU2IxKqcl1x/A+LDx/msLaTJDHXg=; b=lhRmE/dFBQEmBK7arTSdV6
	sy8GCNE9bGb9W8dhWW1VL3KGXT77CBpX4IgOYJ4K/xqJiQw+ZdAD78kZ0dPL/GYc
	xPMIwNKjQ5TReDtAvXFPgWI46L/LmlGkFWVhttB0dgC7IJpDbebpTl1yqQNAWOJL
	OYbDK3bWLyxVzK7FMPVst/SNicIBu4iazn2k7c+8V/yXpU7QB8C6XmLZ/E8995Dw
	4NheSQgANT0zbhNHnyQ9OT88URU7PTLpFJFW86q+YlN7Jx95F9vYjpGHemrTkTT4
	peFw76PxfNfKfv6vWAVc7X0wJQy2L5oHil0+FVnkW2S0gUoMEtRFJziaIm53G/zg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsbxq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Sep 2025 06:57:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5871rQcZ010605;
	Sun, 7 Sep 2025 06:57:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910smgrap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Sep 2025 06:57:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5876vROx58917316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Sep 2025 06:57:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB11D20040;
	Sun,  7 Sep 2025 06:57:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EA4220043;
	Sun,  7 Sep 2025 06:57:25 +0000 (GMT)
Received: from [9.39.29.249] (unknown [9.39.29.249])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  7 Sep 2025 06:57:24 +0000 (GMT)
Message-ID: <1a0bb291-c670-44c3-af7b-d2b5aac51a18@linux.ibm.com>
Date: Sun, 7 Sep 2025 12:27:23 +0530
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
Subject: Re: [PATCH] kexec: Include kernel-end even without crashkernel
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, bcollins@kernel.org
References: <2025042122-inescapable-mandrill-8a5ff2@boujee-and-buff>
Content-Language: en-US
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <2025042122-inescapable-mandrill-8a5ff2@boujee-and-buff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX63p0GkUMwBgE
 OsIi9bRnsRYuTrEofDjrlPNXUSkskI/Xuf3yU3RB1qMqbeeY0sg4FtulcShIY2wDeQW6Zk3B0Fu
 rKikxsPMWn0wKVIinOhriFXZanJwF9gZ5zOoXztmZh1ZD1BLJqEsULNaL0DFwcIx3+dtv7tdI9Q
 6WQhAm0Uzse+lwNPYQ2uqpRcD+S8dDGf2N0DQFAfJRAjxvP4DGAHt3Z5wPIJOCTnj5JJsPLsGIP
 zQezkE+HaJv5vv2I5x+8JvEqOJ92J7rO9Um6FnCl+mI65bmZxvWigF629DZ6Ia6hqpClTtr06+4
 u9j8+WCUujKxqlo45hXsu+0OmL4NEHIu8efjZXN9ji3lb7DQm+oAljHZiwk05gv7KUxgBUp4HGA
 7rkqXc4+
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68bd2cd9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=voM4FWlXAAAA:8 a=HkynlMYEhPZgYFSW0akA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: SbwSOwfWaELS2w4_kT83n78LDCgdJfLb
X-Proofpoint-ORIG-GUID: SbwSOwfWaELS2w4_kT83n78LDCgdJfLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 22/04/25 08:06, Ben Collins wrote:
> Certain versions of kexec don't even work without kernel-end being
> added to the device-tree. Add it even if crash-kernel is disabled.
>
> Signed-off-by: Ben Collins <bcollins@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/powerpc/kexec/core.c | 27 +++++++++++++++------------
>   1 file changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> index 00e9c267b912f..7b5958c37f702 100644
> --- a/arch/powerpc/kexec/core.c
> +++ b/arch/powerpc/kexec/core.c
> @@ -22,6 +22,8 @@
>   #include <asm/setup.h>
>   #include <asm/firmware.h>
>   
> +#define cpu_to_be_ulong __PASTE(cpu_to_be, BITS_PER_LONG)
> +
>   #ifdef CONFIG_CRASH_DUMP
>   void machine_crash_shutdown(struct pt_regs *regs)
>   {
> @@ -136,17 +138,10 @@ int __init overlaps_crashkernel(unsigned long start, unsigned long size)
>   }
>   
>   /* Values we need to export to the second kernel via the device tree. */
> -static phys_addr_t kernel_end;
>   static phys_addr_t crashk_base;
>   static phys_addr_t crashk_size;
>   static unsigned long long mem_limit;
>   
> -static struct property kernel_end_prop = {
> -	.name = "linux,kernel-end",
> -	.length = sizeof(phys_addr_t),
> -	.value = &kernel_end,
> -};
> -
>   static struct property crashk_base_prop = {
>   	.name = "linux,crashkernel-base",
>   	.length = sizeof(phys_addr_t),
> @@ -165,8 +160,6 @@ static struct property memory_limit_prop = {
>   	.value = &mem_limit,
>   };
>   
> -#define cpu_to_be_ulong	__PASTE(cpu_to_be, BITS_PER_LONG)
> -
>   static void __init export_crashk_values(struct device_node *node)
>   {
>   	/* There might be existing crash kernel properties, but we can't
> @@ -190,6 +183,15 @@ static void __init export_crashk_values(struct device_node *node)
>   	mem_limit = cpu_to_be_ulong(memory_limit);
>   	of_update_property(node, &memory_limit_prop);
>   }
> +#endif /* CONFIG_CRASH_RESERVE */
> +
> +static phys_addr_t kernel_end;
> +
> +static struct property kernel_end_prop = {
> +	.name = "linux,kernel-end",
> +	.length = sizeof(phys_addr_t),
> +	.value = &kernel_end,
> +};
>   
>   static int __init kexec_setup(void)
>   {
> @@ -200,16 +202,17 @@ static int __init kexec_setup(void)
>   		return -ENOENT;
>   
>   	/* remove any stale properties so ours can be found */
> -	of_remove_property(node, of_find_property(node, kernel_end_prop.name, NULL));
> +	of_remove_property(node, of_find_property(node, kernel_end_prop.name,
> +						  NULL));
>   
>   	/* information needed by userspace when using default_machine_kexec */
>   	kernel_end = cpu_to_be_ulong(__pa(_end));
>   	of_add_property(node, &kernel_end_prop);
>   
> +#ifdef CONFIG_CRASH_RESERVE
>   	export_crashk_values(node);
> -
> +#endif
>   	of_node_put(node);
>   	return 0;
>   }
>   late_initcall(kexec_setup);
> -#endif /* CONFIG_CRASH_RESERVE */

While cleaning up KEXEC and KDUMP configs, the export linux,kernel-end 
was moved under CONFIG_CRASH_DUMP.

commit 5c4233cc0920cc90787aafe950b90f6c57a35b88 (HEAD, tag: powerpc-6.9-2)
Author: Hari Bathini <hbathini@linux.ibm.com>
Date:   Mon Feb 26 16:00:10 2024 +0530

     powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency

So, if kexec is enabled without CONFIG_CRASH_DUMP, the kexec command 
fails to load the kexec kernel using the `kexec_load` system call.

[root]# kexec --initrd=/boot/initramfs-`uname -r`.img 
/boot/vmlinuz-`uname -r` --append="`cat /proc/cmdline`" -lcd
Try gzip decompression.
Try LZMA decompression.
kernel: 0x7fffaef30010 kernel_size: 0x2ccba80
0000000000000000-0000000030000000 : 0
0000000030000000-0000004000000000 : 0
get base memory ranges:2
/proc/device-tree/chosen/linux,kernel-end: No such file or directory
Could not get memory layout
[root]# echo $?
255

So, it is better to call kexec_setup/kexec/core.c even when 
CONFIG_CRASH_DUMP is not enabled and export linux,kernel-end, because kexec
requires this to load the kexec kernel using the kexec_file_load system 
call.

I suggest adding a Fixes tag to the commit I mentioned above and also 
including the logs I shared. That might help others discover
this fix if they run into the same issue.

Rest look good to me.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

