Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB51B7D7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 20:04:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4982Bb0DzLzDr4d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 04:04:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49828l6240zDr1D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 04:03:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OH3QHc119097; Fri, 24 Apr 2020 14:02:48 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jtk44bef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 14:02:46 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03OI0mWF021112;
 Fri, 24 Apr 2020 18:02:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 30fs65haxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 18:02:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03OI2fSw8454556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 18:02:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6813A4051;
 Fri, 24 Apr 2020 18:02:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30E39A4040;
 Fri, 24 Apr 2020 18:02:41 +0000 (GMT)
Received: from localhost (unknown [9.85.74.26])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 18:02:40 +0000 (GMT)
Date: Fri, 24 Apr 2020 23:32:35 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <16070946-1185-2aad-62fe-f4ed9cd4eefe@c-s.fr>
In-Reply-To: <16070946-1185-2aad-62fe-f4ed9cd4eefe@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1587750857.11mgorpnza.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_08:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240133
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 23/04/2020 =C3=A0 17:09, Naveen N. Rao a =C3=A9crit=C2=A0:
>> With STRICT_KERNEL_RWX, we are currently ignoring return value from
>> __patch_instruction() in do_patch_instruction(), resulting in the error
>> not being propagated back. Fix the same.
>=20
> Good patch.
>=20
> Be aware that there is ongoing work which tend to wanting to replace=20
> error reporting by BUG_ON() . See=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D166003

Hah, I see that you pointed out this exact issue in your review there!

I had noticed this when Russell's series for STRICT_MODULE_RWX started=20
causing kretprobe failures, due to one of the early boot-time patching=20
failing silently.

I'll defer to Michael on which patch he prefers to take, between this=20
one and the series you point out above.

>=20
>>=20
>> Fixes: 37bc3e5fd764f ("powerpc/lib/code-patching: Use alternate map for =
patch_instruction()")
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/lib/code-patching.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-pa=
tching.c
>> index 3345f039a876..5c713a6c0bd8 100644
>> --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -138,7 +138,7 @@ static inline int unmap_patch_area(unsigned long add=
r)
>>  =20
>>   static int do_patch_instruction(unsigned int *addr, unsigned int instr=
)
>>   {
>> -	int err;
>> +	int err, rc =3D 0;
>>   	unsigned int *patch_addr =3D NULL;
>>   	unsigned long flags;
>>   	unsigned long text_poke_addr;
>> @@ -163,7 +163,7 @@ static int do_patch_instruction(unsigned int *addr, =
unsigned int instr)
>>   	patch_addr =3D (unsigned int *)(text_poke_addr) +
>>   			((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
>>  =20
>> -	__patch_instruction(addr, instr, patch_addr);
>> +	rc =3D __patch_instruction(addr, instr, patch_addr);
>>  =20
>>   	err =3D unmap_patch_area(text_poke_addr);
>>   	if (err)
>> @@ -172,7 +172,7 @@ static int do_patch_instruction(unsigned int *addr, =
unsigned int instr)
>>   out:
>>   	local_irq_restore(flags);
>>  =20
>> -	return err;
>> +	return rc ? rc : err;
>=20
> That's not really consistent. __patch_instruction() and=20
> unmap_patch_area() return a valid minus errno, while in case of=20
> map_patch_area() failure, err has value -1

Not sure I follow -- I'm not changing what would be returned in those=20
cases, just also capturing return value from __patch_instruction().

If anything, I've considered the different return codes to be a good=20
thing -- return code gives you a clear idea of what exactly failed.


- Naveen

