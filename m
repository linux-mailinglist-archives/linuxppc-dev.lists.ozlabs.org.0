Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AAC2711E0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 05:00:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvC3n6dgPzDqvl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 13:00:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvC1W5qcVzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 12:58:03 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kJpXt-0026Rb-Iq; Sun, 20 Sep 2020 02:57:45 +0000
Date: Sun, 20 Sep 2020 03:57:45 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Message-ID: <20200920025745.GL3421308@ZenIV.linux.org.uk>
References: <20200919224122.GJ3421308@ZenIV.linux.org.uk>
 <36CF3DE7-7B4B-41FD-9818-FDF8A5B440FB@amacapital.net>
 <20200919232411.GK3421308@ZenIV.linux.org.uk>
 <CALCETrViwOdFia_aX4p4riE8aqop1zoOqVfiQtSAZEzheC+Ozg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrViwOdFia_aX4p4riE8aqop1zoOqVfiQtSAZEzheC+Ozg@mail.gmail.com>
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
Cc: linux-aio@kvack.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-block <linux-block@vger.kernel.org>,
 io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 05:14:41PM -0700, Andy Lutomirski wrote:

> > 2) have you counted the syscalls that do and do not need that?
> 
> No.

Might be illuminating...

> > 3) how many of those realistically *can* be unified with their
> > compat counterparts?  [hint: ioctl(2) cannot]
> 
> There would be no requirement to unify anything.  The idea is that
> we'd get rid of all the global state flags.

_What_ global state flags?  When you have separate SYSCALL_DEFINE3(ioctl...)
and COMPAT_SYSCALL_DEFINE3(ioctl...), there's no flags at all, global or
local.  They only come into the play when you try to share the same function
for both, right on the top level.

> For ioctl, we'd have a new file_operation:
> 
> long ioctl(struct file *, unsigned int, unsigned long, enum syscall_arch);
> 
> I'm not saying this is easy, but I think it's possible and the result
> would be more obviously correct than what we have now.

No, it would not.  Seriously, from time to time a bit of RTFS before grand
proposals turns out to be useful.
