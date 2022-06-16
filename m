Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D916854D9E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 07:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNrgp6K6Mz3btK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 15:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iRGmLfD8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iRGmLfD8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNrg41r9zz2ypY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 15:42:55 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4XZJk015248;
	Thu, 16 Jun 2022 05:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8DjpLYqx4LQu7FgpgumpxRIodysKfWuh5NFUJ/bDwys=;
 b=iRGmLfD8GZ0R+LjayzHxsbx2S2nWAQWY+embdIF0CkKCgq7vrU5x7n78k9BaA6ss94DL
 8m9OR/V6ad76qLeQEmt7f2y9Dld8ioyLbCFgha0G13kft/tsO60oSp3OOJuqHL06in5s
 JHw+AbBNwxCQPtQNv5qgaGFtRycf9RR/iFIyD7JGSwG8tDs7turEVB6SCRlgs81r+xwE
 fyYShXdOpU5rdEuqUiy5uQ2thHtMPjNZ/ByO0df7qdeHNNu1LqbqyNijziPHMITtbWXQ
 HW6c+9AZcTJYTxiRo8H1lQSCGH26v/W8L+8k14KJZxdkq4ngPWmqDPAG2dZ2HYIyWBlS eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqhbd3bt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 05:42:49 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25G5O9B1027461;
	Thu, 16 Jun 2022 05:42:49 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqhbd3bsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 05:42:48 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25G5aVc2014332;
	Thu, 16 Jun 2022 05:42:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma02fra.de.ibm.com with ESMTP id 3gmjp958wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 05:42:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25G5ghk922020596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 05:42:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7A8AAE04D;
	Thu, 16 Jun 2022 05:42:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2D4DAE051;
	Thu, 16 Jun 2022 05:42:41 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.192.255.94])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu, 16 Jun 2022 05:42:41 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <730437cb-62ee-0dfc-61b4-52458ab937bb@csgroup.eu>
Date: Thu, 16 Jun 2022 15:42:36 +1000
Message-Id: <8155704E-10E6-4AC0-817C-EB282848E0C2@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-2-rmclure@linux.ibm.com>
 <a722557b-533a-452d-3355-8f31052df4b4@csgroup.eu>
 <730437cb-62ee-0dfc-61b4-52458ab937bb@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TPC8vYUcS6JgTILhdBichraa_DCIyxr1
X-Proofpoint-GUID: X_CnVXaGBtYnrhiqhOdDEtByStsxI2PC
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_02,2022-06-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160020
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Le 01/06/2022 =C3=A0 10:29, Christophe Leroy a =C3=A9crit :
>> Le 01/06/2022 =C3=A0 07:48, Rohan McLure a =C3=A9crit :
>>> [Vous ne recevez pas souvent de courriers de la part de rmclure@linux.i=
bm.com. D=C3=A9couvrez pourquoi cela peut =C3=AAtre important =C3=A0 l'adre=
sse https://aka.ms/LearnAboutSenderIdentification.]
>>>=20
>>> Syscall wrapper implemented as per s390, x86, arm64, providing the
>>> option for gprs to be cleared on entry to the kernel, reducing caller
>>> influence influence on speculation within syscall routine. The wrapper
>>> is a macro that emits syscall handler implementations with parameters
>>> passed by stack pointer.
>> Passing parameters by stack is going to be sub-optimal. Did you make any=
 measurement of the implied performance degradation ? We usually use the nu=
ll_syscall selftest for that everytime we touch syscall entries/exits.
>=20
> I did a test with null_syscall on an 8xx. Surprisingly I get more than 20=
% improvement with your series.
>=20
> Looking at the generated code in more details, we see that system_call_ex=
ception() is lighter as now no stack frame is needed, the compiler has enou=
gh registers available.
>=20
> Before the patch:
>=20
> c000c9ec <system_call_exception>:
> c000c9ec:	94 21 ff f0 	stwu r1,-16(r1)
> c000c9f0:	93 e1 00 0c 	stw r31,12(r1)
> c000c9f4:	7d 5f 53 78 	mr r31,r10
> c000c9f8:	81 4a 00 84 	lwz r10,132(r10)
> c000c9fc:	90 7f 00 88 	stw r3,136(r31)
> c000ca00:	71 4b 00 02 	andi. r11,r10,2
> c000ca04:	41 82 00 4c 	beq c000ca50 <system_call_exception+0x64>
> c000ca08:	71 4b 40 00 	andi. r11,r10,16384
> c000ca0c:	41 82 00 50 	beq c000ca5c <system_call_exception+0x70>
> c000ca10:	71 4a 80 00 	andi. r10,r10,32768
> c000ca14:	41 82 00 54 	beq c000ca68 <system_call_exception+0x7c>
> c000ca18:	7c 50 13 a6 	mtspr 80,r2
> c000ca1c:	81 42 00 4c 	lwz r10,76(r2)
> c000ca20:	71 4a 84 91 	andi. r10,r10,33937
> c000ca24:	40 82 00 50 	bne c000ca74 <system_call_exception+0x88>
> c000ca28:	28 09 01 c2 	cmplwi r9,450
> c000ca2c:	41 81 00 88 	bgt c000cab4 <system_call_exception+0xc8>
> c000ca30:	3d 40 c0 6f 	lis r10,-16273
> c000ca34:	55 29 10 3a 	rlwinm r9,r9,2,0,29
> c000ca38:	39 4a c1 c5 	addi r10,r10,-15931
> c000ca3c:	7d 2a 48 2e 	lwzx r9,r10,r9
> c000ca40:	83 e1 00 0c 	lwz r31,12(r1)
> c000ca44:	7d 29 03 a6 	mtctr r9
> c000ca48:	38 21 00 10 	addi r1,r1,16
> c000ca4c:	4e 80 04 20 	bctr
> ...
>=20
> After the patch:
> c000cc94 <system_call_exception>:
> c000cc94:	81 24 00 84 	lwz r9,132(r4)
> c000cc98:	81 44 00 0c 	lwz r10,12(r4)
> c000cc9c:	71 28 00 02 	andi. r8,r9,2
> c000cca0:	91 44 00 88 	stw r10,136(r4)
> c000cca4:	41 82 00 48 	beq c000ccec <system_call_exception+0x58>
> c000cca8:	71 2a 40 00 	andi. r10,r9,16384
> c000ccac:	41 82 00 44 	beq c000ccf0 <system_call_exception+0x5c>
> c000ccb0:	71 29 80 00 	andi. r9,r9,32768
> c000ccb4:	41 82 00 40 	beq c000ccf4 <system_call_exception+0x60>
> c000ccb8:	7c 50 13 a6 	mtspr 80,r2
> c000ccbc:	81 22 00 4c 	lwz r9,76(r2)
> c000ccc0:	71 29 84 91 	andi. r9,r9,33937
> c000ccc4:	40 82 00 34 	bne c000ccf8 <system_call_exception+0x64>
> c000ccc8:	28 03 01 c2 	cmplwi r3,450
> c000cccc:	41 81 00 78 	bgt c000cd44 <system_call_exception+0xb0>
> c000ccd0:	3d 20 c0 70 	lis r9,-16272
> c000ccd4:	54 63 10 3a 	rlwinm r3,r3,2,0,29
> c000ccd8:	39 29 81 c5 	addi r9,r9,-32315
> c000ccdc:	7d 29 18 2e 	lwzx r9,r9,r3
> c000cce0:	7c 83 23 78 	mr r3,r4
> c000cce4:	7d 29 03 a6 	mtctr r9
> c000cce8:	4e 80 04 20 	bctr
> ...
>=20
>=20
>=20
>> Why going via stack ? The main advantage of a RISC processor like powerp=
c is that, unlike x86, there are enough registers to avoid going through me=
mory. RISC processors are optimised with three operands operations and many=
 registers, and usually have slow memory in return.
>=20
> Well, thinking about it once more. In fact registers are saved to the sta=
ck anyway. At the start of syscall functions they are likely to still be ho=
t in the cache, so reading them back is just a few cycles. And it eventuall=
y provide the compiler the opportunity to organise stuff better.
>=20
>=20
>>>=20
>>> For platforms supporting this syscall wrapper, emit symbols with usual
>>> in-register parameters (`sys...`) to support calls to syscall handlers
>>> from within the kernel.
>>>=20
>>> Syscalls are wrapped on all platforms except Cell processor. SPUs requi=
re
>>> access syscall prototypes which are omitted with ARCH_HAS_SYSCALL_WRAPP=
ER
>>> enabled.
>> This commit message isn't very clear, please describe in more details wh=
at is done, how and why.
>=20
>=20
> Christophe

Thanks for checking this Christophe.

>> Why going via stack ? The main advantage of a RISC processor like powerp=
c is that, unlike x86, there are enough registers to avoid going through me=
mory. RISC processors are optimised with three operands operations and many=
 registers, and usually have slow memory in return.
>=20
> Well, thinking about it once more. In fact registers are saved to the sta=
ck anyway. At the start of syscall functions they are likely to still be ho=
t in the cache, so reading them back is just a few cycles. And it eventuall=
y provide the compiler the opportunity to organise stuff better.


Sorry for the delay in performance results - took me a while to verify
these results on real hardware. On a Power9 I=E2=80=99m seeing ~5.6% perfor=
mance
improvement on null_syscall, even with register clearing enabled.

The upshot of the syscall wrapper was primarily to adopt common
behaviour to other architectures, and to enable register clearing. As it
stands, prior to this patch series we already save register state into a
pt_regs struct, and so may as well pass arguments by the stack as
performance results are favourable.

>>> For platforms supporting this syscall wrapper, emit symbols with usual
>>> in-register parameters (`sys...`) to support calls to syscall handlers
>>> from within the kernel.
>>>=20
>>> Syscalls are wrapped on all platforms except Cell processor. SPUs requi=
re
>>> access syscall prototypes which are omitted with ARCH_HAS_SYSCALL_WRAPP=
ER
>>> enabled.
>> This commit message isn't very clear, please describe in more details wh=
at is done, how and why.

Here is a hack which addresses the fact that handlers for the select and
ppc64_personality syscalls will tail-call generic implementations via
their sys_... symbol, passing arguments with the usual in-register
calling convention. This commit resolves this issue by emitting external
linkage functions with both in-register and in-stack conventions
(__powerpc_sys... and sys_... respectively), but the best way forward is
probably to remove dependence on sys_... handlers alltogether. There=E2=80=
=99s
simply too much code bloat in emitting both, and direct calls to syscall
handlers should in general be avoided. I would much rather remove all such
references in the kernel as arm has done before proceeding.

As for SPU's, the issue here is that include/linux/syscalls.h only
provides prototypes for sys_... handlers. So spu_callbacks.c must
reference these symbols for the translation unit to compile. A solution
may be for spu_syscall_table to be made extern linkage and populated in
the same manner as systbl.S. I suggest we simply omit support for sycall
wrappers with the Cell processor.

Rohan=
