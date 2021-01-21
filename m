Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D79892FDDD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 01:28:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLjsY3RTGzDqgw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 11:28:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=B2uKyheb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLjqp1bczzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 11:26:29 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10L02fd7187368; Wed, 20 Jan 2021 19:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=/mtKNzmnrudwEwjWIAtKj/SObnLcmtngw7yz5z1JiCc=;
 b=B2uKyhebCsJ0LrH6cw/Ts2VP74oGaNt47SexS0zcU+YC9+mk9gJLA49+EFyd9EEvq1a7
 Gkeg1u1uV8qBz/TmAriGbyl0sUAm0CxuHgYkDX68ZunJY+lQKBCc7mFQJyFcwEdpjY38
 CsnRlOtuK1sldveAT4cJir1jwaoi4EWlKttig7i4VbL8ZgrT+b1N6G+7Ucb8OnlQ6ZAR
 2Toa05nQVVpRbtPOpf914S8/K8gQ/nByBxn0jDJetXxi/jq79IwhNdANLQEAPO1j5lJT
 kMo99ysPDXa4I35DhEi4HE5AgWp3ki1wJWNG7dZ41WX0q+K7OLsyyK8Yk7uOsx/5HWeb ew== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366x9a8xbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 19:26:21 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10L0CNUu025371;
 Thu, 21 Jan 2021 00:26:20 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3668psa5y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 00:26:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10L0QIvO22872526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 00:26:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACAC2BE04F;
 Thu, 21 Jan 2021 00:26:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85A6DBE053;
 Thu, 21 Jan 2021 00:26:18 +0000 (GMT)
Received: from localhost (unknown [9.211.72.22])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 00:26:18 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
In-Reply-To: <87czxzrel3.fsf@mpe.ellerman.id.au>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <87mtx5qp1g.fsf@mpe.ellerman.id.au> <874kjcy73z.fsf@linux.ibm.com>
 <87czxzrel3.fsf@mpe.ellerman.id.au>
Date: Wed, 20 Jan 2021 18:26:17 -0600
Message-ID: <87v9brw2xi.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_10:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101200135
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
Cc: aik@ozlabs.ru, tyreld@linux.ibm.com, brking@linux.ibm.com,
 ajd@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>> Memory locations passed as arguments from the OS to RTAS usually need
>>>> to be addressable in 32-bit mode and must reside in the Real Mode
>>>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>>>> first logical memory block reported in the LPAR=E2=80=99s device tree.
>>>>
>>>> On powerpc targets with RTAS, Linux makes available to user space a
>>>> region of memory suitable for arguments to be passed to RTAS via
>>>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>>>> API during boot in order to ensure that it satisfies the requirements
>>>> described above.
>>>>
>>>> With radix MMU, the upper limit supplied to the memblock allocation
>>>> can exceed the bounds of the first logical memory block, since
>>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB.
>>>
>>> Why does the size of the first memory block matter for radix?
>>
>> Here is my understanding: in the platform architecture, the size of the
>> first memory block equals the RMA, regardless of the MMU mode. It just
>> so happens that when using radix, Linux can pass ibm,configure-connector
>> a work area address outside of the RMA because the allocation
>> constraints for the work area are computed differently. It would be
>> wrong of the OS to pass RTAS arguments outside of this region with hash
>> MMU as well.
>
> If that's the requirement then shouldn't we be adjusting ppc64_rma_size?
> Otherwise aren't other uses of ppc64_rma_size going to run into similar
> problems.

Not all allocations limited by ppc64_rma_size set up memory that is
passed to RTAS though, do they? e.g. emergency_stack_init and
init_fallback_flush? Those shouldn't be confined to the first LMB
unnecessarily.

That's why I'm thinking what I've written here should be generalized a
bit and placed in an early allocator function that can be used to set up
the user region and the per-cpu reentrant RTAS argument buffers
(see allocate_paca_ptrs/new_rtas_args). So far those two sites are the
only ones I'm convinced need attention.
