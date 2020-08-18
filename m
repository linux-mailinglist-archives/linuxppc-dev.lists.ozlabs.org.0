Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D123248DDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 20:22:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWK4x2VjfzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:22:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWJkL4CgwzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 04:06:02 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C0BB768AFE; Tue, 18 Aug 2020 20:05:55 +0200 (CEST)
Date: Tue, 18 Aug 2020 20:05:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc
Message-ID: <20200818180555.GA29185@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
 <319d15b1-cb4a-a7b4-3082-12bb30eb5143@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <319d15b1-cb4a-a7b4-3082-12bb30eb5143@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 18, 2020 at 07:46:22PM +0200, Christophe Leroy wrote:
> I gave it a go on my powerpc mpc832x. I tested it on top of my newest 
> series that reworks the 32 bits signal handlers (see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=196278) with 
> the microbenchmark test used is that series.
>
> With KUAP activated, on top of signal32 rework, performance is boosted as 
> system time for the microbenchmark goes from 1.73s down to 1.56s, that is 
> 10% quicker
>
> Surprisingly, with the kernel as is today without my signal's series, your 
> series degrades performance slightly (from 2.55s to 2.64s ie 3.5% slower).
>
>
> I also observe, in both cases, a degradation on
>
> 	dd if=/dev/zero of=/dev/null count=1M
>
> Without your series, it runs in 5.29 seconds.
> With your series, it runs in 5.82 seconds, that is 10% more time.

That's pretty strage, I wonder if some kernel text cache line
effects come into play here?

The kernel access side is only used in slow path code, so it should
not make a difference, and the uaccess code is simplified and should be
(marginally) faster.

Btw, was this with the __{get,put}_user_allowed cockup that you noticed
fixed?
