Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD896695EDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:20:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGG0F4gFjz3cMS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:20:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q8foVNTr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q8foVNTr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFzK6RC9z3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:19:57 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E8QdMb012460;
	Tue, 14 Feb 2023 09:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=dyXB5zv3wQB7AEDxGVKlfyvHSRi4velhkCkKbx6oyz8=;
 b=Q8foVNTr0bKkSz6NyWGUB5/jvNoReTt5fYBFwmmy2X83aX6VNdol9862TaC4hz5BuYpq
 EzcoGVxasOaVTmcuakDgMC5cdVV0tzkYuQC7R8H50zm2x7LaRM89UKWIYpSrchBOLCT7
 5GlkDlVV8pbxSa2iQOO0ZvR6qSYTxoYVNrQZ3w8X05NZSVI0mAcz7B38HfINHq693F4H
 OzBVI8864oQEJMZ05/R+QDMWuN2d9YeJkyny1gXrNyQmfPrnX64NBJIVSbhMiUhoDB41
 HYsJ1O85VhXwwK/zzJiZAZQxuAkRzTB9mL/YLJm7I3KSHKqkAX3IpMCScRBqCr28B1ge NA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nr6sx9589-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 09:19:12 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31E8ddvD025579;
	Tue, 14 Feb 2023 09:19:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nr6sx9571-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 09:19:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E56QdR029819;
	Tue, 14 Feb 2023 09:19:07 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fkt16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 09:19:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31E9J4kZ23921262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 09:19:04 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DE4120040;
	Tue, 14 Feb 2023 09:19:04 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 425BB20043;
	Tue, 14 Feb 2023 09:19:03 +0000 (GMT)
Received: from osiris (unknown [9.152.212.244])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 14 Feb 2023 09:19:03 +0000 (GMT)
Date: Tue, 14 Feb 2023 10:19:02 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Message-ID: <Y+tSBlSsQBQF/Ro2@osiris>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <Y+tIl07KOOrGZ2Et@osiris>
 <CAMuHMdVG4=UmKDa17dys9e3iGM75u4+13nQVyjMHK--aD6WKfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVG4=UmKDa17dys9e3iGM75u4+13nQVyjMHK--aD6WKfw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UOzvHh6KowmpY_9himJ0Lcj8lppogDkY
X-Proofpoint-ORIG-GUID: 43TrAfyms_R0LeogELAFDthALGccI9YC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_06,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140077
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xt
 ensa.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Vasily Gorbik <gor@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
> Hi Heiko,
> 
> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
> > On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
> > > This all came up in the context of increasing COMMAND_LINE_SIZE in the
> > > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> > > maximum length of /proc/cmdline and userspace could staticly rely on
> > > that to be correct.
> > >
> > > Usually I wouldn't mess around with changing this sort of thing, but
> > > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> > > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> > > increasing, but they're from before the UAPI split so I'm not quite sure
> > > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> > > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> > > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> > > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> > > asm-generic/setup.h.").
> > >
> > > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> > > part of the uapi to begin with, and userspace should be able to handle
> > > /proc/cmdline of whatever length it turns out to be.  I don't see any
> > > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> > > search, but that's not really enough to consider it unused on my end.
> > >
> > > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> > > shouldn't be part of uapi, so this now touches all the ports.  I've
> > > tried to split this all out and leave it bisectable, but I haven't
> > > tested it all that aggressively.
> >
> > Just to confirm this assumption a bit more: that's actually the same
> > conclusion that we ended up with when commit 3da0243f906a ("s390: make
> > command line configurable") went upstream.
> 
> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
> I assume?

Yes, sorry for that. I got distracted while writing and used the wrong
branch to look this up.
