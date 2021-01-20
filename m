Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C39B2FC5F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 01:41:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL6CF6pFCzDqxX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 11:41:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MnWsMJPd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL69P1wJlzDqvY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 11:39:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10K0VYY9129863; Tue, 19 Jan 2021 19:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Okur1r/0S2RByMZx9Zoi3iq9hvnuT6E8bDnqtseireE=;
 b=MnWsMJPdk8LOyHRtaFIJKyF1+TQAL5soViujBYudS4l8kATWJblJvBev9m4Gf6M+Dnee
 17r+lPWGXWEffFzNJ8/dHkUKi1y0Wmug8jbcrWfVNUwYb7+BMnE4dJg0KDqKi2HkjcJU
 R61rS2Mofp1XHHGk6nYdT0VcUI5yPSeup77Gxrvh0NWBNV1LRniBTPH7IzZA0kXGsbIa
 G8tbwwJnSWvfzxyunjijsAK/g0ve0c/cILaRJkHDu6Y6jtUy2wJ6CA7u+1yzFDcjXxDl
 g13BJXUStC67Xi0Qpt9KobVl4A2c2xzws4RArMjN38wj7+ZuZddret2H47q4eleE53S9 /g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36696xs5mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 19:39:32 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10K0ZSXW013245;
 Wed, 20 Jan 2021 00:39:31 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 3668s70e0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 00:39:31 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10K0dVLW26673494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 00:39:31 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4975B12405A;
 Wed, 20 Jan 2021 00:39:31 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C55124055;
 Wed, 20 Jan 2021 00:39:31 +0000 (GMT)
Received: from localhost (unknown [9.211.72.22])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 00:39:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
In-Reply-To: <3c5141d5-ee78-3771-3410-37635d423945@ozlabs.ru>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
 <87czy6xlap.fsf@linux.ibm.com>
 <3c5141d5-ee78-3771-3410-37635d423945@ozlabs.ru>
Date: Tue, 19 Jan 2021 18:39:30 -0600
Message-ID: <871regxwzh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_15:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190128
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
> On 16/01/2021 02:38, Nathan Lynch wrote:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>> On 15/01/2021 09:00, Nathan Lynch wrote:
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
>>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
>>>> a common size of the first memory block according to a small sample of
>>>> LPARs I have checked.) This leads to failures when user space invokes
>>>> an RTAS function that uses a work area, such as
>>>> ibm,configure-connector.
>>>>
>>>> Alter the determination of the upper limit for rtas_rmo_buf's
>>>> allocation to consult the device tree directly, ensuring placement
>>>> within the RMA regardless of the MMU in use.
>>>
>>> Can we tie this with RTAS (which also needs to be in RMA) and simply add
>>> extra 64K in prom_instantiate_rtas() and advertise this address
>>> (ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do
>>> not need this RMO area before that point.
>>=20
>> Can you explain more about what advantage that would bring? I'm not
>> seeing it. It's a more significant change than what I've written
>> here.
>
>
> We already allocate space for RTAS and (like RMO) it needs to be in RMA,=
=20
> and RMO is useless without RTAS. We can reuse RTAS allocation code for=20
> RMO like this:

When you say RMO I assume you are referring to rtas_rmo_buf? (I don't
think it is well-named.)


> =3D=3D=3D
> diff --git a/arch/powerpc/kernel/prom_init.c=20
> b/arch/powerpc/kernel/prom_init.c
> index e9d4eb6144e1..d9527d3e01d2 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1821,7 +1821,8 @@ static void __init prom_instantiate_rtas(void)
>          if (size =3D=3D 0)
>                  return;
>
> -       base =3D alloc_down(size, PAGE_SIZE, 0);
> +       /* One page for RTAS, one for RMO */

One page for RTAS? RTAS is ~20MB on LPARs I've checked:

# lsprop /proc/device-tree/rtas/{rtas-size,linux,rtas-base}
/proc/device-tree/rtas/rtas-size
		 01370000 (20381696)

> +       base =3D alloc_down(size, PAGE_SIZE + PAGE_SIZE, 0);

This changes the alignment but not the size of the allocation.


>          if (base =3D=3D 0)
>                  prom_panic("Could not allocate memory for RTAS\n");
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index d126d71ea5bd..885d95cf4ed3 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1186,6 +1186,7 @@ void __init rtas_initialize(void)
>          rtas.size =3D size;
>          no_entry =3D of_property_read_u32(rtas.dev, "linux,rtas-entry",=
=20
> &entry);
>          rtas.entry =3D no_entry ? rtas.base : entry;
> +       rtas_rmo_buf =3D rtas.base + PAGE_SIZE;

I think this would overlay the user region on top of the RTAS private
data area, allowing user space to corrupt it.


>
>          /* If RTAS was found, allocate the RMO buffer for it and look for
>           * the stop-self token if any
> @@ -1196,11 +1197,6 @@ void __init rtas_initialize(void)
>                  ibm_suspend_me_token =3D rtas_token("ibm,suspend-me");
>          }
>   #endif
> -       rtas_rmo_buf =3D memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_=
SIZE,
> -                                                0, rtas_region);
> -       if (!rtas_rmo_buf)
> -               panic("ERROR: RTAS: Failed to allocate %lx bytes below=20
> %pa\n",
> -                     PAGE_SIZE, &rtas_region);
> =3D=3D=3D
>
> May be store in the FDT as "linux,rmo-base" next to "linux,rtas-base",=20
> for clarity, as sharing symbols between prom and main kernel is a bit=20
> tricky.
>
> The benefit is that we do not do the same thing   (=3D=3D find 64K in RMA=
)=20
> in 2 different ways and if the RMO allocated my way is broken - we'll=20
> know it much sooner as RTAS itself will break too.

Implementation details aside... I'll grant that combining the
allocations into one in prom_init reduces some duplication in the sense
that both are subject to the same constraints (mostly - the RTAS data
area must not cross a 256MB boundary, while the user region may). But
they really are distinct concerns. The RTAS private data area is
specified in the platform architecture, the OS is obligated to allocate
it and pass it to instantiate-rtas, etc etc. However the user region
(rtas_rmo_buf) is purely a Linux construct which is there to support
sys_rtas.

Now, there are multiple sites in the kernel proper that must allocate
memory suitable for passing to RTAS. Obviously there is value in
consolidating the logic for that purpose in one place, so I'll work on
adding that in v2. OK?
