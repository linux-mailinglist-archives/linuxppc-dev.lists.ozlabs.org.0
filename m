Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE09519C71E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:32:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tTB96p4jzDrSL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 03:32:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tT7X586VzDqts
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 03:30:16 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jK2is-008oQu-I7; Thu, 02 Apr 2020 16:29:42 +0000
Date: Thu, 2 Apr 2020 17:29:42 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
Message-ID: <20200402162942.GG23230@ZenIV.linux.org.uk>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 keescook@chromium.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 airlied@linux.ie, hpa@zytor.com, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, daniel@ffwll.ch, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 07:34:16AM +0000, Christophe Leroy wrote:
> Some architectures like powerpc64 have the capability to separate
> read access and write access protection.
> For get_user() and copy_from_user(), powerpc64 only open read access.
> For put_user() and copy_to_user(), powerpc64 only open write access.
> But when using unsafe_get_user() or unsafe_put_user(),
> user_access_begin open both read and write.
> 
> Other architectures like powerpc book3s 32 bits only allow write
> access protection. And on this architecture protection is an heavy
> operation as it requires locking/unlocking per segment of 256Mbytes.
> On those architecture it is therefore desirable to do the unlocking
> only for write access. (Note that book3s/32 ranges from very old
> powermac from the 90's with powerpc 601 processor, till modern
> ADSL boxes with PowerQuicc II modern processors for instance so it
> is still worth considering)
> 
> In order to avoid any risk based of hacking some variable parameters
> passed to user_access_begin/end that would allow hacking and
> leaving user access open or opening too much, it is preferable to
> use dedicated static functions that can't be overridden.
> 
> Add a user_read_access_begin and user_read_access_end to only open
> read access.
> 
> Add a user_write_access_begin and user_write_access_end to only open
> write access.
> 
> By default, when undefined, those new access helpers default on the
> existing user_access_begin and user_access_end.

The only problem I have is that we'd better choose the calling
conventions that work for other architectures as well.

AFAICS, aside of ppc and x86 we have (at least) this:
arm:
	unsigned int __ua_flags = uaccess_save_and_enable();
	...
	uaccess_restore(__ua_flags);
arm64:
	uaccess_enable_not_uao();
	...
	uaccess_disable_not_uao();
riscv:
	__enable_user_access();
	...
	__disable_user_access();
s390/mvc:
	old_fs = enable_sacf_uaccess();
	...
        disable_sacf_uaccess(old_fs);

arm64 and riscv are easy - they map well on what we have now.
The interesting ones are ppc, arm and s390.

You wants to specify the kind of access; OK, but...  it's not just read
vs. write - there's read-write as well.  AFAICS, there are 3 users of
that:
	* copy_in_user()
	* arch_futex_atomic_op_inuser()
	* futex_atomic_cmpxchg_inatomic()
The former is of dubious utility (all users outside of arch are in
the badly done compat code), but the other two are not going to go
away.

What should we do about that?  Do we prohibit such blocks outside
of arch?

What should we do about arm and s390?  There we want a cookie passed
from beginning of block to its end; should that be a return value?

And at least on arm that thing nests (see e.g. __clear_user_memset()
there), so "stash that cookie in current->something" is not a solution...

Folks, let's sort that out while we still have few users of that
interface; changing the calling conventions later will be much harder.
Comments?
