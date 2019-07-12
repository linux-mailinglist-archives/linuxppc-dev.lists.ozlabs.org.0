Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4375C6657F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 06:17:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lKQM4FzxzDqpv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 14:17:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lKNH5rCLzDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 14:15:41 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hlmxT-000330-0Q; Fri, 12 Jul 2019 04:14:55 +0000
Date: Fri, 12 Jul 2019 05:14:54 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v9 01/10] namei: obey trailing magic-link DAC permissions
Message-ID: <20190712041454.GG17978@ZenIV.linux.org.uk>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-2-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190706145737.5299-2-cyphar@cyphar.com>
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

On Sun, Jul 07, 2019 at 12:57:28AM +1000, Aleksa Sarai wrote:

> @@ -514,7 +516,14 @@ static void set_nameidata(struct nameidata *p, int dfd, struct filename *name)
>  	p->stack = p->internal;
>  	p->dfd = dfd;
>  	p->name = name;
> -	p->total_link_count = old ? old->total_link_count : 0;
> +	p->total_link_count = 0;
> +	p->acc_mode = 0;
> +	p->opath_mask = FMODE_PATH_READ | FMODE_PATH_WRITE;
> +	if (old) {
> +		p->total_link_count = old->total_link_count;
> +		p->acc_mode = old->acc_mode;
> +		p->opath_mask = old->opath_mask;
> +	}

Huh?  Could somebody explain why traversals of NFS4 referrals should inherit
->acc_mode and ->opath_mask?

>  static __always_inline
> -const char *get_link(struct nameidata *nd)
> +const char *get_link(struct nameidata *nd, bool trailing)
>  {
>  	struct saved *last = nd->stack + nd->depth - 1;
>  	struct dentry *dentry = last->link.dentry;
> @@ -1081,6 +1134,44 @@ const char *get_link(struct nameidata *nd)
>  		} else {
>  			res = get(dentry, inode, &last->done);
>  		}
> +		/* If we just jumped it was because of a magic-link. */
> +		if (unlikely(nd->flags & LOOKUP_JUMPED)) {

That's not quite guaranteed (it is possible to bind a symlink on top
of a regular file, and you will get LOOKUP_JUMPED on the entry into
trailing_symlink() when looking the result up).  Moreover, why bother
with LOOKUP_JUMPED here?  See that
	nd->last_type = LAST_BIND;
several lines prior?  That's precisely to be able to recognize those
suckers.

And _that_ would've avoided another piece of ugliness - your LOOKUP_JUMPED
kludge forces you to handle that cra^Wsclero^Wvaluable security hardening
in get_link(), instead of trailing_symlink() where you apparently want
it to be.  Simply because nd_jump_root() done later in get_link() will set
LOOKUP_JUMPED for absolute symlinks, confusing your test.

Moreover, I'm not sure that trailing_symlink() is the right place for
that either - I would be rather tempted to fold do_o_path() into
path_openat(), inline path_lookupat() there (as in
        s = path_init(nd, flags);

        while (!(error = link_path_walk(s, nd))
                && ((error = lookup_last(nd)) > 0)) {
                s = trailing_symlink(nd);
        }
        if (!error)
                error = complete_walk(nd);
        if (!error && nd->flags & LOOKUP_DIRECTORY)
                if (!d_can_lookup(nd->path.dentry))
                        error = -ENOTDIR;
        if (!error) {
                audit_inode(nd->name, nd->path.dentry, 0);
                error = vfs_open(&nd->path, file);
        }
        terminate_walk(nd);
- we don't need LOOKUP_DOWN there) and then we only care about the
two callers of trailing_symlink() that are in path_openat().  Which
is where you have your ->acc_mode and ->opath_mask without the need
to dump them into nameidata.  Or to bring that mess into the
things like stat(2) et.al. - it simply doesn't belong there.

In any case, this "bool trailing" is completely wrong; whether that
check belongs in trailing_symlink() or (some of) its callers, putting
it into get_link() is a mistake, forced by kludgy check for procfs-style
symlinks.
