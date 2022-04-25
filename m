Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7550EAE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 23:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnHTF6ZMfz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 07:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BGex542d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=BGex542d; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnHSZ1ps9z2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 06:59:23 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso303791wml.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+0NQ0MbGYoEB5Jsr85JSxqkzHf5iQdh5cM2NyrsDis=;
 b=BGex542dDfYT9HHYZfLCHcpHPGYA2/GNKIzZeosJgIywm2a3Tc6iL/Vtz2vWx7zjQc
 EVZT+T3Xu2N4CqQCITrP+06X+HS178Z/m41youJ1Drv4CbDKwtXRfqEm+kAuaet77TA3
 2QP5Wkh4qoafLDELvHmpJ2Uf/l9c6gHRn6YvMuq3QclOu4lKu121I0V/AVyvcx/Va5Wg
 /lNJla5ZwrUfCRleKMpea1Tc5hSbbcjXAWI2MPhjhFRY1ntLQBiYgKGNSfyGdWeUc7+Q
 eZu6TYEToZPYaZWgpoEC5Vz5FKdeAH7Y1gZfV/T6j40u+brBqffIhGmaocuLo+FinP0h
 wTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+0NQ0MbGYoEB5Jsr85JSxqkzHf5iQdh5cM2NyrsDis=;
 b=zZ0GBMKYrn2ik0iPzA94luwrpBDbDVAMjGgA3xBJDtEz0Q9weReFCZXLyfWgk6ydSo
 jSkWWuOX2zgALqVcaPHJTTVzIjxdEDF4FHei8iKifpyjtr+H49RW1XmiQrWLkuB3oFOY
 dE48Z0Y1MhVKMySjydXaPtSz4ANywp4JM5j9L0w6DnsbdmrZfVD1qLekk6punlcuCELe
 fXPRju7nbmELAHYpdoeIGzr7MEGRRqJP3HDxRv1Zc5cZf6ZRIAkijiiY60Gk1Jf+PhMu
 rJUW3BM7TLbTj1fC4tfrYusZPd/UMCJMW5+iR0tk2ofHSsHIjYJVf25vrqR2bre6JueZ
 zI8g==
X-Gm-Message-State: AOAM532YDKhVouREhM43poxiOc4Kz2MaVQyVThMJ2G5SUWooLHfPNEBr
 XS+e4ySWTElDsicQ9sn7j214zpioG0G80SMiqvqX+w==
X-Google-Smtp-Source: ABdhPJwv8xGoKyyqY7JuRQboD78b5Wduxo+WwgNk1JdFTzVpIPkAlXaxUrQaqx469hajLw6aXoAByPWhfpp1OFNyuHw=
X-Received: by 2002:a1c:4e19:0:b0:393:dc47:b808 with SMTP id
 g25-20020a1c4e19000000b00393dc47b808mr15703552wmh.182.1650920355956; Mon, 25
 Apr 2022 13:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220416004048.1514900-1-namhyung@kernel.org>
In-Reply-To: <20220416004048.1514900-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 25 Apr 2022 13:59:03 -0700
Message-ID: <CAP-5=fUUeqimTKoO9PQbm4yDWXZtTqxWm9ZAsNt1=K5N1Rq_Lg@mail.gmail.com>
Subject: Re: [PATCH 0/3] perf tools: Tidy up symbol end fixup (v3)
To: Namhyung Kim <namhyung@kernel.org>
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
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Leo Yan <leo.yan@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>,
 Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 15, 2022 at 5:40 PM Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hello,
>
> This work is a follow-up of Ian's previous one at
>   https://lore.kernel.org/all/20220412154817.2728324-1-irogers@google.com/
>
> Fixing up more symbol ends as introduced in:
>   https://lore.kernel.org/lkml/20220317135536.805-1-mpetlan@redhat.com/
>
> it caused perf annotate to run into memory limits - every symbol holds
> all the disassembled code in the annotation, and so making symbols
> ends further away dramatically increased memory usage (40MB to >1GB).
>
> Modify the symbol end fixup logic so that special kernel cases aren't
> applied in the common case.
>
> v3 changes)
>  * rename is_kernel to is_kallsyms
>  * move the logic to generic function
>  * remove arch-specific functions
>
> Thanks,
> Namhyung

Thanks Namhyung! The series:

Acked-by: Ian Rogers <irogers@google.com>

> Namhyung Kim (3):
>   perf symbol: Pass is_kallsyms to symbols__fixup_end()
>   perf symbol: Update symbols__fixup_end()
>   perf symbol: Remove arch__symbols__fixup_end()
>
>  tools/perf/arch/arm64/util/machine.c   | 21 ---------------
>  tools/perf/arch/powerpc/util/Build     |  1 -
>  tools/perf/arch/powerpc/util/machine.c | 25 -----------------
>  tools/perf/arch/s390/util/machine.c    | 16 -----------
>  tools/perf/util/symbol-elf.c           |  2 +-
>  tools/perf/util/symbol.c               | 37 +++++++++++++++++++-------
>  tools/perf/util/symbol.h               |  3 +--
>  7 files changed, 29 insertions(+), 76 deletions(-)
>  delete mode 100644 tools/perf/arch/powerpc/util/machine.c
>
>
> base-commit: 41204da4c16071be9090940b18f566832d46becc
> --
> 2.36.0.rc0.470.gd361397f0d-goog
>
