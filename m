Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC13D7EDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 22:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ7G51WlCz30MC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 06:10:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=BVqWR6/v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=BVqWR6/v; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ7FY2s36z301N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 06:10:23 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C853660F9B;
 Tue, 27 Jul 2021 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1627416620;
 bh=Y+22u+tRLyeCEMBb6In1ZjF6k/Q7kC+hWd73eqYEGas=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BVqWR6/vu3R3J5zfoKCep8iyJZp5vpOXQXMjCpyBKF5+fjjmsM3GAAh9luGKAyX8w
 TnUSkae4d6enUtqjUMLK5elkiFVHeOBBlB/WvoSt+pulwa5YBeWjHLswiQ/pay/Rwt
 WFBpnLlfubVGd5wruQc9aelH0q3iYdqHJRaI6Jng=
Date: Tue, 27 Jul 2021 13:10:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 0/6] compat: remove compat_alloc_user_space
Message-Id: <20210727131017.f151a81fc69db8f45f81a2b3@linux-foundation.org>
In-Reply-To: <YQAfa6iObAwwIpzb@infradead.org>
References: <20210727144859.4150043-1-arnd@kernel.org>
 <YQAfa6iObAwwIpzb@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Feng Tang <feng.tang@intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Jul 2021 15:59:55 +0100 Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, Jul 27, 2021 at 04:48:53PM +0200, Arnd Bergmann wrote:
> > Since these patches are now all that remains, it would be nice to
> > merge it all through Andrew's Linux-mm tree, which is already based
> > on top of linux-next.
> 
> Is it?

the -mm tree is structured as

<90% of stuff>
linux-next.patch
<the other 10% of stuff>

So things like Arnd's series which have a dependency on linux-next
material get added to the "other 10%" and are merged behind the
linux-next material and all is good.

If possible I'll queue things ahead of linux-next.patch.  Those few
things which have dependencies on linux-next material get sent to Linus
after the required linux-next material is merged into mainline.
