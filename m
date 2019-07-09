Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FAF62E0A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 04:22:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jR0S2GCMzDqQ9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 12:22:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OMGu7W8A"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jQyg4wyczDq6M
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 12:20:27 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id s7so39790281iob.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PqqLzTYgfQxqS7WeMJ8j0MU1nn2fiHKsb4BBFyiKEmI=;
 b=OMGu7W8ASNA2F50nIS4M1xfIwcL/esB9I9lXSnfIXcIbD874tTTaEF1ABDM8SALR6I
 n4S1WMnJCTe3/W6z9o8Lx7wq1YFF65hvl68HKz1nvhu5cygsDrkUVtXB+EksGde1w1mR
 rwC7HnmzOfAJfnECJ7lsdg+9CFA3OV601tC5q9MNIwItgRxOX+WafU/xHe6rGzCdl9ds
 FOHOQGhVTdyhq3RFBTvV1asJ7PQD+ajEoGch0X06+xtwe9svY1vXfyBC+1W3Qv7SB+EH
 T+1fJs8HsgLu+yOZkjJJ26e7x3HqY+fNFKD6CCOSlqCOksT9F5CIYwRpiovXz0oPELzQ
 YY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqqLzTYgfQxqS7WeMJ8j0MU1nn2fiHKsb4BBFyiKEmI=;
 b=UFuCEbdWKvOqW7trTaEK/Gt2gRCjiG89Ylwo2sZi/x+d3R7EaHyTpbqaKnWkoTZbEB
 jax31bRYSPRWe4ZZnff6xoEbaTAtnwRwLb3UEJGXDYJCvPJzb+7QBbjODQe7glqRfbxX
 T/K5Vbpz4UeuEUD7BrkcdriqPDB/Bpailum2b1G+jNuMmxi8prYW/dLQnX45rFgv9K+s
 4sdCorWNBg7wQauG/QZ/eKTZPtstxqur8yPLUKN+nFOyoVjLL8aNE1DNBhwFrj2W0K2o
 SQb+LPvgkzDfK/PRw6pzgDcDS5Ui23boRrc+M68DK95zDO454iDUgmuwIkcwkHXxVUU1
 dGkQ==
X-Gm-Message-State: APjAAAVJPePss02o4wh2gNvGCgKSmG/VNM7L3MK/WcLcp0nS7TGxaSqi
 G6NISYxemvvgwhoi6TllJ2RmIhD255IBa5DA/tNQuzBqM7A=
X-Google-Smtp-Source: APXvYqzwwSPcBygzgpPc++VFRInbOx3Vxz9b08adPYXTcT1Fz+zr8amDiOvv+RltV/YRKkW51A1K3UDPLktZFZDjEIU=
X-Received: by 2002:a5d:8497:: with SMTP id t23mr2052187iom.298.1562638823991; 
 Mon, 08 Jul 2019 19:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
 <d6f628ffdeb9c7863da722a8f6ef2949e57bb360.1557824379.git.christophe.leroy@c-s.fr>
 <87y318d2th.fsf@linux.ibm.com>
In-Reply-To: <87y318d2th.fsf@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 9 Jul 2019 12:20:12 +1000
Message-ID: <CAOSf1CG-oxpSDsAPw8xHV5367MrMn2Ty_yDpPY9TvA6wMrMZHA@mail.gmail.com>
Subject: Re: [PATCH 4/4] powerpc/64: reuse PPC32 static inline
 flush_dcache_range()
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 9, 2019 at 12:22 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>
> > *snip*
> > +     if (IS_ENABLED(CONFIG_PPC64))
> > +             isync();
> >  }
>
>
> Was checking with Michael about why we need that extra isync. Michael
> pointed this came via
>
> https://github.com/mpe/linux-fullhistory/commit/faa5ee3743ff9b6df9f9a03600e34fdae596cfb2#diff-67c7ffa8e420c7d4206cae4a9e888e14
>
> for 970 which doesn't have coherent icache. So possibly isync there is
> to flush the prefetch instructions? But even so we would need an icbi
> there before that isync.

I don't think it's that, there's some magic in flush_icache_range() to
handle dropping prefetched instructions on 970.

> So overall wondering why we need that extra barriers there.

I think the isync is needed there because the architecture only
requires sync to provide ordering. A sync alone doesn't guarantee the
dcbfs have actually completed so the isync is necessary to ensure the
flushed cache lines are back in memory. That said, as far as I know
all the IBM book3s chips from power4 onwards will wait for pending
dcbfs when they hit a sync, but that might change in the future.

If it's a problem we could add a cpu-feature section around the isync
to no-op it in the common case. However, when I had a look with perf
it always showed that the sync was the hotspot so I don't think it'll
help much.

Oliver
