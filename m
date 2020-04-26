Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE11B8C66
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 06:49:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498wRQ0hRFzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 14:49:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=VFSFTqIk; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498wPZ113wzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 14:47:28 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBF99206D4;
 Sun, 26 Apr 2020 04:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587876445;
 bh=Ed67bnHI9OcrbnOogb7cRpweoPOXndi3LfHAp1KEHNU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VFSFTqIkT30VQv/yqmwoiheYULSHC7LBREaYVEFRbiJt7N9sU3UVjVvCyt//ew1k3
 QWT1YQSEti18WMfchHZBCnyl9qpwh+UmcBplK9lmYsDiAgsRv62q1g57b9dtVVzqAz
 Dwl5D4QRSHUBhY/aww8YGmR9u9n6LKHhV87QfYvw=
Date: Sat, 25 Apr 2020 21:47:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/7] signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Message-Id: <20200425214724.a9a00c76edceff7296df7874@linux-foundation.org>
In-Reply-To: <20200421154204.252921-3-hch@lst.de>
References: <20200421154204.252921-1-hch@lst.de>
 <20200421154204.252921-3-hch@lst.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jeremy Kerr <jk@ozlabs.org>,
 linux-kernel@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Apr 2020 17:41:59 +0200 Christoph Hellwig <hch@lst.de> wrote:

> To remove the use of set_fs in the coredump code there needs to be a
> way to convert a kernel siginfo to a userspace compat siginfo.
> 
> Call that function copy_siginfo_to_compat and factor it out of
> copy_siginfo_to_user32.
> 
> The existence of x32 complicates this code.  On x32 SIGCHLD uses 64bit
> times for utime and stime.  As only SIGCHLD is affected and SIGCHLD
> never causes a coredump I have avoided handling that case.

x86_64 allmodconfig:

kernel/signal.c: In function 'copy_siginfo_to_external32':
kernel/signal.c:3299:7: error: 'x32_ABI' undeclared (first use in this function); did you mean 'CTL_ABI'?
   if (x32_ABI) {
       ^~~~~~~

I looked at fixing it but surely this sort of thing:


int copy_siginfo_to_user32(struct compat_siginfo __user *to,
			   const struct kernel_siginfo *from)
#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
{
	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
}
int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
			     const struct kernel_siginfo *from, bool x32_ABI)
#endif
{
	...


is too ugly to live?
