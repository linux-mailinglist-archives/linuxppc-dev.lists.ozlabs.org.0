Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85B1C6903
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 08:36:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H6LD5NC7zDqsW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 16:36:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H6F95Kn4zDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 16:31:40 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 22E0A68C4E; Wed,  6 May 2020 08:31:35 +0200 (CEST)
Date: Wed, 6 May 2020 08:31:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: remove set_fs calls from the coredump code v6
Message-ID: <20200506063134.GA11391@lst.de>
References: <20200505101256.3121270-1-hch@lst.de>
 <CAHk-=wgrHhaM1XCB=E3Zp2Br8E5c_kmVUTd5y06xh5sev5nRMA@mail.gmail.com>
 <877dxqgm7x.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dxqgm7x.fsf@x220.int.ebiederm.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 the arch/x86 maintainers <x86@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 05, 2020 at 03:28:50PM -0500, Eric W. Biederman wrote:
> We probably can.   After introducing a kernel_compat_siginfo that is
> the size that userspace actually would need.
> 
> It isn't something I want to mess with until this code gets merged, as I
> think the set_fs cleanups are more important.
> 
> 
> Christoph made some good points about how ugly the #ifdefs are in
> the generic copy_siginfo_to_user32 implementation.

Take a look at the series you are replying to, the magic x86 ifdefs are
entirely gone from the common code :)
