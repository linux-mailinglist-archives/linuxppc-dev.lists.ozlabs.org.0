Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182151D683
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 13:20:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvp5Y6s4Bz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 21:20:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KUrZVHNe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KUrZVHNe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvp4p3mPyz3bpy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 21:19:53 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246AxYnp014029;
 Fri, 6 May 2022 11:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=y5OiXKtWxrE9jkRNnZnUPIxSoW5NO888lYPMeY8p20o=;
 b=KUrZVHNedJMQHXRUcjFYRz49EjLPt/z8Enxpe963RBRHVwRMBIajjKHTbAEmyQygRzWc
 lvtblkDBEv0KM5s9aGvgB1VbknJOF47xy4utbk/2sTFacNlPn+6id8sHDSEmtYqCHgce
 bb8f78CA6OZEGHds6XuwyfyNYtjQ/Sz14sYUz2gP0WSwg3pg800hXKb7bnHzDJeiHtFZ
 dZaiepyf5OYOjy0JX7QcOFu7TIf6eefQLMPf+V2/m05DTHXeyKaCpGjGJHSckMTQJXTK
 0SdLpB5S8k05thmQVCh28GCCFzfAXO02Xps+YQB3gva5HPAW0rJhQpu/5Dq/ASHPVitd Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw2dm8asx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 11:18:58 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246BI0IY021612;
 Fri, 6 May 2022 11:18:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw2dm8asf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 11:18:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246BHWn0005982;
 Fri, 6 May 2022 11:18:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ftp7fwcut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 11:18:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 246BIrKO46924078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 11:18:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27ED14C044;
 Fri,  6 May 2022 11:18:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 641CB4C046;
 Fri,  6 May 2022 11:18:51 +0000 (GMT)
Received: from sig-9-145-46-59.uk.ibm.com (unknown [9.145.46.59])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 11:18:51 +0000 (GMT)
Message-ID: <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Finn Thain <fthain@linux-m68k.org>, Bjorn Helgaas <helgaas@kernel.org>
Date: Fri, 06 May 2022 13:18:51 +0200
In-Reply-To: <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
 <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5UqqC9GevofRxBeHStbLnLlUH6eZ3euH
X-Proofpoint-ORIG-GUID: w_xuM4uo82W1hTrsAd4vNrc6YUx1BE02
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060062
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Arnd Bergmann <arnd@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open
 list:ALPHA PORT" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND
 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-05-06 at 19:12 +1000, Finn Thain wrote:
> 
> On Thu, 5 May 2022, Bjorn Helgaas wrote:
> 
> > On Thu, May 05, 2022 at 07:39:42PM +0200, Arnd Bergmann wrote:
> > > On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> > > > > The main goal is to avoid c), which is what happens on s390, but
> > > > > can also happen elsewhere. Catching b) would be nice as well,
> > > > > but is much harder to do from generic code as you'd need an
> > > > > architecture specific inline asm statement to insert a ex_table
> > > > > fixup, or a runtime conditional on each access.
> > > > 
> > > > Or s390 could implement its own inb().
> > > > 
> > > > I'm hearing that generic powerpc kernels have to run both on machines
> > > > that have I/O port space and those that don't.  That makes me think
> > > > s390 could do something similar.
> > > 
> > > No, this is actually the current situation, and it makes absolutely no
> > > sense. s390 has no way of implementing inb()/outb() because there
> > > are no instructions for it and it cannot tunnel them through a virtual
> > > address mapping like on most of the other architectures. (it has special
> > > instructions for accessing memory space, which is not the same as
> > > a pointer dereference here).
> > > 
> > > The existing implementation gets flagged as a NULL pointer dereference
> > > by a compiler warning because it effectively is.
> > 
> > I think s390 currently uses the inb() in asm-generic/io.h, i.e.,
> > "__raw_readb(PCI_IOBASE + addr)".  I understand that's a NULL pointer
> > dereference because the default PCI_IOBASE is 0.
> > 
> > I mooted a s390 inb() implementation like "return ~0" because that's
> > what happens on most arches when there's no device to respond to the
> > inb().
> > 
> > The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter
> > drivers that use I/O ports in some cases but not others.  But maybe
> > it's the most practical way.
> > 
> 
> Do you mean, "the most practical way to avoid a compiler warning on s390"? 
> What about "#pragma GCC diagnostic ignored"?

This actually happens with clang. Apart from that, I think this would
also fall under the same argument as the original patch Linus unpulled.
We would just paint over someting that we know at compile time won't
work:

https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/

