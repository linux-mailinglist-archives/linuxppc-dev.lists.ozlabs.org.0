Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431966B2725
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 15:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXWzh0mtpz3f6K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 01:39:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
X-Greylist: delayed 144 seconds by postgrey-1.36 at boromir; Fri, 10 Mar 2023 01:39:12 AEDT
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXWz42lYfz3cLx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 01:39:12 +1100 (AEDT)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1paHNg-000885-00; Thu, 09 Mar 2023 15:36:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6CA12C123A; Thu,  9 Mar 2023 15:36:21 +0100 (CET)
Date: Thu, 9 Mar 2023 15:36:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v4 3/4] arch/*/io.h: remove ioremap_uc in some
 architectures
Message-ID: <20230309143621.GA12350@alpha.franken.de>
References: <20230308130710.368085-1-bhe@redhat.com>
 <20230308130710.368085-4-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308130710.368085-4-bhe@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de, linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, mcgrof@kernel.org, geert@linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 08, 2023 at 09:07:09PM +0800, Baoquan He wrote:
> ioremap_uc() is only meaningful on old x86-32 systems with the PAT
> extension, and on ia64 with its slightly unconventional ioremap()
> behavior. So remove the ioremap_uc() definition in architecutures
> other than x86 and ia64. These architectures all have asm-generic/io.h
> included and will have the default ioremap_uc() definition which
> returns NULL.
> 
> This changes the existing behaviour, while no need to worry about
> any breakage because in the only callsite of ioremap_uc(), code
> has been adjusted to eliminate the impact. Please see
> atyfb_setup_generic() of drivers/video/fbdev/aty/atyfb_base.c.
> 
> If any new invocation of ioremap_uc() need be added, please consider
> using ioremap() intead or adding a ARCH specific version if necessary.
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> ---
>  Documentation/driver-api/device-io.rst | 9 +++++----
>  arch/alpha/include/asm/io.h            | 1 -
>  arch/hexagon/include/asm/io.h          | 3 ---
>  arch/m68k/include/asm/kmap.h           | 1 -
>  arch/mips/include/asm/io.h             | 1 -
>  arch/parisc/include/asm/io.h           | 2 --
>  arch/powerpc/include/asm/io.h          | 1 -
>  arch/sh/include/asm/io.h               | 2 --
>  arch/sparc/include/asm/io_64.h         | 1 -
>  9 files changed, 5 insertions(+), 16 deletions(-)

this doesn't apply to v6.3-rc1... what tree is this based on ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
