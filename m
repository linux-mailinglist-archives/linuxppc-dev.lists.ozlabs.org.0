Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D824950AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:22:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C7j23d3HzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 08:22:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=luto@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="XGcvD/0M"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C7g42B7rzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 08:21:03 +1000 (AEST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3664B2070B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566253261;
 bh=KR93Nh2pEVTQXskRCcRNJG5EoMuJxb1LL9zdGmo9ev8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XGcvD/0M9vzUeS5avfGpqrqHbAXOoM7uu9ljKoE0xyKGAOK/T4rwZQ5k6bSHpqVZy
 OkuCiCQD0/WV82YQMrJnVLzUeStX/PHvdFGOvUencl1Htvm5Rq7zuoaJoyxWxg9qvu
 808gminbEYHjFq2fq8o9F4ZuzVJo6fczFFK2iaQo=
Received: by mail-wr1-f51.google.com with SMTP id j16so10274640wrr.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 15:21:01 -0700 (PDT)
X-Gm-Message-State: APjAAAWL8Sow9gDAvxZlbDZ+5HBItL7OVe0xBZQ3bSDcVyAmI5afmyEh
 egMdwSR8y1LN0FzGw0YheRyn6Z8lyFZ7jlPL+j1H4A==
X-Google-Smtp-Source: APXvYqwNtW0rY5/4IORCA0JWGQVEmCNW0QeuAxonklMdoFEakLEyQfmhwomVLQ6OZ71NQtenvXcQl0iYBVssDum9uwg=
X-Received: by 2002:adf:eec5:: with SMTP id a5mr29877043wrp.352.1566253259728; 
 Mon, 19 Aug 2019 15:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190815001636.12235-1-dja@axtens.net>
 <20190815001636.12235-2-dja@axtens.net>
 <15c6110a-9e6e-495c-122e-acbde6e698d9@c-s.fr>
 <20190816170813.GA7417@lakrids.cambridge.arm.com>
 <87imqtu7pc.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87imqtu7pc.fsf@dja-thinkpad.axtens.net>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 19 Aug 2019 15:20:47 -0700
X-Gmail-Original-Message-ID: <CALCETrXnvofB_2KciRL6gZBemtjwTVg4-EKSJx-nz-BULF5aMg@mail.gmail.com>
Message-ID: <CALCETrXnvofB_2KciRL6gZBemtjwTVg4-EKSJx-nz-BULF5aMg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, Andrew Lutomirski <luto@kernel.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Aug 18, 2019, at 8:58 PM, Daniel Axtens <dja@axtens.net> wrote:
>

>>> Each page of shadow memory represent 8 pages of real memory. Could we use
>>> page_ref to count how many pieces of a shadow page are used so that we can
>>> free it when the ref count decreases to 0.
>
> I'm not sure how much of a difference it will make, but I'll have a look.
>

There are a grand total of eight possible pages that could require a
given shadow page. I would suggest that, instead of reference
counting, you just check all eight pages.

Or, better yet, look at the actual vm_area_struct and are where prev
and next point. That should tell you exactly which range can be freed.
