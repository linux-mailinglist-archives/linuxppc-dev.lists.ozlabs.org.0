Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BC2717F7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 22:51:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvfqW5N1wzDqfG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 06:51:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvfnj5VHCzDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 06:49:27 +1000 (AEST)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MtwIW-1kcbd73koG-00uHe9 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep
 2020 22:49:22 +0200
Received: by mail-qt1-f174.google.com with SMTP id h6so10585290qtd.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 13:49:21 -0700 (PDT)
X-Gm-Message-State: AOAM5313PUKFi3jYb3gIT3aig8u77eAY8IRKfFRzHIj0PLmfqkIU2x6V
 XiB97JjqB6+DQU+Sn9kmUpz/XJTffncomXlxzZs=
X-Google-Smtp-Source: ABdhPJwBXwBil3iRHV11f3BxYsgRD++l69TenwTYSqKgYe+2Dux9TFUrSKvqlq1FFlXpzrttVMSzDz47tEK6RfJnMjg=
X-Received: by 2002:aed:2ce5:: with SMTP id g92mr30020804qtd.204.1600634960428; 
 Sun, 20 Sep 2020 13:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200920151510.GS32101@casper.infradead.org>
 <20200920180742.GN3421308@ZenIV.linux.org.uk>
 <20200920190159.GT32101@casper.infradead.org>
 <20200920191031.GQ3421308@ZenIV.linux.org.uk>
 <20200920192259.GU32101@casper.infradead.org>
 <CALCETrXVtBkxNJcMxf9myaKT9snHKbCWUenKHGRfp8AOtORBPg@mail.gmail.com>
In-Reply-To: <CALCETrXVtBkxNJcMxf9myaKT9snHKbCWUenKHGRfp8AOtORBPg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 20 Sep 2020 22:49:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a37BRFj_qg61gP2oVrjJzBrZ58y1vggeTk_5n55Ou5U2Q@mail.gmail.com>
Message-ID: <CAK8P3a37BRFj_qg61gP2oVrjJzBrZ58y1vggeTk_5n55Ou5U2Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tF9TCQw5lIg2NZZ07atGwdwzig7ixcDmZTV5roQ9LPJ1TtGCefg
 Vk1onuElp+7G+py8xGfjRSaIzJjk6rw8cEWxg3w/b/q/lUS/HE9lqdV110WiPaDCbLra4xo
 D0OLli1S+sR+q1hTs/YkOiw9REZKXL+UxeDwN7F6YEsfWDAINXlixrt4rpvKZk8cEZcQRGX
 5LpToZLPlQn3ibGiCBOgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X2rR3gD86rs=:QHrX1a0kCRrKudyMYx+I1p
 hubGa4wIaipoUc3M6J366Zgws+mxWEJBTMET990oS7ng9Hf+d5MKIZmCAsJP2tqXo9YEoDkl0
 BylvG9Dg0eeOxKv6nqx3pIq3Pcls1UYzuq9+R158lDxVLxU5ZLVYR/Se2VBgM4UjT5MvWEgiF
 ai/xZDU0lG9EIXYhGbwlKmyXYOuCpMi3KVyMlDZtwIjioYMOFjrhhGmUTAVS8Ju6NYTbwHJ4D
 imPUE9kXpQOVaPsX9KJ3hMOiXxfVPxpkoVovQHT0v7JbG2K72NxAfyRLamyZfg436NdtWTORa
 p5AMpmVrOZ+QJyL0/xSbf3c6dG7UaZTXDzOSsKtNmOxiezE4CVctQX/nRtbXQfB5DUBPpZvOh
 6T062fIcdljZEKOLisoD0EoC6xOV+7yeLQnmBJPIxxUssru5vZBzgdOVdD46NRdnq7Va2PsIO
 NhFOWgs+M2f5Ieqa4v+VwqNG8bwRLDxQ0BPZA4dEuvpwDg20k046TYV8h409SHIr9E/4Sbjh6
 yJo4Olt1Cpb56gCwT+PF46h1elNcTXY84xayYD7iGV4eJoA2A9Gw/JnPMarNp+ge83KP7KT10
 iH+/gJge8d6gJhUt2s0P6JBa5TVQBJEu+1D4g61UvohDjPVHQFPket3BD54bPCI5beZw0ITA/
 2fuYs2M1fHtH4tPbcF2Y1GwdQae+4mTBJOBYVEFOpPlJYwFMgMZqA4Tnug8bh9sbIuhOAxiGs
 SAjjeLDAyaLoiygdv6mAxoXEEzn6xh/bB1GZ/r/eoo6ZCOXMa7aQgdPQJcz9s1r0twFjI2XAo
 Don6yhgtkFTm1GTAl8MSjzfo3Y4dzg9+nEdOH0+wRSDqIRAf9x7hRHaa7Y+IZ04N6jHngNE5R
 WZUc3h+lMN3/bIdLasqLAAqDmTRDqqlgO5Be9uSRRNocuQulYpyPysoMli4t2wNL8PKwrHqy5
 cANLkXVtVRkrtBpLQYKn87u0MM3tzkczTB753OCE28BxqGqZlI9k+
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
 Matthew Wilcox <willy@infradead.org>,
 linux-block <linux-block@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
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

On Sun, Sep 20, 2020 at 9:28 PM Andy Lutomirski <luto@kernel.org> wrote:
> On Sun, Sep 20, 2020 at 12:23 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Sun, Sep 20, 2020 at 08:10:31PM +0100, Al Viro wrote:
> > > IMO it's much saner to mark those and refuse to touch them from io_uring...
> >
> > Simpler solution is to remove io_uring from the 32-bit syscall list.
> > If you're a 32-bit process, you don't get to use io_uring.  Would
> > any real users actually care about that?
>
> We could go one step farther and declare that we're done adding *any*
> new compat syscalls :)

Would you also stop adding system calls to native 32-bit systems then?

On memory constrained systems (less than 2GB a.t.m.), there is still a
strong demand for running 32-bit user space, but all of the recent Arm
cores (after Cortex-A55) dropped the ability to run 32-bit kernels, so
that compat mode may eventually become the primary way to run
Linux on cheap embedded systems.

I don't think there is any chance we can realistically take away io_uring
from the 32-bit ABI any more now.

      Arnd
