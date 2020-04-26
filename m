Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D59791B8D94
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 09:42:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4990HH6SWXzDqdP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 17:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4990FV5qg2zDqVN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 17:40:45 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0E93D68C65; Sun, 26 Apr 2020 09:40:40 +0200 (CEST)
Date: Sun, 26 Apr 2020 09:40:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/7] signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Message-ID: <20200426074039.GA31501@lst.de>
References: <20200421154204.252921-1-hch@lst.de>
 <20200421154204.252921-3-hch@lst.de>
 <20200425214724.a9a00c76edceff7296df7874@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425214724.a9a00c76edceff7296df7874@linux-foundation.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jeremy Kerr <jk@ozlabs.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 09:47:24PM -0700, Andrew Morton wrote:
> I looked at fixing it but surely this sort of thing:
> 
> 
> int copy_siginfo_to_user32(struct compat_siginfo __user *to,
> 			   const struct kernel_siginfo *from)
> #if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
> {
> 	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
> }
> int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
> 			     const struct kernel_siginfo *from, bool x32_ABI)
> #endif
> {
> 	...
> 
> 
> is too ugly to live?

I fixed it up in my earlier versions, but Eric insisted to keep it,
which is why I switched to his version given that he is the defacto
signal.c maintainer.

Here is what I would have preferred:

https://www.spinics.net/lists/kernel/msg3473847.html
https://www.spinics.net/lists/kernel/msg3473840.html
https://www.spinics.net/lists/kernel/msg3473843.html
