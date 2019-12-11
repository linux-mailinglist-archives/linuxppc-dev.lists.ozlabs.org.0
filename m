Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4AD11BBF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:41:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5NS1kbzzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:40:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxtx.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=jmforbes@linuxtx.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linuxtx.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxtx.org header.i=@linuxtx.org header.b="cWBLp/GP"; 
 dkim-atps=neutral
X-Greylist: delayed 4732 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Dec 2019 03:53:12 AEDT
Received: from mail-wm1-x343.google.com (unknown [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y3084hqDzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:53:11 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id a5so2140375wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 08:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxtx.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fl7Is/227Xkupce2trJJJrsnTq1Teu4U8XUaGw3152I=;
 b=cWBLp/GPZGoKuBJ8dsv+TMZRrbzBXSstVTLxIXi/BlmooE6meRq08qQmG9rZWE5M9o
 GXWeAMB/Sex87iLqvlE0lzp+xzgwpzYZDUqI2SAb08d7tXVBNJcwqEdG9fI5zJhjNXBk
 4AzRV2ZAnelvnFparpQcFZvUl54U4nGcDFBqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fl7Is/227Xkupce2trJJJrsnTq1Teu4U8XUaGw3152I=;
 b=VMMTzyZqHinETGiSCXLi4XiHklVjBg4NBqWQffA63jEUGOmZsR4pVUXBUuRcGqNvL2
 esuOLYm0sc2VR3Arlpk7+YISI41BQh5rMiWdcs4e5ZT7Qucbg0rx6SfM/cFjKknS4x0A
 IS0BGRxx8BVd9vpVWqHGiIdgZ3ecxv6+5j8cjqKF2jlX0T/CgKP5r64+2O+cl3e3Fiyx
 4dIZFimZF+w8YgKeU/0fA3Bn9LHqRv7eLQZ9kwfTsAK9sKldZfRZuuAZ/NZ6H4MMEya5
 dZsMeJl7lySLJumVKfbzHZsOlvGyOL1SO1QtQXMR4JtYn4sHuMpOf3ZPzCcdVOtjvghp
 ejxA==
X-Gm-Message-State: APjAAAWmEXQh6hViZ5pSUBkNxJxZLa+ovv9V3WlgtnZH/4U9mN1vnwSc
 gDIwLkZzrnZ9j7aepsNeGrBFdb5rUH3tRIJr5xS5tw==
X-Google-Smtp-Source: APXvYqxQ/81XeKvFtm1/WNxQRu/wNJRlqT0NFJHNgcrVecBqhjXTNjZXqgLQYu8pNL92MJEv7xeKM3Lw3lZAYTcReXo=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr841991wmj.7.1576083177581;
 Wed, 11 Dec 2019 08:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20191201195728.4161537-1-aurelien@aurel32.net>
 <87zhgbe0ix.fsf@mpe.ellerman.id.au>
 <20191202093752.GA1535@localhost.localdomain>
 <CAFxkdAqg6RaGbRrNN3e_nHfHFR-xxzZgjhi5AnppTxxwdg0VyQ@mail.gmail.com>
 <20191210222553.GA4580@calabresa>
 <CAFxkdAp6Up0qSyp0sH0O1yD+5W3LvY-+-iniBrorcz2pMV+y-g@mail.gmail.com>
 <20191211160133.GB4580@calabresa>
In-Reply-To: <20191211160133.GB4580@calabresa>
From: Justin Forbes <jmforbes@linuxtx.org>
Date: Wed, 11 Dec 2019 10:52:46 -0600
Message-ID: <CAFxkdAp9OGjJS1Sdny+TiG2+zU4n0Nj+ZVrZt5J6iVsS_zqqcw@mail.gmail.com>
Subject: Re: [PATCH] libbpf: fix readelf output parsing on powerpc with recent
 binutils
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 "open list:BPF \(Safe dynamic programs and tools\)"
 <netdev@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <ast@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>,
 "open list:BPF \(Safe dynamic programs and tools\)" <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Aurelien Jarno <aurelien@aurel32.net>, debian-kernel@lists.debian.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 10:01 AM Thadeu Lima de Souza Cascardo
<cascardo@canonical.com> wrote:
>
> On Wed, Dec 11, 2019 at 09:33:53AM -0600, Justin Forbes wrote:
> > On Tue, Dec 10, 2019 at 4:26 PM Thadeu Lima de Souza Cascardo
> > <cascardo@canonical.com> wrote:
> > >
> > > On Tue, Dec 10, 2019 at 12:58:33PM -0600, Justin Forbes wrote:
> > > > On Mon, Dec 2, 2019 at 3:37 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > > >
> > > > > On Mon, Dec 02, 2019 at 04:53:26PM +1100, Michael Ellerman wrote:
> > > > > > Aurelien Jarno <aurelien@aurel32.net> writes:
> > > > > > > On powerpc with recent versions of binutils, readelf outputs an extra
> > > > > > > field when dumping the symbols of an object file. For example:
> > > > > > >
> > > > > > >     35: 0000000000000838    96 FUNC    LOCAL  DEFAULT [<localentry>: 8]     1 btf_is_struct
> > > > > > >
> > > > > > > The extra "[<localentry>: 8]" prevents the GLOBAL_SYM_COUNT variable to
> > > > > > > be computed correctly and causes the checkabi target to fail.
> > > > > > >
> > > > > > > Fix that by looking for the symbol name in the last field instead of the
> > > > > > > 8th one. This way it should also cope with future extra fields.
> > > > > > >
> > > > > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > > > > ---
> > > > > > >  tools/lib/bpf/Makefile | 4 ++--
> > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > Thanks for fixing that, it's been on my very long list of test failures
> > > > > > for a while.
> > > > > >
> > > > > > Tested-by: Michael Ellerman <mpe@ellerman.id.au>
> > > > >
> > > > > Looks good & also continues to work on x86. Applied, thanks!
> > > >
> > > > This actually seems to break horribly on PPC64le with binutils 2.33.1
> > > > resulting in:
> > > > Warning: Num of global symbols in sharedobjs/libbpf-in.o (32) does NOT
> > > > match with num of versioned symbols in libbpf.so (184). Please make
> > > > sure all LIBBPF_API symbols are versioned in libbpf.map.
> > > >
> > > > This is the only arch that fails, with x86/arm/aarch64/s390 all
> > > > building fine.  Reverting this patch allows successful build across
> > > > all arches.
> > > >
> > > > Justin
> > >
> > > Well, I ended up debugging this same issue and had the same fix as Jarno's when
> > > I noticed his fix was already applied.
> > >
> > > I just installed a system with the latest binutils, 2.33.1, and it still breaks
> > > without such fix. Can you tell what is the output of the following command on
> > > your system?
> > >
> > > readelf -s --wide tools/lib/bpf/sharedobjs/libbpf-in.o | cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $0}'
> > >
> >
> > readelf -s --wide tools/lib/bpf/sharedobjs/libbpf-in.o | cut -d "@"
> > -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | awk '/GLOBAL/ && /DEFAULT/ &&
> > !/UND/ {print $0}'
> >    373: 00000000000141bc  1376 FUNC    GLOBAL DEFAULT    1
> > libbpf_num_possible_cpus [<localentry>: 8]
> >    375: 000000000001869c   176 FUNC    GLOBAL DEFAULT    1 btf__free
> > [<localentry>: 8]
> [...]
>
> This is a patch on binutils carried by Fedora:
>
> https://src.fedoraproject.org/rpms/binutils/c/b8265c46f7ddae23a792ee8306fbaaeacba83bf8
>
> " b8265c Have readelf display extra symbol information at the end of the line. "
>
> It has the following comment:
>
> # FIXME:    The proper fix would be to update the scripts that are expecting
> #           a fixed output from readelf.  But it seems that some of them are
> #           no longer being maintained.
>
> This commit is from 2017, had it been on binutils upstream, maybe the situation
> right now would be different.
>
> Honestly, it seems the best way out is to filter the other information in the
> libbpf Makefile.
>
> Does the following patch work for you?
>
>
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index 56ce6292071b..e6f99484d7d5 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -145,6 +145,7 @@ PC_FILE             := $(addprefix $(OUTPUT),$(PC_FILE))
>
>  GLOBAL_SYM_COUNT = $(shell readelf -s --wide $(BPF_IN_SHARED) | \
>                            cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | \
> +                          sed 's/\[.*\]//' | \
>                            awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$8}' | \
>                            sort -u | wc -l)
>  VERSIONED_SYM_COUNT = $(shell readelf -s --wide $(OUTPUT)libbpf.so | \
> @@ -217,6 +218,7 @@ check_abi: $(OUTPUT)libbpf.so
>                      "versioned in $(VERSION_SCRIPT)." >&2;              \
>                 readelf -s --wide $(OUTPUT)libbpf-in.o |                 \
>                     cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' |   \
> +                   sed 's/\[.*\]//' |                                   \
>                     awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$8}'|   \
>                     sort -u > $(OUTPUT)libbpf_global_syms.tmp;           \
>                 readelf -s --wide $(OUTPUT)libbpf.so |                   \

This patch was against the older version, but when updated for current
5.5-rc1, it does indeed work for me.

Thanks,
Justin
