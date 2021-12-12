Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD8F4719E3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 12:48:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBjZq3R0tz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 22:48:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DBuAHgfz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=DBuAHgfz; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBjZ50ndqz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 22:47:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cdIWjpexE795gzuTbGkhPUpnRr/U2TeKiWDOHNiXINU=; b=DBuAHgfzGOIMRSDJohGgbB9HgK
 ghrV2KCPdFwOYiKPJbGZmSBlu830exEyDU1H933xIMmToosr9grTCGE55WJZij6cZJgiJ1q30Hz6n
 hZ10t4g0j/sD0EiJhnKSD6jRzu1/6oOpBcVGGwdhdZP63WKKmTkX5QTrHpV8qjjFHIi/X5QMWkaoG
 kknEssmq/uipXQiDMvDkVUnKo+GmhJFGjhExQwE0EWBz9jMfQIQFxVuyBDOWKu8J+hXb6Owf3uTdh
 8Fl4Is3Mc1bjDe5u/B8VTKoy9i1C2ETLTUE3K71/BU8t21Bssus2/nA1qsleo4QX3UFxfJvaTfFhq
 xMZgWXeA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mwNKJ-00Bt8s-Ff; Sun, 12 Dec 2021 11:47:35 +0000
Date: Sun, 12 Dec 2021 11:47:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v2 0/2] kdump: simplify code
Message-ID: <YbXhVxRJfjvKw++W@casper.infradead.org>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
 <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
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
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Xuefeng Li <lixuefeng@loongson.cn>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 'Tiezhu Yang' <yangtiezhu@loongson.cn>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 11, 2021 at 05:53:46PM +0000, David Laight wrote:
> From: Tiezhu Yang
> > Sent: 11 December 2021 03:33
> > 
> > v2:
> >   -- add copy_to_user_or_kernel() in lib/usercopy.c
> >   -- define userbuf as bool type
> 
> Instead of having a flag to indicate whether the buffer is user or kernel,
> would it be better to have two separate buffer pointers.
> One for a user space buffer, the other for a kernel space buffer.
> Exactly one of the buffers should always be NULL.

No.  You should be using an iov_iter instead.  See
https://lore.kernel.org/all/Ya4bdB0UBJCZhUSo@casper.infradead.org/
for a start on this.
