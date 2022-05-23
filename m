Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8675308E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 07:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65mV0rqCz3btK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 15:41:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XIPnWqkZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XIPnWqkZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65ll2TJjz2xKf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 15:40:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N52Wd4003765;
 Mon, 23 May 2022 05:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=PFNuXZrAekHBAO/x4Z8zgaZi4fTp/DEHoG+j4VQcKoM=;
 b=XIPnWqkZhtO606ZAOOQ7Zto74Hiy76aIiAMCNnlvW6kzaDSGgJoW/NFPrzTCm1IyLx3n
 lUTrEIcaogdAc3UMOD7IEZAhJwRcRUoiVcK6UyfiHecfYQBNzxQbWFAQv/Lb/uI2dcYy
 yiQD9iLYJoL8T6fffvadnrRYjl3h95jr0Sf9afUvoe6krOxxq33CGlgHuBE7czgiYW5d
 yW4dvFbxE6I/mygQImciD94m1JyCx2V1crNDNMmtEvnjkb6F55VqbhIJqBV1lZgtCmOS
 vKL4Aitvgy5jI6bA+/ENmKZwl1KQ6t8Zgq9JDYMLsryfdoza8X1ROOxFjbjbwdFOhWdU YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g79vrc7vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 05:39:27 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24N5WCwG005307;
 Mon, 23 May 2022 05:39:26 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g79vrc7v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 05:39:26 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24N5GOxB032557;
 Mon, 23 May 2022 05:39:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3g6qq99uts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 05:39:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24N5cZBL32833982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 05:38:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7094CA4051;
 Mon, 23 May 2022 05:39:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01F26A404D;
 Mon, 23 May 2022 05:39:21 +0000 (GMT)
Received: from localhost (unknown [9.43.111.79])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 May 2022 05:39:20 +0000 (GMT)
Date: Mon, 23 May 2022 11:09:19 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Peter Zijlstra
 <peterz@infradead.org>, Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble>
 <b8fac6e2-c117-86cf-2901-5ae0852ca403@csgroup.eu>
 <20220512151206.dphxz5jyeshwc4jb@treble>
 <bedd240b-d5b1-72f9-156d-96d160f180d4@csgroup.eu>
 <20220521105704.GE2578@worktop.programming.kicks-ass.net>
In-Reply-To: <20220521105704.GE2578@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1653283961.ozxe2866nt.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q4XrUBLp1vLNiLkxKy3NPUZ3a81A8eAR
X-Proofpoint-GUID: TBiGA9AsHHO1NnovwnJFeyyoVBWOPvd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_01,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 spamscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230034
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra wrote:
> On Sat, May 21, 2022 at 09:38:35AM +0000, Christophe Leroy wrote:
>=20
>> I gave it a try this morning, I selected HAVE_OBJTOOL and=20
>> HAVE_OBJTOOL_MCOUNT from arch/powerpc/Kconfig
>>=20
>>=20
>> Seems like there are still some x86 arch specific stuff in common common=
=20
>> code and I get the following errors.
>=20
> I'm assuming there's a metric ton of x86 specific stuff in there.
> That'll take a while to clean out.
>=20
> Mostly Josh's rewrite was centered around splitting out the runtime
> options, but objtool is still always build with all options included,
> even the ones you're not using for your arch, which is what's triggering
> the problems you see here, I suppose...
>=20
>> Also, is it normal to get those functions built allthough I have not=20
>> selected HAVE_STACK_VALIDATION ?
>>=20
>>    CC      /home/chleroy/linux-powerpc/tools/objtool/check.o
>> check.c: In function 'has_valid_stack_frame':
>> check.c:2369:30: error: 'CFI_BP' undeclared (first use in this=20
>> function); did you mean 'CFI_SP'?
>>   2369 |         if (cfi->cfa.base =3D=3D CFI_BP &&
>>        |                              ^~~~~~
>>        |                              CFI_SP
>> check.c:2369:30: note: each undeclared identifier is reported only once=20
>> for each function it appears in
>> check.c:2371:44: error: 'CFI_RA' undeclared (first use in this=20
>> function); did you mean 'CFI_R3'?
>>   2371 |             check_reg_frame_pos(&cfi->regs[CFI_RA],=20
>> -cfi->cfa.offset + 8))
>>        |                                            ^~~~~~
>>        |                                            CFI_R3
>> check.c: In function 'update_cfi_state':
>> check.c:2499:70: error: 'CFI_BP' undeclared (first use in this=20
>> function); did you mean 'CFI_SP'?
>>   2499 |                         if (op->src.reg =3D=3D CFI_SP &&=20
>> op->dest.reg =3D=3D CFI_BP &&
>>        |=20
>>        ^~~~~~
>>        |=20
>>        CFI_SP
>> make[3]: *** [/home/chleroy/linux-powerpc/tools/build/Makefile.build:97:=
=20
>> /home/chleroy/linux-powerpc/tools/objtool/check.o] Error 1
>> make[2]: *** [Makefile:54:=20
>> /home/chleroy/linux-powerpc/tools/objtool/objtool-in.o] Error 2
>> make[1]: *** [Makefile:69: objtool] Error 2
>> make: *** [Makefile:1337: tools/objtool] Error 2
>>=20
>>=20
>> What would be the best approach to fix that ?
>=20
> Define CFI_BP to your frame register (r2, afaict) I suppose. If you're
> only using OBJTOOL_MCOUNT this code will never run, so all you have to
> ensure is that it compiles, not that it makes sense (-:

Sathvika has been looking into this.

>=20
> The very long and complicated way would be to propagate the various
> CONFIG_HAVE_* build time things to the objtool build and librally
> sprinkle a lot of #ifdef around.

I think there were just a couple of unrelated checks/warnings that were=20
causing problems on powerpc. So, we likely won't need too many #ifdefs,=20
at least for mcount purposes.

Sathvika,
Can you post what you have?


- Naveen

