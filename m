Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E865D2016B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 18:41:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pPj01tsWzDrRP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 02:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ubuntu.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=christian.brauner@ubuntu.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ubuntu.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL8z4w13zDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 00:02:27 +1000 (AEST)
Received: from ip-109-41-0-196.web.vodafone.de ([109.41.0.196]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jmHau-0002Hs-LG; Fri, 19 Jun 2020 14:02:15 +0000
Date: Fri, 19 Jun 2020 16:01:48 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the pidfd tree with the
 powerpc-fixes tree
Message-ID: <20200619140148.4ytme4wsvtw2oyrg@wittgenstein>
References: <20200618121131.4ad29150@canb.auug.org.au>
 <878sgjcnjp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878sgjcnjp.fsf@mpe.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 19, 2020 at 09:17:30PM +1000, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the pidfd tree got a conflict in:
> >
> >   arch/powerpc/kernel/syscalls/syscall.tbl
> >
> > between commit:
> >
> >   35e32a6cb5f6 ("powerpc/syscalls: Split SPU-ness out of ABI")
> >
> > from the powerpc-fixes tree and commit:
> >
> >   9b4feb630e8e ("arch: wire-up close_range()")
> >
> > from the pidfd tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks.
> 
> I thought the week between rc1 and rc2 would be a safe time to do that
> conversion of the syscall table, but I guess I was wrong :)

:)

> 
> I'm planning to send those changes to Linus for rc2, so the conflict
> will then be vs mainline. But I guess it's pretty trivial so it doesn't
> really matter.

close_range() is targeted for the v5.9 merge window. I always do
test-merges with mainline at the time I'm creating a pr and I'll just
mention to Linus that there's conflict with ppc. :)

Thanks!
Christian
