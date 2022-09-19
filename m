Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F105BC31A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 08:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWFgC3PvXz30MT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:50:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YodRFNAg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YodRFNAg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWFfT0g76z2yRH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 16:49:52 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J56FQ4005386;
	Mon, 19 Sep 2022 06:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=La9mpDMc0nafU8r314iLJmzSSTtAdERr9B5zYcIJDt8=;
 b=YodRFNAgjIWKZ/kHvyNg8p0S/nuplSmMdPS/w4Ty6sitchUlT+qWUDmNQ28kSU5SUonr
 94gl6/aNuXRmYPPvOChzwlu/xxmSIkj6NzjsKU6ddXO/DKWV1xVnTXkUg20R7V6O0vq4
 YaELebo/yTO2FdIfw8DtwLUugik5IcX1JVMp7n7uU6di7+7wzn5QrLT9xOwKadXTXjWm
 vlr6igi2iAkZ5Y5MmP5jVHSfPcp91cAH1VhEWB6QJbFfcsc9jP+LU3h68ls78GwwhLoi
 afxle3sM7kpAE8GFUc4YRvoqBwbfOhBDHav3K9WqTAn1qyZV0GWjzLpbQ13toDJI57t+ tA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpaqb9y6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 06:49:28 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28J6AOj4013715;
	Mon, 19 Sep 2022 06:49:27 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpaqb9y69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 06:49:27 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28J6ZpZA008387;
	Mon, 19 Sep 2022 06:49:25 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma05fra.de.ibm.com with ESMTP id 3jn5v8sfm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 06:49:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28J6nNrS40042902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 06:49:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08297A404D;
	Mon, 19 Sep 2022 06:49:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B3B6A4053;
	Mon, 19 Sep 2022 06:49:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 19 Sep 2022 06:49:22 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 73B65602EA;
	Mon, 19 Sep 2022 16:49:13 +1000 (AEST)
Message-ID: <ff06e95c7f85f0b33e3573c46f9d9fe7ddffba2d.camel@linux.ibm.com>
Subject: Re: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 19 Sep 2022 16:49:13 +1000
In-Reply-To: <4c19a0fa-6af0-e71a-deaf-b150eeec6381@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
	 <20220916062330.430468-2-bgray@linux.ibm.com>
	 <4c19a0fa-6af0-e71a-deaf-b150eeec6381@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 73RXf5HwWRlllT8LoakyjEHD06miVfQ6
X-Proofpoint-GUID: gSlMiGPcXkL4gkf-8qm8alCLMzK0xoUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190042
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-09-19 at 06:04 +0000, Christophe Leroy wrote:
> With CONFIG_STRICT_KERNEL_RWX, this patches causes a 15% time
> increase=20
> for activation/deactivation of ftrace.

It's possible that new alignment check is the cause. I'll see


> Without CONFIG_STRICT_KERNEL_RWX, it doesn't build.

Yup, fixed for v2

> > +static int __patch_text(void *dest, const void *src, size_t size,
> > bool is_exec, void *exec_addr)
>=20
> Is 'text' a good name ? For me text mean executable code. Should it
> be=20
> __patch_memory() ?

Well patching regular memory is just a normal store. Text to me implies
its non-writeable. Though __patch_memory would be fine.

> Why pass src as a void * ? This forces data to go via the stack.
> Can't=20
> you pass it as a 'long' ?

Probably, I wasn't aware that it would make a difference. I prefer
pointers in general for their semantic meaning, but will change if it
affects param passing.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (virt_to_pfn(dest) !=3D v=
irt_to_pfn(dest + size - 1))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EFAULT;
>=20
> Why do you need that new check ?

If the patch crosses a page boundary then letting it happen is
unpredictable. Though perhaps this requirement can just be put as a
comment, or require that patches be aligned to the patch size.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0case 8:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__put_=
kernel_nofault(dest, src, u64,
> > failed);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
>=20
> Is case 8 needed for PPC32 ?

I don't have a particular need for it, but the underlying
__put_kernel_nofault is capable of it so I included it.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> Do you catch it when size if none of 1,2,4,8 ?
>=20

Not yet. Perhaps I should wrap patch_text_data in a macro that checks
the size with BUILD_BUG_ON? I'd rather not check at runtime.

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm ("dcbst 0, %0; sync" :: =
"r" (dest));
>=20
> Maybe write it in C:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dcbst(dest);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mb(); /* sync */
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (is_exec)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0asm ("icbi 0,%0; sync; isync" :: "r" (exec_addr));
>=20
> Same, can be:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (is_exec) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0icbi(exec_addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0mb(); /* sync */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0isync();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> Or keep it flat:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!is_exec)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0icbi(exec_addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mb(); /* sync */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isync();
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;

Will try this.

> > +static int do_patch_text(void *dest, const void *src, size_t size,
> > bool is_exec)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int err;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pte_t *pte;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 *patch_addr;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pte =3D start_text_patch(des=
t, &patch_addr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D __patch_text(patch_a=
ddr, src, size, is_exec, dest);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0finish_text_patch(pte);
>=20
> Why do you need to split this function in three parts ? I can't see
> the=20
> added value, all it does is reduce readability.

It made it more readable to me, so the __patch_text didn't get buried.
It also made it easier to do the refactoring, and potentially add code
patching variants that use the poke area but not __patch_text. I'll
remove it for v2 though given this is the only use right now.

> Did you check the impact of calling __this_cpu_read() twice ?

I wasn't concerned about performance, but given I'll merge it back
again it will only be read once in v2 again.

> > +void *patch_memory(void *dest, const void *src, size_t size)
>=20
> What is this function used for ?
>=20

Build failure apparently :)

It's removed in v2.
>=20
