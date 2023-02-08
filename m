Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6115D68F129
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 15:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBjYy2JDrz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 01:49:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o78BhQDH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o78BhQDH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBjXy0BNlz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 01:48:17 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318EfolE020107;
	Wed, 8 Feb 2023 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Y78WRnPUf5dogSmwoGN9dnJZEpvp9kGRrscQHCetKVE=;
 b=o78BhQDH1NMtNcQv1LcvzUwifWLixp1Hp87Dx9i5rQwAL2GdvXHv1ylOo/itRdEpNwzo
 EXiAjM50FzmJxUBFGmwXj6yG6v6mEgQsxgm20BKjyzZKENiGXFYbq8uDbKvGTWELHSMw
 00gai9TRvJGXCvAgrvCaKR1qZZ31cVrR7G4r8h1wgAZfN6cm4wKlLFcJ3AvltnwDgc3x
 o0JoXWcJtgmEttFnzj1gL+idJDv7W5j0ZVQrPeDDqEQIGo9ZbGA5QTxcXkPtPpyinkdB
 wsqgQnq3/n0BoPRj10C6dDNUJZ7MXMJ5H4Xpg2mKG0ErSioFA3lwuJxzx8qgSWKpYeuz Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmdqp0558-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 14:48:05 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318Eh2xW024419;
	Wed, 8 Feb 2023 14:48:04 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmdqp054q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 14:48:04 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318BYuFB003016;
	Wed, 8 Feb 2023 14:48:03 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3nhf07u6wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 14:48:03 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 318Em1UE1180174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 14:48:01 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D17158064;
	Wed,  8 Feb 2023 14:48:01 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52A0858063;
	Wed,  8 Feb 2023 14:48:01 +0000 (GMT)
Received: from localhost (unknown [9.163.2.97])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 14:48:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Submission
 Endpoint <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Kajol
 Jain <kjain@linux.ibm.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 11/19] powerpc/rtas: add work area allocator
In-Reply-To: <87o7q4wera.fsf@mpe.ellerman.id.au>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-11-9aa6bd058063@linux.ibm.com>
 <87o7q4wera.fsf@mpe.ellerman.id.au>
Date: Wed, 08 Feb 2023 08:48:01 -0600
Message-ID: <87r0v0nrha.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7lw-xMbuwfIWl9rWmJkq5-bz_q9akM42
X-Proofpoint-ORIG-GUID: HyGKjXfByEH-M5urxjBa82_ylYjPzY21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_06,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080128
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch via B4 Submission Endpoint
> <devnull+nathanl.linux.ibm.com@kernel.org> writes:
>> diff --git a/arch/powerpc/include/asm/rtas-work-area.h b/arch/powerpc/include/asm/rtas-work-area.h
>> new file mode 100644
>> index 000000000000..76ccb039cc37
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/rtas-work-area.h
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef POWERPC_RTAS_WORK_AREA_H
>> +#define POWERPC_RTAS_WORK_AREA_H
>
> The usual style would be _ASM_POWERPC_RTAS_WORK_AREA_H.

OK. (will change in all new headers)

>> +static struct rtas_work_area_allocator_state {
>> +	struct gen_pool *gen_pool;
>> +	char *arena;
>> +	struct mutex mutex; /* serializes allocations */
>> +	struct wait_queue_head wqh;
>> +	mempool_t descriptor_pool;
>> +	bool available;
>> +} rwa_state_ = {
>> +	.mutex = __MUTEX_INITIALIZER(rwa_state_.mutex),
>> +	.wqh = __WAIT_QUEUE_HEAD_INITIALIZER(rwa_state_.wqh),
>> +};
>> +static struct rtas_work_area_allocator_state *rwa_state = &rwa_state_;
>
> I assumed the pointer was so you could swap this out at runtime or
> something, but I don't think you do.
>
> Any reason not to drop the pointer and just use rwa_state.foo accessors?
> That would also allow the struct to be anonymous.
>
> Or if you have the pointer you can at least make it NULL prior to init
> and avoid the need for "available".

I think it's there because earlier versions of this that I never posted
had unit tests. I'll either resurrect those or reduce the indirection.


>> +/*
>> + * A single work area buffer and descriptor to serve requests early in
>> + * boot before the allocator is fully initialized.
>> + */
>> +static bool early_work_area_in_use __initdata;
>> +static char early_work_area_buf[SZ_4K] __initdata;
>
> That should be page aligned I think?

Yes. It happens to be safe in this version because ibm,get-system-parameter,
which has no alignment requirement, is the only function used early
enough to use the buffer. But that's too fragile.


>> +static struct rtas_work_area early_work_area __initdata = {
>> +	.buf = early_work_area_buf,
>> +	.size = sizeof(early_work_area_buf),
>> +};
>> +
>> +
>> +static struct rtas_work_area * __init rtas_work_area_alloc_early(size_t size)
>> +{
>> +	WARN_ON(size > early_work_area.size);
>> +	WARN_ON(early_work_area_in_use);
>> +	early_work_area_in_use = true;
>> +	memset(early_work_area.buf, 0, early_work_area.size);
>> +	return &early_work_area;
>> +}
>> +
>> +static void __init rtas_work_area_free_early(struct rtas_work_area *work_area)
>> +{
>> +	WARN_ON(work_area != &early_work_area);
>> +	WARN_ON(!early_work_area_in_use);
>> +	early_work_area_in_use = false;
>> +}
>> +
>> +struct rtas_work_area * __ref rtas_work_area_alloc(size_t size)
>> +{
>> +	struct rtas_work_area *area;
>> +	unsigned long addr;
>> +
>> +	might_sleep();
>> +
>> +	WARN_ON(size > RTAS_WORK_AREA_MAX_ALLOC_SZ);
>> +	size = min_t(size_t, size, RTAS_WORK_AREA_MAX_ALLOC_SZ);
>
> This seems unsafe.
>
> If you return a buffer smaller than the caller asks for they're likely
> to read/write past the end of it and corrupt memory.

OK, let's figure out another way to handle this.

> AFAIK genalloc doesn't have guard pages or anything fancy to save us
> from that - but maybe I'm wrong, I've never used it.

Yeah we would have to build our own thing on top of it. And I don't
think it could be something that traps on access, it would have to be a
check in rtas_work_area_free(), after the fact.

> There's only three callers in the end, seems like we should just return
> NULL if the size is too large and have callers check the return value.

There are more conversions to do, and a property I hope to maintain is
that requests can't fail. Existing users of rtas_data_buf don't have
error paths for failure to acquire the buffer.

I believe the allocation size passed to rtas_work_area_alloc() can be
known at build time in all cases. Maybe we could prevent inappropriate
requests from being built with a compile-time assertion (untested):

/* rtas-work-area.h */

static inline struct rtas_work_area *rtas_work_area_alloc(size_t sz)
{
	static_assert(sz < RTAS_WORK_AREA_MAX_ALLOC_SZ);
        return __rtas_work_area_alloc(sz);
}

I think this would be OK? If I can't make it work I'll fall back to
returning NULL as you suggest, but it will make for more churn (and
risk) in the conversions.


>> +	if (!rwa_state->available) {
>> +		area = rtas_work_area_alloc_early(size);
>> +		goto out;
>> +	}
>> +
>> +	/*
>> +	 * To ensure FCFS behavior and prevent a high rate of smaller
>> +	 * requests from starving larger ones, use the mutex to queue
>> +	 * allocations.
>> +	 */
>> +	mutex_lock(&rwa_state->mutex);
>> +	wait_event(rwa_state->wqh,
>> +		   (addr = gen_pool_alloc(rwa_state->gen_pool, size)) != 0);
>> +	mutex_unlock(&rwa_state->mutex);
>> +
>> +	area = mempool_alloc(&rwa_state->descriptor_pool, GFP_KERNEL);
>> +	*area = (typeof(*area)){
>> +		.size = size,
>> +		.buf = (char *)addr,
>> +	};
>
> That is an odd way to write that :)

yeah I'll change it.

>
>> +out:
>> +	pr_devel("%ps -> %s() -> buf=%p size=%zu\n",
>> +		 (void *)_RET_IP_, __func__, area->buf, area->size);
>
> Can we drop those? They need a recompile to enable, so if someone needs
> debugging they can just rewrite them - or use some sort of tracing
> instead.

Sure.


>> +machine_arch_initcall(pseries, rtas_work_area_allocator_init);
>
> Should it live in platforms/pseries then?

Yeah it probably ought to. I am pretty sure the "work area" construct is
PAPR-specific, and I haven't found any evidence that it's used on
non-pseries.


>> +/**
>> + * rtas_work_area_reserve_arena() - reserve memory suitable for RTAS work areas.
>> + */
>> +int __init rtas_work_area_reserve_arena(const phys_addr_t limit)
>> +{
>> +	const phys_addr_t align = RTAS_WORK_AREA_ARENA_ALIGN;
>> +	const phys_addr_t size = RTAS_WORK_AREA_ARENA_SZ;
>> +	const phys_addr_t min = MEMBLOCK_LOW_LIMIT;
>> +	const int nid = NUMA_NO_NODE;
>
> This should probably also be restricted to pseries?

Yes.
