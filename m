Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BFB6B4F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 05:19:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pMtZ0Qn2zDqg9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 13:19:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aerifal.cx
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@aerifal.cx; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at bilbo;
 Wed, 17 Jul 2019 12:51:35 AEST
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 45pMGv1MGRzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 12:51:34 +1000 (AEST)
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
 id 1hnZs6-0002cE-00; Wed, 17 Jul 2019 02:40:46 +0000
Date: Tue, 16 Jul 2019 22:40:46 -0400
From: Rich Felker <dalias@libc.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 2/4] Add fchmodat4(), a new syscall
Message-ID: <20190717024046.GI1506@brightrain.aerifal.cx>
References: <20190717012719.5524-1-palmer@sifive.com>
 <20190717012719.5524-3-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717012719.5524-3-palmer@sifive.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:17:29 +1000
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
Cc: kim.phillips@arm.com, catalin.marinas@arm.com, linux-sh@vger.kernel.org,
 peterz@infradead.org, heiko.carstens@de.ibm.com, stefan@agner.ch,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 namhyung@kernel.org, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, will@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com,
 gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org,
 firoz.khan@linaro.org, mattst88@gmail.com, fenghua.yu@intel.com,
 Arnd Bergmann <arnd@arndb.de>, jolsa@redhat.com, tycho@tycho.ws,
 acme@kernel.org, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org,
 alexander.shishkin@linux.intel.com, tglx@linutronix.de, christian@brauner.io,
 rth@twiddle.net, axboe@kernel.dk, dhowells@redhat.com, monstr@monstr.eu,
 tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2019 at 06:27:17PM -0700, Palmer Dabbelt wrote:
> man 3p says that fchmodat() takes a flags argument, but the Linux
> syscall does not.  There doesn't appear to be a good userspace
> workaround for this issue but the implementation in the kernel is pretty
> straight-forward.  The specific use case where the missing flags came up
> was WRT a fuse filesystem implemenation, but the functionality is pretty
> generic so I'm assuming there would be other use cases.

Note that we do have a workaround in musl libc with O_PATH and
/proc/self/fd, but a syscall that allows a proper fix with the ugly
workaround only in the fallback path for old kernels will be much
appreciated!

What about also doing a new SYS_faccessat4 with working AT_EACCESS
flag? The workaround we have to do for it is far worse.

Rich
