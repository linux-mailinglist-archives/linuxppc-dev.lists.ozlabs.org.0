Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5086145B01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 18:43:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482t6Z2dx7zDqQt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 04:43:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 482t4p2yQlzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 04:41:46 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1iuK0P-000izi-Q7; Wed, 22 Jan 2020 17:41:29 +0000
Date: Wed, 22 Jan 2020 17:41:29 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
Message-ID: <20200122174129.GH23230@ZenIV.linux.org.uk>
References: <a02d3426f93f7eb04960a4d9140902d278cab0bb.1579697910.git.christophe.leroy@c-s.fr>
 <CAHk-=whTzEu5=sMEVLzuf7uOnoCyUs8wbfw87njes9FyE=mj1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whTzEu5=sMEVLzuf7uOnoCyUs8wbfw87njes9FyE=mj1w@mail.gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 22, 2020 at 08:13:12AM -0800, Linus Torvalds wrote:
> On Wed, Jan 22, 2020 at 5:00 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
> >
> > Modify filldir() and filldir64() to request the real area they need
> > to get access to.
> 
> Not like this.
> 
> This makes the situation for architectures like x86 much worse, since
> you now use "put_user()" for the previous dirent filling. Which does
> that expensive user access setup/teardown twice again.
> 
> So either you need to cover both the dirent's with one call, or you
> just need to cover the whole (original) user buffer passed in. But not
> this unholy mixing of both unsafe_put_user() and regular put_user().

I would suggest simply covering the range from dirent->d_off to
buf->current_dir->d_name[namelen]; they are going to be close to
each other and we need those addresses anyway...
