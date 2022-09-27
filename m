Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C60115EB87C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 05:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc4Xm56Scz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 13:16:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f0sjROCY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f0sjROCY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc4X44ccjz3bWM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 13:16:04 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R3EGpc019833;
	Tue, 27 Sep 2022 03:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bLahLIU0KXKrxefN9ud2bAttHAwEiJevFqzaYPSm16g=;
 b=f0sjROCYPZUPKXaMzMI0LZloG0GuFt2+dxBeEdGRbvJ5GHzYHIWRjXWGWRwd+7VR82Cg
 qm/Xb+8Q9dCKLAiefXlsKFFxX4iENEdr024ebKdlEeCWr+P3oz2CINdE0x6cjUGfC6JA
 0UJz4BYiXGfGFi9ivoxQ00U1Sy3QqKRlrq+sQ0wpkVy0rfkNDEJq1W9PNnQK3fg6dvQk
 pPkGpCxLtXof4Sv2aq5bSaHKJDz0xfnYGx7Nd8uY2gZicAV0nyxRdaSkHl+H2ep1tphN
 SH/eHPJnilt7xhbzeecDIu9PMbGx0dsCKrBHoBe0G7ocAyUQNDY+jU08EfbxViULukRz QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jus3hg0w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 03:15:45 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28R3FiL9027975;
	Tue, 27 Sep 2022 03:15:44 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jus3hg0vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 03:15:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28R35Xb5013630;
	Tue, 27 Sep 2022 03:15:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3jssh8tcng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 03:15:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28R3BRPw50659834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Sep 2022 03:11:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5021F11C054;
	Tue, 27 Sep 2022 03:15:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A416A11C04C;
	Tue, 27 Sep 2022 03:15:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 27 Sep 2022 03:15:39 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8F9D26057E;
	Tue, 27 Sep 2022 12:57:26 +1000 (AEST)
Message-ID: <ae7b4dfa7887ad1a4b3156dfc5c012bf73a1d8d6.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/6] powerpc/code-patching: Implement generic text
 patching function
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 27 Sep 2022 12:57:26 +1000
In-Reply-To: <cf9a6312-7a23-1000-8c28-4dbc1553db24@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
	 <20220926064316.765967-2-bgray@linux.ibm.com>
	 <cf9a6312-7a23-1000-8c28-4dbc1553db24@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CXJxFWbKexXGP4daPHMB0HUKHSz6RjDh
X-Proofpoint-ORIG-GUID: n7lp1ylRmJBg5YMdF1EegWKf5PDs1yAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_11,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270016
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

On Mon, 2022-09-26 at 14:33 +0000, Christophe Leroy wrote:
> > +#define patch_memory(addr, val) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BUILD_BUG_ON(!__native_word(=
val)); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__patch_memory(addr, (unsign=
ed long) val, sizeof(val)); \
> > +})
>=20
> Can you do a static __always_inline function instead of a macro here
> ?

I didn't before because it doesn't allow using the type as a parameter.
I considered these forms

  patch_memory(addr, val, 8);
  patch_memory(addr, val, void*);
  patch_memory(addr, val);  // size taken from val type

And thought the third was the nicest to use. Though coming back to
this, I hadn't considered

  patch_memory(addr, val, sizeof(void*))

which would still allow a type to decide the size, and not be a macro.
I've got an example implementation further down that also addresses the
size check issue.

> > +static int __always_inline ___patch_memory(void *patch_addr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long data,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *prog_addr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size)
>=20
> Is it really needed in the .c file ? I would expect GCC to take the=20
> right decision by itself.

I thought it'd be better to always inline it given it's only used
generically in do_patch_memory and __do_patch_memory, which both get
inlined into __patch_memory. But it does end up generating two copies
due to the different contexts it's called in, so probably not worth it.
Removed for v3.

(raw_patch_instruction gets an optimised inline of ___patch_memory
either way)

> A BUILD_BUG() would be better here I think.

BUILD_BUG() as the default case always triggers though, I assume
because the constant used for size is too far away. How about

  static __always_inline int patch_memory(void *addr,=C2=A0
                                          unsigned long val,=C2=A0
                                          size_t size)=C2=A0
  {
      int __patch_memory(void *dest, unsigned long src, size_t size);

      BUILD_BUG_ON_MSG(!(size =3D=3D sizeof(char)  ||
                         size =3D=3D sizeof(short) ||
                         size =3D=3D sizeof(int)   ||
                         size =3D=3D sizeof(long)),
                       "Unsupported size for patch_memory");
      return __patch_memory(addr, val, size);
  }

Declaring the __patch_memory function inside of patch_memory enforces
that you can't accidentally call __patch_memory without going through
this or the *patch_instruction entry points (which hardcode the size).

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__put_kernel_nofault(patch_addr, &val, u32,
> > failed);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0u64 val =3D ppc_inst_as_ulong(instr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dcbst(patch_addr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dcbst(patch_addr + size - 1)=
; /* Last byte of data may
> > cross a cacheline */
>=20
> Or the second byte of data may cross a cacheline ...

It might, but unless we are assuming data cachelines smaller than the
native word size it will either be in the first or last byte's
cacheline. Whereas the last byte might be in it's own cacheline.

As justification the comment's misleading though, how about reducing it
to "data may cross a cacheline" and leaving the reason for flushing the
last byte implicit?

> > -static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
> > +static int __always_inline __do_patch_memory(void *dest, unsigned
> > long src, size_t size)
> > =C2=A0 {
>=20
> Whaou, do we really want all this to be __always_inline ? Did you
> check=20
> the text size increase ?

These ones are redundant because GCC will already inline them, they
were just part of experimenting inlining ___patch_memory. Will remove
for v3.=C2=A0

The text size doesn't increase though because the call hierarchy is
just a linear chain of
__patch_memory -> do_patch_memory=C2=A0-> __do_patch_memory

The entry point __patch_memory is not inlined.
