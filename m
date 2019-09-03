Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE76A7102
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 18:50:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NCcp3W26zDqNX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 02:50:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NC872NQMzDqTR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:29:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46NC866jLpz8t6V
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:29:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46NC865Khjz9sRc; Wed,  4 Sep 2019 02:29:10 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46NC852Vwgz9sR7
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Sep 2019 02:29:09 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x83GNJ95021806
 for <linuxppc-dev@ozlabs.org>; Tue, 3 Sep 2019 12:29:07 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2usu0bsw4q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 03 Sep 2019 12:29:07 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 3 Sep 2019 17:29:04 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 17:29:02 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x83GT0ab49020954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 16:29:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C1C8A405E;
 Tue,  3 Sep 2019 16:29:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 762EBA4059;
 Tue,  3 Sep 2019 16:28:58 +0000 (GMT)
Received: from [9.85.81.203] (unknown [9.85.81.203])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 16:28:58 +0000 (GMT)
Subject: Re: [PATCH v5 10/31] opal: add MPIPL interface definitions
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630272066.8896.14185583668659839717.stgit@hbathini.in.ibm.com>
 <87tv9tr5yc.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Tue, 3 Sep 2019 21:58:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87tv9tr5yc.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090316-0020-0000-0000-000003672E62
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090316-0021-0000-0000-000021BC997A
Message-Id: <aa997e57-3d51-94b6-c587-79aededcafa2@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030167
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
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/09/19 4:40 PM, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
>> index 383242e..c8a5665 100644
>> --- a/arch/powerpc/include/asm/opal-api.h
>> +++ b/arch/powerpc/include/asm/opal-api.h
>> @@ -980,6 +983,50 @@ struct opal_sg_list {
>>  };
>>  
>>  /*
>> + * Firmware-Assisted Dump (FADump) using MPIPL
>> + */
>> +
>> +/* MPIPL update operations */
>> +enum opal_mpipl_ops {
>> +	OPAL_MPIPL_ADD_RANGE			= 0,
>> +	OPAL_MPIPL_REMOVE_RANGE			= 1,
>> +	OPAL_MPIPL_REMOVE_ALL			= 2,
>> +	OPAL_MPIPL_FREE_PRESERVED_MEMORY	= 3,
>> +};
>> +
>> +/*
>> + * Each tag maps to a metadata type. Use these tags to register/query
>> + * corresponding metadata address with/from OPAL.
>> + */
>> +enum opal_mpipl_tags {
>> +	OPAL_MPIPL_TAG_CPU		= 0,
>> +	OPAL_MPIPL_TAG_OPAL		= 1,
>> +	OPAL_MPIPL_TAG_KERNEL		= 2,
>> +	OPAL_MPIPL_TAG_BOOT_MEM		= 3,
>> +};
>> +
>> +/* Preserved memory details */
>> +struct opal_mpipl_region {
>> +	__be64	src;
>> +	__be64	dest;
>> +	__be64	size;
>> +};
>> +
>> +/* FADump structure format version */
>> +#define MPIPL_FADUMP_VERSION			0x01
>> +
>> +/* Metadata provided by OPAL. */
>> +struct opal_mpipl_fadump {
>> +	u8				version;
>> +	u8				reserved[7];
>> +	__be32				crashing_pir;
>> +	__be32				cpu_data_version;
>> +	__be32				cpu_data_size;
>> +	__be32				region_cnt;
>> +	struct opal_mpipl_region	region[];
>> +} __attribute__((packed));
>> +
> 
> The above hunk is in the wrong place vs the skiboot header. Please put
> things in exactly the same place in the skiboot and kernel versions of
> the header.
> 
> After your kernel & skiboot patches are applied, the result of:
> 
>  $ git diff ~/src/skiboot/include/opal-api.h arch/powerpc/include/asm/opal-api.h
> 
> Should not include anything MPIPL/fadump related.

Sure.

> 
>> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
>> index 57bd029..878110a 100644
>> --- a/arch/powerpc/include/asm/opal.h
>> +++ b/arch/powerpc/include/asm/opal.h
>> @@ -39,6 +39,12 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
>>  				uint64_t PE_handle);
>>  int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
>>  			uint64_t rate_phys, uint32_t size);
>> +
>> +int64_t opal_mpipl_update(enum opal_mpipl_ops op, u64 src,
>> +			  u64 dest, u64 size);
>> +int64_t opal_mpipl_register_tag(enum opal_mpipl_tags tag, uint64_t addr);
>> +int64_t opal_mpipl_query_tag(enum opal_mpipl_tags tag, uint64_t *addr);
>> +
> 
> Please consistently use kernel types for new prototypes in here.

uint64_t instead of 'enum's?

- Hari

