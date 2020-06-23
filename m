Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28443205105
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 13:43:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rkv76xS5zDqSy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 21:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rksM6xp7zDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 21:42:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FdAc3Uuw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49rksM2lbKz9sRf;
 Tue, 23 Jun 2020 21:42:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592912535;
 bh=DhodLWRbjsm1QEKUXGt5fQ+iEJxdsKCEMvDxKJeoPa8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FdAc3UuwwW0TfbyazwNXcrcWdX3+Ki4nOzmmk++Kt/Gf38d/1PF1YBSb7HCiWA+n5
 QXx9woZoyoQvwqmMB1wWGD8NUwHA9rau/jXA5gKNTRfYXIO89oreFFR3EyQJtH6Di1
 6TbQ7AHrf+GxhaOxNcgZY2j7t4QBm5BS4GCO2XA6QyXfVbw+ZMvBak0DbqCq4V6q/2
 swnXtmizzIBgjtiF2YnvkdsnEGjLjniWIpBYHNJS9V0tf6nb8VOLzEPWd2rUdUtmhK
 ZQOq+dPCiZ1J+dGfgON0EnMZxX/4mOVsQJX+hRKVaFcFu0SUZzZUuriiNWuel1Vqmt
 IR4m0IseS6H8w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: linux-next: manual merge of the pidfd tree with the powerpc-fixes
 tree
In-Reply-To: <20200619140148.4ytme4wsvtw2oyrg@wittgenstein>
References: <20200618121131.4ad29150@canb.auug.org.au>
 <878sgjcnjp.fsf@mpe.ellerman.id.au>
 <20200619140148.4ytme4wsvtw2oyrg@wittgenstein>
Date: Tue, 23 Jun 2020 21:42:45 +1000
Message-ID: <87tuz2atze.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Christian Brauner <christian.brauner@ubuntu.com> writes:
> On Fri, Jun 19, 2020 at 09:17:30PM +1000, Michael Ellerman wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> > Hi all,
>> >
>> > Today's linux-next merge of the pidfd tree got a conflict in:
>> >
>> >   arch/powerpc/kernel/syscalls/syscall.tbl
>> >
>> > between commit:
>> >
>> >   35e32a6cb5f6 ("powerpc/syscalls: Split SPU-ness out of ABI")
>> >
>> > from the powerpc-fixes tree and commit:
>> >
>> >   9b4feb630e8e ("arch: wire-up close_range()")
>> >
>> > from the pidfd tree.
>> >
>> > I fixed it up (see below) and can carry the fix as necessary. This
>> > is now fixed as far as linux-next is concerned, but any non trivial
>> > conflicts should be mentioned to your upstream maintainer when your tree
>> > is submitted for merging.  You may also want to consider cooperating
>> > with the maintainer of the conflicting tree to minimise any particularly
>> > complex conflicts.
...
>> 
>> I'm planning to send those changes to Linus for rc2, so the conflict
>> will then be vs mainline. But I guess it's pretty trivial so it doesn't
>> really matter.
>
> close_range() is targeted for the v5.9 merge window. I always do
> test-merges with mainline at the time I'm creating a pr and I'll just
> mention to Linus that there's conflict with ppc. :)

I ended up dropping the patch, so there shouldn't be a conflict anymore.

cheers
