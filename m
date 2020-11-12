Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2196E2B0381
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 12:08:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWzNM1YhSzDqB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 22:08:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=IyNoaFai; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=3CYfPdTt; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWzH61GjQzDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 22:03:29 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1605179001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyoQNma1D4GVgEfBEnD9HpKfLsmdKQZ2swCCbsJ89u4=;
 b=IyNoaFaiD+NM5KphnaangmvfL0El+UAOD+w5h3trf2Yyosfdrv/YLVOkMULOW/ZGBhg+Y/
 CdApJJvXGBIZ5Y44ibFQmafGLFWCU3g2FoxBkEzR7mbT6bdJj8sJZKMh9WrX346Yk/RRPA
 ObPEWbP1WIFj7Nu0oQW4DAuIZK/gvLY9xJn27pRRcuIRXasgXoUZIFo7CFG246Z8CyXPW3
 lDFsIyNmic0931dDytsaIyKfHvx6VLixbP2g5wvqVZcSxNyP0kB6LHCFDa/PWmE2zunoqs
 ONbIDGQXkPDZeN2NEzrt5DA5ZmFd/tf+3b4Z7uRwEDxb+zVSTZJFZcQwZtL5UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1605179001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyoQNma1D4GVgEfBEnD9HpKfLsmdKQZ2swCCbsJ89u4=;
 b=3CYfPdTtsJ7bzsqrZTQJEvt1hjj5oOsRpY9HRk4W6lYOEOtLJxrx+ZTCMYthtsl9eIeQcX
 u0l5A2sNhnUsiqCg==
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
In-Reply-To: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.582196476@linutronix.de>
 <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com>
 <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Date: Thu, 12 Nov 2020 12:03:20 +0100
Message-ID: <87v9ean8g7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Mel Gorman <mgorman@suse.de>, Dave Airlie <airlied@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Marek,

On Thu, Nov 12 2020 at 09:10, Marek Szyprowski wrote:
> On 03.11.2020 10:27, Thomas Gleixner wrote:
>
> I can do more tests to help fixing this issue. Just let me know what to do.

Just sent out the fix before I saw your report.

     https://lore.kernel.org/r/87y2j6n8mj.fsf@nanos.tec.linutronix.de

Thanks,

        tglx
