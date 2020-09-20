Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBFC27158A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 18:03:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvXRQ4HQYzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 02:03:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvXNH0W80zDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 02:00:29 +1000 (AEST)
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MaIGB-1jwWxs2JkL-00WFF8 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep
 2020 18:00:21 +0200
Received: by mail-qk1-f176.google.com with SMTP id o5so12381285qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 09:00:20 -0700 (PDT)
X-Gm-Message-State: AOAM531883S597OeVzKRpBT4MhWMjid02A6dtXM9H0TKBVXTlotS7bXj
 wowo6MgaEJAYwQeiyUgNYPVtZ3Ydsaslwg+01T8=
X-Google-Smtp-Source: ABdhPJxWyfvCzQQBAWL//h6npTn88fQ05xaOWJspiDrXO43nFmdBtx69etP6R9R9/pXauFf/MfRV57t9JJqYkZya4Ms=
X-Received: by 2002:a37:5d8:: with SMTP id 207mr42809575qkf.352.1600617619461; 
 Sun, 20 Sep 2020 09:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200920151510.GS32101@casper.infradead.org>
In-Reply-To: <20200920151510.GS32101@casper.infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 20 Sep 2020 18:00:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0utXQj+yLh3n2mvi-mX_fPnxz3hKB7+wEof53EgNzDvQ@mail.gmail.com>
Message-ID: <CAK8P3a0utXQj+yLh3n2mvi-mX_fPnxz3hKB7+wEof53EgNzDvQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:G76zNexhw61w0YDGSR6UgZ0ceRQVWOzMpA4R/YcaCUJRGFRsrOU
 Dm/OjdwrqtFnQYr0LghPiEP9cUgzLcuxTCvnwsj1+wJ3Vbp2WbkF+kh/dBokaH3p04tcBm6
 ++s/W+HP1hdfpzLxMahNi6zXM0y0pUTFnqJCGVn5zSf5TmFN1swthPV3ehoa27+qGrponF2
 1xWJkV71gpYuPbssPzpGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RDUn2VcE5Z8=:OWoJByWfHcrJUBqv72FchM
 B25RQCnkZQRt+YxrVa5dJqI3KQcgXfNxBS0BxhLOu2Sxj8sGbGAtywzQ3NDp4+vGSxJe2eXev
 AnU2wPGt6ux1PBJJID503eYAXwm7c//Ckhe9sysjD+SGsH4Lhgp/+L5xPEqXjX1QNmOjZPuZV
 BBNpta9FpvgJCdALhTqZt50zLyiFKhl48gBFYcRcLyIRF4zQGj1xjHk/L53mPcPnZrHyF9c0h
 ZxLXzqrPFw/CMwNxicBs4AtgcukYBt3r7por3Z7K1s9XwpH+1f27fteJGycq732aIEKs2QbpH
 SzaWhy54mWKIxprjbAYpoSPrn8GGpx8uOvWepUxtXfLtsQI7hOcTh3LwFmskH9V/NI7pxzdH/
 BA7MxlmZNZT/VpJVm0dtmD6w5Ub+g73tN33UWh+Vu/G6tGr7PAlWG1anQem3jUUmCAVdLdqfA
 qVBj3DJ1aqFoahcp0HDOGYk8uSljvS2arM/qkaMggpgkYvsIlIvVgSSNXON4DtrhMafZDXFYt
 iZ6uHjeWyTArER66OjOnH+arFdowoWdU3CfkU+bJ+MZHoFMBLXaRN2xsL4XpCAzwn1w1AsGn0
 HlJJxFF202NXBo3TevxQzB7Mfa2SOCYVu2VqMbdAyS6uZmvSTj8bNc/xS13Kd4lD/OuYWaxCa
 iTIgygrh6mk3ySb8bYlrmWeK8t7Vaj/zUEwd+BwE0m96GEVwvJ1Iz7U8g88U/NSYUWkN2B1fB
 0p5ssN1KaC3b9DfaAhR38Nh/XmxDnmhrKSNTQcshRvJt0+DaDHTC2aU6dpZBukQJ0gk0KTFBc
 Ugq05s5t+Xub8YkyRLS23b/ypr6GYKlby9lzuFpcKiu9ImAV6Bik1tvQrlURtLYnTEkgiIfmL
 XnKJhlvVOSmh3mA4rdJEuuihffnAwru/h0fwB+TXbYchDPuwwgMjO1oDrLwRb/bd5v88sDlJ/
 yY1SrJdAG44eGxicVe9GHfysFxZyIxGbHqs8vfvBKKbT7nlpzhVVx
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
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 20, 2020 at 5:15 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Fri, Sep 18, 2020 at 02:45:25PM +0200, Christoph Hellwig wrote:
> > Add a flag to force processing a syscall as a compat syscall.  This is
> > required so that in_compat_syscall() works for I/O submitted by io_uring
> > helper threads on behalf of compat syscalls.
>
> Al doesn't like this much, but my suggestion is to introduce two new
> opcodes -- IORING_OP_READV32 and IORING_OP_WRITEV32.  The compat code
> can translate IORING_OP_READV to IORING_OP_READV32 and then the core
> code can know what that user pointer is pointing to.

How is that different from the current approach of storing the ABI as
a flag in ctx->compat?

     Arnd
