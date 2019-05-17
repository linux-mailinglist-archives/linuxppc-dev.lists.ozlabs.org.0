Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE521272
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 05:19:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454tnn2hnFzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 13:19:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454tmH5sYLzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 13:18:39 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4H3HAaM130766
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 23:18:35 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2shh78f6dn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 23:18:35 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Fri, 17 May 2019 04:18:35 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 04:18:32 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4H3IVkl34537632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 03:18:32 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3C40AE067;
 Fri, 17 May 2019 03:18:31 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0849DAE066;
 Fri, 17 May 2019 03:18:31 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.176.7])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 17 May 2019 03:18:30 +0000 (GMT)
References: <20190516020437.11783-1-npiggin@gmail.com>
 <d65ae686-c117-ae1c-1d48-498fdd1ea0eb@c-s.fr>
 <1557986563.56odablyi5.astroid@bobo.none>
User-agent: mu4e 1.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Make boot look nice(r)
In-reply-to: <1557986563.56odablyi5.astroid@bobo.none>
Date: Fri, 17 May 2019 00:18:26 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19051703-0040-0000-0000-000004F0CDFF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011108; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01204426; UDB=6.00632282; IPR=6.00985360; 
 MB=3.00026924; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-17 03:18:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051703-0041-0000-0000-000008FCDE1E
Message-Id: <87pnohzs3h.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170019
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello,

Nicholas Piggin <npiggin@gmail.com> writes:

> Christophe Leroy's on May 16, 2019 2:47 pm:
>>=20
>>=20
>> Le 16/05/2019 =C3=A0 04:04, Nicholas Piggin a =C3=A9crit:
>>> Radix boot looks like this:
>>>=20
>>>   -----------------------------------------------------
>>>   phys_mem_size     =3D 0x200000000
>>>   dcache_bsize      =3D 0x80
>>>   icache_bsize      =3D 0x80
>>>   cpu_features      =3D 0x0000c06f8f5fb1a7
>>>     possible        =3D 0x0000fbffcf5fb1a7
>>>     always          =3D 0x00000003800081a1
>>>   cpu_user_features =3D 0xdc0065c2 0xaee00000
>>>   mmu_features      =3D 0xbc006041
>>>   firmware_features =3D 0x0000000010000000
>>>   hash-mmu: ppc64_pft_size    =3D 0x0
>>>   hash-mmu: kernel vmalloc start   =3D 0xc008000000000000
>>>   hash-mmu: kernel IO start        =3D 0xc00a000000000000
>>>   hash-mmu: kernel vmemmap start   =3D 0xc00c000000000000
>>>   -----------------------------------------------------
>>>=20
>>> Fix:
>>>=20
>>>   -----------------------------------------------------
>>>   phys_mem_size     =3D 0x200000000
>>>   dcache_bsize      =3D 0x80
>>>   icache_bsize      =3D 0x80
>>>   cpu_features      =3D 0x0000c06f8f5fb1a7
>>>     possible        =3D 0x0000fbffcf5fb1a7
>>>     always          =3D 0x00000003800081a1
>>>   cpu_user_features =3D 0xdc0065c2 0xaee00000
>>>   mmu_features      =3D 0xbc006041
>>>   firmware_features =3D 0x0000000010000000
>>>   vmalloc start     =3D 0xc008000000000000
>>>   IO start          =3D 0xc00a000000000000
>>>   vmemmap start     =3D 0xc00c000000000000
>>>   -----------------------------------------------------
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>=20
>> I fear your change defeats most of the purpose of commit=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/?h=3Dnext-20190515&id=3De4dccf9092ab48a6f902003b9558c0e45d0e849a
>
> I think it's still a significant improvement without introducing
> the regression :)
>
>> As far as I understand, the main issue is the "hash-mmu:" prefix ?
>> That's due to the following define in top of book3s64/hash_utils.c:
>>=20
>> #define pr_fmt(fmt) "hash-mmu: " fmt
>>=20
>> Could we simply undef it just before print_system_hash_info() ?
>
> Little bit fragile I think.
>
>> Or move print_system_hash_info() in another book3s64 specific file which=
=20
>> doesn't set pr_fmt ?
>
> print_system_info() would be okay for me and allow getting rid of
> that PPC64 config. Although it also needs to go in a file without
> pr_fmt I guess that's not so hard.

Or it could use printk(KERN_INFO "...") instead of pr_info(), which I
think makes sense if the pr_fmt prefix is undesired.

--=20
Thiago Jung Bauermann
IBM Linux Technology Center

