Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AEEA949C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 23:11:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NxMg4Mh0zDqX9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 07:11:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nx8T63ZZzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 07:02:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Nx8T4LYlz8tWh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 07:02:01 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Nx8T45K0z9sN1; Thu,  5 Sep 2019 07:02:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46Nx8T0Fm9z9sDQ
 for <linuxppc-dev@ozlabs.org>; Thu,  5 Sep 2019 07:02:00 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x84KwCoH028966
 for <linuxppc-dev@ozlabs.org>; Wed, 4 Sep 2019 17:01:56 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2utjwhktq2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 04 Sep 2019 17:01:56 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 4 Sep 2019 22:01:54 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Sep 2019 22:01:51 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x84L1QRn33882370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 21:01:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEB1842045;
 Wed,  4 Sep 2019 21:01:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9F3E42042;
 Wed,  4 Sep 2019 21:01:47 +0000 (GMT)
Received: from [9.199.38.196] (unknown [9.199.38.196])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 21:01:47 +0000 (GMT)
Subject: Re: [PATCH v5 16/31] powernv/fadump: process the crashdump by
 exporting it as /proc/vmcore
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630276507.8896.7987455476577127053.stgit@hbathini.in.ibm.com>
 <874l1sqoce.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Thu, 5 Sep 2019 02:31:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <874l1sqoce.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090421-0028-0000-0000-00000397C48E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090421-0029-0000-0000-0000245A1770
Message-Id: <ed116b02-faf5-d267-3d58-cc7c1fa2399d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040207
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/09/19 5:12 PM, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
>> index a755705..10f6086 100644
>> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
>> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
>> @@ -41,6 +43,37 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
>>  	fadump_conf->fadumphdr_addr = fdm->fadumphdr_addr;
>>  }
>>  
>> +/*
>> + * This function is called in the capture kernel to get configuration details
>> + * from metadata setup by the first kernel.
>> + */
>> +static void opal_fadump_get_config(struct fw_dump *fadump_conf,
>> +				   const struct opal_fadump_mem_struct *fdm)
>> +{
>> +	int i;
>> +
>> +	if (!fadump_conf->dump_active)
>> +		return;
>> +
>> +	fadump_conf->boot_memory_size = 0;
>> +
>> +	pr_debug("Boot memory regions:\n");
>> +	for (i = 0; i < fdm->region_cnt; i++) {
>> +		pr_debug("\t%d. base: 0x%llx, size: 0x%llx\n",
>> +			 (i + 1), fdm->rgn[i].src, fdm->rgn[i].size);
> 
> Printing the zero-based array off by one (i + 1) seems confusing.

Hmmm... Indexing the regions from `0` sounded inappropriate..

> 
>> +
>> +		fadump_conf->boot_memory_size += fdm->rgn[i].size;
>> +	}
>> +
>> +	/*
>> +	 * Start address of reserve dump area (permanent reservation) for
>> +	 * re-registering FADump after dump capture.
>> +	 */
>> +	fadump_conf->reserve_dump_area_start = fdm->rgn[0].dest;
>> +
>> +	opal_fadump_update_config(fadump_conf, fdm);
>> +}
>> +
>>  /* Initialize kernel metadata */
>>  static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
>>  {
>> @@ -215,24 +248,114 @@ static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
>>  		pr_warn("Could not reset (%llu) kernel metadata tag!\n", ret);
>>  }
>>  
>> +/*
>> + * Convert CPU state data saved at the time of crash into ELF notes.
>> + */
>> +static int __init opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
>> +{
>> +	u32 num_cpus, *note_buf;
>> +	struct fadump_crash_info_header *fdh = NULL;
>> +
>> +	num_cpus = 1;
>> +	/* Allocate buffer to hold cpu crash notes. */
>> +	fadump_conf->cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
>> +	fadump_conf->cpu_notes_buf_size =
>> +		PAGE_ALIGN(fadump_conf->cpu_notes_buf_size);
>> +	note_buf = fadump_cpu_notes_buf_alloc(fadump_conf->cpu_notes_buf_size);
>> +	if (!note_buf) {
>> +		pr_err("Failed to allocate 0x%lx bytes for cpu notes buffer\n",
>> +		       fadump_conf->cpu_notes_buf_size);
>> +		return -ENOMEM;
>> +	}
>> +	fadump_conf->cpu_notes_buf = __pa(note_buf);
>> +
>> +	pr_debug("Allocated buffer for cpu notes of size %ld at %p\n",
>> +		 (num_cpus * sizeof(note_buf_t)), note_buf);
>> +
>> +	if (fadump_conf->fadumphdr_addr)
>> +		fdh = __va(fadump_conf->fadumphdr_addr);
>> +
>> +	if (fdh && (fdh->crashing_cpu != FADUMP_CPU_UNKNOWN)) {
>> +		note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
>> +		final_note(note_buf);
>> +
>> +		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
>> +			 fdh->elfcorehdr_addr);
>> +		fadump_update_elfcore_header(fadump_conf,
>> +					     __va(fdh->elfcorehdr_addr));
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int __init opal_fadump_process(struct fw_dump *fadump_conf)
>>  {
>> -	return -EINVAL;
>> +	struct fadump_crash_info_header *fdh;
>> +	int rc = 0;
> > No need to initialise rc there.
> 

	rc = -EINVAL;

and


>> +	if (!opal_fdm_active || !fadump_conf->fadumphdr_addr)
>> +		return -EINVAL;

>> +
>> +	/* Validate the fadump crash info header */
>> +	fdh = __va(fadump_conf->fadumphdr_addr);
>> +	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
>> +		pr_err("Crash info header is not valid.\n");
>> +		return -EINVAL;

	return rc; ??

>> +	}
>> +
>> +	/*
>> +	 * TODO: To build cpu notes, find a way to map PIR to logical id.
>> +	 *       Also, we may need different method for pseries and powernv.
>> +	 *       The currently booted kernel could have a different PIR to
>> +	 *       logical id mapping. So, try saving info of previous kernel's
>> +	 *       paca to get the right PIR to logical id mapping.
>> +	 */
> 
> That TODO is removed by the end of the series, so please just omit it entirely.
> 
>> +	rc = opal_fadump_build_cpu_notes(fadump_conf);
>> +	if (rc)
>> +		return rc;
> 
> I think this all runs early in boot, so we don't need to worry about
> another CPU seeing the partially initialised core due to there being no
> barrier here before we set elfcorehdr_addr?
> 

This is processed in fs/proc/vmcore.c during fs_initcall() and the data within the core
is processed much later (initrd). So, I think we are good here...

>> +	/*
>> +	 * We are done validating dump info and elfcore header is now ready
>> +	 * to be exported. set elfcorehdr_addr so that vmcore module will
>> +	 * export the elfcore header through '/proc/vmcore'.
>> +	 */
>> +	elfcorehdr_addr = fdh->elfcorehdr_addr;
> 
>> @@ -283,5 +407,42 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
>>  	fadump_conf->ops		= &opal_fadump_ops;
>>  	fadump_conf->fadump_supported	= 1;
>>  
>> +	/*
>> +	 * Check if dump has been initiated on last reboot.
>> +	 */
>> +	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
>> +	if (prop) {
> 
>         if (!prop)
>                 return 1;
> 
> And then everything below can be unindented.
> 
>> +		u64 addr = 0;
>> +		s64 ret;
>> +		const struct opal_fadump_mem_struct *r_opal_fdm_active;
> 
>   *
>  / \
>  /_\
>   |
> 

:) Will take care of such instances...
I think this should be added to checkpatch.pl

>> +
>> +		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
>> +		if ((ret != OPAL_SUCCESS) || !addr) {
>> +			pr_err("Failed to get Kernel metadata (%lld)\n", ret);
>> +			return 1;
>> +		}
>> +
>> +		addr = be64_to_cpu(addr);
>> +		pr_debug("Kernel metadata addr: %llx\n", addr);
>> +
>> +		opal_fdm_active = __va(addr);
>> +		r_opal_fdm_active = (void *)addr;
> 
> Why do we need the r_ version?
> 
> We're called early in boot, so we are still in real mode, but that's
> fine the CPU will ignore the top bits of the virtual address for us.

I don't know if I am missing a trick here or if there is a bug somewhere
but trying to access `opal_fdm_active->version` is not working for me..

- Hari

