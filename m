Return-Path: <linuxppc-dev+bounces-14428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC95C7DDEF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Nov 2025 09:28:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dDhtG4Thsz2yvc;
	Sun, 23 Nov 2025 19:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763886502;
	cv=none; b=KcAMd+kaGI7xYyQy85uTJeCxNMbYT1GrtX1UTJDg9FmI8rNrwxUjsCPXaObi2N03Rl5VPvlLupJF6ib4oEeyYz1Gqy4MXv6jdux5nQ/ZIEYaLbdoqAV4fhLUM3L0+VvU1koXH4UZ69wWyaC0cefjgWhemSV5dGjsRpLPS1K0KoKnpsUn2oNNy0jlSgNVTQKPODPALOVA+IHQQhMBMOwvEB2RykxOeHbGCqXKUYyRZurLITEwI5fCjNMGV2W5y2tG3bZUmtidROYcH26OH8H7lQ6xcWEkT3Ggi4GmxdxvOV3LR3fNl5Afust6gqmbEt6lJFGQhZ8qGPOW0xKimGQ1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763886502; c=relaxed/relaxed;
	bh=0B64FfcBUebWGa97KlLEVMunA7ifEx9dRjZ8w3tB0G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXcBUvjtzzkPHrnU3QoiWAVZV4ckxfwx+jRYFKZQzzhJxxiW8db/1klSenwPoXIBtUA5C4/4ShWIr7CVEN0hmJzFymVq/e60ihVwlqZxFp96m6GWd8t4Wa4AkKQkWyb0B2Ox+JDvq2ln9p6XYYmBTQIIFQ5j6VXo+0fmVVEk7EJf2k/ch7fhFbCPRPioqvTKRvb5ewAveiFMLjXLru/7ukcWcFT0GAiSuqWWM5TR7xXmnYOMMtb6ls2x+MJ/vxhUTaC1Eo5PQByEnrd6Hq7ij422Ju/BNUFt3IiKexavvJ3klihVrl3ZeeImLebJ6tBsZZxH/+aHDn5I20vxGafAEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KaEiudfD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KaEiudfD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dDhtF1GH8z2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Nov 2025 19:28:20 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AN5PwRL028323;
	Sun, 23 Nov 2025 08:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0B64Ff
	cBUebWGa97KlLEVMunA7ifEx9dRjZ8w3tB0G0=; b=KaEiudfDAZlWNjP2ZRLLol
	Sl06GXlsY/OXEucjDyEzUiWlJW0KKMzSY+2CPtvTBs5/+D00Is4dAepLShXoXHVG
	xCxE9QhPmNj8qLQt9sx/GUW704NU0OySTrVUZBC0G2xRJavcLi7jzCm8CJbJ5ozE
	gHcABK8rtPH7rcxfXMZ1j2Wn+tJyqAbg+zr3eItT04+dNrY5Or9PBNfjFrOKTviU
	EZyWPPkBss2GGyM6qZqi/s1VceTLF84UYu1MC2v1KCacekaMvnvgrMk8fo7AN2pv
	xWy+2/r8cQGbC6CxDjXPYgtguc5g/KuzJcb7X5F4fiP2NCXl0JFL/oTqTsp+m2pw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4u1kmt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 08:28:04 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AN8S4A9014392;
	Sun, 23 Nov 2025 08:28:04 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4u1kmt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 08:28:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AN7vvQC016418;
	Sun, 23 Nov 2025 08:28:03 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aks0jrydv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 08:28:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AN8RxQZ35258630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Nov 2025 08:27:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 856C620043;
	Sun, 23 Nov 2025 08:27:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58DC520040;
	Sun, 23 Nov 2025 08:27:54 +0000 (GMT)
Received: from [9.124.217.114] (unknown [9.124.217.114])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Nov 2025 08:27:54 +0000 (GMT)
Message-ID: <89757b9f-d34d-4f60-a164-7ffc46d0f122@linux.ibm.com>
Date: Sun, 23 Nov 2025 13:57:48 +0530
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
Subject: Re: [RFC PATCH 1/1] powerpc/pseries: Add RTAS-based error injection
 support via pseries_eeh_err_inject()
To: Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mahesh@linux.ibm.com, oohall@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, gregkh@linuxfoundation.org,
        vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
References: <20251107091009.43034-1-nnmlinux@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251107091009.43034-1-nnmlinux@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAyMSBTYWx0ZWRfX8BAqnAGHgv0p
 SCL5mKyJh34VM+jbXOHQARGunDS6Nckgyr4d9eMXOIXP++jm52kgCP+v5Cb91skA9HgvtvOCUoL
 G1rTOs75lXRDBku9H+tWgWIDnkcG1wqPFmcM2nX9TrCDG144YwtEc0xAz0MyvyzJ39DnsnxfIus
 q7/C6gHxOzbxMeTSS1ZjatULv7B1hlsRY8hDOCIcclBP/G1GrWsgtYD8RtIUDWXMtDnJPqHgfa0
 a0Ngv2GFA8Kc3/C2pjRAKcxCVDset5AA/ZJFJtkYu3+/16bXTpj+mBVYpuOzWEeCh4waDEjbLdr
 SWH+l/x4zNEGuMn0E4cODcszv/uMq9Ve7it1ehO+Me6c4wqLQ2JaG7pDqn4il5xXVVbTMG91AoT
 GepQ7QtjrSv8ngJphvAu0vxW6NYjbg==
X-Authority-Analysis: v=2.4 cv=SuidKfO0 c=1 sm=1 tr=0 ts=6922c595 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=9AdMxfjQAAAA:20 a=DRo31FuvXVHvAC_QAo4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: vY8Qw8m0LXXzucLft-F6DFYrhWdmYnqk
X-Proofpoint-GUID: vBNdpQ6HH0JnRJnMPgA9gRItu9EroDdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511220021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 07/11/25 14:40, Narayana Murty N wrote:
> This patch add support for RTAS-based error injection on pseries platforms
> using a new implementation in the pseries_eeh_err_inject() function. The
> feature allows controlled injection of synthetic hardware errors for
> testing and validation purposes, such as PCI and memory faults.
>
> Highlights of the implementation:
>
> - Dynamically acquires RTAS tokens for ibm,open-errinjct, ibm,errinjct,
>    and ibm,close-errinjct services. A complete open-call-close session is
>    managed as per the platform firmware interface.
>
> - A 1KB aligned and zero-initialized working buffer is allocated and
>    filled according to the specified error type. Buffer layouts strictly
>    follow PAPR documentation.
>
> - Supports multiple error types:
>    * 0x03 - recovered-special-event
>    * 0x04 - corrupted-page
>    * 0x07 - ioa-bus-error (32-bit)
>    * 0x0F - ioa-bus-error-64 (64-bit)
>    * 0x09 - corrupted-dcache-start
>    * 0x0A - corrupted-dcache-end
>    * 0x0B - corrupted-icache-start
>    * 0x0C - corrupted-icache-end
>    * 0x0D - corrupted-tlb-start
>    * 0x0E - corrupted-tlb-end
>
> - All RTAS parameters are passed in big-endian format using cpu_to_be32().
>
> - Proper status code handling and detailed debug output via printk.
>    Handles special conditions like already open sessions and unsupported
>    operations.
>
> - The error-specific buffer population logic is refactored into a helper
>    for maintainability and clarity.
>
> Tested on a PowerVM guest with firmware support for RTAS error injection.
> Includes tracing support via bpftrace and in-kernel printk debugging.
>
> Note : error injection from guest tested with the qemu patches
> https://lore.kernel.org/all/20251029150618.186803-1-nnmlinux@linux.ibm.com/
>
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/rtas.h              |   4 +
>   arch/powerpc/include/uapi/asm/eeh.h          |  18 +
>   arch/powerpc/kernel/rtas.c                   |   6 +
>   arch/powerpc/platforms/pseries/eeh_pseries.c | 424 ++++++++++++++++++-
>   4 files changed, 434 insertions(+), 18 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index d046bbd5017d..cb5f6475747c 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -519,6 +519,10 @@ int rtas_get_error_log_max(void);
>   extern spinlock_t rtas_data_buf_lock;
>   extern char rtas_data_buf[RTAS_DATA_BUF_SIZE];
>   
> +#define RTAS_ERRINJCT_BUF_SIZE 1024
> +extern spinlock_t rtas_errinjct_buf_lock;
> +extern char rtas_errinjct_buf[RTAS_ERRINJCT_BUF_SIZE];
> +
>   /* RMO buffer reserved for user-space RTAS use */
>   extern unsigned long rtas_rmo_buf;
>   
> diff --git a/arch/powerpc/include/uapi/asm/eeh.h b/arch/powerpc/include/uapi/asm/eeh.h
> index 3b5c47ff3fc4..86645cab2827 100644
> --- a/arch/powerpc/include/uapi/asm/eeh.h
> +++ b/arch/powerpc/include/uapi/asm/eeh.h
> @@ -41,4 +41,22 @@
>   #define EEH_ERR_FUNC_DMA_WR_TARGET	19
>   #define EEH_ERR_FUNC_MAX		19
>   
> +/* RTAS PCI Error Injection Token Types */
> +#define RTAS_ERR_TYPE_FATAL                     0x1
> +#define RTAS_ERR_TYPE_RECOVERED_RANDOM_EVENT    0x2
> +#define RTAS_ERR_TYPE_RECOVERED_SPECIAL_EVENT   0x3
> +#define RTAS_ERR_TYPE_CORRUPTED_PAGE            0x4
> +#define RTAS_ERR_TYPE_CORRUPTED_SLB             0x5
> +#define RTAS_ERR_TYPE_TRANSLATOR_FAILURE        0x6
> +#define RTAS_ERR_TYPE_IOA_BUS_ERROR             0x7
> +#define RTAS_ERR_TYPE_PLATFORM_SPECIFIC         0x8
> +#define RTAS_ERR_TYPE_CORRUPTED_DCACHE_START    0x9
> +#define RTAS_ERR_TYPE_CORRUPTED_DCACHE_END      0xA
> +#define RTAS_ERR_TYPE_CORRUPTED_ICACHE_START    0xB
> +#define RTAS_ERR_TYPE_CORRUPTED_ICACHE_END      0xC
> +#define RTAS_ERR_TYPE_CORRUPTED_TLB_START       0xD
> +#define RTAS_ERR_TYPE_CORRUPTED_TLB_END         0xE
> +#define RTAS_ERR_TYPE_IOA_BUS_ERROR_64          0xF
> +#define RTAS_ERR_TYPE_UPSTREAM_IO_ERROR         0x10

Yes, PAPR lists Errinjct-token-names in the above order, but
are we sure these are the correct Errinjct Token values?

> +
>   #endif /* _ASM_POWERPC_EEH_H */
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 8d81c1e7a8db..04c707100dab 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -769,6 +769,12 @@ EXPORT_SYMBOL_GPL(rtas_data_buf);
>   
>   unsigned long rtas_rmo_buf;
>   
> +DEFINE_SPINLOCK(rtas_errinjct_buf_lock);
> +EXPORT_SYMBOL_GPL(rtas_errinjct_buf_lock);
> +
> +char rtas_errinjct_buf[1024] __aligned(SZ_1K);
> +EXPORT_SYMBOL_GPL(rtas_errinjct_buf);
> +
>   /*
>    * If non-NULL, this gets called when the kernel terminates.
>    * This is done like this so rtas_flash can be a module.
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index b12ef382fec7..b06fcaf7282d 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -786,6 +786,358 @@ static int pseries_notify_resume(struct eeh_dev *edev)
>   }
>   #endif
>   
> +/**
> + * validate_addr_mask_in_pe - Validate that an addr+mask fall within PE's BARs
> + * @pe:  EEH PE containing one or more PCI devices
> + * @addr: Address to validate
> + * @mask: Address mask to validate
> + *
> + * Checks that @addr is mapped into a BAR/MMIO region of any device belonging
> + * to the PE. If @mask is non-zero, ensures it is consistent with @addr.
> + *
> + * Return: 0 if valid, RTAS_INVALID_PARAMETER on failure.
> + */
> +
> +static int validate_addr_mask_in_pe(struct eeh_pe *pe, unsigned long addr,
> +				    unsigned long mask)
> +{
> +	struct eeh_dev *edev, *tmp;
> +	struct pci_dev *pdev;
> +	int bar;
> +	resource_size_t bar_start, bar_len;
> +	bool valid = false;
> +
> +	/* nothing to validate */
> +	if (addr == 0 && mask == 0)
> +		return 0;
> +
> +	eeh_pe_for_each_dev(pe, edev, tmp) {
> +		pdev = eeh_dev_to_pci_dev(edev);
> +		if (!pdev)
> +			continue;
> +
> +		for (bar = 0; bar < PCI_NUM_RESOURCES; bar++) {
> +			bar_start = pci_resource_start(pdev, bar);
> +			bar_len = pci_resource_len(pdev, bar);
> +
> +			if (!bar_len)
> +				continue;
> +
> +			if (addr >= bar_start && addr < (bar_start + bar_len)) {
> +				/* ensure mask makes sense for the addr value */
> +				if ((addr & mask) != addr) {
> +					pr_err("EEH: Mask 0x%lx invalid for addr 0x%lx in BAR[%d] range 0x%llx-0x%llx\n",
> +					       mask, addr, bar,
> +					       (unsigned long long)bar_start,
> +					       (unsigned long long)(bar_start + bar_len));
> +					return RTAS_INVALID_PARAMETER;
> +				}
> +
> +				pr_debug("EEH: addr=0x%lx with mask=0x%lx validated in BAR[%d] of %s\n",
> +					 addr, mask, bar, pci_name(pdev));

How about defining pr_fmt, so that you can avoid EEH: for pr_* calls?
#define pr_fmt(fmt)    "EEH: " fmt


> +				valid = true;
> +			}
> +		}
> +	}
> +
> +	if (!valid) {
> +		pr_err("EEH: addr=0x%lx not valid within any BAR of any device in PE\n",
> +		       addr);
> +		return RTAS_INVALID_PARAMETER;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * validate_err_type - Basic sanity check for RTAS error type
> + * @type: RTAS error type
> + *
> + * Ensures that the error type is within the valid RTAS error type range.
> + *
> + * Return: true if valid, false otherwise.
> + */
> +
> +static bool validate_err_type(int type)
> +{
> +	/* sanity check */

We can avoid the above comment. There is already a detailed document
about this function just before the function definition.

> +	if (type < RTAS_ERR_TYPE_FATAL ||
> +	    type > RTAS_ERR_TYPE_UPSTREAM_IO_ERROR)
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * validate_special_event - Validate parameters for special-event injection
> + * @addr: Address parameter (should be zero)
> + * @mask: Mask parameter (should be zero)
> + *
> + * Special-event error injection should not take addr/mask.  Rejects if either
> + * is set.
> + *
> + * Return: 0 if valid, RTAS_INVALID_PARAMETER otherwise.
> + */
> +
> +static int validate_special_event(unsigned long addr, unsigned long mask)
> +{
> +	if (addr || mask) {
> +		pr_err("EEH: Special-event should not specify addr/mask\n");
> +		return RTAS_INVALID_PARAMETER;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * validate_corrupted_page - Validate parameters for corrupted-page injection
> + * @pe:   EEH PE (unused here, for consistency)

What if the compiler starts raising a warning for the unused argument in 
the future?

> + * @addr: Physical page address (required)
> + * @mask: Address mask (ignored if non-zero)
> + *
> + * Ensures a valid non-zero page address is provided. Warns if mask is set.
> + *
> + * Return: 0 if valid, RTAS_INVALID_PARAMETER otherwise.
> + */
> +
> +static int validate_corrupted_page(struct eeh_pe *pe,
> +				   unsigned long addr, unsigned long mask)
> +{
> +	if (!addr) {
> +		pr_err("EEH: corrupted-page requires non-zero addr\n");
> +		return RTAS_INVALID_PARAMETER;
> +	}
> +	/* Mask not meaningful for corrupted-page */
> +	if (mask)
> +		pr_warn("EEH: corrupted-page ignoring mask=0x%lx\n", mask);
> +	return 0;
> +}
> +
> +/**
> + * validate_ioa_bus_error - Validate parameters for IOA bus error injection
> + * @pe:   EEH PE whose BARs are validated against
> + * @addr: Address parameter (optional)
> + * @mask: Mask parameter (optional)
> + *
> + * For IOA bus error injections, @addr and @mask are optional. If present,
> + * they must map into the PE's MMIO/CFG space.
> + *
> + * Return: 0 if valid or addr/mask absent, RTAS_INVALID_PARAMETER otherwise.
> + */
> +
> +static int validate_ioa_bus_error(struct eeh_pe *pe,
> +				  unsigned long addr, unsigned long mask)
> +{
> +	/* Must map into BAR/MMIO/CFG space of PE */
> +	return validate_addr_mask_in_pe(pe, addr, mask);
> +}
> +
> +/**
> + * prepare_errinjct_buffer - Prepare RTAS error injection work buffer
> + * @pe:   EEH PE for the target device(s)
> + * @type: RTAS error type
> + * @func: Error function selector (semantics vary by type)
> + * @addr: Address argument (type-dependent)
> + * @mask: Mask argument (type-dependent)
> + *
> + * Clears the global error injection work buffer and populates it based on
> + * the error type and parameters provided. Performs inline validation of the
> + * arguments for each supported error type.
> + *
> + * Return: 0 on success, or RTAS_INVALID_PARAMETER / -EINVAL on failure.
> + */
> +
> +static int prepare_errinjct_buffer(struct eeh_pe *pe, int type, int func,
> +				   unsigned long addr, unsigned long mask)
> +{
> +	u64 *buf64;
> +	u32 *buf32;
> +
> +	memset(rtas_errinjct_buf, 0, RTAS_ERRINJCT_BUF_SIZE);
> +	buf64 = (u64 *)rtas_errinjct_buf;
> +	buf32 = (u32 *)rtas_errinjct_buf;
> +
> +	switch (type) {
> +	case RTAS_ERR_TYPE_RECOVERED_SPECIAL_EVENT:
> +		/* func must be 1 = non-persistent or 2 = persistent */
> +		if (func < 1 || func > 2)
> +			return RTAS_INVALID_PARAMETER;
> +		if (addr == 0 && mask == 0)
> +			return RTAS_INVALID_PARAMETER;
> +
> +		if (validate_special_event(addr, mask))
> +			return RTAS_INVALID_PARAMETER;


The two conditions above seem to be checking the same thing.


> +
> +		buf32[0] = cpu_to_be32(func);
> +		break;
> +
> +	case RTAS_ERR_TYPE_CORRUPTED_PAGE:
> +		/* addr required: physical page address */
> +		if (addr == 0)
> +			return RTAS_INVALID_PARAMETER;
> +
> +		if (validate_corrupted_page(pe, addr, mask))
> +			return RTAS_INVALID_PARAMETER;
> +
> +		buf32[0] = cpu_to_be32(upper_32_bits(addr));
> +		buf32[1] = cpu_to_be32(lower_32_bits(addr));
> +		break;
> +
> +	case RTAS_ERR_TYPE_IOA_BUS_ERROR:
> +		/* 32-bit IOA bus error: addr/mask optional */
> +		if (func < EEH_ERR_FUNC_LD_MEM_ADDR || func > EEH_ERR_FUNC_MAX)
> +			return RTAS_INVALID_PARAMETER;
> +
> +		if (addr || mask) {
> +			if (validate_ioa_bus_error(pe, addr, mask))
> +				return RTAS_INVALID_PARAMETER;
> +		}
> +
> +		buf32[0] = cpu_to_be32((u32)addr);
> +		buf32[1] = cpu_to_be32((u32)mask);
> +		buf32[2] = cpu_to_be32(pe->addr);
> +		buf32[3] = cpu_to_be32(BUID_HI(pe->phb->buid));
> +		buf32[4] = cpu_to_be32(BUID_LO(pe->phb->buid));
> +		buf32[5] = cpu_to_be32(func);
> +		break;
> +
> +	case RTAS_ERR_TYPE_IOA_BUS_ERROR_64:
> +		/* 64-bit IOA bus error: addr/mask optional */
> +		if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
> +			return RTAS_INVALID_PARAMETER;
> +
> +		if (addr || mask) {
> +			if (validate_ioa_bus_error(pe, addr, mask))
> +				return RTAS_INVALID_PARAMETER;
> +		}
> +
> +		buf64[0] = cpu_to_be64(addr);
> +		buf64[1] = cpu_to_be64(mask);
> +		buf32[4] = cpu_to_be32(pe->addr);
> +		buf32[5] = cpu_to_be32(BUID_HI(pe->phb->buid));
> +		buf32[6] = cpu_to_be32(BUID_LO(pe->phb->buid));
> +		buf32[7] = cpu_to_be32(func);
> +		break;
> +
> +	case RTAS_ERR_TYPE_CORRUPTED_DCACHE_START:
> +	case RTAS_ERR_TYPE_CORRUPTED_DCACHE_END:
> +	case RTAS_ERR_TYPE_CORRUPTED_ICACHE_START:
> +	case RTAS_ERR_TYPE_CORRUPTED_ICACHE_END:
> +		/* addr/mask optional, no strict validation */
> +		buf32[0] = cpu_to_be32(addr);
> +		buf32[1] = cpu_to_be32(mask);
> +		break;
> +
> +	case RTAS_ERR_TYPE_CORRUPTED_TLB_START:
> +	case RTAS_ERR_TYPE_CORRUPTED_TLB_END:
> +		/* only addr field relevant */
> +		buf32[0] = cpu_to_be32(addr);
> +		break;
> +
> +	default:
> +		pr_err("EEH: Unsupported error type 0x%x\n", type);
> +		return -EINVAL;
> +	}
> +
> +	pr_debug("RTAS: errinjct buffer prepared: type=%d func=%d addr=0x%lx mask=0x%lx\n",
> +		 type, func, addr, mask);
> +
> +	return 0;
> +}
> +
> +/**
> + * rtas_open_errinjct_session - Open an RTAS error injection session
> + *
> + * Opens a session with the RTAS ibm,open-errinjct service.
> + *
> + * Return: Positive session token on success, negative error code on failure.
> + */
> +static int rtas_open_errinjct_session(void)
> +{
> +	int open_token, args[2] = {0};
> +	int rc, status, session_token = -1;
> +
> +	open_token = rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT);
> +	if (open_token == RTAS_UNKNOWN_SERVICE) {
> +		pr_err("RTAS: ibm,open-errinjct not available\n");
> +		return RTAS_UNKNOWN_SERVICE;
> +	}
> +
> +	/* Call open; original code treated rtas_call return as session token */

As per PAPR (V2.13 and V2.11) treating return code as session token 
seems incorrect.
The ibm,open-errinjct RTAS call-buffer has two output cells. One for 
session token and
other status.

While reading PARP I found something interesting about ibm,open-errinjct 
output
buffer order. In all RTAS call buffer the first output cell holds RTAS 
call status and
rest output cells depends on RTAS call type (Some has only one RTAS 
output cell
which is status) except ibm,open-errinjct.

As per PAPR the first output cell of ibm,open-errinjct RTAS call holds 
token value
and second holds the RTAS call status. If that is really the case 
rtas_call()/rtas.c
itself is processing the return code wrong for ibm,open-errinjct RTAS call.

Checkout this:
https://github.com/torvalds/linux/blob/d13f3ac64efb868d09cb2726b1e84929afe90235/arch/powerpc/kernel/rtas.c#L1218

I suspecting PARP document could be wrong here. But we should double check.

Now once we confirmed what is the right output cell for session token 
the below
code must be update the read from that cell and not relay on rtas_call 
return value.

> +	rc = rtas_call(open_token, 0, 2, args);
> +	status = args[0];
> +	if (status != 0) {
> +		pr_err("RTAS: open-errinjct failed: status=%d args[1]=%d rc=%d\n",
> +		       status, args[1], rc);
> +		return status ? status : -EIO;
> +	}
> +
> +	session_token = rc;
> +	pr_info("RTAS: Opened injection session: token=%d\n", session_token);
> +	return session_token;
> +}
> +
> +/**
> + * rtas_close_errinjct_session - Close an RTAS error injection session
> + * @session_token: Session token returned from open
> + *
> + * Attempts to close a previously opened error injection session. Best-effort;
> + * logs warnings if close fails or if service is unavailable.
> + */
> +
> +static void rtas_close_errinjct_session(int session_token)
> +{
> +	int close_token, args[2] = {0};
> +	int rc;
> +
> +	if (session_token < 0)
> +		return;

Are we sure that session_token cannot be less than 0?

> +
> +	close_token = rtas_function_token(RTAS_FN_IBM_CLOSE_ERRINJCT);
> +	if (close_token == RTAS_UNKNOWN_SERVICE) {
> +		pr_warn("RTAS: close-errinjct not available\n");

Let this also be pr_err like for other rtas_function_token call.

> +		return;
> +	}
> +
> +	args[0] = session_token;
> +	rc = rtas_call(close_token, 1, 1, args);

Should we try atleast once again if rtas_call status says 990x ?

> +	if (rc) {
> +		pr_warn("RTAS: close-errinjct rc=%d, args[0]=%d, args[1]=%d\n",
> +			rc, args[0], args[1]);

This should be consider error I think.

> +	}
> +}
> +
> +/**
> + * do_errinjct_call - Invoke the RTAS error injection service
> + * @errinjct_token: RTAS token for ibm,errinjct
> + * @type:           RTAS error type
> + * @session_token:  RTAS error injection session token
> + *
> + * Issues the RTAS ibm,errinjct call with the prepared work buffer. Logs errors
> + * on failure.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +
> +static int do_errinjct_call(int errinjct_token, int type, int session_token)
> +{
> +	int rc, status;
> +
> +	if (errinjct_token == RTAS_UNKNOWN_SERVICE)
> +		return -ENODEV;
> +
> +	/* errinjct takes: type, session_token, workbuf pointer (3 in), returns status */
> +	rc = rtas_call(errinjct_token, 3, 1, &status, type, session_token,
> +		       rtas_errinjct_buf);

The argument passed rtas_call above seems incorrect. As per PARR the status
should come last.

> +
> +	if (rc || status) {

RTAS call return code and status both are same.

> +		pr_err("RTAS: errinjct failed: rc=%d, status=%d\n", rc, status);
> +		return status ? status : -EIO;
> +	}
> +
> +	pr_info("RTAS: errinjct ok: rc=%d, status=%d\n", rc, status);
> +	return 0;
> +}
> +
>   /**
>    * pseries_eeh_err_inject - Inject specified error to the indicated PE
>    * @pe: the indicated PE
> @@ -799,30 +1151,66 @@ static int pseries_notify_resume(struct eeh_dev *edev)
>   static int pseries_eeh_err_inject(struct eeh_pe *pe, int type, int func,
>   				  unsigned long addr, unsigned long mask)
>   {
> -	struct	eeh_dev	*pdev;
> +	int rc = 0;
> +	int session_token = -1;
> +	int errinjct_token;
> +
> +	/* Validate type */
> +	if (!validate_err_type(type)) {
> +		pr_err("RTAS: invalid error type 0x%x\n", type);
> +		return RTAS_INVALID_PARAMETER;
> +	}
> +	pr_debug("RTAS: error type 0x%x\n", type);
>   
> -	/* Check on PCI error type */
> -	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
> -		return -EINVAL;
> +	/* For IOA bus errors we must validate err_func and addr/mask in PE.
> +	 * For other types: if addr/mask present we'll still validate BAR range;
> +	 * otherwise skip function checks.
> +	 */
> +	if (type == RTAS_ERR_TYPE_IOA_BUS_ERROR ||
> +	    type == RTAS_ERR_TYPE_IOA_BUS_ERROR_64) {
> +		/* Validate that addr/mask fall in the PE's BAR ranges */
> +		rc = validate_addr_mask_in_pe(pe, addr, mask);
> +		if (rc)
> +			return rc;
> +	} else if (addr || mask) {
> +		/* If caller provided addr/mask for a non-IOA type, do a BAR check too */
> +		rc = validate_addr_mask_in_pe(pe, addr, mask);
> +		if (rc)
> +			return rc;
> +	}
>   
> -	switch (func) {
> -	case EEH_ERR_FUNC_LD_MEM_ADDR:
> -	case EEH_ERR_FUNC_LD_MEM_DATA:
> -	case EEH_ERR_FUNC_ST_MEM_ADDR:
> -	case EEH_ERR_FUNC_ST_MEM_DATA:
> -		/* injects a MMIO error for all pdev's belonging to PE */
> -		pci_lock_rescan_remove();
> -		list_for_each_entry(pdev, &pe->edevs, entry)
> -			eeh_pe_inject_mmio_error(pdev->pdev);
> -		pci_unlock_rescan_remove();
> -		break;
> -	default:
> -		return -ERANGE;
> +	/* Open RTAS session */
> +	session_token = rtas_open_errinjct_session();
> +	if (session_token < 0)
> +		return session_token;

Same comment, are we sure session_token can't be negative?

> +
> +	/* get errinjct token */
> +	errinjct_token = rtas_function_token(RTAS_FN_IBM_ERRINJCT);
> +	if (errinjct_token == RTAS_UNKNOWN_SERVICE) {
> +		pr_err("RTAS: ibm,errinjct not available\n");
> +		rc = -ENODEV;
> +		goto out_close;
>   	}
>   
> -	return 0;
> +	/* prepare shared buffer while holding lock */
> +	spin_lock(&rtas_errinjct_buf_lock);
> +	rc = prepare_errinjct_buffer(pe, type, func, addr, mask);
> +	if (rc) {
> +		spin_unlock(&rtas_errinjct_buf_lock);
> +		goto out_close;
> +	}
> +
> +	/* perform the errinjct RTAS call */
> +	rc = do_errinjct_call(errinjct_token, type, session_token);
> +	spin_unlock(&rtas_errinjct_buf_lock);
> +
> +out_close:
> +	/* always attempt close if we opened a session */
> +	rtas_close_errinjct_session(session_token);
> +	return rc;

I hope returning 0 even when errinjct session didn't close properly is fine.

>   }
>   
> +
>   static struct eeh_ops pseries_eeh_ops = {
>   	.name			= "pseries",
>   	.probe			= pseries_eeh_probe,

Can you please share the steps on how one can try this patch?

Thanks,
Sourabh Jain

