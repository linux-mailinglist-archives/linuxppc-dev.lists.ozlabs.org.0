Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA46E1D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:38:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qjY85ffRzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:38:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="SEbNU/1/"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qjW266h7zDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 17:36:46 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 02BC77F92F;
 Fri, 19 Jul 2019 02:36:43 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1563521804; bh=DOeY01lxwZti9woJpEBA+lAJ08+UzoDDuA49gXiGLkc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SEbNU/1/gVAOEAoqOo2wZdU0O7c1WarNt7PQrJo9lyC8bPBP/YEB05TZhkfG9Eg9l
 qg1+1iScjT01Bu0kTYRfe8EwSUqsBh0kacfyB/8bUvIfbWD+UQVF5YwAmQOIGc7oI7
 oKDCJkKBELCl38is+tIVTX6QoyFIYUZNhr0PopyyzBYD+Y2LKGuJ39sSCpTJbAUYs4
 T+JBc9Nzw1YrhrvW+WcrJh7HtUoR+tcPhqTjMvYSfHtcm2+PSPk/0KGOVaK4Gsq39v
 ZVtKc2c5hwfIidblCCzMxjpxrLRViP5/AJfWVEWWw2XyvuT8g0a7LOSDcWZZgueoiN
 D7LZXmqSPUWYQ==
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Christoph Hellwig <hch@lst.de>
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
 <20190718084934.GF24562@lst.de> <20190718095200.GA25744@lst.de>
 <2da4fafe-93f2-4bf1-62e1-180a3ac800fa@anastas.io>
 <20190719070659.GA19555@lst.de>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <3dd3bf62-3881-51f1-bbb0-e8ee515bb3d8@anastas.io>
Date: Fri, 19 Jul 2019 02:36:42 -0500
MIME-Version: 1.0
In-Reply-To: <20190719070659.GA19555@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Sam Bobroff <sbobroff@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/19 2:06 AM, Christoph Hellwig wrote:
 > What is inherently architecture specific here over the fact that
 > the pgprot_* expand to architecture specific bits?

What I meant is that different architectures seem to have different
criteria for setting the different pgprot_ bits. i.e. ppc checks
for cache coherency, arm64 checks for cache coherency and
writecombine, mips just checks for writecombine, etc.

That being said, I'm no expert here and there is probably some behavior
here that would make for a much more sane default.

 > I'd rather not create boilerplate code where we don't have to it. Note
 > that arch_dma_mmap_pgprot is a little misnamed now, as we also use it
 > for the in-kernel remapping in kernel/dma/remap.c, which I'm slowly
 > switching a lot of architectures to.  powerpc will follow soon once
 > I get the ppc44x that was given to me to actually boot with a recent
 > kernel (not that I've tried much so far).

Fair enough. I didn't realize that most of the other architectures
don't use the common code anyways as you mention below.

 > Every arch except for arm32 now uses dma direct for the direct mapping,
 > and thus the common code without the indeed odd default.  I also have
 > a series to remove the default fallback, which is inherently a bad idea:
 >
 > 
http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-no-defaults

Awesome. This is great to hear.

 > I think your patch that started this thread is fine for 5.3 and -stable:
 >
 > Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks!

 > But going forward I'd rather have a sane default.

Agreed.
