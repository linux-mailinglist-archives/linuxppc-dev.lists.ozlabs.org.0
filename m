Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FEE8A05AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 03:54:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/CC118T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFN6w60jVz3vbP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 11:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/CC118T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFN683tbXz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 11:54:07 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43B1qPOn009223;
	Thu, 11 Apr 2024 01:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BOmC5vFbrIqZ/RGj1JAJsv948iS3UldEjB0MIyHN4wc=;
 b=o/CC118TqXAIG6jjI+LXEbSpFG90RCQL064iR60Q+QFNQsnti6y2N10uzhUzeWWQl/CR
 vfQZP67Z4chZ1gDNkbxxaR46TNN8rcv27MF8sMhD3ghsiP9GXH2XBuQmYKLJ8nyhogVk
 a/5I6smaxiEWuWFptC5p+ziJZRZrIS/O/PcQPxLCg/LxEfj6MW13H0RBpi9O99wonzKa
 NXPgiH+1IdNee1nySNf5Z8dfaO6A3yvbM/EnzFPeP3QRBnAHF4gm47dNWr1i6vk8JDFu
 huLT+iezf21ZJfsZ2Ptu0gmFTw6Ua66vIk8c+F5MnS+wqyVWjmIuNYcqgDom6Xhkl6u4 yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xe6bx80wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 01:53:58 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43B1rvuE010819;
	Thu, 11 Apr 2024 01:53:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xe6bx80w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 01:53:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43B18BCR016971;
	Thu, 11 Apr 2024 01:53:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbke2r0mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 01:53:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43B1rrYY54853962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Apr 2024 01:53:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E85D220043;
	Thu, 11 Apr 2024 01:53:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D7692004B;
	Thu, 11 Apr 2024 01:53:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Apr 2024 01:53:52 +0000 (GMT)
Received: from [10.61.2.138] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 072886013D;
	Thu, 11 Apr 2024 11:53:49 +1000 (AEST)
Message-ID: <352c55c4056030884f7870b20bc6c557b64e158a.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/64: Only warn for kuap locked when KCSAN
 not present
From: Rohan McLure <rmclure@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 11 Apr 2024 11:53:48 +1000
In-Reply-To: <cf6f5be6-3250-4dba-8f2d-3e003edced97@csgroup.eu>
References: <20240404044535.642122-2-rmclure@linux.ibm.com>
	 <20240404044535.642122-4-rmclure@linux.ibm.com>
	 <cf6f5be6-3250-4dba-8f2d-3e003edced97@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZjKicAujDN4ZCG9ZP7nHYI25Vh5Xrc9Q
X-Proofpoint-GUID: X6OjOiIKuLFnIZU-olNh7WQ5yuJ9SvQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404110012
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-04 at 06:14 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 04/04/2024 =C3=A0 06:45, Rohan McLure a =C3=A9crit=C2=A0:
> > Arbitrary instrumented locations, including syscall handlers, can
> > call
> > arch_local_irq_restore() transitively when KCSAN is enabled, and in
> > turn
> > also replay_soft_interrupts_irqrestore(). The precondition on entry
> > to
> > this routine that is checked is that KUAP is enabled (user access
> > prohibited). Failure to meet this condition only triggers a warning
> > however, and afterwards KUAP is enabled anyway. That is, KUAP being
> > disabled on entry is in fact permissable, but not possible on an
> > uninstrumented kernel.
> >=20
> > Disable this assertion only when KCSAN is enabled.
>=20
> Please elaborate on that arbitrary call to arch_local_irq_restore()=20
> transitively, when does it happen and why, and why only when KCSAN is
> enabled.

The implementation of kcsan depends on this_cpu_* routines, which in
turn need to manage irqs for correctness. This means that the presence
of KCSAN in a uaccess enabled epoch can introduce calls to
arch_local_irq_restore().

For this reason, the warning really only applies in the instance of
uninstrumented code, and so to prevent KCSAN from issuing a false-
positive here, it makes sense to issue it only when KCSAN is not
present.

>=20
> I don't understand the reasoning, if it is permissible as you say,
> just=20
> drop the warning. If the warning is there, it should stay also with=20
> KCSAN. You should fix the root cause instead.

By dropping this assertion when KCSAN is enabled, we open up the
opportunity for KCSAN to warn only when data races are actually
observed, rather than just instances where an unblocked AMR state is
inherited into an IRQ context.

>=20
> >=20
> > Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> > Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> > ---
> > =C2=A0 arch/powerpc/kernel/irq_64.c | 3 ++-
> > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/kernel/irq_64.c
> > b/arch/powerpc/kernel/irq_64.c
> > index d5c48d1b0a31..18b2048389a2 100644
> > --- a/arch/powerpc/kernel/irq_64.c
> > +++ b/arch/powerpc/kernel/irq_64.c
> > @@ -189,7 +189,8 @@ static inline __no_kcsan void
> > replay_soft_interrupts_irqrestore(void)
> > =C2=A0=C2=A0	 * and re-locking AMR but we shouldn't get here in the
> > first place,
> > =C2=A0=C2=A0	 * hence the warning.
> > =C2=A0=C2=A0	 */
> > -	kuap_assert_locked();
> > +	if (!IS_ENABLED(CONFIG_KCSAN))
> > +		kuap_assert_locked();
> > =C2=A0=20
> > =C2=A0=C2=A0	if (kuap_state !=3D AMR_KUAP_BLOCKED)
> > =C2=A0=C2=A0		set_kuap(AMR_KUAP_BLOCKED);

