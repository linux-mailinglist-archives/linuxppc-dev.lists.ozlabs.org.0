Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C82F5A0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 05:56:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGX8R0wH0zDrfR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 15:56:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.47; helo=mail-lf1-f47.google.com;
 envelope-from=namhyung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGX6C5M30zDrTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 15:54:22 +1100 (AEDT)
Received: by mail-lf1-f47.google.com with SMTP id m25so6204623lfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 20:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QNuc5f5wtLLJ36D9lt2nfW/3BD8HkXS2QxBwmwSVa8=;
 b=j9qWHx1c5yZiiSc/XOFnXAIk3itFfPxTxHzGmMw4SV4VMHy1bKsG0dRJjFfOEwh6bN
 pbnkGwxmEinK2NzTFhkGD80Wn+Y9H2O+bzBNu1naqCQ4HRTEWkn4/n5nnGw/ddfW5Fz+
 ACwr5C1qi2TbxeUWdlpJpKSh1fY8KpXY/V/1nLkPAgQUVTRK7H80CFj8bUO6qpIy1Sf9
 3XgWZ15K0SJ5yciiaU1KKICpJkMRjrgRiqJwfrh9jLX0cVNeyZyevlqysBiTiSYtc4pU
 mHfIeJIUvChGKuAkMhkToP564ZFV3zC0wGhp82fsrvz6LPZIlwvSb5fnRKPCE5OCCiTB
 vziQ==
X-Gm-Message-State: AOAM532qMErBnRIY8+IQCHLD48lFRBFe1MhHh0ig5izh/gyGimOBNiA5
 wd293OsGdmMLIq5yuirIeN5f7gloMuqa1tSKKL0=
X-Google-Smtp-Source: ABdhPJwIoCOczUufg2qa2oKWPRqPOtlucA6dn40C0SaO7Ked72QkH4MA5vrl1RMC89iee0EPMcniw8nO6/dbDVxpPjQ=
X-Received: by 2002:a19:8584:: with SMTP id h126mr2512631lfd.152.1610600058061; 
 Wed, 13 Jan 2021 20:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20210113080128.10286-1-jslaby@suse.cz>
 <20210113104618.GB1331835@krava>
 <388a2e21-14ee-4609-84d0-c8824154c015@suse.cz>
In-Reply-To: <388a2e21-14ee-4609-84d0-c8824154c015@suse.cz>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 14 Jan 2021 13:54:06 +0900
Message-ID: <CAM9d7cgmUqLX+C1wDPe9qaxDh1tY4sVmLx2qZqey3CQSmZSo2Q@mail.gmail.com>
Subject: Re: [PATCH] perf tools: Resolve symbols against debug file first
To: Jiri Slaby <jslaby@suse.cz>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi both of Jiri,

On Wed, Jan 13, 2021 at 8:43 PM Jiri Slaby <jslaby@suse.cz> wrote:
>
> On 13. 01. 21, 11:46, Jiri Olsa wrote:
> > On Wed, Jan 13, 2021 at 09:01:28AM +0100, Jiri Slaby wrote:
> >> With LTO, there are symbols like these:
> >> /usr/lib/debug/usr/lib64/libantlr4-runtime.so.4.8-4.8-1.4.x86_64.debug
> >>   10305: 0000000000955fa4     0 NOTYPE  LOCAL  DEFAULT   29 Predicate.cpp.2bc410e7
> >>
> >> This comes from a runtime/debug split done by the standard way:
> >> objcopy --only-keep-debug $runtime $debug
> >> objcopy --add-gnu-debuglink=$debugfn -R .comment -R .GCC.command.line --strip-all $runtime
> >>
> >> perf currently cannot resolve such symbols (relicts of LTO), as section
> >> 29 exists only in the debug file (29 is .debug_info). And perf resolves
> >> symbols only against runtime file. This results in all symbols from such
> >> a library being unresolved:
> >>       0.38%  main2    libantlr4-runtime.so.4.8  [.] 0x00000000000671e0
> >>
> >> So try resolving against the debug file first. And only if it fails (the
> >> section has NOBITS set), try runtime file. We can do this, as "objcopy
> >> --only-keep-debug" per documentation preserves all sections, but clears
> >> data of some of them (the runtime ones) and marks them as NOBITS.
> >>
> >> The correct result is now:
> >>       0.38%  main2    libantlr4-runtime.so.4.8  [.] antlr4::IntStream::~IntStream
> >>
> >> Note that these LTO symbols are properly skipped anyway as they belong
> >> neither to *text* nor to *data* (is_label && !elf_sec__filter(&shdr,
> >> secstrs) is true).
> >>
> >> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> >> Cc: Peter Zijlstra <peterz@infradead.org>
> >> Cc: Ingo Molnar <mingo@redhat.com>
> >> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> >> Cc: Jiri Olsa <jolsa@redhat.com>
> >> Cc: Namhyung Kim <namhyung@kernel.org>
> >> ---
> >>   tools/perf/util/symbol-elf.c | 10 +++++++++-
> >>   1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> >> index f3577f7d72fe..a31b716fa61c 100644
> >> --- a/tools/perf/util/symbol-elf.c
> >> +++ b/tools/perf/util/symbol-elf.c
> >> @@ -1226,12 +1226,20 @@ int dso__load_sym(struct dso *dso, struct map *map, struct symsrc *syms_ss,
> >>              if (sym.st_shndx == SHN_ABS)
> >>                      continue;
> >>
> >> -            sec = elf_getscn(runtime_ss->elf, sym.st_shndx);
> >> +            sec = elf_getscn(syms_ss->elf, sym.st_shndx);
> >>              if (!sec)
> >>                      goto out_elf_end;
> >
> > we iterate symbols from syms_ss, so the fix seems to be correct
> > to call elf_getscn on syms_ss, not on runtime_ss as we do now
> >
> > I'd think this worked only when runtime_ss == syms_ss
>
> No, because the headers are copied 1:1 from runtime_ss to syms_ss. And
> runtime_ss is then stripped, so only .debug* sections are removed there.
> (And syms_ss's are set as NOBITS.)
>
> We iterated .debug* sections in syms_ss and used runtime_ss section
> _headers_ only to adjust symbols (sometimes). That worked.

It seems PPC has an opd section only in the runtime_ss and that's why
we use it for section headers.

>
> >>              gelf_getshdr(sec, &shdr);
> >>
> >> +            if (shdr.sh_type == SHT_NOBITS) {
> >> +                    sec = elf_getscn(runtime_ss->elf, sym.st_shndx);
> >> +                    if (!sec)
> >> +                            goto out_elf_end;
> >> +
> >> +                    gelf_getshdr(sec, &shdr);
> >> +            }
> >
> > is that fallback necessary? the symbol is from syms_ss
>
> Provided the above, we don't need the section data here, only headers,
> so the NOBITS test is superfluous and the fallback shouldn't be needed.
> Let me test it.

We need to talk to PPC folks like I said.  Or maybe we can change the
default ss depending on the arch.

Thanks,
Namhyung
