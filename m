Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201950E948
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 21:15:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnF8P6Zfzz3bps
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 05:15:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com;
 envelope-from=namhyung@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnF7z2cl6z3bXq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 05:14:53 +1000 (AEST)
Received: by mail-lf1-f43.google.com with SMTP id g19so27978397lfv.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 12:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dHw3bSR/H7CsKHNYVZ388J1hNpCRBRDwS8dgecfZChM=;
 b=KU9GufpQlpxlfRbBYdXyBtWHVMZih73XuiYD/KxbPRZ7dq3oNRNJpcdWgnvW2QD6yB
 QLTWaGmczz/51/XO279uGWwXAq7wYP6+XIKvGUS+xBEPvLSosOqABK8guMWhg4WQK0r/
 REtXszJO0wfDJNfI9pDvx2w04GxTejGX1cctzFLnARYfxok8ekXS5kEoTdxi8QQWA30o
 LKdjlbMy5+XcwuDDbPY2jo4RHI5HyiczbSbBFhrzSbL3cvmWXWotZvw6M7RZ6xiJrIx1
 BtplahtwJm1rOiaU97zhaNgvW+Ziv+X/ZK0F0sbpv/F6au/TGHegCRyDDMUn8V+RfwSL
 +QQQ==
X-Gm-Message-State: AOAM530LoLxVUReiXIEdtI0ypHyKcCTgS9nHPbhCG4tJRLNSFgPoMkdA
 cRqIXvBTlrhXXntB81tJmKu5ADUP4ETnE35Yx8g=
X-Google-Smtp-Source: ABdhPJyhIu6bV/7PCchygWQAOXBLRo+nw25DWy7AdnYXRE222Wbp82PwUfbfw5cBzUzTpTwxnu0Yw930jpFPtAOIVa8=
X-Received: by 2002:ac2:4c4f:0:b0:44a:4357:c285 with SMTP id
 o15-20020ac24c4f000000b0044a4357c285mr13820828lfk.99.1650914089654; Mon, 25
 Apr 2022 12:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220416004048.1514900-1-namhyung@kernel.org>
 <20220416004048.1514900-2-namhyung@kernel.org>
 <CAP-5=fX5S2CR58REzAhXH4s8_27=D2LbKksS7mHoSoxYOOmN4g@mail.gmail.com>
In-Reply-To: <CAP-5=fX5S2CR58REzAhXH4s8_27=D2LbKksS7mHoSoxYOOmN4g@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 25 Apr 2022 12:14:38 -0700
Message-ID: <CAM9d7cgSZu43YLAWgJdw8d1TUS9geD9QrWqSQw1sWPU7ocVRtQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf symbol: Pass is_kallsyms to symbols__fixup_end()
To: Ian Rogers <irogers@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, linuxppc-dev@lists.ozlabs.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Michael Petlan <mpetlan@redhat.com>, Will Deacon <will@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-perf-users <linux-perf-users@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Leo Yan <leo.yan@linaro.org>,
 Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ian,

On Sat, Apr 16, 2022 at 7:59 AM Ian Rogers <irogers@google.com> wrote:
>
> On Fri, Apr 15, 2022 at 8:40 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > The symbol fixup is necessary for symbols in kallsyms since they don't
> > have size info.  So we use the next symbol's address to calculate the
> > size.  Now it's also used for user binaries because sometimes they
> > miss size for hand-written asm functions.
> >
> > There's a arch-specific function to handle kallsyms differently but
> > currently it cannot distinguish kallsyms from others.  Pass this
> > information explicitly to handle it properly.  Note that those arch
> > functions will be moved to the generic function so I didn't added it
> > to the arch-functions.
>
> Thanks Namhyung, in:
> https://lore.kernel.org/linux-perf-users/20220412154817.2728324-3-irogers@google.com/
> I used "dso->kernel != DSO_SPACE__USER" in symbol-elf to make this
> more than just kallsyms as presumably kernel code is the issue. Do we
> know elf kernel code has correctly sized symbols?

Yeah, IIUC the whole point of the symbol end fixup is because the
kallsyms doesn't have the symbol size info.  Every ELF binaries
should have the size except for some hand-written asm functions
which missed adding it manually.  I guess that's the reason it was
added to other DSO loading paths.

Also considering "[" (and "]") in the symbol name is specific to
kallsyms which has both kernel and module symbols together.

Thanks,
Namhyung
