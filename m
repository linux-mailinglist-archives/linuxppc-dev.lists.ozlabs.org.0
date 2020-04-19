Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870F1AF8B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 10:20:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494jSw6HDNzDrFl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 18:20:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 494jK330xjzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 18:13:59 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A967968BEB; Sun, 19 Apr 2020 10:13:53 +0200 (CEST)
Date: Sun, 19 Apr 2020 10:13:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 1/2] signal: Factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Message-ID: <20200419081353.GF12222@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-3-hch@lst.de> <87pnc5akhk.fsf@x220.int.ebiederm.org>
 <87k12dakfx.fsf_-_@x220.int.ebiederm.org>
 <c51c6192-2ea4-62d8-dd22-305f7a1e0dd3@c-s.fr>
 <87v9lx3t4j.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9lx3t4j.fsf@x220.int.ebiederm.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 18, 2020 at 06:55:56AM -0500, Eric W. Biederman wrote:
> > Is that really an issue to use that set_fs() in the coredump code ?
> 
> Using set_fs() is pretty bad and something that we would like to remove
> from the kernel entirely.  The fewer instances of set_fs() we have the
> better.
> 
> I forget all of the details but set_fs() is both a type violation and an
> attack point when people are attacking the kernel.  The existence of
> set_fs() requires somethings that should be constants to be variables.
> Something about that means that our current code is difficult to protect
> from spectre style vulnerabilities.

Yes, set_fs requires variable based address checking in the uaccess
routines for architectures with a shared address space, or even entirely
different code for architectures with separate kernel and user address
spaces.  My plan is to hopefully kill set_fs in its current form a few
merge windows down the road.  We'll probably still need some form of
it to e.g. mark a thread as kernel thread vs also being able to execute
user code, but it will be much ore limited than before, called from very
few places and actually be a no-op for many architectures.
