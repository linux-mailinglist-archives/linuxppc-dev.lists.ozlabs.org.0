Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB662F73C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 08:39:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHCkV1y1xzDsc3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:39:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.181;
 helo=mail-qk1-f181.google.com; envelope-from=namhyung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHChS0T9QzDsbF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 18:37:58 +1100 (AEDT)
Received: by mail-qk1-f181.google.com with SMTP id b64so10868095qkc.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 23:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4VQLhch2tvznClXcvsEtRp0FtI7Q9qiifzg7hnwGe2Y=;
 b=BoSVgb2tYBRre2nCpSJ9YhK2SQBRYAhINA39uF9q8yz1aL2+X0GVLsHd+uWf/Qos3w
 a0a6pqJh2r0rJmG5rDjkiXFHId632uPfWrNR7hdD523CW8AXTCiUR6MODiRW/8mRhOBH
 b5vT/xNEMEMy4sFMPXxp2KDYWrVFR6Gv7n0msidvHbds9Fg0KgSEnX2glc2D5VT8/etr
 29E/V5w7XymsvK4OMJNytzdw3GIfbpUtYcKeH0Bilgk+n26RXx8cQGyvrcn2G5wnESDW
 FBsqks6z7PwJdlYLH15YWnkJOXmK3vHfFZAlTPZTlZbcCPX/yEKx+x7/+h2T+ih3o4GA
 YStw==
X-Gm-Message-State: AOAM531tTpWBXBOOnfFXNUbCii+ffDbbwNydO83HCD+B17V0hRUvZHAW
 DOPZjbyFQbyAZ3vnsQfmcseO7ARPGmclqSw9XUk=
X-Google-Smtp-Source: ABdhPJwlUosA4V5gN1uUNGSCPi+KOJSFEDqHzEVZldToXcd/a0pXtbK4/llHzOVo/MjUrR0CNxaW5uttIhERTvn/K8A=
X-Received: by 2002:a05:620a:12f8:: with SMTP id
 f24mr11003851qkl.132.1610696276033; 
 Thu, 14 Jan 2021 23:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20210113080128.10286-1-jslaby@suse.cz>
 <20210113104618.GB1331835@krava>
 <388a2e21-14ee-4609-84d0-c8824154c015@suse.cz>
 <CAM9d7cgmUqLX+C1wDPe9qaxDh1tY4sVmLx2qZqey3CQSmZSo2Q@mail.gmail.com>
 <87sg73kbsq.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sg73kbsq.fsf@mpe.ellerman.id.au>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 15 Jan 2021 16:37:44 +0900
Message-ID: <CAM9d7cicU-Nhi+eHMshv5QMbBK__yEF2UfyJxeeuNy9c-bX7-w@mail.gmail.com>
Subject: Re: [PATCH] perf tools: Resolve symbols against debug file first
To: Michael Ellerman <mpe@ellerman.id.au>
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
 Jiri Slaby <jslaby@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Jan 14, 2021 at 8:17 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Namhyung Kim <namhyung@kernel.org> writes:
> > On Wed, Jan 13, 2021 at 8:43 PM Jiri Slaby <jslaby@suse.cz> wrote:
> >>
> >> On 13. 01. 21, 11:46, Jiri Olsa wrote:
> >> > On Wed, Jan 13, 2021 at 09:01:28AM +0100, Jiri Slaby wrote:
> >> >> With LTO, there are symbols like these:
> >> >> /usr/lib/debug/usr/lib64/libantlr4-runtime.so.4.8-4.8-1.4.x86_64.debug
> >> >>   10305: 0000000000955fa4     0 NOTYPE  LOCAL  DEFAULT   29 Predicate.cpp.2bc410e7
> >> >>
> >> >> This comes from a runtime/debug split done by the standard way:
> >> >> objcopy --only-keep-debug $runtime $debug
> >> >> objcopy --add-gnu-debuglink=$debugfn -R .comment -R .GCC.command.line --strip-all $runtime
> >> >>
> ...
> >> >> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> >> >> index f3577f7d72fe..a31b716fa61c 100644
> >> >> --- a/tools/perf/util/symbol-elf.c
> >> >> +++ b/tools/perf/util/symbol-elf.c
> >> >> @@ -1226,12 +1226,20 @@ int dso__load_sym(struct dso *dso, struct map *map, struct symsrc *syms_ss,
> >> >>              if (sym.st_shndx == SHN_ABS)
> >> >>                      continue;
> >> >>
> >> >> -            sec = elf_getscn(runtime_ss->elf, sym.st_shndx);
> >> >> +            sec = elf_getscn(syms_ss->elf, sym.st_shndx);
> >> >>              if (!sec)
> >> >>                      goto out_elf_end;
> >> >
> >> > we iterate symbols from syms_ss, so the fix seems to be correct
> >> > to call elf_getscn on syms_ss, not on runtime_ss as we do now
> >> >
> >> > I'd think this worked only when runtime_ss == syms_ss
> >>
> >> No, because the headers are copied 1:1 from runtime_ss to syms_ss. And
> >> runtime_ss is then stripped, so only .debug* sections are removed there.
> >> (And syms_ss's are set as NOBITS.)
> >>
> >> We iterated .debug* sections in syms_ss and used runtime_ss section
> >> _headers_ only to adjust symbols (sometimes). That worked.
> >
> > It seems PPC has an opd section only in the runtime_ss and that's why
> > we use it for section headers.
>
> At least on my system (Ubuntu 20.04.1) I see .opd in the debug file with
> NOBITS set:
>
> $ readelf -e vmlinux.debug | grep opd
>   [37] .opd              NOBITS           c000000001c1f548  01202e14
>
>
> But possibly that's not the case with older toolchains?

I was referring to this commit:

commit 261360b6e90a782f0a63d8f61a67683c376c88cf
Author: Cody P Schafer <cody@linux.vnet.ibm.com>
Date:   Fri Aug 10 15:23:01 2012 -0700

    perf symbols: Convert dso__load_syms to take 2 symsrc's

    To properly handle platforms with an opd section, both a runtime image
    (which contains the opd section but possibly lacks symbols) and a symbol
    image (which probably lacks an opd section but has symbols).

    The next patch ("perf symbol: use both runtime and debug images")
    adjusts the callsite in dso__load() to take advantage of being able to
    pass both runtime & debug images.

    Assumptions made here:

     - The opd section, if it exists in the runtime image, has headers in
       both the runtime image and the debug/syms image.

     - The index of the opd section (again, only if it exists in the runtime
       image) is the same in both the runtime and debug/symbols image.

    Both of these are true on RHEL, but it is unclear how accurate they are
    in general (on platforms with function descriptors in opd sections).

    Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>


Thanks,
Namhyung
