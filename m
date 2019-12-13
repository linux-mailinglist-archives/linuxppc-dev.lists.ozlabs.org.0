Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 870E311FB14
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 21:28:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bbb36zqZzDqHF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 07:28:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=andrii.nakryiko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LiRgSKsE"; 
 dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZH692DFYzDrCW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 04:02:34 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id c2so11277qvp.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 09:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vUE8AEfpv1Je3ytswJ2t5UjmrKOaLm5nTOW/OGZXKqs=;
 b=LiRgSKsEotztqVrsicsLsNUDrDyYeIVpc5+lRgzqczvL62rsuBj4Sa8kv7CHVoxoXH
 EWf2/4n/6YSz0KEDVyfYtJTpb8F7EmGyVJR+ZshuzOr+rwiewODBxJsSOOlq9GFzmfmR
 xbyfqPPoFwYCGFYTbxa0kspoKBUFBP8SWqe6HFH220EKZNVz5tnRGO45bF6o7uPDCsYs
 c/oZxItM/SELe7rS2ok8whcpRv0BeIPcwpH6Sy1KO9LukZKVfqv3oXFTjiNf3iXIc7hr
 s0ZkR9IY00n1vFjE/biRCTww+E0EzM7oNaqT4yRiQqb5w4dqYj9TQmRdhnkZeug5/rJe
 984Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vUE8AEfpv1Je3ytswJ2t5UjmrKOaLm5nTOW/OGZXKqs=;
 b=foqki3UyRhh2RLQHPduy3zKTIXiwVGUXQ4GPVSvrFcTemMIUN0e+Oa99tCAsdFA8jO
 frBB9viKumkKyvwEY1DzqbmfFRnQfKIr8RvySNETvCKLJ9P5P4vP/1WzXLBRL7O/S0u9
 JPb2bONlOCm0Y3V9AzDR1OkrNnHDVJ3aoGYFN1cPPaGLyMDAbAa3dIhTETj0wly5f/B7
 Rhuu/Wrij45qyPS7f58Y73NYi5mT2fTphRsiVNhj0Xb0+XkOgU7ruRp6WenCt5LRS7Jx
 eogcoKokGvBoYVGOZSdl/+82qXJCzGUUH7OjMc/56QcRvTZ+5HAqYXClXFkeRbTy3UXu
 002A==
X-Gm-Message-State: APjAAAU1i96RLQKyfQvUtPoJKRhAWu/prLjyzkfl7O69AKKri5arAzda
 eilHn3qeoF3F3LeSXdR7IrO2cV8uvNM82lqs4g0=
X-Google-Smtp-Source: APXvYqxSHgQ7tT0FFNjw0FMOJb3XsIngDsE1kSkmcHPlEmXgbqA8EhfpMfQEZmwNFjBDUp4xDIjV8uTmvi+wnxrkb7A=
X-Received: by 2002:ad4:4e34:: with SMTP id
 dm20mr14796667qvb.163.1576256550460; 
 Fri, 13 Dec 2019 09:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20191201195728.4161537-1-aurelien@aurel32.net>
 <87zhgbe0ix.fsf@mpe.ellerman.id.au>
 <20191202093752.GA1535@localhost.localdomain>
 <CAFxkdAqg6RaGbRrNN3e_nHfHFR-xxzZgjhi5AnppTxxwdg0VyQ@mail.gmail.com>
 <20191210222553.GA4580@calabresa>
 <CAFxkdAp6Up0qSyp0sH0O1yD+5W3LvY-+-iniBrorcz2pMV+y-g@mail.gmail.com>
 <20191211160133.GB4580@calabresa>
 <CAFxkdAp9OGjJS1Sdny+TiG2+zU4n0Nj+ZVrZt5J6iVsS_zqqcw@mail.gmail.com>
 <20191213101114.GA3986@calabresa>
In-Reply-To: <20191213101114.GA3986@calabresa>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 13 Dec 2019 09:02:19 -0800
Message-ID: <CAEf4BzY-JP+vYNjwShhgMs6sJ+Bdqc8FEd19BVf8uf+jSnX1Jw@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Fix readelf output parsing for Fedora
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Dec 2019 07:27:01 +1100
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 "open list:BPF \(Safe dynamic programs and tools\)"
 <netdev@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Justin Forbes <jmforbes@linuxtx.org>, Alexei Starovoitov <ast@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>,
 "open list:BPF \(Safe dynamic programs and tools\)" <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Aurelien Jarno <aurelien@aurel32.net>, debian-kernel@lists.debian.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 13, 2019 at 2:11 AM Thadeu Lima de Souza Cascardo
<cascardo@canonical.com> wrote:
>
> Fedora binutils has been patched to show "other info" for a symbol at the
> end of the line. This was done in order to support unmaintained scripts
> that would break with the extra info. [1]
>
> [1] https://src.fedoraproject.org/rpms/binutils/c/b8265c46f7ddae23a792ee8306fbaaeacba83bf8
>
> This in turn has been done to fix the build of ruby, because of checksec.
> [2] Thanks Michael Ellerman for the pointer.
>
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=1479302
>
> As libbpf Makefile is not unmaintained, we can simply deal with either
> output format, by just removing the "other info" field, as it always comes
> inside brackets.
>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Fixes: 3464afdf11f9 (libbpf: Fix readelf output parsing on powerpc with recent binutils)
> Reported-by: Justin Forbes <jmforbes@linuxtx.org>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> ---

I was briefly playing with it and trying to make it use nm to dump
symbols, instead of parsing more human-oriented output of readelf, but
somehow nm doesn't output symbols with @@LIBBPF.* suffix at the end,
so I just gave up. So I think this one is good.

This should go through bpf-next tree.

Acked-by: Andrii Nakryiko <andriin@fb.com>


>  tools/lib/bpf/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index defae23a0169..23ae06c43d08 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -147,6 +147,7 @@ TAGS_PROG := $(if $(shell which etags 2>/dev/null),etags,ctags)
>
>  GLOBAL_SYM_COUNT = $(shell readelf -s --wide $(BPF_IN_SHARED) | \
>                            cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | \
> +                          sed 's/\[.*\]//' | \
>                            awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$NF}' | \
>                            sort -u | wc -l)
>  VERSIONED_SYM_COUNT = $(shell readelf -s --wide $(OUTPUT)libbpf.so | \
> @@ -213,6 +214,7 @@ check_abi: $(OUTPUT)libbpf.so
>                      "versioned in $(VERSION_SCRIPT)." >&2;              \
>                 readelf -s --wide $(BPF_IN_SHARED) |                     \
>                     cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' |   \
> +                   sed 's/\[.*\]//' |                                   \
>                     awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$NF}'|  \
>                     sort -u > $(OUTPUT)libbpf_global_syms.tmp;           \
>                 readelf -s --wide $(OUTPUT)libbpf.so |                   \
> --
> 2.24.0
>
