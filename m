Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CDE6333D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 04:18:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGTx42T3Gz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 14:18:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KOaMVsqy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KOaMVsqy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGTw35Zxhz3cFP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 14:17:38 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM2fK1T010739
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=D8Kda4wZ8a59GowawilfK4BFLZzpuGyUqhf27R8vPPg=;
 b=KOaMVsqynO439sIt2l62qDDHzFGfR1W13yhFGNCkZ0KKnQ4vT0DwRUMF16M3F+ftNQZZ
 Sse857sSrLgBkNX3KN0DdybaVqmNyS8dlHNtLk6KlW2HbtoKOdulUI32JDb0BwNfkS38
 yH0f6RLlOCJ5Wzd+erkpvLJUHK++Ied0HIeAfqKWTtIHAbWOmI7iBtC7mZGcbDpanVsf
 NC/YiLhlCwLFvVhIjoGw6w1b5t2u7I+phQXnzOBkAfwGeEjY/pRAbIJSX07SOpq6N/X1
 ANJN8NblECqtZMpn7mFNrmD2OutPARjcHaZasu+Ubx6PlCUiM2S6uWVD5NHrO7pWY4On PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0ju6vj5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:17:36 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM3Hatm016956
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:17:36 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0ju6vj57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:17:36 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM36UDu032446;
	Tue, 22 Nov 2022 03:17:33 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3kxps92k6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:17:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM3HVop39453352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 03:17:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 600CF4C046;
	Tue, 22 Nov 2022 03:17:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B571C4C040;
	Tue, 22 Nov 2022 03:17:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 03:17:30 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 58447600F3;
	Tue, 22 Nov 2022 14:17:26 +1100 (AEDT)
Message-ID: <f10d18ac9243ec239aaebbf3934c78422147de34.camel@linux.ibm.com>
Subject: Re: [PATCH 04/13] powerpc/rtas: avoid scheduling in rtas_os_term()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 14:17:25 +1100
In-Reply-To: <20221118150751.469393-5-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-5-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4BbpaxoktBivtxqpsEyzQia_tiuPODrM
X-Proofpoint-GUID: l218eDBoAUuPnzN_oRlyq0T-_okuVfNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=641
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220020
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> It's unsafe to use rtas_busy_delay() to handle a busy status from
> the ibm,os-term RTAS function in rtas_os_term():
>=20
> Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x0000000b
> BUG: sleeping function called from invalid context at
> arch/powerpc/kernel/rtas.c:618
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name:
> swapper/0
> preempt_count: 2, expected: 0
> CPU: 7 PID: 1 Comm: swapper/0 Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.0.0-rc=
5-
> 02182-gf8553a572277-dirty #9
> Call Trace:
> [c000000007b8f000] [c000000001337110] dump_stack_lvl+0xb4/0x110
> (unreliable)
> [c000000007b8f040] [c0000000002440e4] __might_resched+0x394/0x3c0
> [c000000007b8f0e0] [c00000000004f680] rtas_busy_delay+0x120/0x1b0
> [c000000007b8f100] [c000000000052d04] rtas_os_term+0xb8/0xf4
> [c000000007b8f180] [c0000000001150fc] pseries_panic+0x50/0x68
> [c000000007b8f1f0] [c000000000036354]
> ppc_panic_platform_handler+0x34/0x50
> [c000000007b8f210] [c0000000002303c4] notifier_call_chain+0xd4/0x1c0
> [c000000007b8f2b0] [c0000000002306cc]
> atomic_notifier_call_chain+0xac/0x1c0
> [c000000007b8f2f0] [c0000000001d62b8] panic+0x228/0x4d0
> [c000000007b8f390] [c0000000001e573c] do_exit+0x140c/0x1420
> [c000000007b8f480] [c0000000001e586c] make_task_dead+0xdc/0x200
>=20
> Use rtas_busy_delay_time() instead, which signals without side
> effects
> whether to attempt the ibm,os-term RTAS call again.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Makes sense.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/kernel/rtas.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 81e4996012b7..51f0508593a7 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -965,10 +965,15 @@ void rtas_os_term(char *str)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0snprintf(rtas_os_term_buf=
, 2048, "OS panic: %s", str);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Keep calling as long as RTA=
S returns a "try again" status,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * but don't use rtas_busy_del=
ay(), which potentially
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * schedules.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0do {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0status =3D rtas_call(ibm_os_term_token, 1, 1, NULL,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __pa(rtas_os_term=
_buf));
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} while (rtas_busy_delay(statu=
s));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} while (rtas_busy_delay_time(=
status));
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (status !=3D 0)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0printk(KERN_EMERG "ibm,os-term call failed %d\n",
> status);

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
