Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE85271142
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 00:43:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv5M4138WzDqwD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 08:42:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv5KT3vxDzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 08:41:33 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kJlXm-001zb3-7c; Sat, 19 Sep 2020 22:41:22 +0000
Date: Sat, 19 Sep 2020 23:41:22 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Message-ID: <20200919224122.GJ3421308@ZenIV.linux.org.uk>
References: <20200919220920.GI3421308@ZenIV.linux.org.uk>
 <AA2CFC7E-E685-4596-84AD-0E314137B93F@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AA2CFC7E-E685-4596-84AD-0E314137B93F@amacapital.net>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 03:23:54PM -0700, Andy Lutomirski wrote:
> 
> > On Sep 19, 2020, at 3:09 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > 
> > ﻿On Fri, Sep 18, 2020 at 05:16:15PM +0200, Christoph Hellwig wrote:
> >>> On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
> >>> Said that, why not provide a variant that would take an explicit
> >>> "is it compat" argument and use it there?  And have the normal
> >>> one pass in_compat_syscall() to that...
> >> 
> >> That would help to not introduce a regression with this series yes.
> >> But it wouldn't fix existing bugs when io_uring is used to access
> >> read or write methods that use in_compat_syscall().  One example that
> >> I recently ran into is drivers/scsi/sg.c.
> > 
> > So screw such read/write methods - don't use them with io_uring.
> > That, BTW, is one of the reasons I'm sceptical about burying the
> > decisions deep into the callchain - we don't _want_ different
> > data layouts on read/write depending upon the 32bit vs. 64bit
> > caller, let alone the pointer-chasing garbage that is /dev/sg.
> 
> Well, we could remove in_compat_syscall(), etc and instead have an implicit parameter in DEFINE_SYSCALL.  Then everything would have to be explicit.  This would probably be a win, although it could be quite a bit of work.

It would not be a win - most of the syscalls don't give a damn
about 32bit vs. 64bit...
