Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D1535D78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 11:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8fqG6ldMz3c6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 19:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2/yJLI3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2/yJLI3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8fpV1VWRz2yxS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 19:37:05 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24R8wtBu000420;
	Fri, 27 May 2022 09:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=/3yhtcLV7lGw1O774Uj3YB+h1YJJQMkZuXgBVStyG1I=;
 b=M2/yJLI3eFZtBs1FuFgCL5WalrJ0IGN7srYzhcEtEVvAAFwudph3NKOEmhxEO2geNBEz
 x1ekL6rwU72zQ4ANWO8Q34mM7oKrlECb3T6PFMzb3efDP0yEcRB5EW71mkIEadr/sVIg
 EkZK01+lspZdCcQdnsC9C3LAHlw7O+iYMjEr8l5icRGvPLg7hqAxZgweWo0qn4MSEX7G
 q+AKz8O1n1DgYALF8AhMse09pqelh3YyeVd+nNE/QFrcYLYbIriEfNl3duLUzGvj753B
 8PLpr51T6m6g67/zMdINnIQ3kM0PCdQ1wRTZXQljDj0a7yZ2GQ42Fo38+E7uEBp59/mF /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gaum30my7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 09:36:16 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24R9WHZ2028821;
	Fri, 27 May 2022 09:36:15 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gaum30mxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 09:36:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24R9CccZ005327;
	Fri, 27 May 2022 09:36:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3g93ux3r7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 09:36:12 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24R9aAB617236406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 May 2022 09:36:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91E93A4054;
	Fri, 27 May 2022 09:36:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F35E0A405C;
	Fri, 27 May 2022 09:36:09 +0000 (GMT)
Received: from osiris (unknown [9.145.57.114])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Fri, 27 May 2022 09:36:09 +0000 (GMT)
Date: Fri, 27 May 2022 11:36:08 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] locking/lockref: Use try_cmpxchg64 in CMPXCHG_LOOP
 macro
Message-ID: <YpCbiBCx1o38uhhX@osiris>
References: <CAHk-=wh1XeaxWXG5QziGA4ds918UnW1hO924kusgVB-wGj+9Og@mail.gmail.com>
 <871qwgmqws.fsf@mpe.ellerman.id.au>
 <Yo91omfDZtTgXhyn@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yo91omfDZtTgXhyn@FVFF77S0Q05N.cambridge.arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IInokStyvhEzGjfG9nWgkGvGO89yAxRN
X-Proofpoint-ORIG-GUID: ZMfPYhuHlVUkExUVG7NJSGyAZDOiDEYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=674 spamscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270044
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
Cc: Waiman.Long@hp.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paulmck@linux.vnet.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 26, 2022 at 01:42:35PM +0100, Mark Rutland wrote:
> On Thu, May 26, 2022 at 10:14:59PM +1000, Michael Ellerman wrote:
> > Linus Torvalds <torvalds@linux-foundation.org> writes:
> > > On Wed, May 25, 2022 at 7:40 AM Uros Bizjak <ubizjak@gmail.com> wrote:
> > >>
> > >> Use try_cmpxchg64 instead of cmpxchg64 in CMPXCHG_LOOP macro.
> > >> x86 CMPXCHG instruction returns success in ZF flag, so this
> > >> change saves a compare after cmpxchg (and related move instruction
> > >> in front of cmpxchg). The main loop of lockref_get improves from:
> > >
> > > Ack on this one regardless of the 32-bit x86 question.
> > >
> > > HOWEVER.
> > >
> > > I'd like other architectures to pipe up too, because I think right now
> > > x86 is the only one that implements that "arch_try_cmpxchg()" family
> > > of operations natively, and I think the generic fallback for when it
> > > is missing might be kind of nasty.
> > >
> > > Maybe it ends up generating ok code, but it's also possible that it
> > > just didn't matter when it was only used in one place in the
> > > scheduler.
> > 
> > This patch seems to generate slightly *better* code on powerpc.
> > 
> > I see one register-to-register move that gets shifted slightly later, so
> > that it's skipped on the path that returns directly via the SUCCESS
> > case.
> 
> FWIW, I see the same on arm64; a register-to-register move gets moved out of
> the success path. That changes the register allocation, and resulting in one
> fewer move, but otherwise the code generation is the same.

Just for the records: s390 code generation changes the same like on
powerpc; so looks good.
