Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD1765FE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 00:50:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBmDz5sk0z3cP1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 08:50:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=libc.org (client-ip=216.12.86.13; helo=brightrain.aerifal.cx; envelope-from=dalias@libc.org; receiver=lists.ozlabs.org)
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBbqd3zhNz3c3c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 02:31:08 +1000 (AEST)
Date: Thu, 27 Jul 2023 12:31:04 -0400
From: "dalias@libc.org" <dalias@libc.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Message-ID: <20230727163103.GB20050@brightrain.aerifal.cx>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Fri, 28 Jul 2023 08:48:48 +1000
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
Cc: "kim.phillips@arm.com" <kim.phillips@arm.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "fenghua.yu@intel.com" <fenghua.yu@intel.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>, "x86@kernel.org" <x86@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "ldv@altlinux.org" <ldv@altlinux.org>, "dhowells@redhat.com" <dhowells@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "deepa.kernel@gmail.com" <deepa.kernel@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "hare@suse.com" <hare@suse.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, "deller@gmx.de" <deller@gmx.de>, "linux-sh@vger.ker
 nel.org" <linux-sh@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "mingo@redhat.com" <mingo@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "jhogan@kernel.org" <jhogan@kernel.org>, "mattst88@gmail.com" <mattst88@gmail.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "fweimer@redhat.com" <fweimer@redhat.com>, "tycho@tycho.ws" <tycho@tycho.ws>, Arnd Bergmann <arnd@arndb.de>, "glebfm@altlinux.org" <glebfm@altlinux.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "acme@kernel.org" <acme@kernel.org>, 'Aleksa Sarai' <cyphar@cyphar.com>, "bp@alien8.de" <bp@alien8.de>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "christian@brauner.io" <christian@brauner.io>, "axboe@kernel.dk" <axboe@kernel.dk>, "James.Bottomley@hansenpartnership.com" <James
 .Bottomley@hansenpartnership.com>, "monstr@monstr.eu" <monstr@monstr.eu>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "peterz@infradead.org" <peterz@infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, Alexey Gladkov <legion@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 27, 2023 at 09:01:06AM +0000, David Laight wrote:
> From: Aleksa Sarai
> > Sent: 25 July 2023 17:36
> ....
> > We almost certainly want to support AT_EMPTY_PATH at the same time.
> > Otherwise userspace will still need to go through /proc when trying to
> > chmod a file handle they have.
> 
> That can't be allowed.
> 
> Just because a process has a file open and write access to
> the directory that contains it doesn't mean they are allowed
> to change the file permissions.
> 
> They also need directory search access from a directory
> they have open through to the containing directory.

Am I missing something? How is this different from fchmod?

Rich
