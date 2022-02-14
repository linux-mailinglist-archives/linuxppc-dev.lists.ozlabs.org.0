Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B14B5ACC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyFTD5SN9z3cY0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 07:00:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyFSk5y44z2yLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 07:00:21 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2A25C68AA6; Mon, 14 Feb 2022 21:00:11 +0100 (CET)
Date: Mon, 14 Feb 2022 21:00:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
Message-ID: <20220214200011.GA3786@lst.de>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org> <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 08:45:52PM +0100, Arnd Bergmann wrote:
> As Al pointed out, they turned out to be necessary on sparc64, but the only
> definitions are on sparc64 and x86, so it's possible that they serve a similar
> purpose here, in which case changing the limit from TASK_SIZE to
> TASK_SIZE_MAX is probably wrong as well.
> 
> So either I need to revert the original definition as I did on sparc64, or
> they can be removed completely. Hopefully Al or the x86 maintainers
> can clarify.

Looking at the x86 users I think:

 - valid_user_frame should go away and the caller should use get_user
   instead of __get_user
 - the one in copy_code can just go away, as there is another check
   in copy_from_user_nmi
 - copy_stack_frame should just use access_ok
 - as does copy_from_user_nmi

but yes, having someone who actually knows this code look over it
would be very helpful.
