Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7425FBFD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:48:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D9W93z8DzF6WY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 16:48:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=195.92.253.2;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D9T65vtvzDrFm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 16:46:16 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1iV7v2-0000Ln-Fm; Thu, 14 Nov 2019 05:43:48 +0000
Date: Thu, 14 Nov 2019 05:43:48 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v15 3/9] namei: LOOKUP_NO_XDEV: block mountpoint crossing
Message-ID: <20191114054348.GH26530@ZenIV.linux.org.uk>
References: <20191105090553.6350-1-cyphar@cyphar.com>
 <20191105090553.6350-4-cyphar@cyphar.com>
 <20191113013630.GZ26530@ZenIV.linux.org.uk>
 <20191114044945.ldedzjrb4s7i7irr@yavin.dot.cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114044945.ldedzjrb4s7i7irr@yavin.dot.cyphar.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>, Jeff Layton <jlayton@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 14, 2019 at 03:49:45PM +1100, Aleksa Sarai wrote:
> On 2019-11-13, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Tue, Nov 05, 2019 at 08:05:47PM +1100, Aleksa Sarai wrote:
> > 
> > > @@ -862,6 +870,8 @@ static int nd_jump_root(struct nameidata *nd)
> > >  void nd_jump_link(struct path *path)
> > >  {
> > >  	struct nameidata *nd = current->nameidata;
> > > +
> > > +	nd->last_magiclink.same_mnt = (nd->path.mnt == path->mnt);
> > >  	path_put(&nd->path);
> > >  
> > >  	nd->path = *path;
> > > @@ -1082,6 +1092,10 @@ const char *get_link(struct nameidata *nd)
> > >  		if (nd->flags & LOOKUP_MAGICLINK_JUMPED) {
> > >  			if (unlikely(nd->flags & LOOKUP_NO_MAGICLINKS))
> > >  				return ERR_PTR(-ELOOP);
> > > +			if (unlikely(nd->flags & LOOKUP_NO_XDEV)) {
> > > +				if (!nd->last_magiclink.same_mnt)
> > > +					return ERR_PTR(-EXDEV);
> > > +			}
> > >  		}
> > 
> > Ugh...  Wouldn't it be better to take that logics (some equivalent thereof)
> > into nd_jump_link()?  Or just have nd_jump_link() return an error...
> 
> This could be done, but the reason for stashing it away in
> last_magiclink is because of the future magic-link re-opening patches
> which can't be implemented like that without putting the open_flags
> inside nameidata (which was decided to be too ugly a while ago).
> 
> My point being that I could implement it this way for this series, but
> I'd have to implement something like last_magiclink when I end up
> re-posting the magic-link stuff in a few weeks.
> 
> Looking at all the nd_jump_link() users, the other option is to just
> disallow magic-link crossings entirely for LOOKUP_NO_XDEV. The only
> thing allowing them permits is to resolve file descriptors that are
> pointing to the same procfs mount -- and it's unclear to me how useful
> that really is (apparmorfs and nsfs will always give -EXDEV because
> aafs_mnt and nsfs_mnt are internal kernel vfsmounts).

I would rather keep the entire if (nd->flags & LOOKUP_MAGICLINK_JUMPED)
out of the get_link().  If you want to generate some error if
nd_jump_link() has been called, just do it right there.  The fewer
pieces of state need to be carried around, the better...

And as for opening them...  Why would you need full open_flags in there?
Details, please...
