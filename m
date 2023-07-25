Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B306C7621F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 21:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9RDy4hRlz3cY2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 05:00:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=libc.org (client-ip=216.12.86.13; helo=brightrain.aerifal.cx; envelope-from=dalias@libc.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 915 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 05:00:04 AEST
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9RDN5GJpz3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 05:00:03 +1000 (AEST)
Date: Tue, 25 Jul 2023 14:44:43 -0400
From: Rich Felker <dalias@libc.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Message-ID: <20230725184443.GA20050@brightrain.aerifal.cx>
References: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com>
 <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
 <107290.1690310391@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <107290.1690310391@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: kim.phillips@arm.com, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@HansenPartnership.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, axboe@kernel.dk, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, Florian Weimer <fweimer@redhat.com>, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vg
 er.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 25, 2023 at 07:39:51PM +0100, David Howells wrote:
> Florian Weimer <fweimer@redhat.com> wrote:
> 
> > > Rather than adding a fchmodat2() syscall, should we add a
> > > "set_file_attrs()" syscall that takes a mask and allows you to set a bunch
> > > of stuff all in one go?  Basically, an interface to notify_change() in the
> > > kernel that would allow several stats to be set atomically.  This might be
> > > of particular interest to network filesystems.
> > 
> > Do you mean atomically as in compare-and-swap (update only if old values
> > match), or just a way to update multiple file attributes with a single
> > system call?
> 
> I was thinking more in terms of the latter.  AFAIK, there aren't any network
> filesystems support a CAS interface on file attributes like that.  To be able
> to do a CAS operation, we'd need to pass in the old values as well as the new.
> 
> Another thing we could look at is doing "create_and_set_attrs()", possibly
> allowing it to take a list of xattrs also.

Can we please not let " hey let's invent a new interface to do
something that will be hard for underlying filesystems to even provide
and that nothing needs because there's no standard API to do it" be
the enemy of "fixing a known problem implementing an existing standard
API that just requires a simple, clearly-scoped syscall to do it"?

Rich
