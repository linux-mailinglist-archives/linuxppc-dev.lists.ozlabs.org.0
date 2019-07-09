Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0163001
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 07:31:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jWCT0mQpzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 15:31:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bi5Qyysv"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jW9J6nsqzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 15:29:56 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id f4so24994311ioh.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ekTBrm84eDXWp2v27vp/vaf2aZ34u1Aceu1+v4AGHdQ=;
 b=bi5Qyysv+BTUf6UfpIP1DBNvpEfxu1eIX6ZN3ZtCABgoI3gVIc9Ab6nbbW7wMIp9+v
 NrhtR0tF4ki2WZZSh2W7XrGRwvXyWHbRvMBA1uI9u9Ii5NX91Uk3PEvFxiX45AL1ay6I
 z2Cvk3ksOY48Fa3QlisSHncdSRaJfsaKkzFb84oyBTRnv7YXSLZwK7ikVQIh3U7aiRWG
 JFRisGdvze06cdteG8b1YUE3eWYC70EQMeZSrnecXX2eG0/jZo6MOcBbv2VmLbL/Q7di
 1mw5UqYdTPloGP1qsP2UPsQcnDJ7YQvQz0DMrGZwB5KvfaTyuSx4Cswh+tQrHXuhwJa0
 LVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ekTBrm84eDXWp2v27vp/vaf2aZ34u1Aceu1+v4AGHdQ=;
 b=O30shQuIpl6hYu8cXixUjeCecRO9qa0LNc/w//yPliJE+f1AbnEPdt6Gg0Kv5Skcbu
 IX30wy1YO2wwqOD/kpQmSH4vuL9XBTIJGhztG5dkd71ve+tH4DPd0bKll94li/cT6Qwy
 u9RS+FdYLNnAWBN+3nkVcd49D2bnIQPueHcOXSVDxxzxDrswJQI+4a0PdV/+pta779x1
 a1R/PcHheGkxOD3R1dwpz2zpOv3YCvlgu4bR6rIssuTu8MpispHaxJ8Gv9qiqZKj2Ow9
 t8x4FkRkBfdvCQZTS6ZW6Fs/zFuhzKvjidVxYQdbQkixt+jxCvuODUxamHze0w/Hxy1D
 DbnA==
X-Gm-Message-State: APjAAAUr9yiNls0WAfFRt8+Pr6bGL9rohlTy1ft/hi1O/22aOMnvKFXO
 kuIVNrgyzBtM8A52zIblJ0fGFgDEhtP0kWAmZM8=
X-Google-Smtp-Source: APXvYqwlS6XUTtj022vlunepvujabK/y+bpHegMJ9IVb5gwkEqD17jg6eAVvZb3eDYVISpiQtcZhOGdsmj+f1PHg5V0=
X-Received: by 2002:a02:9004:: with SMTP id w4mr26522994jaf.111.1562650194327; 
 Mon, 08 Jul 2019 22:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
 <d6f628ffdeb9c7863da722a8f6ef2949e57bb360.1557824379.git.christophe.leroy@c-s.fr>
 <87y318d2th.fsf@linux.ibm.com>
 <CAOSf1CG-oxpSDsAPw8xHV5367MrMn2Ty_yDpPY9TvA6wMrMZHA@mail.gmail.com>
 <c0461069-8ef8-cb56-6807-71cc79793ac4@linux.ibm.com>
In-Reply-To: <c0461069-8ef8-cb56-6807-71cc79793ac4@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 9 Jul 2019 15:29:43 +1000
Message-ID: <CAOSf1CHYdUXOrxrnEgnF0QXWJ3At=x_70FOhr-9nyuXcgsYk3Q@mail.gmail.com>
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

On Tue, Jul 9, 2019 at 12:52 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 7/9/19 7:50 AM, Oliver O'Halloran wrote:
> > On Tue, Jul 9, 2019 at 12:22 AM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> >>
> >>> *snip*
> >>> +     if (IS_ENABLED(CONFIG_PPC64))
> >>> +             isync();
> >>>   }
> >>
> >>
> >> Was checking with Michael about why we need that extra isync. Michael
> >> pointed this came via
> >>
> >> https://github.com/mpe/linux-fullhistory/commit/faa5ee3743ff9b6df9f9a03600e34fdae596cfb2#diff-67c7ffa8e420c7d4206cae4a9e888e14
> >>
> >> for 970 which doesn't have coherent icache. So possibly isync there is
> >> to flush the prefetch instructions? But even so we would need an icbi
> >> there before that isync.
> >
> > I don't think it's that, there's some magic in flush_icache_range() to
> > handle dropping prefetched instructions on 970.
> >
> >> So overall wondering why we need that extra barriers there.
> >
> > I think the isync is needed there because the architecture only
> > requires sync to provide ordering. A sync alone doesn't guarantee the
> > dcbfs have actually completed so the isync is necessary to ensure the
> > flushed cache lines are back in memory. That said, as far as I know
> > all the IBM book3s chips from power4 onwards will wait for pending
> > dcbfs when they hit a sync, but that might change in the future.
> >
>
> ISA doesn't list that as the sequence. Only place where isync was
> mentioned was w.r.t  icbi where want to discards the prefetch.

doesn't list that as the sequence for what?

> > If it's a problem we could add a cpu-feature section around the isync
> > to no-op it in the common case. However, when I had a look with perf
> > it always showed that the sync was the hotspot so I don't think it'll
> > help much.
> >
>
> What about the preceding barriers (sync; isync;) before dcbf? Why are
> they needed?

Dunno, the sync might just be to ensure ordering between prior stores
and the dcbf.

>
> -aneesh
