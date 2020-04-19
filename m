Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A61AF8B5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 10:23:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494jWT3czbzDqFH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 18:23:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 494jRQ3vkBzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 18:19:30 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5319B68BEB; Sun, 19 Apr 2020 10:19:26 +0200 (CEST)
Date: Sun, 19 Apr 2020 10:19:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: remove set_fs calls from the exec and coredump code v2
Message-ID: <20200419081926.GA12539@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <87r1wl68gf.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1wl68gf.fsf@x220.int.ebiederm.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 17, 2020 at 05:41:52PM -0500, Eric W. Biederman wrote:
> > this series gets rid of playing with the address limit in the exec and
> > coredump code.  Most of this was fairly trivial, the biggest changes are
> > those to the spufs coredump code.
> >
> > Changes since v1:
> >  - properly spell NUL
> >  - properly handle the compat siginfo case in ELF coredumps
> 
> Quick question is exec from a kernel thread within the scope of what you
> are looking at?
> 
> There is a set_fs(USER_DS) in flush_old_exec whose sole purpose appears
> to be to allow exec from kernel threads.  Where the kernel threads
> run with set_fs(KERNEL_DS) until they call exec.

This series doesn't really look at that area.  But I don't think exec
from a kernel thread makes any sense, and cleaning up how to set the
initial USER_DS vs KERNEL_DS state is something I'll eventually get to,
it seems like a major mess at the moment.
