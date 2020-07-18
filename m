Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FF224C83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 17:33:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B8BpP25B0zDrNM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jul 2020 01:33:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rn7Jp+F0; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B8BmR0HFVzDrBY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 01:31:34 +1000 (AEST)
Received: by mail-qv1-xf42.google.com with SMTP id ed14so5575149qvb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=auwkIRQjT6Uc69u2UKmP1cyyXbEWBz03molj5iU9OA4=;
 b=Rn7Jp+F07KLYyMTYZgl3wpwyyEStC4DnVcLCTgf7ONn5Ajp3ogfLukeo+4mUbxVd9D
 djwzS8Wyl5Aa9S8bYjRS1TuFNd28p8JNjgqvDlRQOm1A6KDFzoE48Oo4aqVq4EJu9OQ9
 f9CROYV3BcG1tmRAhAIOdge0DfJQjzYGIUbZKgJta5osfNuKc1ZL7VWrc7vaQU/eNR6s
 GlEoqGVfI+mJks5subKJ40S+iKizL2Z/9Zw95Jk29x2TAPgzz4a4XLUAjh8g0RvE3iiR
 gfhZ7syQbArQkcqQ5fMRRSfUus/b0lj2Z8dqhYzpUuaT1R5hPQ3TzsgK2nK4CUXWtPCF
 AS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=auwkIRQjT6Uc69u2UKmP1cyyXbEWBz03molj5iU9OA4=;
 b=IJNsdTWiYEr/vPwFZxhkzZGu90lHksFh2XveGgVuj0dusnJ+0xKKFU85DGbdnyNncb
 FVoZLxVsLckJHxXTmO8/Lz9SsIWp1AmacdhbjJYx+PFlCbHJrV+o0ulvAvsQkmbvBS3/
 h1vNhl5mogZLJpPufyfPDZMgViS21OwFv2ImyzDf/36zqF7mbWiF5d5MeSinxhsg3BAI
 PElCwYejnUga0BUpiHDWIy+ilTuWNdcmR0l9d3Wu/jiy3mKJOblYwK5YVEprF9A/H761
 YTofRSlJj54o53yXVWozxMKBIfpylhh5ZFyOEWopMmpCqiRujcbI1PUPi+PT7hVS258N
 KY1w==
X-Gm-Message-State: AOAM530EVMTqTuZONVpma0/w44UosFcBjyN4ZEihGpyof0jDmdicRofG
 FfdsghxHidtaTobuInofYNU=
X-Google-Smtp-Source: ABdhPJzUEY75zsnGOmvWd64xcaA6KtUhLpNpA2yNJhrpDY0AaZCL/2AcO9N7kLNgZGnBZ7dnPxjuqg==
X-Received: by 2002:ad4:5a46:: with SMTP id ej6mr14203491qvb.52.1595086291245; 
 Sat, 18 Jul 2020 08:31:31 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id o12sm13740812qtl.48.2020.07.18.08.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 08:31:30 -0700 (PDT)
Date: Sat, 18 Jul 2020 08:31:29 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
Message-ID: <20200718153129.GA1815449@ubuntu-n2-xlarge-x86>
References: <20200624035920.835571-1-natechancellor@gmail.com>
 <CAMuHMdU_KfQ-RT_nev5LgN=Vj_P97Fn=nwRoC6ZREFLa3Ysj7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU_KfQ-RT_nev5LgN=Vj_P97Fn=nwRoC6ZREFLa3Ysj7w@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 18, 2020 at 09:50:50AM +0200, Geert Uytterhoeven wrote:
> Hi Nathan,
> 
> On Wed, Jun 24, 2020 at 6:02 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > arch/powerpc/boot/main.c:107:18: warning: array comparison always
> > evaluates to a constant [-Wtautological-compare]
> >         if (_initrd_end > _initrd_start) {
> >                         ^
> > arch/powerpc/boot/main.c:155:20: warning: array comparison always
> > evaluates to a constant [-Wtautological-compare]
> >         if (_esm_blob_end <= _esm_blob_start)
> >                           ^
> > 2 warnings generated.
> >
> > These are not true arrays, they are linker defined symbols, which are
> > just addresses.  Using the address of operator silences the warning
> > and does not change the resulting assembly with either clang/ld.lld
> > or gcc/ld (tested with diff + objdump -Dr).
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/212
> > Reported-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  arch/powerpc/boot/main.c | 4 ++--
> >  arch/powerpc/boot/ps3.c  | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
> > index a9d209135975..cae31a6e8f02 100644
> > --- a/arch/powerpc/boot/main.c
> > +++ b/arch/powerpc/boot/main.c
> > @@ -104,7 +104,7 @@ static struct addr_range prep_initrd(struct addr_range vmlinux, void *chosen,
> >  {
> >         /* If we have an image attached to us, it overrides anything
> >          * supplied by the loader. */
> > -       if (_initrd_end > _initrd_start) {
> > +       if (&_initrd_end > &_initrd_start) {
> >
> 
> Are you sure that fix is correct?
> 
>     extern char _initrd_start[];
>     extern char _initrd_end[];
>     extern char _esm_blob_start[];
>     extern char _esm_blob_end[];
> 
> Of course the result of their comparison is a constant, as the addresses
> are constant.  If clangs warns about it, perhaps that warning should be moved
> to W=1?
> 
> But adding "&" is not correct, according to C.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Hi Geert,

Yes, I have done fairly extensive testing in the past to verify that
this fix is correct.

For example:

$ cat test.c
#include <stdio.h>

extern char _test[];

int main(void)
{
        printf("_test:  %p\n", _test);
        printf("&_test: %p\n", &_test);
        return 0;
}

$ cat test.lds
_test = .;

$ clang -Wl,-T test.lds test.c

$ ./a.out
_test:  0x204
&_test: 0x204

$ gcc -fuse-ld=lld -Wl,-T test.lds test.c

$ ./a.out
_test:  0x60a0f76301fb
&_test: 0x60a0f76301fb

I also did runtime verification in QEMU to confirm this is true when I
was testing these commits, which are already present in Linus' tree:

63174f61dfae ("kernel/extable.c: use address-of operator on section symbols")
bf2cbe044da2 ("tracing: Use address-of operator on section symbols")
8306b057a85e ("lib/dynamic_debug.c: use address-of operator on section symbols")
b0d14fc43d39 ("mm/kmemleak.c: use address-of operator on section symbols")

I did a lot of work to get this warning enabled as it can find bugs:

6def1a1d2d58 ("fanotify: Fix the checks in fanotify_fsid_equal")
79ba4f931067 ("IB/hfi1: Fix logical condition in msix_request_irq")

-Wno-tautological-compare disables a bunch of good subwarnings, as I
point out in the commit that enabled it:

afe956c577b2 ("kbuild: Enable -Wtautological-compare")

Cheers,
Nathan
