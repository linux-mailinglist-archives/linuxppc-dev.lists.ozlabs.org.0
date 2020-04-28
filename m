Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8EE1BB745
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 09:11:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BCVh2VB2zDqxG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 17:11:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BCSg5whWzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 17:09:39 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C417368CEC; Tue, 28 Apr 2020 09:09:35 +0200 (CEST)
Date: Tue, 28 Apr 2020 09:09:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/7] signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Message-ID: <20200428070935.GE18754@lst.de>
References: <20200421154204.252921-1-hch@lst.de>
 <20200421154204.252921-3-hch@lst.de>
 <20200425214724.a9a00c76edceff7296df7874@linux-foundation.org>
 <20200426074039.GA31501@lst.de>
 <20200427154050.e431ad7fb228610cc6b95973@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427154050.e431ad7fb228610cc6b95973@linux-foundation.org>
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

On Mon, Apr 27, 2020 at 03:40:50PM -0700, Andrew Morton wrote:
> > https://www.spinics.net/lists/kernel/msg3473847.html
> > https://www.spinics.net/lists/kernel/msg3473840.html
> > https://www.spinics.net/lists/kernel/msg3473843.html
> 
> OK, but that doesn't necessitate the above monstrosity?  How about
> 
> static int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
> 			     const struct kernel_siginfo *from, bool x32_ABI)
> {
> 	struct compat_siginfo new;
> 	copy_siginfo_to_external32(&new, from);
> 	...
> }
> 
> int copy_siginfo_to_user32(struct compat_siginfo __user *to,
> 			   const struct kernel_siginfo *from)
> {
> #if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
> 	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
> #else
> 	return __copy_siginfo_to_user32(to, from, 0);
> #endif
> }
> 
> Or something like that - I didn't try very hard.  We know how to do
> this stuff, and surely this thing isn't how!

I guess that might be a worthwhile middle ground.  Still not a fan of
all these ifdefs..
