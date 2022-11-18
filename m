Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFF6630709
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 01:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDZBm60ZMz3f6X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 11:23:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=An8R27hB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=An8R27hB;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDWfY6Pktz3cKM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 09:29:07 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so4324113pjh.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 14:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbBsvDU//DL6nEBTfVogOGw4gtrIt5cEgoWU7wg0yqE=;
        b=An8R27hBelrmHfCbOWIi0CQbpB+FbdUKZd/K74OWA+t1inv8v4494buerQXpAbVoQ/
         hawXo5IWqwOaOJXIlgQJ62nY4aZ8mzIQL8T0sN5QawgAa8EGZw3klOrzN/KXycM8ohn1
         PnwiDQNXHvwQENzmlhMaoO6BFIxzwB92hREPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbBsvDU//DL6nEBTfVogOGw4gtrIt5cEgoWU7wg0yqE=;
        b=0jZVn5Zr/+m5PBxxQj/1q+URWJRRP0ZOqbPX6MePNuWkoZfPQFy+zXXB9K3lDZQFGt
         tH9QefeR81Zbu/DfLIFGlkkQCHaz5t8gr714PurnHtElferNz+4hBsNGoMKhxRPsQGa+
         dlTzQQHt8FkdPdn34GtSqHfWi8LUh8Eb+MbFY7/9eCXvpTQlw+c3Gy7Q00KUn8h6LVe1
         /J0F42unl04z6/2bZ2IWbYBOsGEE91fQ5Ab4hsyI65H5hdsoFhqWblftvnIYDQPtiISW
         /hXI0O5NFycoBkcaj6TOYq7RXweVfoEK82NxboP6qeDkdbh7GbxBSa7fnatvB1WoGI2m
         p+EQ==
X-Gm-Message-State: ANoB5plH62eGyTGw4wRAZaqUEgAty1M7BJN4yY/9WslVZdF0jq8JeLU2
	YYWqjsaCjZyCnCaMKtiSGRy//g==
X-Google-Smtp-Source: AA0mqf6CgTDul/374P0W7rrlIZwWC/WtPB/rFM9c4Pb8H4WjGT5BNPOAuJqtgF8hwxBjrZP80dPQ5g==
X-Received: by 2002:a17:902:7b96:b0:188:b0db:cd5d with SMTP id w22-20020a1709027b9600b00188b0dbcd5dmr1455470pll.104.1668810543328;
        Fri, 18 Nov 2022 14:29:03 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f26-20020aa7969a000000b00571dda13fafsm3646997pfk.163.2022.11.18.14.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:02 -0800 (PST)
Date: Fri, 18 Nov 2022 14:29:02 -0800
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
Message-ID: <202211181427.4D1C3132FE@keescook>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
 <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Sat, 19 Nov 2022 11:21:11 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Borislav Petkov <bp@alien8.de>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, V
 lastimil Babka <vbabka@suse.cz>, Matt Turner <mattst88@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-media@vger.kernel.org, Kentaro Takeda <takedakn@nttdata.co.jp>, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>, Richard Weinberger <richard@nod.at>, Alex Williamson <alex.williamson@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <richard.henderson@linaro.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-arm-kernel@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Torvalds <torvalds@linux-foundation.org>, Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org, Alexand
 er Viro <viro@zeniv.linux.org.uk>, linux-perf-users@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 18, 2022 at 12:09:02PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 16, 2022 at 10:16:34AM -0800, Linus Torvalds wrote:
> > Following the history of it is a big of a mess, because there's a
> > number of renamings and re-organizations, but it seems to go back to
> > 2007 and commit b6a2fea39318 ("mm: variable length argument support").
> 
> I went back and read parts of the discussions with Ollie, and the
> .force=1 thing just magically appeared one day when we were sending
> work-in-progress patches back and forth without mention of where it came
> from :-/
> 
> And I certainly can't remember now..
> 
> Looking at it now, I have the same reaction as both you and Kees had, it
> seems entirely superflous. So I'm all for trying to remove it.

Thanks for digging through the history! I've pushed the change to -next:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/execve&id=cd57e443831d8eeb083c7165bce195d886e216d4

-- 
Kees Cook
