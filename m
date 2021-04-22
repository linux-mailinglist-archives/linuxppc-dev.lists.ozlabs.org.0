Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F694368920
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 00:44:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRCCy6lvBz2yxv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 08:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=J+EDgb6l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=J+EDgb6l; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRCCY1bgNz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 08:44:22 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id y4so34438733lfl.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eVWWvugI8DB7tGc32EIZh1dbZnwGe5Bt+f006OvhJS0=;
 b=J+EDgb6lx4Ai3flNJZAUBsqJDvUXLA67oGcIqHVqt7rpFgBUDYNJsQZ4o3h5AaNI3U
 GBJgJVmfbnA5xfbL/uUHu/bVkU6Sj4caOjrq2RimVAS1IpWEHeNACHQ6BydOG9JyMNnn
 rEw+vXuijPm+PTk0G/Ng9czw8gxh5Tyj32N1PN4cZPV1UTvXaDAZCqY5QOba6u74G4Ue
 kEye3LPZtcdetcvoVY7Z07WlPTfZbdwmphfwX1vLe97GhJClaq9upYRf86HqJLT97uvh
 RwbYzzRqbTBsKr0m+Vf2+aiNwKCTDeKAJrOKYp1I+CAPPQ477hnmGf9mlfzm9JUHeXu2
 Tuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eVWWvugI8DB7tGc32EIZh1dbZnwGe5Bt+f006OvhJS0=;
 b=ZRFiBdOtvIm7g9y032zqB8cfTPvwH5FxxSZcMvMISaofG7T+BZuKkSzJaFLrZyYaXq
 CEAG1Jr1+XJvIsyLIsdKxYQUzU9OT2MmZ6g0RBAMLT0RMFTy5Z8Yr2yjx0Ps9j9oy6Ap
 LR575C4z60TNt66DusfkrA7jdrOP+bYDZwkTN6kdEBaFo2RgVXrZT8ZkBjx39tWjTb4X
 XcSHa9y5HyY3u+sIAHc0O5uMo1rd7QcJrgyrXIhqP5l8RvUKqDlgNQpPUE3d6ahv6p+1
 2TsekGK7umFS9kEBP4HvR15vp9993yMrqDpsGWKh+iwWG6V2A7ch/uvvRQuj09DvYqeY
 dTLg==
X-Gm-Message-State: AOAM532h/ZkpWRmjfZoEg8ilt3cVUOVutVeozzpkoCwZ/ai+IIQ6BDyY
 A84SUbDzsTBSL5renQdBoA87e6Kok0P+dVXrquh47w==
X-Google-Smtp-Source: ABdhPJwYSO43FuRfyDZjVX5z5UG55Qn0AtKaW1+5Fl21nVwrVVRCd3KaER5zMUSJFG13eTZoMQSkycXBXphkTb373o8=
X-Received: by 2002:a05:6512:159:: with SMTP id
 m25mr454486lfo.73.1619131454440; 
 Thu, 22 Apr 2021 15:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200901222523.1941988-1-ndesaulniers@google.com>
 <20200901222523.1941988-2-ndesaulniers@google.com>
 <87blio1ilu.fsf@mpe.ellerman.id.au>
 <CAKwvOd=ZeJU+vLUk2P7FpX35haj7AC50B9Yps4pyoGCpd7ueTw@mail.gmail.com>
 <3d837a36-a186-6789-7924-eaa97f056b68@csgroup.eu>
In-Reply-To: <3d837a36-a186-6789-7924-eaa97f056b68@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Apr 2021 15:44:02 -0700
Message-ID: <CAKwvOd=KP5CZ5wOrczC6qPAzN7DdFCJ_XvU6e=zvB3XpQrp_-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/vdso64: link vdso64 with linker
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>,
 Fangrui Song <maskray@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 11:02 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 02/09/2020 =C3=A0 19:41, Nick Desaulniers a =C3=A9crit :
> > On Wed, Sep 2, 2020 at 5:14 AM Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
> >>
> >> Nick Desaulniers <ndesaulniers@google.com> writes:
> >>> Fixes: commit f2af201002a8 ("powerpc/build: vdso linker warning for o=
rphan sections")
> >>
> >> I think I'll just revert that for v5.9 ?
> >
> > SGTM; you'll probably still want these changes with some modifications
> > at some point; vdso32 did have at least one orphaned section, and will
> > be important for hermetic builds.  Seeing crashes in supported
> > versions of the tools ties our hands at the moment.
> >
>
> Keeping the tool problem aside with binutils 2.26, do you have a way to
> really link an elf32ppc object when  building vdso32 for PPC64 ?

Sorry, I'm doing a bug scrub and found
https://github.com/ClangBuiltLinux/linux/issues/774 still open (and my
reply to this thread still in Drafts; never sent). With my patches
rebased:
$ file arch/powerpc/kernel/vdso32/vdso32.so
arch/powerpc/kernel/vdso32/vdso32.so: ELF 32-bit MSB shared object,
PowerPC or cisco 4500, version 1 (SYSV), dynamically linked, stripped

Are you still using 2.26?

I'm not able to repro Nathan's reported issue from
https://lore.kernel.org/lkml/20200902052123.GA2687902@ubuntu-n2-xlarge-x86/=
,
so I'm curious if I should resend the rebased patches as v2?

--
Thanks,
~Nick Desaulniers
