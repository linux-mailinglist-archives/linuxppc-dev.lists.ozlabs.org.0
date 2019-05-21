Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEC25835
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 21:21:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457lxv03SvzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 05:21:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 457lwS250SzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 05:20:37 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hTAIz-0003v8-BX; Tue, 21 May 2019 19:20:09 +0000
Date: Tue, 21 May 2019 20:20:09 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521192009.GK17978@ZenIV.linux.org.uk>
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28114.1558456227@warthog.procyon.org.uk>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, oleg@redhat.com,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, shuah@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, miklos@szeredi.hu,
 x86@kernel.org, torvalds@linux-foundation.org,
 Christian Brauner <christian@brauner.io>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de,
 ldv@altlinux.org, linux-arm-kernel@lists.infradead.org, fweimer@redhat.com,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 05:30:27PM +0100, David Howells wrote:

> If we can live with close_from(int first) rather than close_range(), then this
> can perhaps be done a lot more efficiently by:
> 
> 	new = alloc_fdtable(first);
> 	spin_lock(&files->file_lock);
> 	old = files_fdtable(files);
> 	copy_fds(new, old, 0, first - 1);
> 	rcu_assign_pointer(files->fdt, new);
> 	spin_unlock(&files->file_lock);
> 	clear_fds(old, 0, first - 1);
> 	close_fdt_from(old, first);
> 	kfree_rcu(old);

I really hate to think how that would interact with POSIX locks...
