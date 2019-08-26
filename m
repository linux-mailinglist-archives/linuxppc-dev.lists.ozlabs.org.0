Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE39CAD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 09:44:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H3tR0R46zDqZR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 17:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H3rJ74R7zDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 17:42:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lIut4B8w/K6qaNO5//JKDXgxZBzz15ddgNf2zVVfQ1E=; b=f6XJLfxeBVv9Hyb0B1vtj9oxL
 i8iw5LMMkKhG+T6Xu47kb2+iCLpMrKBQjXS1NBw74AP7B3pgxUBsbndSWQGizhRtNCAgW99j5+OeI
 c+T+1uJAk4oCoRSmOm0NE/wm6iL8VH+qSfESDzvXkGeSKy+GyCJWsD5r3LnItvz8EK4g8tAXBgRgi
 JMSMaRtxN+OddwD4UaHD/oWS7Za8/f15E/5LTf3nBtMiL8X2OQpSYRhvIozCuZOKt/2bBeTu5XD5k
 MSr7q1wHFvaw9hwCCzoDKZY0xDJWDWNsCSapSfqxfwjWoZuh5bxf2qBIOtw+RF3Jx2EN1us7T239k
 nCed49xqA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i29dr-0004v1-6h; Mon, 26 Aug 2019 07:42:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3BB083075FE;
 Mon, 26 Aug 2019 09:41:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9740120B33552; Mon, 26 Aug 2019 09:42:15 +0200 (CEST)
Date: Mon, 26 Aug 2019 09:42:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH 03/11] asm-generic: add generic dwarf definition
Message-ID: <20190826074215.GL2369@hirez.programming.kicks-ass.net>
References: <20190825132330.5015-1-changbin.du@gmail.com>
 <20190825132330.5015-4-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190825132330.5015-4-changbin.du@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-mips@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 25, 2019 at 09:23:22PM +0800, Changbin Du wrote:
> Add generic DWARF constant definitions. We will use it later.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  include/asm-generic/dwarf.h | 199 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 include/asm-generic/dwarf.h
> 
> diff --git a/include/asm-generic/dwarf.h b/include/asm-generic/dwarf.h
> new file mode 100644
> index 000000000000..c705633c2a8f
> --- /dev/null
> +++ b/include/asm-generic/dwarf.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Architecture independent definitions of DWARF.
> + *
> + * Copyright (C) 2019 Changbin Du <changbin.du@gmail.com>

You're claiming copyright on dwarf definitions? ;-)

I'm thinking only Oracle was daft enough to think stuff like that was
copyrightable.

Also; I think it would be very good to not use/depend on DWARF for this.

You really don't need all of DWARF; I'm thikning you only need a few
types; for location we already have regs_get_kernel_argument() which
has all the logic to find the n-th argument.

