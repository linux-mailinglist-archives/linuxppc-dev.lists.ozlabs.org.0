Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9326422D1E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:42:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD42x4dyTzF1Yx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 08:42:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a42;
 helo=mail-vk1-xa42.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=B42vINBN; dkim-atps=neutral
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD4195KnlzF1Rw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 08:40:54 +1000 (AEST)
Received: by mail-vk1-xa42.google.com with SMTP id x187so536643vkc.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SywmoYaZyeOKx6H84LI5dM1wvNKs3szhtS3aRO+7r8s=;
 b=B42vINBN6rAdrr9c1UO+5AVn0IZsOgODa1QzZZeGJLEcBvMwqgPf8b4uxAobvBY8Ns
 5y9CMzvqAP5iJ1klT+xgnukkFAY/pi97qJaHHsn16KQVZUwUljAfZPfUqZwUA6Zt4PXS
 H3SdpelZ2emnbhKB3y6/C/T8D6XOPFFXxoCuiIfzUCM3vcX9Atu2YoSqYNxZAs7nOoCA
 KjBNFLxeF9FHAz2ZWiYi3/AL/7Sz4n9T5/Uda9GtaLKra3ToEgiTchQ2yDHa0h/wLNAm
 qoa0P8niz/Xumu2hRgwVrc8pfTs//pjQlJdJ6kiySvzGDs9ax9JT4YnGunVpzbMBvJCv
 EX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SywmoYaZyeOKx6H84LI5dM1wvNKs3szhtS3aRO+7r8s=;
 b=bGj/8NUdNvj4nN62EWVRzRvtvHhiUyZR8sbbYDN3WEvHBh2TZNnMAcGwPN+7C4qunh
 TKXLIqkEbEJHYvOUWq8T+Zv86pV7hzO0JwXyLgPn0wCdurA+Wh+gyapZEKnyJCP5CfCq
 ftJGhDfyaiMvDA0rZKzMzI3RD4Hb1sZ9ojCQa2FL1IclS8tKTo99eGYBwmos9u6ikN5q
 owyf5P9Rx7yrWnRTfduyQSPr9fvPj+L6lbCrjFyi0N3quU/gDu2Y3gBh90U02b+lVJtd
 up8HyUMg71Q3hhOtlejHlaZmy82tpR2siua9zra0qXdOvodWhO4RIzuDX4erSjFj1esx
 ltfg==
X-Gm-Message-State: AOAM533VjVGMSafq6O+OxbOAml6rcOOyB2uUYC1JXWwu+vKIgJ9bcMw8
 ytoK/2hF+uMaV541Szz0lM+6IcVmzcjRaRpRFpqHUxA=
X-Google-Smtp-Source: ABdhPJz76rOZdl+0K2y5gccsLcmIFME2S3amzCR0RGWGIC7DQtIx37SMpe3r/5DObXKWL3QRoaYtStMkz+KV2WNVufM=
X-Received: by 2002:a1f:1943:: with SMTP id 64mr9478664vkz.40.1595630450525;
 Fri, 24 Jul 2020 15:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200724001605.3718561-1-morbo@google.com>
 <87sgdhp4t7.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sgdhp4t7.fsf@mpe.ellerman.id.au>
From: Bill Wendling <morbo@google.com>
Date: Fri, 24 Jul 2020 15:40:39 -0700
Message-ID: <CAGG=3QW4=SmOEY=9mdtZUPBBvHHzVD4UN7hAz9wC83ctr8XsXQ@mail.gmail.com>
Subject: Re: [PATCH v 1/1] powerpc/64s: allow for clang's objdump differences
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 3:48 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Bill,
>
> Bill Wendling <morbo@google.com> writes:
> > Clang's objdump emits slightly different output from GNU's objdump,
> > causing a list of warnings to be emitted during relocatable builds.
> > E.g., clang's objdump emits this:
> >
> >    c000000000000004: 2c 00 00 48  b  0xc000000000000030
> >    ...
> >    c000000000005c6c: 10 00 82 40  bf 2, 0xc000000000005c7c
> >
> > while GNU objdump emits:
> >
> >    c000000000000004: 2c 00 00 48  b    c000000000000030 <__start+0x30>
> >    ...
> >    c000000000005c6c: 10 00 82 40  bne  c000000000005c7c <masked_interrupt+0x3c>
> >
> > Adjust llvm-objdump's output to remove the extraneous '0x' and convert
> > 'bf' and 'bt' to 'bne' and 'beq' resp. to more closely match GNU
> > objdump's output.
> >
> > Note that clang's objdump doesn't yet output the relocation symbols on
> > PPC.
> >
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> >  arch/powerpc/tools/unrel_branch_check.sh | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
> > index 77114755dc6f..71ce86b68d18 100755
> > --- a/arch/powerpc/tools/unrel_branch_check.sh
> > +++ b/arch/powerpc/tools/unrel_branch_check.sh
> > @@ -31,6 +31,9 @@ grep -e "^c[0-9a-f]*:[[:space:]]*\([0-9a-f][0-9a-f][[:space:]]\)\{4\}[[:space:]]
> >  grep -v '\<__start_initialization_multiplatform>' |
> >  grep -v -e 'b.\?.\?ctr' |
> >  grep -v -e 'b.\?.\?lr' |
> > +sed 's/\bbt.\?[[:space:]]*[[:digit:]][[:digit:]]*,/beq/' |
> > +sed 's/\bbf.\?[[:space:]]*[[:digit:]][[:digit:]]*,/bne/' |
> > +sed 's/[[:space:]]0x/ /' |
> >  sed 's/://' |
>
> I know you followed the example in the script of just doing everything
> as a separate entry in the pipeline, but I think we could consolidate
> all the seds into one?
>
> eg:
>
> sed -e 's/\bbt.\?[[:space:]]*[[:digit:]][[:digit:]]*,/beq/' \
>     -e 's/\bbf.\?[[:space:]]*[[:digit:]][[:digit:]]*,/bne/' \
>     -e 's/[[:space:]]0x/ /' \
>     -e 's/://' |
>
> Does that work?
>
I'm fine with that. I separated them mostly for my benefit while
creating the patch to keep things simple. :-) I'll send out an update.

-bw
