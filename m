Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A45765FF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 00:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBmFd32LPz3dDt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 08:50:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 468 seconds by postgrey-1.37 at boromir; Fri, 28 Jul 2023 02:36:58 AEST
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBbyL4Qj7z3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 02:36:58 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4RBbn61Pc5z1r1sM;
	Thu, 27 Jul 2023 18:28:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4RBbn50Hlbz1qqlc;
	Thu, 27 Jul 2023 18:28:57 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 8fkMsyegbcfc; Thu, 27 Jul 2023 18:28:54 +0200 (CEST)
X-Auth-Info: /OdUztXMee0ZSkATtsTdHv9aXOABzOIhAtGtPnP68TjAEOXj7HyRSJPLBm2Ue4rD
Received: from igel.home (aftr-62-216-205-232.dynamic.mnet-online.de [62.216.205.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 27 Jul 2023 18:28:54 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 19B4B2C1309; Thu, 27 Jul 2023 18:28:54 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
In-Reply-To: <d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com> (David
	Laight's message of "Thu, 27 Jul 2023 09:01:06 +0000")
References: <cover.1689074739.git.legion@kernel.org>
	<cover.1689092120.git.legion@kernel.org>
	<f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
	<njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
	<d052e1266bf042f9b4961bbf42261a55@AcuMS.aculab.com>
X-Yow: Darling, my ELBOW is FLYING over FRANKFURT, Germany..
Date: Thu, 27 Jul 2023 18:28:53 +0200
Message-ID: <87ila5jp2y.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "dalias@libc.org" <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>, "stefan@agner.ch" <stefan@agner.ch>, "ldv@altlinux.org" <ldv@altlinux.org>, "dhowells@redhat.com" <dhowells@redhat.com>, "kim.phillips@arm.com" <kim.phillips@arm.com>, "paulus@samba.org" <paulus@samba.org>, "deepa.kernel@gmail.com" <deepa.kernel@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "hare@suse.com" <hare@suse.com>, "fweimer@redhat.com" <fweimer@redhat.com>, "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, "deller@gmx.de" <deller@gmx.de>, "x86@k
 ernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "mingo@redhat.com" <mingo@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "jhogan@kernel.org" <jhogan@kernel.org>, "mattst88@gmail.com" <mattst88@gmail.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "fenghua.yu@intel.com" <fenghua.yu@intel.com>, "tycho@tycho.ws" <tycho@tycho.ws>, Arnd Bergmann <arnd@arndb.de>, "glebfm@altlinux.org" <glebfm@altlinux.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "acme@kernel.org" <acme@kernel.org>, 'Aleksa Sarai' <cyphar@cyphar.com>, "bp@alien8.de" <bp@alien8.de>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "christian@brauner.io" <christian@brauner.io>, "axboe@kernel.dk" <axboe@kernel.dk>, "James.Bo
 ttomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "monstr@monstr.eu" <monstr@monstr.eu>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "peterz@infradead.org" <peterz@infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, Alexey Gladkov <legion@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jul 27 2023, David Laight wrote:

> From: Aleksa Sarai
>> Sent: 25 July 2023 17:36
> ...
>> We almost certainly want to support AT_EMPTY_PATH at the same time.
>> Otherwise userspace will still need to go through /proc when trying to
>> chmod a file handle they have.
>
> That can't be allowed.

IIUC, fchmodat2(fd, "", m, AT_EMPTY_PATH) is equivalent to fchmod(fd,
m).  With that, new architectures only need to implement the fchmodat2
syscall to cover all chmod variants.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
