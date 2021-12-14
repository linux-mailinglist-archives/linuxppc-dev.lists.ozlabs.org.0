Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C1474341
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 14:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCzQR60Zdz30HX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 00:15:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XK2cZMDZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=XK2cZMDZ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCzPk5TXcz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 00:15:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+SjuTfMdZX234WsFLTKgVuTlJHNKJQ6+73Q7tXhFwCc=; b=XK2cZMDZBs7uBis/aCOTIfy5Id
 Woqbhfb9Jy/KCZQKrZRNKBni0OPi2vhjbBCFXVTZZwdfNF56JsdsQ62OYcF94p2H7RI22o/MO9Gze
 79MLQCmvpO5GoJH/Wc3U5bT1kFBO7szsOivwVrpgEe7O/dPOSpHXg5RQnCMxsxVg4sEL5yLxKaGaN
 o2+DlolygGwKfZqa8tJ/Igl2vUcTDqbbAeBp3a6cbU7DI3cqvUrdvjVUunJvazeyk7h1+n8aLITmy
 mHMZsUktXu9JXz8kjVqgNxu5akRJTqIaRWUcQM0R8KY9P3voRZitjZtMGV0nZpFi23pCL7fHt8sO7
 e7KFAFsQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mx7do-00DjQw-6u; Tue, 14 Dec 2021 13:14:48 +0000
Date: Tue, 14 Dec 2021 13:14:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v2 0/2] kdump: simplify code
Message-ID: <YbiYyDRW9aB9jFMD@casper.infradead.org>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
 <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
 <YbXhVxRJfjvKw++W@casper.infradead.org>
 <b7a75ae9253445af81ff2fedd5268af4@AcuMS.aculab.com>
 <YbdcKK3Cq6ITTg/l@casper.infradead.org>
 <36440c0f-8b8a-c401-684f-6f54ce9c061e@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36440c0f-8b8a-c401-684f-6f54ce9c061e@loongson.cn>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Baoquan He <bhe@redhat.com>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>, Vivek Goyal <vgoyal@redhat.com>,
 Xuefeng Li <lixuefeng@loongson.cn>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 14, 2021 at 06:03:11PM +0800, Tiezhu Yang wrote:
> On 12/13/2021 10:43 PM, Matthew Wilcox wrote:
> > On Mon, Dec 13, 2021 at 08:30:33AM +0000, David Laight wrote:
> > > From: Matthew Wilcox
> > > > Sent: 12 December 2021 11:48
> > > > 
> > > > On Sat, Dec 11, 2021 at 05:53:46PM +0000, David Laight wrote:
> > > > > From: Tiezhu Yang
> > > > > > Sent: 11 December 2021 03:33
> > > > > > 
> > > > > > v2:
> > > > > >   -- add copy_to_user_or_kernel() in lib/usercopy.c
> > > > > >   -- define userbuf as bool type
> > > > > 
> > > > > Instead of having a flag to indicate whether the buffer is user or kernel,
> > > > > would it be better to have two separate buffer pointers.
> > > > > One for a user space buffer, the other for a kernel space buffer.
> > > > > Exactly one of the buffers should always be NULL.
> > > > 
> > > > No.  You should be using an iov_iter instead.  See
> > > > https://lore.kernel.org/all/Ya4bdB0UBJCZhUSo@casper.infradead.org/
> > > > for a start on this.
> > > 
> > > iov_iter gets horribly expensive...
> > 
> > Oh, right.  Reading the kcore is a high-performance path, my mistake.
> > 
> 
> Hi,
> 
> Thank you for your discussions.
> 
> The intention of this patchset is to simplify the related code with no
> functional changes and no side effects.
> 
> At this moment, if you are OK, I will send v3 used with inline function
> copy_to_user_or_kernel() to keep it simple, maybe other more changes can
> be done in the future if no any side effect.

That would be pointless.  I already sent a series to remove this,
which you were cc'd on.
