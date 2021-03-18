Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C2D33FD55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 03:42:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1BC61M6Qz3bwP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 13:42:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Y+rEVRYk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32;
 helo=mail-yb1-xb32.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y+rEVRYk; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1BBj0LYbz2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 13:42:19 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id n195so956869ybg.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 19:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yH5PzRW85N1JyyiQVE6znBE0JobSJTK1ZOPrZSyhJSA=;
 b=Y+rEVRYktEFfAuWatQOPkTzUUyf26qI+WvD1wFqwGC3ZuUc+U25ooF1SkPV2mazHO7
 bsK5FrOMbgsRldzEsHsU9oAud4xtj36dgTwn7cx+ZCXqzgFfYIXKZI9obngJ2AnKnRne
 yEyJTTqUVkUXumunmpJZauIceHbug6PjU3xYnC1AOcWqgCuF9HFYeD5INtJK7+iwTVvb
 YQy0CetcoUFRe9t24swVBGC9f0nyH9NF/G8A+Ds6LxiycZeNZIUX9UjGnV9he/G69bH1
 /zTsq7hSxC+iGwl8Xss2pvwyIxl9DQUa6xWvPNrkpQcRAJxO7T2yWD39Mfk4LMgpR94r
 PXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yH5PzRW85N1JyyiQVE6znBE0JobSJTK1ZOPrZSyhJSA=;
 b=cRXPP9VW9BRpMAv/Y5hLa5xVlZbFCXjcvgnUx+9rXJ2Q/xlCT61ouewaSdpi7nU5vV
 q2P1Np75Erd2Gr1z3BXuSSYumU2fBIqm7kT7J8ARyzXXpR53PxFyclwDG7JwPtTc/iIs
 2raGcsRf0ZKD0R0toc4yXIML5R6aecdEhbNi9l6a6fQDeo8Da6F1LpgmYCGCto9PqfJT
 n80G0chb2+I3Izu3nmyK8xIAteIs5HAQ0Ee6zSHJmrUy7VFU9QxBY9m+RgT0AdTPdcEj
 fEPayKX9syaV4iidGmTKXdmimt+ygMyiPj57o7ugoU9D5qErJXbpb1si3CU/+adEhqAX
 VOXw==
X-Gm-Message-State: AOAM533oATz3POa/eRPweoSDnWRz17u+jlzce569MIxE/Gz2+2c99Igv
 pFs2aA/1chru5t87kO4IvBzFhNKM6kmvWbBO618=
X-Google-Smtp-Source: ABdhPJx+i2x2HoJt4hWotMyzY4g2jkYU30a54PTsPiM9PXT+H/Kp+Kx/3IyAOom1NMZuSR4KYa7cN9j6UgoUl/a7SGw=
X-Received: by 2002:a25:5051:: with SMTP id e78mr8536391ybb.386.1616035335694; 
 Wed, 17 Mar 2021 19:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-3-jniethe5@gmail.com>
 <87553048-5f1f-0704-2256-d2c85b8e43c6@csgroup.eu>
In-Reply-To: <87553048-5f1f-0704-2256-d2c85b8e43c6@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 18 Mar 2021 13:42:04 +1100
Message-ID: <CACzsE9qm694GvaS+iZgd-X5sNwhHXsAxMdJD0n79fmehtt26PA@mail.gmail.com>
Subject: Re: [PATCH v9 3/8] powerpc/kprobes: Mark newly allocated probes as RO
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, ajd@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 5:12 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 16/03/2021 =C3=A0 04:17, Jordan Niethe a =C3=A9crit :
> > From: Russell Currey <ruscur@russell.cc>
> >
> > With CONFIG_STRICT_KERNEL_RWX=3Dy and CONFIG_KPROBES=3Dy, there will be=
 one
> > W+X page at boot by default.  This can be tested with
> > CONFIG_PPC_PTDUMP=3Dy and CONFIG_PPC_DEBUG_WX=3Dy set, and checking the
> > kernel log during boot.
> >
> > Add an arch specific insn page allocator which returns RO pages if
> > STRICT_KERNEL_RWX is enabled. This page is only written to with
> > patch_instruction() which is able to write RO pages.
> >
>
> Did you investigate BPF ? The problematic looks more or less similar to k=
probe:
>
> bpf_jit_compile() in arch/powerpc/net/bpf_jit_comp.c calls module_alloc()=
, which provides it with
> PAGE_KERNEL_TEXT memory, ie RWX. That function is only used on PPC32 whic=
h still has Classic BPF,
> and this is about to go away with future series
> https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1608112796.=
git.christophe.leroy@csgroup.eu/
>
> PPC64 has Extended BPF instead, and PPC32 will it the future too.
> bpf_int_jit_compile() in arch/powerpc/net/bpf_jit_comp64.c calls bpf_jit_=
binary_alloc() which uses
> bpf_jit_alloc_exec().
>
> bpf_jit_alloc_exec() is a weak function that should be redefined for powe=
rpc I think, more or less
> like alloc_insn_page() for kprobes.
Thanks, that is a good point. I will handle bpf with the next revision.
>
> Christophe
