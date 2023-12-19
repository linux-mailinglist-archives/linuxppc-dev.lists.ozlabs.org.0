Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2AD8181BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 07:59:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A3TytZQW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvSGY0QPQz3cGW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 17:59:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A3TytZQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvSFl0SJkz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 17:58:18 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BJ6gSs7011616
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 06:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uRxvDffb8pYcOlMVr0Ccb/FU7ho6E0bBmC0n7prn5yg=;
 b=A3TytZQWhIyxnCeAsnNKWFdiuGFCuPBBG3FeKcyX8E5NWWmrY258DePSEP4HHTZq7KuC
 R7KYJ8BUPIJ7axm14cH5jwXKdx5TiDaAqgsOC9+/U0X366dJ4PwWnaYPFOgJmGbcetgg
 WwtqaemTRyW6LiKsw7p3SV7OibQEdHEG62EgGK1hEz15SqJbDbcJv+5vndPMBn+KU3Ut
 ugAVicT/FAA2sXxXACwK84M8I64fKi11zmI9EAkYnPLQduvN98TRnCBsRdQqPAVpyIYC
 BmxHPn1M4KfMhhv3igJ+lda4z3rRFKZmfWf5G2Og3uDXkHl01Y283Z5mRD3J81Aywg8J 7g== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v364v0bea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 06:58:15 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BJ6psCf029726
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 06:58:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3v1p7se428-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 06:58:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BJ6wCAG23462576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Dec 2023 06:58:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAC722004E;
	Tue, 19 Dec 2023 06:58:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A91620040;
	Tue, 19 Dec 2023 06:58:11 +0000 (GMT)
Received: from [9.195.47.190] (unknown [9.195.47.190])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 Dec 2023 06:58:10 +0000 (GMT)
Message-ID: <4d355c5c-fcaa-4e71-b302-665df7f2ac30@linux.ibm.com>
Date: Tue, 19 Dec 2023 12:28:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/fadump: add support for multiple
 boot memory regions
Content-Language: en-US
To: Aditya Gupta <adityag@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20231205201835.388030-1-hbathini@linux.ibm.com>
 <20231205201835.388030-2-hbathini@linux.ibm.com>
 <dfa27ef9-e6f1-4701-ba66-905280b4149f@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <dfa27ef9-e6f1-4701-ba66-905280b4149f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -mI550CRgV5xezRb5XukR1-2tGHstw5h
X-Proofpoint-ORIG-GUID: -mI550CRgV5xezRb5XukR1-2tGHstw5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-19_02,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312190050
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Aditya,

On 17/12/23 14:11, Aditya Gupta wrote:
> Hi sourabh,
>
> On 06/12/23 01:48, Hari Bathini wrote:
>> From: Sourabh Jain <sourabhjain@linux.ibm.com>
>>
>> Currently, fadump on pseries assumes a single boot memory region even
>> though f/w supports more than one boot memory region. Add support for
>> more boot memory regions to make the implementation flexible for any
>> enhancements that introduce other region types. For this, rtas memory
>> structure for fadump is updated to have multiple boot memory regions
>> instead of just one. Additionally, methods responsible for creating
>> the fadump memory structure during both the first and second kernel
>> boot have been modified to take these multiple boot memory regions
>> into account. Also, a new callback has been added to the fadump_ops
>> structure to get the maximum boot memory regions supported by the
>> platform.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/fadump-internal.h   |   2 +-
>>   arch/powerpc/kernel/fadump.c                 |  27 +-
>>   arch/powerpc/platforms/powernv/opal-fadump.c |   8 +
>>   arch/powerpc/platforms/pseries/rtas-fadump.c | 258 ++++++++++++-------
>>   arch/powerpc/platforms/pseries/rtas-fadump.h |  26 +-
>>   5 files changed, 199 insertions(+), 122 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/fadump-internal.h 
>> b/arch/powerpc/include/asm/fadump-internal.h
>> index 27f9e11eda28..b3956c400519 100644
>> --- a/arch/powerpc/include/asm/fadump-internal.h
>> +++ b/arch/powerpc/include/asm/fadump-internal.h
>> @@ -129,6 +129,7 @@ struct fadump_ops {
>>                         struct seq_file *m);
>>       void    (*fadump_trigger)(struct fadump_crash_info_header *fdh,
>>                     const char *msg);
>> +    int    (*fadump_max_boot_mem_rgns)(void);
>>   };
>>     /* Helper functions */
>> @@ -136,7 +137,6 @@ s32 __init fadump_setup_cpu_notes_buf(u32 num_cpus);
>>   void fadump_free_cpu_notes_buf(void);
>>   u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
>>   void __init fadump_update_elfcore_header(char *bufp);
>> -bool is_fadump_boot_mem_contiguous(void);
>>   bool is_fadump_reserved_mem_contiguous(void);
>>     #else /* !CONFIG_PRESERVE_FA_DUMP */
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index d14eda1e8589..757681658dda 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -222,28 +222,6 @@ static bool is_fadump_mem_area_contiguous(u64 
>> d_start, u64 d_end)
>>       return ret;
>>   }
>>   -/*
>> - * Returns true, if there are no holes in boot memory area,
>> - * false otherwise.
>> - */
>> -bool is_fadump_boot_mem_contiguous(void)
>> -{
>> -    unsigned long d_start, d_end;
>> -    bool ret = false;
>> -    int i;
>> -
>> -    for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
>> -        d_start = fw_dump.boot_mem_addr[i];
>> -        d_end   = d_start + fw_dump.boot_mem_sz[i];
>> -
>> -        ret = is_fadump_mem_area_contiguous(d_start, d_end);
>> -        if (!ret)
>> -            break;
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>>   /*
>>    * Returns true, if there are no holes in reserved memory area,
>>    * false otherwise.
>> @@ -389,10 +367,11 @@ static unsigned long __init 
>> get_fadump_area_size(void)
>>   static int __init add_boot_mem_region(unsigned long rstart,
>>                         unsigned long rsize)
>>   {
>> +    int max_boot_mem_rgns = fw_dump.ops->fadump_max_boot_mem_rgns();
>>       int i = fw_dump.boot_mem_regs_cnt++;
>>   -    if (fw_dump.boot_mem_regs_cnt > FADUMP_MAX_MEM_REGS) {
>> -        fw_dump.boot_mem_regs_cnt = FADUMP_MAX_MEM_REGS;
>> +    if (fw_dump.boot_mem_regs_cnt > max_boot_mem_rgns) {
>> +        fw_dump.boot_mem_regs_cnt = max_boot_mem_rgns;
>>           return 0;
>>       }
>>   diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c 
>> b/arch/powerpc/platforms/powernv/opal-fadump.c
>> index 964f464b1b0e..fa26c21a08d9 100644
>> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
>> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
>> @@ -615,6 +615,13 @@ static void opal_fadump_trigger(struct 
>> fadump_crash_info_header *fdh,
>>           pr_emerg("No backend support for MPIPL!\n");
>>   }
>>   +/* FADUMP_MAX_MEM_REGS or lower */
>> +static int opal_fadump_max_boot_mem_rgns(void)
>> +{
>> +    return FADUMP_MAX_MEM_REGS;
>> +
>> +}
>> +
>>   static struct fadump_ops opal_fadump_ops = {
>>       .fadump_init_mem_struct        = opal_fadump_init_mem_struct,
>>       .fadump_get_metadata_size    = opal_fadump_get_metadata_size,
>> @@ -627,6 +634,7 @@ static struct fadump_ops opal_fadump_ops = {
>>       .fadump_process            = opal_fadump_process,
>>       .fadump_region_show        = opal_fadump_region_show,
>>       .fadump_trigger            = opal_fadump_trigger,
>> +    .fadump_max_boot_mem_rgns    = opal_fadump_max_boot_mem_rgns,
>>   };
>>     void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 
>> node)
>> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c 
>> b/arch/powerpc/platforms/pseries/rtas-fadump.c
>> index b5853e9fcc3c..1b05b4cefdfd 100644
>> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
>> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
>> @@ -29,9 +29,6 @@ static const struct rtas_fadump_mem_struct 
>> *fdm_active;
>>   static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
>>                         const struct rtas_fadump_mem_struct *fdm)
>>   {
>> -    fadump_conf->boot_mem_dest_addr =
>> -        be64_to_cpu(fdm->rmr_region.destination_address);
>> -
>>       fadump_conf->fadumphdr_addr = (fadump_conf->boot_mem_dest_addr +
>>                          fadump_conf->boot_memory_size);
>>   }
>> @@ -43,20 +40,52 @@ static void rtas_fadump_update_config(struct 
>> fw_dump *fadump_conf,
>>   static void __init rtas_fadump_get_config(struct fw_dump *fadump_conf,
>>                      const struct rtas_fadump_mem_struct *fdm)
>>   {
>> -    fadump_conf->boot_mem_addr[0] =
>> -        be64_to_cpu(fdm->rmr_region.source_address);
>> -    fadump_conf->boot_mem_sz[0] = 
>> be64_to_cpu(fdm->rmr_region.source_len);
>> -    fadump_conf->boot_memory_size = fadump_conf->boot_mem_sz[0];
>> +    unsigned long base, size, last_end, hole_size;
>>   -    fadump_conf->boot_mem_top = fadump_conf->boot_memory_size;
>> -    fadump_conf->boot_mem_regs_cnt = 1;
>> +    last_end = 0;
>> +    hole_size = 0;
>> +    fadump_conf->boot_memory_size = 0;
>> +    fadump_conf->boot_mem_regs_cnt = 0;
>> +    pr_debug("Boot memory regions:\n");
>> +    for (int i = 0; i < be16_to_cpu(fdm->header.dump_num_sections); 
>> i++) {
>> +        int type = be16_to_cpu(fdm->rgn[i].source_data_type);
>>   -    /*
>> -     * Start address of reserve dump area (permanent reservation) for
>> -     * re-registering FADump after dump capture.
>> -     */
>> -    fadump_conf->reserve_dump_area_start =
>> - be64_to_cpu(fdm->cpu_state_data.destination_address);
>> +        switch (type) {
>> +        case RTAS_FADUMP_CPU_STATE_DATA:
>> +            u64 addr = be64_to_cpu(fdm->rgn[i].destination_address);
>
> This caused a compiler error on my system:
>
> arch/powerpc/platforms/pseries/rtas-fadump.c: In function 
> ‘rtas_fadump_get_config’:
> arch/powerpc/platforms/pseries/rtas-fadump.c:56:4: error: a label can 
> only be part of a statement and a declaration is not a statement
>     u64 addr = be64_to_cpu(fdm->rgn[i].destination_address);
>     ^~~
>
> Probably the 'addr' local variable needs to be in it's own local scope.
>
> Adding the case block in brackets {} solved the error for me.
> Rest of the code looks good to me. I will also try to test the patch 
> series later.
>

Thanks for reporting, we will fix it in next version.

- Sourabh

