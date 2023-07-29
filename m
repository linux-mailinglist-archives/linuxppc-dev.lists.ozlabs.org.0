Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 845BD76805F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 17:30:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rFQmd67Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCpN635MHz3cTP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 01:29:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rFQmd67Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCpMF4WVHz2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jul 2023 01:29:13 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36TF9d5A007393;
	Sat, 29 Jul 2023 15:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7QNrstYvrUd7K52DgGX7AAcijyI8HbO0q/XNTWiYNkI=;
 b=rFQmd67YGrWhEaj0vQLsBTgOMFU24xVwrNUdWw9KZkUVHLe2JQv7ncrdBJ8ZDP5Q8Ngg
 ZEKH41fufA5+2y01IeyddnMzOHUxqUwd8tLfVsn/j1g9YYvBInuHr+2TXMpvIu+wB04d
 fD2+RJ/9EJ4UOAkEPKSma9hJyY6o92P9gtF2aUGRWvjRHvl2q015sNOBbUUjkLyJM0lh
 f1LiKRiFS9O3jlZGFswlcjE+xkP06SIMBGSF253dxdXWvbxZMr7MwYq06v+uHN8aVsxc
 c0Ou+VMVlupIzTGYX1w3I1O0PcFJuMbjNi7pCDFCwh7vf+VqwgatgOYZ1PI1TBvoS0vJ yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s54xwgd81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 15:29:03 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36TFT3sS016470;
	Sat, 29 Jul 2023 15:29:03 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s54xwgd7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 15:29:03 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36TDGKJr002059;
	Sat, 29 Jul 2023 15:29:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0teny1tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 15:29:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36TFT0KH25690556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Jul 2023 15:29:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC17320043;
	Sat, 29 Jul 2023 15:28:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35FFA20040;
	Sat, 29 Jul 2023 15:28:58 +0000 (GMT)
Received: from [9.43.27.66] (unknown [9.43.27.66])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 29 Jul 2023 15:28:57 +0000 (GMT)
Message-ID: <e8eb6d6b-fffb-2f8c-b236-ae9578837084@linux.ibm.com>
Date: Sat, 29 Jul 2023 20:58:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/2] powerpc/mm: Cleanup memory block size probing
Content-Language: en-US
To: Reza Arbab <arbab@linux.ibm.com>
References: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
 <f38660ab-89ed-44f5-ac7e-34c89a3e66d1@arbab-laptop>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <f38660ab-89ed-44f5-ac7e-34c89a3e66d1@arbab-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K4AHsIrIocmSXK04V6uqmz9TpLDvT-e9
X-Proofpoint-ORIG-GUID: PIDcXPDPVzZ3pdwNftzmERgcyWr3YS3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290140
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
Cc: foraker1@llnl.gov, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/29/23 3:25 AM, Reza Arbab wrote:
> On Fri, Jul 28, 2023 at 04:05:55PM +0530, Aneesh Kumar K.V wrote:
>> --- a/arch/powerpc/mm/init_64.c
>> +++ b/arch/powerpc/mm/init_64.c
> [snip]
>> +    /*
>> +     * "ibm,coherent-device-memory with linux,usable-memory = 0
>> +     * Force 256MiB block size. Work around for GPUs on P9 PowerNV
>> +     * linux,usable-memory == 0 implies driver managed memory and
>> +     * we can't use large memory block size due to hotplug/unplug
>> +     * limitations.
>> +     */
>> +    compatible = of_get_flat_dt_prop(node, "compatible", NULL);
>> +    if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
>> +        int len = 0;
>> +        const __be32 *usm;
>> +
>> +        usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
> 
> I think this should be "linux,usable-memory".
> 
>> +        if (usm && !len) {
>> +            *block_size = SZ_256M;
>> +            return 1;
>> +        }
> 
> This isn't quite right. The criteria is not that the property itself has no registers, it's that the base/size combo has size zero.
> 
> If you fold in the patch appended to the end of this mail, things worked for me.
> 
>> +    }
>> +
>> +    reg = of_get_flat_dt_prop(node, "reg", &l);
>> +    endp = reg + (l / sizeof(__be32));
>> +
>> +    while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
>> +        u64 base, size;
>> +
>> +        base = dt_mem_next_cell(dt_root_addr_cells, &reg);
>> +        size = dt_mem_next_cell(dt_root_size_cells, &reg);
>> +
>> +        if (size == 0)
>> +            continue;
>> +
>> +        update_memory_block_size(block_size, size);
>> +    }
>> +    /* continue looking for other memory device types */
>> +    return 0;
>> +}
>> +
>> +/*
>> + * start with 1G memory block size. Early init will
>> + * fix this with correct value.
>> + */
>> +unsigned long memory_block_size __ro_after_init = 1UL << 30;
> 
> Could use SZ_1G here.
> 
> With the following fixup, I got 256MiB blocks on a system with
> "ibm,coherent-device-memory" nodes.
> 
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index dbed37d6cffb..1ac58e72a885 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -487,7 +487,6 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
>                        depth, void *data)
>  {
>      const char *type;
> -    const char *compatible;
>      unsigned long *block_size = (unsigned long *)data;
>      const __be32 *reg, *endp;
>      int l;
> @@ -532,38 +531,38 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
>      if (type == NULL || strcmp(type, "memory") != 0)
>          return 0;
>  
> -    /*
> -     * "ibm,coherent-device-memory with linux,usable-memory = 0
> -     * Force 256MiB block size. Work around for GPUs on P9 PowerNV
> -     * linux,usable-memory == 0 implies driver managed memory and
> -     * we can't use large memory block size due to hotplug/unplug
> -     * limitations.
> -     */
> -    compatible = of_get_flat_dt_prop(node, "compatible", NULL);
> -    if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
> -        int len = 0;
> -        const __be32 *usm;
> -
> -        usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
> -        if (usm && !len) {
> -            *block_size = SZ_256M;
> -            return 1;
> -        }
> -    }
> +    reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
> +    if (!reg)
> +        reg = of_get_flat_dt_prop(node, "reg", &l);
> +    if (!reg)
> +        return 0;
>  
> -    reg = of_get_flat_dt_prop(node, "reg", &l);
>      endp = reg + (l / sizeof(__be32));
>  
>      while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
> +        const char *compatible;
>          u64 base, size;
>  
>          base = dt_mem_next_cell(dt_root_addr_cells, &reg);
>          size = dt_mem_next_cell(dt_root_size_cells, &reg);
>  
> -        if (size == 0)
> +        if (size) {
> +            update_memory_block_size(block_size, size);
>              continue;
> +        }
>  
> -        update_memory_block_size(block_size, size);
> +        /*
> +         * ibm,coherent-device-memory with linux,usable-memory = 0
> +         * Force 256MiB block size. Work around for GPUs on P9 PowerNV
> +         * linux,usable-memory == 0 implies driver managed memory and
> +         * we can't use large memory block size due to hotplug/unplug
> +         * limitations.
> +         */
> +        compatible = of_get_flat_dt_prop(node, "compatible", NULL);
> +        if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
> +            *block_size = SZ_256M;
> +            return 1;
> +        }
>      }
>      /* continue looking for other memory device types */
>      return 0;

Thanks for correcting the right device tree node and testing the changes. Can I add

Co-authored-by: Reza Arbab <arbab@linux.ibm.com>

-aneesh
