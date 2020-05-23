Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DEA1DF686
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 12:08:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TfF335H0zDr37
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 20:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GlbX2Jyb; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TfCR3k8fzDqtR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 20:06:41 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id z15so2794712pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=pHMA/O04guMph5hS5Q4P9Tcl5HEUZXZqg3o4kCIqJOE=;
 b=GlbX2Jyb007pfBF014RLYULwNRRnvvq9SiWsQm9QoCPjQbzlUpxwQ7XVd/CU79x0r0
 mmcg+X7jMo5hf/Bt0jaHBZzdgBScFwgOEs3+UFAzo033cvkJ/jVyowWdQ/k3yyPU3ZJC
 yLYb75pcxKeSwQUt5WpieRtFyGiSTyKg1pzdKSoOOV66yyQ4bk0i1YGOA+QHoK/tfzC6
 bYJeRMA+YiMEak4D93XkRW9KpjugfPQX6WkTogHhzNZNSqfXHRscMPaZC8cLA+lG7osA
 YnNEZWPhi7x0fCPNv6MWbWGXS5Sl2H3vuEItLTS9Pzu9otLRZ01V4SYHguejc6/GM+iq
 dSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=pHMA/O04guMph5hS5Q4P9Tcl5HEUZXZqg3o4kCIqJOE=;
 b=MAxDZ8ss3QYdqyO47/SlnIYQGqfaljntpJg2U88RcZv6V/Ceiz3fDX9jx9EHl2wE24
 AZuroy39kNXANvrC3HfnHG1SQ2rVStMDi4eBAyZnhLrQNkaHansJtqO+GRGw/EmqW7bD
 iMySSLTJpPo9i5Ai7/mEyXc36IH7X5t0DpMxQyK0YhBmUjCY8dp+FmF7W56U7e9do5Af
 g5oFsu/8CEfIQcUBaAFkyiLFYr3Wst1Zm/hvRgl5KtpyUCwbbFNa0TMg96kjmQncY3MA
 6AoOzVIQ+LBArOfFBFNwkSU6Vn0e75kzIQlNXc5NHjij8Ntebsv3RWYHGS+o9KamxAvv
 0HGA==
X-Gm-Message-State: AOAM5300bKBW5911sdAG6rM3QqyGuYgij3TFq2Wurda6Sc5fdCCjgBt0
 B6RctFKM7vtYsR2HqP5HrUVNKTfYtW0=
X-Google-Smtp-Source: ABdhPJwkiMz9WliVzcTJZscrGxXsIlnkGc4/qoNgcUnXdXTUKIIvtq9iQDo7UW5bwyMvEl5kRrJCBw==
X-Received: by 2002:a17:90a:64f:: with SMTP id
 q15mr9224434pje.169.1590228397286; 
 Sat, 23 May 2020 03:06:37 -0700 (PDT)
Received: from localhost (115-64-212-199.static.tpgi.com.au. [115.64.212.199])
 by smtp.gmail.com with ESMTPSA id
 a2sm2383046pfg.98.2020.05.23.03.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 03:06:36 -0700 (PDT)
Date: Sat, 23 May 2020 20:06:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Sami Tolvanen
 <samitolvanen@google.com>
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
In-Reply-To: <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1590226253.lnkg0jun9x.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> + Michael, and PPC ML.
>=20
> They may know something about the reason of failure.

Because the linker can't put branch stubs within object code sections,=20
so when you incrementally link them too large, the linker can't resolve=20
branches into other object files.

This is why we added incremental linking in the first place. I suppose=20
it could be made conditional for platforms that can use this=20
optimization.

What'd be really nice is if we could somehow build and link kallsyms=20
without relinking everything twice, and if we could do section mismatch=20
analysis without making that vmlinux.o as well. I had a few ideas but=20
not enough time to do much work on it.

Thanks,
Nick

>=20
>=20
> On Sat, May 23, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
>>
>> On Fri, May 22, 2020 at 5:27 AM Sami Tolvanen <samitolvanen@google.com> =
wrote:
>> >
>> > Instead of linking all compilation units again each time vmlinux_link =
is
>> > called, reuse vmlinux.o from modpost_link.
>> >
>> > With x86_64 allyesconfig, vmlinux_link is called three times and reusi=
ng
>> > vmlinux.o reduces the build time ~38 seconds on my system (59% reducti=
on
>> > in the time spent in vmlinux_link).
>> >
>> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>> > ---
>> >  scripts/link-vmlinux.sh | 5 +----
>> >  1 file changed, 1 insertion(+), 4 deletions(-)
>> >
>> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
>> > index d09ab4afbda4..c6cc4305950c 100755
>> > --- a/scripts/link-vmlinux.sh
>> > +++ b/scripts/link-vmlinux.sh
>> > @@ -77,11 +77,8 @@ vmlinux_link()
>> >
>> >         if [ "${SRCARCH}" !=3D "um" ]; then
>> >                 objects=3D"--whole-archive                        \
>> > -                       ${KBUILD_VMLINUX_OBJS}                  \
>> > +                       vmlinux.o                               \
>> >                         --no-whole-archive                      \
>> > -                       --start-group                           \
>> > -                       ${KBUILD_VMLINUX_LIBS}                  \
>> > -                       --end-group                             \
>> >                         ${@}"
>> >
>> >                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
>> >
>> > base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
>> > --
>> > 2.27.0.rc0.183.gde8f92d652-goog
>> >
>>
>>
>> I like this patch irrespective of CLANG_LTO, but
>> unfortunately, my build test failed.
>>
>>
>> ARCH=3Dpowerpc failed to build as follows:
>>
>>
>>
>>   MODPOST vmlinux.o
>>   MODINFO modules.builtin.modinfo
>>   GEN     modules.builtin
>>   LD      .tmp_vmlinux.kallsyms1
>> vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+4b1c
>> vmlinux.o:(__ftr_alt_97+0x164): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+1cf78
>> vmlinux.o:(__ftr_alt_97+0x288): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+1dac4
>> vmlinux.o:(__ftr_alt_97+0x2f0): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+1e254
>> make: *** [Makefile:1125: vmlinux] Error 1
>>
>>
>>
>> I used powerpc-linux-gcc
>> available at
>> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2=
.0/
>>
>>
>> Build command:
>>
>> make -j24 ARCH=3Dpowerpc  CROSS_COMPILE=3Dpowerpc-linux-  defconfig all
>>
>>
>> Could you check it please?
>>
>>
>>
>> I will apply it to my test branch.
>> Perhaps, 0-day bot may find more failure cases.
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
>=20
>=20
>=20
> --=20
> Best Regards
> Masahiro Yamada
>=20
