Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FA66FD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 15:15:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lYLW3VHdzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 23:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=ftp.linux.org.uk
 (client-ip=195.92.253.2; helo=zeniv.linux.org.uk;
 envelope-from=viro@ftp.linux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lYFX39BkzDqpq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 23:10:40 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hlvJN-0007n9-6P; Fri, 12 Jul 2019 13:10:05 +0000
Date: Fri, 12 Jul 2019 14:10:05 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v9 01/10] namei: obey trailing magic-link DAC permissions
Message-ID: <20190712131005.GM17978@ZenIV.linux.org.uk>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-2-cyphar@cyphar.com>
 <20190712041454.GG17978@ZenIV.linux.org.uk>
 <20190712122017.xkowq2cjreylpotm@yavin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712122017.xkowq2cjreylpotm@yavin>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 12, 2019 at 10:20:17PM +1000, Aleksa Sarai wrote:
> On 2019-07-12, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Sun, Jul 07, 2019 at 12:57:28AM +1000, Aleksa Sarai wrote:
> > > @@ -514,7 +516,14 @@ static void set_nameidata(struct nameidata *p, int dfd, struct filename *name)
> > >  	p->stack = p->internal;
> > >  	p->dfd = dfd;
> > >  	p->name = name;
> > > -	p->total_link_count = old ? old->total_link_count : 0;
> > > +	p->total_link_count = 0;
> > > +	p->acc_mode = 0;
> > > +	p->opath_mask = FMODE_PATH_READ | FMODE_PATH_WRITE;
> > > +	if (old) {
> > > +		p->total_link_count = old->total_link_count;
> > > +		p->acc_mode = old->acc_mode;
> > > +		p->opath_mask = old->opath_mask;
> > > +	}
> > 
> > Huh?  Could somebody explain why traversals of NFS4 referrals should inherit
> > ->acc_mode and ->opath_mask?
> 
> I'll be honest -- I don't understand what set_nameidata() did so I just
> did what I thought would be an obvious change (to just copy the
> contents). I thought it was related to some aspect of the symlink stack
> handling.

No.  It's handling of (very rare) nested pathwalk.  The only case I can think
of is handling of NFS4 referrals - they are triggered by ->d_automount()
and include NFS4 mount.  Which does internal pathwalk of its own, to get
to the root of subtree being automounted.

NFS has its own recursion protection on that path (no deeper nesting than
one level of referral traversals), but there some nesting is inevitable;
we do get another nameidata instance on stack.  And for nd_jump_link() we
need to keep track of the innermost one.

For symlinks nothing of that sort happens - they are dealt with on the same
struct nameidata.  ->total_link_count copying is there for one reason only -
we want the total amount of symlinks traversed during the pathwalk (including
the referral processing, etc.) to count towards MAXSYMLINKS check.  It could've
been moved from nameidata to task_struct, but it's cheaper to handle it that
way.

Again, nesting is *rare*.

> In that case, should they both be set to 0 on set_nameidata()? This will
> mean that fd re-opening (or magic-link opening) through a
> set_nameidata() would always fail.

Huh?  set_nameidata() is done for *all* instances - it's pretty much the
constructor of that object (and restore_nameidata() - a destructor).
Everything goes through it.

And again, I'm not sure we want these fields in nameidata - IMO they belong
in open_flags.  Things like e.g. stat() don't need them at all.

Incidentally, O_PATH opening of symlinks combined with subsequent procfs
symlink traversals is worth testing - that's where the things get subtle
and that's where it's easy to get in trouble on modifications.
