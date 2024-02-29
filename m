Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F8286BF57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:11:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jJmU6isy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlbpT6bpdz3vXL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:11:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jJmU6isy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mpe@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlZk237M1z3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 13:22:18 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41T2CugB026645;
	Thu, 29 Feb 2024 02:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version : content-type
 : content-transfer-encoding; s=pp1;
 bh=jrqcB7f3gqyOeE/5n3jxRuz15ul9JOIkrDuzji+2Ahk=;
 b=jJmU6isyya83TevqWcsHwRUSmhH0m/DSV5/VRf6avOcv4kx9AfnPnsgjR56pW3yieUaN
 +4oL1+Tnk4ftNmAdZ71KEpC8D3zeNuN7gUqOssWvG9QMjgIUiYNVLME280/cLM+EVPwS
 ALCCdEblfrnm5wTxmeAP/D0PYE3hnMtmK8+cpcrE5sMx7trPp60m9ytfMp7xZO/snZgt
 UZXhVtkFa9ucZZFGhdnWBadIFVsxYqtYnXMFP9tGaVcG+aQNNmkHJxUpnFhywnsmFn4g
 UnGUbs6FRL2JbPwd0a0hAPC6YDhsq9VID6l1NHL0pOUPjdow3Ov6HPYxhA3X1MpuvfBf Lg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjgxjr7xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 02:22:15 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41SNKKur008147;
	Thu, 29 Feb 2024 02:22:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9mj9vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 02:22:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41T2MAag32113134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 02:22:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D9D420043;
	Thu, 29 Feb 2024 02:22:10 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 314F020040;
	Thu, 29 Feb 2024 02:22:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 02:22:09 +0000 (GMT)
Received: from localhost (unknown [9.66.77.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ACE1A610C8;
	Thu, 29 Feb 2024 13:22:04 +1100 (AEDT)
From: Michael Ellerman <mpe@linux.ibm.com>
To: Tasmiya Nalatwad <tasmiya@linux.ibm.com>,
        "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [netdev] Build failure on powerpc
In-Reply-To: <8294bf9a-d175-4d86-b6df-9c409108cbf1@linux.vnet.ibm.com>
References: <8294bf9a-d175-4d86-b6df-9c409108cbf1@linux.vnet.ibm.com>
Date: Thu, 29 Feb 2024 13:22:01 +1100
Message-ID: <875xy8103a.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o4WeUlssk2yTmGgHZR9QAl7DpcyRAxfV
X-Proofpoint-GUID: o4WeUlssk2yTmGgHZR9QAl7DpcyRAxfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=954 clxscore=1011 impostorscore=0 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402290017
X-Mailman-Approved-At: Thu, 29 Feb 2024 14:10:35 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com> writes:
> Greetings,
>
> [netdev] Build failure on powerpc
> latest netdev 6.8.0-rc5-auto-g1ce7d306ea63 fails to build on powerpc=20
> below traces

Please include the defconfig you're building, and the toolchain
versions, in reports like this.

I wasn't able to reproduce this failure here.

cheers

> --- Traces---
>
> /include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99:
> /include/linux/rcupdate.h:439:9: error: dereferencing pointer to=20
> incomplete type =E2=80=98struct dpll_pin=E2=80=99
>  =C2=A0 typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> /include/linux/rcupdate.h:587:2: note: in expansion of macro=20
> =E2=80=98__rcu_dereference_check=E2=80=99
>  =C2=A0 __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> /include/linux/rtnetlink.h:70:2: note: in expansion of macro=20
> =E2=80=98rcu_dereference_check=E2=80=99
>  =C2=A0 rcu_dereference_check(p, lockdep_rtnl_is_held())
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~
> /include/linux/dpll.h:175:9: note: in expansion of macro=20
> =E2=80=98rcu_dereference_rtnl=E2=80=99
>  =C2=A0 return rcu_dereference_rtnl(dev->dpll_pin);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] Error=
 1
> make[4]: *** Waiting for unfinished jobs....
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/mpls/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/l3mdev/built-in.a
> In file included from ./include/linux/rbtree.h:24,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/mm_types.h:11,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/mmzone.h:22,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/gfp.h:7,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/umh.h:4,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/kmod.h:9,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/module.h:17,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from drivers/dpll/dpll_netlink.c:9:
> /include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99:
> /include/linux/rcupdate.h:439:9: error: dereferencing pointer to=20
> incomplete type =E2=80=98struct dpll_pin=E2=80=99
>  =C2=A0 typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> /include/linux/rcupdate.h:587:2: note: in expansion of macro=20
> =E2=80=98__rcu_dereference_check=E2=80=99
>  =C2=A0 __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> /include/linux/rtnetlink.h:70:2: note: in expansion of macro=20
> =E2=80=98rcu_dereference_check=E2=80=99
>  =C2=A0 rcu_dereference_check(p, lockdep_rtnl_is_held())
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~
> /include/linux/dpll.h:175:9: note: in expansion of macro=20
> =E2=80=98rcu_dereference_rtnl=E2=80=99
>  =C2=A0 return rcu_dereference_rtnl(dev->dpll_pin);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o]=20
> Error 1
> make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/compiler.h:251,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/instrumented.h:10,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/uaccess.h:6,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from net/core/dev.c:71:
> net/core/dev.c: In function =E2=80=98netdev_dpll_pin_assign=E2=80=99:
> /include/linux/rcupdate.h:462:36: error: dereferencing pointer to=20
> incomplete type =E2=80=98struct dpll_pin=E2=80=99
>  =C2=A0#define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
> /include/asm-generic/rwonce.h:55:33: note: in definition of macro=20
> =E2=80=98__WRITE_ONCE=E2=80=99
>  =C2=A0 *(volatile typeof(x) *)&(x) =3D (val);=C2=A0=C2=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
> /arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro=20
> =E2=80=98WRITE_ONCE=E2=80=99
>  =C2=A0 WRITE_ONCE(*p, v);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>  =C2=A0 ^~~~~~~~~~
> /include/asm-generic/barrier.h:172:55: note: in expansion of macro=20
> =E2=80=98__smp_store_release=E2=80=99
>  =C2=A0#define smp_store_release(p, v) do { kcsan_release();=20
> __smp_store_release(p, v); } while (0)
> ^~~~~~~~~~~~~~~~~~~
> /include/linux/rcupdate.h:503:3: note: in expansion of macro=20
> =E2=80=98smp_store_release=E2=80=99
>  =C2=A0=C2=A0 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)=
); \
>  =C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
> /include/linux/rcupdate.h:503:25: note: in expansion of macro=20
> =E2=80=98RCU_INITIALIZER=E2=80=99
>  =C2=A0=C2=A0 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)=
); \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~=
~~~~~~~~~~~~~
> net/core/dev.c:9081:2: note: in expansion of macro =E2=80=98rcu_assign_po=
inter=E2=80=99
>  =C2=A0 rcu_assign_pointer(dev->dpll_pin, dpll_pin);
>  =C2=A0 ^~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers/net/ethernet/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers/net/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/dcb/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/netlabel/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/strparser/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/handshake/built-in.a
>  =C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 lib/test_fortify.log
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/8021q/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/nsh/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/unix/built-in.a
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lib/string.o
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/packet/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/switchdev/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lib/lib.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/mptcp/built-in.a
>  =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net/devlink/built-in.a
> In file included from ./include/linux/rbtree.h:24,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/mm_types.h:11,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/mmzone.h:22,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/gfp.h:7,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/umh.h:4,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/kmod.h:9,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/module.h:17,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from net/core/rtnetlink.c:17:
> /include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99:
> /include/linux/rcupdate.h:439:9: error: dereferencing pointer to=20
> incomplete type =E2=80=98struct dpll_pin=E2=80=99
>  =C2=A0 typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> /include/linux/rcupdate.h:587:2: note: in expansion of macro=20
> =E2=80=98__rcu_dereference_check=E2=80=99
>  =C2=A0 __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> /include/linux/rtnetlink.h:70:2: note: in expansion of macro=20
> =E2=80=98rcu_dereference_check=E2=80=99
>  =C2=A0 rcu_dereference_check(p, lockdep_rtnl_is_held())
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~
> /include/linux/dpll.h:175:9: note: in expansion of macro=20
> =E2=80=98rcu_dereference_rtnl=E2=80=99
>  =C2=A0 return rcu_dereference_rtnl(dev->dpll_pin);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
> In file included from net/core/rtnetlink.c:60:
> /include/linux/dpll.h:179:1: error: control reaches end of non-void=20
> function [-Werror=3Dreturn-type]
>  =C2=A0}
>
>
> Reverting the below commit fixes the problem
>
> commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
>  =C2=A0=C2=A0=C2=A0 dpll: rely on rcu for netdev_dpll_pin()
>
> --=20
> Regards,
> Tasmiya Nalatwad
> IBM Linux Technology Center
