Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 587911D9D4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 18:56:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RMTt4yxRzDrC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 02:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=US3KTRvN; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RMRp30HSzDr8g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 02:54:27 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y18so176063pfl.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
 b=US3KTRvNcsr1JQ3EhzPolHH5YLTbLmBZ8QACOxRX4DSdLWVJ77w+ufdLjru2exOJj5
 cGgDdNSpGJSLCToXHOYtummYRYMikc607MQTtZw3CIAeMX52xLfkzXJFnqV++/4JZPBX
 TkfA6bA2OQ/tBu0verEpOr/8yTMghh7JOJnq8blVosibdSwn9t4VGf6TTFO3jl9Ku+S6
 us7ewjcIE1yEdgRycst8zGi/M73AaWLcbuldE63QokhOzCU4Lv6vQlzl3U74bTRQpiDW
 76aVV76mP+yZNV5Arg3qVa0f6SZeHYOumZT/8SZvPzqHfkPYn2L9uFwTaop85+0WCxz9
 dP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
 b=C8d8g8/s0WosWzopUPRAoiq7U+3F5PjHSv0SQInxkpuql/tfwVYjOU1kaIRhnQ3NkM
 1KQHllDoKw1W2BbxufasBSD9LtyTBVt/zdE1AHOe2AtSbyIE7UUunHMZ0bNoo8J37BC6
 8kHQrpBxwh6S8iBvTw/tkRI6F61j/eVBz6E7udJGn+ugUQrnZjH/rPH9S/5FgQhquhiE
 7cQadvo4dUYIM5MGIdaaHYOM99knz7ij87YQFeRNr+94cMW2qTSIxMa+AiuEwwG0R+2d
 N1LHMgeIphwxdQc9LOsyMuyBRmj/Shg2rwBFVvzfJg0RxQGYRaLlPvkxZY1+TjkLu7WR
 Phpg==
X-Gm-Message-State: AOAM532585bhN/qpXnplHNLYcXKGhDAfDjb+JqzY5E3UpdNLLIjNCxaM
 dmyXg9i6EVZGuQ0X/pHnR5g=
X-Google-Smtp-Source: ABdhPJyjXg6Tl4Trqy/ovTHZ7agsZDG2QZ23n+CG2Df9YrHRxk8WNFN4fKgw/J0SX04nl9fKvZEDwg==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr36511pfa.15.1589907263910;
 Tue, 19 May 2020 09:54:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id go14sm111069pjb.42.2020.05.19.09.54.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 May 2020 09:54:23 -0700 (PDT)
Date: Tue, 19 May 2020 09:54:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ira.weiny@intel.com
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519165422.GA5838@roeck-us.net>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518184843.3029640-1-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> enables when vaddr is not in the fixmap.
> 
> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

microblazeel works with this patch, as do the nosmp sparc32 boot tests,
but sparc32 boot tests with SMP enabled still fail with lots of messages
such as:

BUG: Bad page state in process swapper/0  pfn:006a1
page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
flags: 0x0()
raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
page dumped because: nonzero mapcount
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
[f00e7ab8 :
bad_page+0xa8/0x108 ]
[f00e8b54 :
free_pcppages_bulk+0x154/0x52c ]
[f00ea024 :
free_unref_page+0x54/0x6c ]
[f00ed864 :
free_reserved_area+0x58/0xec ]
[f0527104 :
kernel_init+0x14/0x110 ]
[f000b77c :
ret_from_kernel_thread+0xc/0x38 ]
[00000000 :
0x0 ]

Code path leading to that message is different but always the same
from free_unref_page().

Still testing ppc images.

Guenter
