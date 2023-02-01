Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2031685E64
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 05:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P682D4J7Pz3f3m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 15:24:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J+kmKK7t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J+kmKK7t;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P681H5h9Jz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 15:23:31 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3113FTQR001364;
	Wed, 1 Feb 2023 04:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AV2qwoo6R30evqAA04PRbq0b0NYm+ZpLrakOMaetR34=;
 b=J+kmKK7thae3jN+mX7o9TfqBXdA93Zz5108+XkpVvPsd9/CS3g7z7NLmeYp18hYMh+vk
 llijvrG1OMFdNBfTH3SrTs7v9qgbMRNiKr8CbvdAMot4iNfmkUauYIIfxb2e/tdj07ce
 5tmLePwWOdoDphlrJNZyVkmm1fvrBzmWkF8liIM92vSm3UhMoWHMcYhlgj1x/kgFK08/
 R7jLfLIMd0EiO1K78shBMEjRpG+RZt5ijqhs4zBGC9SDIP8b+8bBsXNpwuIdCKOkuxnF
 eCDnO0jCliam5xW0E46gD5DzbjcRnPB7D0o56IEnOycZFGyGOyImTQeroZc+dAm+f91M SQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfg13s5es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:23:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDN0Aw012873;
	Wed, 1 Feb 2023 04:23:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyc92b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:23:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3114NJKO32113118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 04:23:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E6F320040;
	Wed,  1 Feb 2023 04:23:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A7DA20043;
	Wed,  1 Feb 2023 04:23:18 +0000 (GMT)
Received: from [9.43.109.52] (unknown [9.43.109.52])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 04:23:18 +0000 (GMT)
Message-ID: <15c53f56-af4c-2e6f-bdbd-c1b1e6d09588@linux.ibm.com>
Date: Wed, 1 Feb 2023 09:53:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] powerpc/kexec_file: Fix division by zero in extra size
 estimation
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230130014707.541110-1-mpe@ellerman.id.au>
 <9a5254fa-f47c-c53e-478d-adbd8d91e9dc@linux.ibm.com>
 <878rhif8ts.fsf@mpe.ellerman.id.au>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <878rhif8ts.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OK0PxWwMARG0SX43bsSFI98RQilXuH07
X-Proofpoint-ORIG-GUID: OK0PxWwMARG0SX43bsSFI98RQilXuH07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_01,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010033
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
Cc: hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 01/02/23 07:25, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> On 30/01/23 07:17, Michael Ellerman wrote:
>>> In kexec_extra_fdt_size_ppc64() there's logic to estimate how much
>>> extra space will be needed in the device tree for some memory related
>>> properties.
>>>
>>> That logic uses the size of RAM divided by drmem_lmb_size() to do the
>>> estimation. However drmem_lmb_size() can be zero if the machine has no
>>> hotpluggable memory configured, which is the case when booting with qemu
>>> and no maxmem=x parameter is passed (the default).
>>>
>>> The division by zero is reported by UBSAN, and can also lead to an
>>> overflow and a warning from kvmalloc, and kdump kernel loading fails:
>>>
>>>     WARNING: CPU: 0 PID: 133 at mm/util.c:596 kvmalloc_node+0x15c/0x160
>>>     Modules linked in:
>>>     CPU: 0 PID: 133 Comm: kexec Not tainted 6.2.0-rc5-03455-g07358bd97810 #223
>>>     Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,git-dd0dca pSeries
>>>     NIP:  c00000000041ff4c LR: c00000000041fe58 CTR: 0000000000000000
>>>     REGS: c0000000096ef750 TRAP: 0700   Not tainted  (6.2.0-rc5-03455-g07358bd97810)
>>>     MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24248242  XER: 2004011e
>>>     CFAR: c00000000041fed0 IRQMASK: 0
>>>     ...
>>>     NIP kvmalloc_node+0x15c/0x160
>>>     LR  kvmalloc_node+0x68/0x160
>>>     Call Trace:
>>>       kvmalloc_node+0x68/0x160 (unreliable)
>>>       of_kexec_alloc_and_setup_fdt+0xb8/0x7d0
>>>       elf64_load+0x25c/0x4a0
>>>       kexec_image_load_default+0x58/0x80
>>>       sys_kexec_file_load+0x5c0/0x920
>>>       system_call_exception+0x128/0x330
>>>       system_call_vectored_common+0x15c/0x2ec
>>>
>>> To fix it, skip the calculation if drmem_lmb_size() is zero.
>>>
>>> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
>>> Cc: stable@vger.kernel.org # v5.12+
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>    arch/powerpc/kexec/file_load_64.c | 10 ++++++----
>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
>>> index af8854f9eae3..3caee570e79b 100644
>>> --- a/arch/powerpc/kexec/file_load_64.c
>>> +++ b/arch/powerpc/kexec/file_load_64.c
>>> @@ -989,10 +989,12 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>>>    	 * linux,drconf-usable-memory properties. Get an approximate on the
>>>    	 * number of usable memory entries and use for FDT size estimation.
>>>    	 */
>>> -	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
>>> -		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
>>> -
>>> -	extra_size = (unsigned int)(usm_entries * sizeof(u64));
>>> +	if (drmem_lmb_size()) {
>>> +		usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
>>> +			       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
>>> +		extra_size = (unsigned int)(usm_entries * sizeof(u64));
>>> +	} else
>>> +		extra_size = 0;
>>>    
>>>    	/*
>>>    	 * Get the number of CPU nodes in the current DT. This allows to
>> I failed to replicate this issue.
>>
>> Qemu command used:
>> $ qemu-system-ppc64 -enable-kvm -smp 4,cores=2 -drive
>> file=my-image.qcow2 -nographic -m 2G
>>
>>
>> lsmem (inside guest):
>> RANGE                                 SIZE  STATE REMOVABLE BLOCK
>> 0x0000000000000000-0x000000007fffffff   2G online       yes 0-127
>>
>> Memory block size:        16M
>> Total online memory:       2G
>> Total offline memory:      0B
>>
>> Not sure what I am missing, but changes looks good to me.
> Hmm, interesting.
>
> Do you have /proc/device-tree/ibm,dynamic-reconfiguration-memory in the VM?

No I don't.

But if I add maxmem=x to qemu command line then ibm,dynamic-reconfiguration
DT node comes up.

> What version of qemu are you using? I think I tested with 6.2 and 7.1.

QEMU emulator version 7.2.50 (v7.2.0-904-g13356edb87)

I tried with QEMU emulator version 7.1.0 (v7.1.0), but not able to 
replicate it.

- Sourabh

