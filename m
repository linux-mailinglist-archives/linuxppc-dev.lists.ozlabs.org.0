Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC782271794
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 21:30:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvd2H2pznzDqkC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 05:30:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JjkWdzs8; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvd0P1Mw7zDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 05:28:36 +1000 (AEST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C65F422262
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600630114;
 bh=MvoJlqBNzeGMhQj08qmauzE2jefx91WtS5O4xpiUc2w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JjkWdzs8l4VG7axJD8j1N7zsDNyHx01VvIoenQP0XrkbTc8PSIPFDC+ocOwK5vc2K
 RrxibNtkQ6Bu2l0c6FA8qAmsm6Zk+9gHRRr0jrtaswknN6/RVSUvSl9tUHIGyxATeV
 mD5rOKF8ZZ6lwaLYgtTds2laysQr8iIjXXnAGF54=
Received: by mail-wr1-f41.google.com with SMTP id s12so10555261wrw.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 12:28:33 -0700 (PDT)
X-Gm-Message-State: AOAM530Ep59NJI52mBbd1dbDWTriJnZiUmIOcsWhi8lDhRkt1fK0NZls
 MStS1NVew1BT7hQYn2SsJkAED1RT/zqJrfzlu16ZKg==
X-Google-Smtp-Source: ABdhPJyGRJyXPIIAcXrNp8ibkDlg/u7fNSqAcKhSzeIjm5dJtxkt9PxOngbofryv0JcZUoQWH7pgaf1q3lhvPecaOZc=
X-Received: by 2002:a5d:6a47:: with SMTP id t7mr48111800wrw.75.1600630112287; 
 Sun, 20 Sep 2020 12:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200920151510.GS32101@casper.infradead.org>
 <20200920180742.GN3421308@ZenIV.linux.org.uk>
 <20200920190159.GT32101@casper.infradead.org>
 <20200920191031.GQ3421308@ZenIV.linux.org.uk>
 <20200920192259.GU32101@casper.infradead.org>
In-Reply-To: <20200920192259.GU32101@casper.infradead.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Sun, 20 Sep 2020 12:28:20 -0700
X-Gmail-Original-Message-ID: <CALCETrXVtBkxNJcMxf9myaKT9snHKbCWUenKHGRfp8AOtORBPg@mail.gmail.com>
Message-ID: <CALCETrXVtBkxNJcMxf9myaKT9snHKbCWUenKHGRfp8AOtORBPg@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-block <linux-block@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
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

On Sun, Sep 20, 2020 at 12:23 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sun, Sep 20, 2020 at 08:10:31PM +0100, Al Viro wrote:
> > IMO it's much saner to mark those and refuse to touch them from io_uring...
>
> Simpler solution is to remove io_uring from the 32-bit syscall list.
> If you're a 32-bit process, you don't get to use io_uring.  Would
> any real users actually care about that?

We could go one step farther and declare that we're done adding *any*
new compat syscalls :)



-- 
Andy Lutomirski
AMA Capital Management, LLC
