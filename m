Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5154E47A54B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 08:12:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHW4H1dBhz3c57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 18:12:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M63+ZdJY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M63+ZdJY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHW3T2QpPz2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 18:11:32 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK42pg7005175
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 07:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=aX50PQLW1pNbcUM07F42EphU+YfPxo9Va041tnbfLAc=;
 b=M63+ZdJYdvNP1T565bJNslWphYlHPZn/R7f5yG24OXftcChDOdasTUASzBNiYBmRecug
 TenU/Z1qGBj/8NgdDH0Vq+miLGEdJhc1qDH0CxFr08IKy/HPhwLhc0nrRA2ZXIfsYujs
 1owqyZIBjdHWtiRfRDiVqObjG623qYcVXGs4x+p3p1WIjcP+TauvJHtbWg0pRvQHGIxv
 7JUHihJDHcX3z5bAk4IY1GdTXNrPeiy72PwAEMoUk0QuTznDFV4JR3RtPoUZgRUnQ5l6
 tJyiVMo4Pa9G0Q5f2VxZerMVc6ABKm8racCW8e5ljNmXocuf5IoPQ5sZ6MLqXhTwOdKm 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1sahdc4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 07:11:29 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BK7BTU0007775
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 07:11:29 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1sahdc3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 07:11:28 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BK6qW0p001867;
 Mon, 20 Dec 2021 07:11:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3d16wj9qpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 07:11:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BK7BOQi38470082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 07:11:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 672FCAE053;
 Mon, 20 Dec 2021 07:11:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA625AE045;
 Mon, 20 Dec 2021 07:11:23 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.190.221])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 07:11:23 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC PATCH] powerpc/signal: sanitise PT_NIP and sa_handler low
 bits
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <1639977910.h19vppmaz3.astroid@bobo.none>
Date: Mon, 20 Dec 2021 12:41:22 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <C41B888E-57FE-494F-807E-3E13CD603D7F@linux.vnet.ibm.com>
References: <20211130072933.2004389-1-npiggin@gmail.com>
 <BE11B400-C0DF-4478-9728-327C9232B75E@linux.vnet.ibm.com>
 <1639977910.h19vppmaz3.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m2UFKckFd7VPeaVIUACimrIwYJfz_VqC
X-Proofpoint-ORIG-GUID: GYp8z7Ch7xHV4QbKdbUfVB70E4BY_Zhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_03,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200040
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


>> [  550.569802] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
>> [  550.569802] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
>> [  550.569802] GPR24: 0000000000000002 0000000000000001 =
0000000002002000 0000000002802000
>> [  550.569802] GPR28: 0000000000000000 0000000000000800 =
c000000ae08bbe80 0000000000040080
>> [  550.569899] NIP [c0000000000171dc] =
arch_local_irq_restore+0x22c/0x230
>> [  550.569909] LR [c000000000033240] =
interrupt_exit_user_prepare_main+0x150/0x260
>> [  550.569919] Call Trace:
>> [  550.569925] [c000000ae08bbd80] [c000000000033240] =
interrupt_exit_user_prepare_main+0x150/0x260
>> [  550.569937] [c000000ae08bbde0] [c000000000033744] =
syscall_exit_prepare+0x74/0x150
>> [  550.569948] [c000000ae08bbe10] [c00000000000c758] =
system_call_common+0xf8/0x268
>=20
> Yeah this looks like a different issue. Is there a test running which=20=

> flips the security mitigations rapidly? There is a race window with
Yes, powerpc/security/mitigation-patching.sh. This test enables/disables
various supported mitigations (parallel execution).

> the the static branch causing exit_must_hard_disable() returning two
> different values.
>=20
> We should update they key while single threaded AFAIKS.

Thanks. I tested with this fix. The test ran correctly without a crash.

> diff --git a/arch/powerpc/lib/feature-fixups.c =
b/arch/powerpc/lib/feature-fixups.c
> index 57c6bb802f6c..a7cb317e7039 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -232,11 +232,22 @@ static DEFINE_MUTEX(exit_flush_lock);
>=20
> static int __do_stf_barrier_fixups(void *data)
> {
> -	enum stf_barrier_type *types =3D data;
> +	enum stf_barrier_type types =3D *(enum stf_barrier_type *)data;
>=20
> 	do_stf_entry_barrier_fixups(*types);
> 	do_stf_exit_barrier_fixups(*types);
>=20
*types should be changed to =E2=80=9Ctypes=E2=80=9D to avoid build =
failure.


