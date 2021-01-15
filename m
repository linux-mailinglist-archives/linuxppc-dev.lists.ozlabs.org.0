Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0162F7FDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 16:40:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHQPT0cWZzDsgl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 02:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dv1Ilgr/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHQLr4MgtzDsZm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 02:38:28 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FFWGrn072321; Fri, 15 Jan 2021 10:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=+gmpWoRJsKiQQNLB5lohX7RH8KaEGcq0F8fncmB+AgQ=;
 b=dv1Ilgr/aeFlLDWCdabosrGH1U5KPsUi1BWwW2NrKvhPoGNfhAbJl6Kl33EuPpV/unIJ
 yOZrCKuCPlUyxX64uqQNzIeiqdZ8DjOejckb339fHg82NQ8DTeQjrv13ME/U+6Svceh3
 7bJuBHO9l0fhXeURjqKqVo1k5MI69fKYQjn4FkXQRahiYtZVbkW6egc7j2GfUs4iqZlb
 1CjefPQ8Xze+cD3L6qUK9y4FZhktAyu2tedpWUFm2uLfovknhyd/3Y1aJRrI1e+H5M1t
 yKqgQ64XxKFHwrJxd/EEmYXrzqhmWccR0EWXAWE8EA9ReCZ43UajPQRoAiCNc+95z/rp rw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 363d8v1gpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:38:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FFaCtj004514;
 Fri, 15 Jan 2021 15:38:24 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 35y44a91rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:38:24 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FFcNnx23265708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 15:38:23 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2421A112063;
 Fri, 15 Jan 2021 15:38:23 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5A5F112061;
 Fri, 15 Jan 2021 15:38:22 +0000 (GMT)
Received: from localhost (unknown [9.163.36.68])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 15:38:22 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
In-Reply-To: <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
Date: Fri, 15 Jan 2021 09:38:22 -0600
Message-ID: <87czy6xlap.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150095
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 15/01/2021 09:00, Nathan Lynch wrote:
>> Memory locations passed as arguments from the OS to RTAS usually need
>> to be addressable in 32-bit mode and must reside in the Real Mode
>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>> first logical memory block reported in the LPAR=E2=80=99s device tree.
>>=20
>> On powerpc targets with RTAS, Linux makes available to user space a
>> region of memory suitable for arguments to be passed to RTAS via
>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>> API during boot in order to ensure that it satisfies the requirements
>> described above.
>>=20
>> With radix MMU, the upper limit supplied to the memblock allocation
>> can exceed the bounds of the first logical memory block, since
>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
>> a common size of the first memory block according to a small sample of
>> LPARs I have checked.) This leads to failures when user space invokes
>> an RTAS function that uses a work area, such as
>> ibm,configure-connector.
>>=20
>> Alter the determination of the upper limit for rtas_rmo_buf's
>> allocation to consult the device tree directly, ensuring placement
>> within the RMA regardless of the MMU in use.
>
> Can we tie this with RTAS (which also needs to be in RMA) and simply add=
=20
> extra 64K in prom_instantiate_rtas() and advertise this address=20
> (ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do=20
> not need this RMO area before that point.

Can you explain more about what advantage that would bring? I'm not
seeing it. It's a more significant change than what I've written
here. Would it interact well with kexec?

> And probably do the same with per-cpu RTAS argument structures mentioned=
=20
> in the cover letter?

I don't think so, since those need to be allocated with the pacas and
limited to the maximum possible CPUs, which is discovered by the kernel
much later.

But maybe I misunderstand what you're suggesting.
