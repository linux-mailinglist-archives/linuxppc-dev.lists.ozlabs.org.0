Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7667268F248
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 16:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBkpP2pV8z3f5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 02:45:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lUwkeB78;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lUwkeB78;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBknT5lvqz3bY1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 02:44:13 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318FKl8v037557;
	Wed, 8 Feb 2023 15:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Nw/vCQb+bwR6mjiVo7k3dVMEaIWApRDaZxM5SxIW7Yo=;
 b=lUwkeB78ZuthNZ/MzDGeYXcMigRcNkT9BKHnzJzPQvQBtgd0z8S3TgyLqZMDjyfJED6k
 6PU7bMjKQ6GZkWFnZtiqokqfcC63yGZECFeBHkRREaq74qj9x/+/sJGP19HswSSYantZ
 zH+j1PERkKe5/k5c4TFGFAcw63JlrXbkqkB3WJmG3eGYyxL2HYyghvqX6cTZxqtqdylf
 Iobo9JIan4pTOhE6leU2QYQYhzK5jflQGBGo7pQsw+O819hmCYyoEQ2nrLnWmJr6uCc5
 wftUB4RW7waLef51JxWHDy49wIvvHBjMLayj+NK47dAL+EpHuj6HKPSdh4UrtYrpwQvL gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmea0s8yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 15:44:04 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318FLNxI039050;
	Wed, 8 Feb 2023 15:44:04 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmea0s8vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 15:44:04 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318FNkLC001961;
	Wed, 8 Feb 2023 15:44:03 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3nhf07keg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 15:44:03 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 318Fi1EX5636698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 15:44:02 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC83B5806A;
	Wed,  8 Feb 2023 15:44:01 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9855158064;
	Wed,  8 Feb 2023 15:44:01 +0000 (GMT)
Received: from localhost (unknown [9.163.2.97])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 15:44:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
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
Subject: Re: [PATCH v2 18/19] powerpc/rtas: introduce rtas_function_token() API
In-Reply-To: <87lel8we7x.fsf@mpe.ellerman.id.au>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-18-9aa6bd058063@linux.ibm.com>
 <87lel8we7x.fsf@mpe.ellerman.id.au>
Date: Wed, 08 Feb 2023 09:44:01 -0600
Message-ID: <87o7q4novy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1jeOHDSA5rwHrwMuNkxGscR3aEd3TxRY
X-Proofpoint-ORIG-GUID: ScW4lRaE8l_dmV0kkUirSvb4WcJnLkJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_06,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080138
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
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> Users of rtas_token() supply a string argument that can't be validated
>> at build time. A typo or misspelling has to be caught by inspection or
>> by observing wrong behavior at runtime.
>>
>> Since the core RTAS code now has consolidated the names of all
>> possible RTAS functions and mapped them to their tokens, token lookup
>> can be implemented using symbolic constants to index a static array.
>>
>> So introduce rtas_function_token(), a replacement API which does that,
>> along with a rtas_service_present()-equivalent helper,
>> rtas_function_implemented(). Callers supply an opaque predefined
>> function handle which is used internally to index the function
>> table. Typos or other inappropriate arguments yield build errors, and
>> the function handle is a type that can't be easily confused with RTAS
>> tokens or other integer types.
>
> Why not go all the way and have the rtas_call() signature be:
>
>   int rtas_call(rtas_fn_handle_t fn, int, int, int *, ...);
>
>
> And have it do the token lookup internally? That way a caller can never
> inadvertantly pass a random integer to rtas_call().
>
> And instead of eg:
>
> 	error = rtas_call(rtas_function_token(RTAS_FN_GET_TIME_OF_DAY), 0, 8, ret);
>
> we'd just need:
>
> 	error = rtas_call(RTAS_FN_GET_TIME_OF_DAY, 0, 8, ret);
>
>
> Doing the conversion all at once might be tricky. So maybe we need to add
> rtas_fn_call() which takes rtas_fn_handle_t so we can convert cases individually?
>
> Anyway just a thought. I guess we could merge this as-is and then do a
> further change to use rtas_fn_handle_t later.

You read my mind :-) But I want to go further and make the eventual
replacement for rtas_call() non-variadic, which will eliminate another
class of usage error.

Getting more ambitious: the ideal situation IMO would be that every use
of rtas_call() or its replacement is tidily contained in a C function in
kernel/rtas.c, where complexities like retries and error code
translation can be performed in a uniform way.

Anyway, a transition away from rtas_call(), whatever form it takes,
probably needs to happen incrementally.

>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 41c430dc40c2..17e59306ce63 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -453,6 +453,26 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
>>  	},
>>  };
>>  
>> +/**
>> + * rtas_function_token() - RTAS function token lookup.
>> + * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
>> + *
>> + * Context: Any context.
>> + * Return: the token value for the function if implemented by this platform,
>> + *         otherwise RTAS_UNKNOWN_SERVICE.
>> + */
>> +s32 rtas_function_token(const rtas_fn_handle_t handle)
>> +{
>> +	const size_t index = handle.index;
>> +	const bool out_of_bounds = index >= ARRAY_SIZE(rtas_function_table);
>> +
>> +	if (WARN_ONCE(out_of_bounds, "invalid function index %zu", index))
>> +		return RTAS_UNKNOWN_SERVICE;
>
> This needs:
>
> +	// If RTAS is not present or not initialised (yet) return unknown
> +	if (!rtas.dev)
> +		return RTAS_UNKNOWN_SERVICE;
> +
>
> Otherwise powernv breaks because it looks up tokens and gets back 0,
> because we never got as far as rtas_function_table_init() (to set all the
> tokens to RTAS_UNKNOWN_SERVICE), because we bailed out at the start of
> rtas_initialize() when we found no /rtas node.

Oh! OK, thanks.
