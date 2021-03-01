Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5B327617
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 03:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpkfb1GDxz3cbv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 13:26:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SzmW73ko;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SzmW73ko; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpkf66GTsz30Ms
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 13:26:21 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121246hE189660; Sun, 28 Feb 2021 21:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=5aUEkC+XhBIU3CBIrTgWSI1d3j2jt9xZ7j9G7TXSIB8=;
 b=SzmW73koYiYGSzY8s7Uv4gywQwa6POvC23Hk5hnjE7yx5pRFsoSI7pPaYv6GjYxgth+W
 Hzwcn59BLqsX3t8NQznDi3M15MBEKLJM0p4sWBdDNezR1wVl/q2XyXuqHYZO1Ptl51In
 4UBBMNf0HKmtXHHMwdgj8RILEkVAwYfelF5qmFEwXHNW21X3JGFy108thZ91dYu4m9Yr
 pmgsPGRojFIVEsnVUY01WSEIX5TI6oyZdT7qZTJtlWo9yv8xZp7hQpUkq7VTFb75Jhz0
 QO0Yj+zlMfZ1/JPxV+LALJTmJubhEO6x9IpAh8rzJ2zAYhTTcfC9/YLTCGB5d+3zVkNx UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3704gg665n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Feb 2021 21:26:08 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12125j2i193698;
 Sun, 28 Feb 2021 21:26:08 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3704gg664y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Feb 2021 21:26:08 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1212MVje023394;
 Mon, 1 Mar 2021 02:26:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 36ydq80q9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 02:26:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1212Q4wK40239530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Mar 2021 02:26:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E37EAE045;
 Mon,  1 Mar 2021 02:26:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 426ECAE04D;
 Mon,  1 Mar 2021 02:25:42 +0000 (GMT)
Received: from [9.195.36.63] (unknown [9.195.36.63])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  1 Mar 2021 02:25:37 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH V2] powerpc/perf: Fix handling of privilege level checks
 in perf interrupt context
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YDjA0giNnkfHeYM5@hirez.programming.kicks-ass.net>
Date: Mon, 1 Mar 2021 07:52:27 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <47F7754C-9F97-4548-ACA4-E88CA1D393C1@linux.vnet.ibm.com>
References: <1614247839-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YDjA0giNnkfHeYM5@hirez.programming.kicks-ass.net>
To: Peter Zijlstra <peterz@infradead.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-28_12:2021-02-26,
 2021-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010015
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, omosnace@redhat.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Feb-2021, at 3:05 PM, Peter Zijlstra <peterz@infradead.org> =
wrote:
>=20
> On Thu, Feb 25, 2021 at 05:10:39AM -0500, Athira Rajeev wrote:
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 4b4319d8..c8be44c 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -222,7 +222,7 @@ static inline void perf_get_data_addr(struct =
perf_event *event, struct pt_regs *
>> 	if (!(mmcra & MMCRA_SAMPLE_ENABLE) || sdar_valid)
>> 		*addrp =3D mfspr(SPRN_SDAR);
>>=20
>> -	if (is_kernel_addr(mfspr(SPRN_SDAR)) && =
perf_allow_kernel(&event->attr) !=3D 0)
>> +	if (is_kernel_addr(mfspr(SPRN_SDAR)) && =
event->attr.exclude_kernel)
>> 		*addrp =3D 0;
>> }
>>=20
>> @@ -507,7 +507,7 @@ static void power_pmu_bhrb_read(struct perf_event =
*event, struct cpu_hw_events *
>> 			 * addresses, hence include a check before =
filtering code
>> 			 */
>> 			if (!(ppmu->flags & PPMU_ARCH_31) &&
>> -				is_kernel_addr(addr) && =
perf_allow_kernel(&event->attr) !=3D 0)
>> +			    is_kernel_addr(addr) && =
event->attr.exclude_kernel)
>> 				continue;
>>=20
>> 			/* Branches are read most recent first (ie. =
mfbhrb 0 is
>=20
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>


Thanks Peter for reviewing the patch.

Athira.=
