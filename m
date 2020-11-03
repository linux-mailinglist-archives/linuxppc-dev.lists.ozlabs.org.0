Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB82E2A4F72
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:54:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQf8k1vmPzDqv6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=HlBdVjW4; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQcsj2nLRzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 04:56:25 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id v6so23333334lfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 09:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0HUqTtrB0uneYNpLQNhQJ6FusME7LjWI9KZLqRyy8M=;
 b=HlBdVjW42hUSJkakIiVHCgxY07l6tlPx/MKTOg49MQqEt9fKpSl2tO6bNlSfEMf3/D
 yOb2ZUXxHpDZzPlQCZuCKgGgj4iIodCB3C8y4WCLAE53N4IY/fO4MumxqPXGllxVBzjJ
 AuMTxQdvsElAjMkZERbVlQwjny9JwixE30+4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0HUqTtrB0uneYNpLQNhQJ6FusME7LjWI9KZLqRyy8M=;
 b=Eu05Q1Y5ac1uYypCgiPRkHd6oFA9J/0VhgI4Am/7NVPGxAVkAnytBgUQ1ElBv+ERvj
 UXvHQYAbcIuOW+F7YUpN+S2ahbLPqFjozkbBPkt6FtTLZmYlUetV4SAXZGSDrOYfVtOM
 zIN0C0RQe1nZdj7KV8P4+LP1aO3Ym+5/g2bvK3cfLMrnMhn2/2ec+14fNE5k0LqkeSab
 ByM4H7LWoh4hJGHQpSXVgNBECWIx0LHRvZjcmK2D5zAr4VO/E52HLkGPlYEMLvt7w/Cx
 JwkyV0FVgCvnLK873IC/79/ngLksKrpk5BONXcNNjNC+spJs1Lgwg/GVlaQ5YyzkuHVI
 K1gA==
X-Gm-Message-State: AOAM533B8aH8xHcXg7WVNAiz4lF88JIJ6XNjp1yUb/vHaXiyjGpzXV0/
 3vI1ZjdX1oTcRGAd//CcYSezqnoqToCHDg==
X-Google-Smtp-Source: ABdhPJyivikhjFaCRYA7YhlChzzzDW2aZNtNwM6TSUpcrgpNAKcYMT3nc+S+VdvpkPSDO04sSaNS6g==
X-Received: by 2002:ac2:5c0d:: with SMTP id r13mr8955374lfp.46.1604426181176; 
 Tue, 03 Nov 2020 09:56:21 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id t66sm4116560lff.85.2020.11.03.09.56.20
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 09:56:20 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id d24so19988512ljg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 09:56:20 -0800 (PST)
X-Received: by 2002:a19:4815:: with SMTP id v21mr8859386lfa.603.1604425706752; 
 Tue, 03 Nov 2020 09:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20201103092712.714480842@linutronix.de>
 <20201103095858.827582066@linutronix.de>
In-Reply-To: <20201103095858.827582066@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Nov 2020 09:48:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
Message-ID: <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
Subject: Re: [patch V3 22/37] highmem: High implementation details and
 document API
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 04 Nov 2020 05:22:55 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, virtualization@lists.linux-foundation.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-btrfs <linux-btrfs@vger.kernel.org>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 3, 2020 at 2:33 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> +static inline void *kmap(struct page *page)
> +{
> +       void *addr;
> +
> +       might_sleep();
> +       if (!PageHighMem(page))
> +               addr = page_address(page);
> +       else
> +               addr = kmap_high(page);
> +       kmap_flush_tlb((unsigned long)addr);
> +       return addr;
> +}
> +
> +static inline void kunmap(struct page *page)
> +{
> +       might_sleep();
> +       if (!PageHighMem(page))
> +               return;
> +       kunmap_high(page);
> +}

I have no complaints about the patch, but it strikes me that if people
want to actually have much better debug coverage, this is where it
should be (I like the "every other address" thing too, don't get me
wrong).

In particular, instead of these PageHighMem(page) tests, I think
something like this would be better:

   #ifdef CONFIG_DEBUG_HIGHMEM
     #define page_use_kmap(page) ((page),1)
   #else
     #define page_use_kmap(page) PageHighMem(page)
   #endif

adn then replace those "if (!PageHighMem(page))" tests with "if
(!page_use_kmap())" instead.

IOW, in debug mode, it would _always_ remap the page, whether it's
highmem or not. That would really stress the highmem code and find any
fragilities.

No?

Anyway, this is all sepatrate from the series, which still looks fine
to me. Just a reaction to seeing the patch, and Thomas' earlier
mention that the highmem debugging doesn't actually do much.

               Linus
