Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBBB1F99A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:09:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ltWG1lhJzDqJl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:09:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 352 seconds by postgrey-1.36 at bilbo;
 Mon, 15 Jun 2020 23:43:14 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lswf0l7lzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 23:43:12 +1000 (AEST)
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MvbJw-1isS3G1W1G-00shSU for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun
 2020 15:43:08 +0200
Received: by mail-qt1-f178.google.com with SMTP id j32so12535976qte.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 06:43:08 -0700 (PDT)
X-Gm-Message-State: AOAM532lmLv71x7a8nawEzTGcUbUekS8SMM8X2iS27vFA6wMfk+4osIy
 di8Uar/eaoLmjWDWQiXOOyRvXXX5dAUiIoTsCGs=
X-Google-Smtp-Source: ABdhPJx0OrXbUjQwUsWKBodkMGMMvkpFLaAJzfOc49aX/puOn3OjGDjHT6HOJmLaKzQk1we2dir5thvL/kN4mVexpfQ=
X-Received: by 2002:ac8:7417:: with SMTP id p23mr15803567qtq.204.1592228587251; 
 Mon, 15 Jun 2020 06:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200615130032.931285-1-hch@lst.de>
In-Reply-To: <20200615130032.931285-1-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Jun 2020 15:42:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3CWhrfyR4taGip8xE3U6HcRMtKBY5A69_cqzJwU1N+Cw@mail.gmail.com>
Message-ID: <CAK8P3a3CWhrfyR4taGip8xE3U6HcRMtKBY5A69_cqzJwU1N+Cw@mail.gmail.com>
Subject: Re: properly support exec and wait with kernel pointers
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Hhj12cfEI0sEMkLgti31P8yKQHGcsMLGW2Q3EBNKh4M/ltdbZeC
 1rJDADAejJFceflQoAIPcxk6j3knnJLI/lQbZxtDee23bl+efijOaD5Nae4xhJg4kRLlBQW
 FR50zepJQSjmdiu4+2LX+VnLlU0cgWd3+29kJI4R2nX2VUZ5v03U3vEjMZ/A+KfGS1XJdFc
 BzXNXy7J+J5eIqmQwuvlg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XZocXQHC56c=:GDKGcMR2ei9Dfbl4Xx7dtG
 YzDIJv/E3/75/j3PIXlWtz4OI6mWDsiCmKHoCJkc4TNv48wYUiZiYHBN17ENzm4nCqeWdOIJT
 OgzdedwuPqvsdcLPem2PiHzmiX4ja/s8aVOyO+okBtltZT5y2dNP/16LhSPO5Oro4DWzqoc6C
 wzI3qno1+nm8IqGLPMCLUIWKS/cnuEoYZPeWpWRsYZOZaCTyk54V0miDFo8TIztA2wMUpUYui
 Oh5Wz1Arf22/UGpck09mK+5bFtfDN3WcoXDfGm70KIJqwOGABm+6PeF6AsjrMfhxSCGktfXkf
 kHj8MbSb3Nk+UIPUFRmmv/qdqHDxlB7J+4Y4EujbYy1cyjgPQLEei7Cdof0pdg4gDbbAGsTOD
 modCO0llYTrirTeIlQiDf99IJoK6ikHxKahSWRbwtpwV4HcER3bEdKbKFcN4+Cr/eNVp/NpRH
 rm7f7FY4h1ZIe4I4oCooRZy632NsraLGZ1+NtMbiNvK1qallyCl7KuSGZTlpJT5xI0kQeGbfO
 S5rjfCKdEz0SrdV608NGFDxbcYEWCN6RBbowdeF65fvmcGW4wll7Xnzb3Oin1AMpWdCIyb0H3
 ZsBKqeS6FqBlDmFS7oiEp7NUe8+mBYJsL2EHzbAk/SOZD/xTE4Gq/m7dfK+bYmBLsgXvJGsbl
 P7vm+zNyKhkMGXe9j8C36BGQ3bbTZA9HuSrOYRluOguR3WQiAfETKriR/ghOyncu8UqLmjGtw
 1nEZQn0xDgqNeaEf8m4gyX/i9mRworLq0UFq7ZBI3kiLFm130/NaZJWve/Q/As/6lEhrEbqLZ
 9Z3bsARoYKnjfC8FCEnU3JPKZx/kxMd8wQccNSR9DgQD8WspMs=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 3:00 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> this series first cleans up the exec code and then adds proper
> kernel_execveat and kernel_wait callers instead of relying on the fact
> that the early init code and kernel threads implicitly run with
> the address limit set to KERNEL_DS.
>
> Note that the cleanup removes the compat execve(at) handlers (almost)
> entirely, as we can handle the compat difference very nicely in a
> unified codebase.  The only exception is x86 where this would list the
> handlers twice in the same syscall table due to the messed up x32
> design.  I had to add an extra compat handler just for that case, but
> maybe someone has a better idea.

I looked at all the patches and I like it a lot. I replied with some suggestions
for x32, but maybe I misunderstood what its problem is, as I don't see
anything preventing us from having two entries in the x32 table pointing
to the same function.

       Arnd
