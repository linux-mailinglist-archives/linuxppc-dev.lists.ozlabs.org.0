Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A030C6FF5AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 17:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHFsC3X4mz3fXt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 01:18:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.47; helo=mail-lf1-f47.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHFrj4xtHz3cd4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 01:17:57 +1000 (AEST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4eff4ea8e39so9871422e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 08:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683818269; x=1686410269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeLJUnaY4RpSv7Fr2RyuafyTEGCbWOy7/KdXYyNynDE=;
        b=B9ATYCbuRHPu/c9e3WZMjWLJqFj7FX+hPjxdfHlpQx3LjSNma3WB20B8BFEsegz5p/
         efDtqVWNgK6qrHBvaReT7kUSDWlHMexNZCBYEQyGoabok8tjWxbnFbq9wVYoOAujz/nU
         90GTYftUBMbNCz8dDSC9/i87Vk0UJAQWrfmb15BstghCtLQrbc09KwZSok9CtBtRPdcW
         YTafAxM89gAK91dudA3OpLNsS3pJYFfu/u5RQWNF/CxcgerMAIiPEk1AKJf+7mu7fhZo
         p9P+izIH98TKFqIWcHwaD7sDd9hzXHOMc7BmlBXhkARNqwIFkiX7ClkYky/Rty96pmgP
         At2g==
X-Gm-Message-State: AC+VfDwYK/jNrfgVoUH8QjNxiuYr9To5eauGHBdZSxdrSuTEaAs7Bzkp
	+jTbdvH/dUrupSu4Y6I94vrz9896J+9Rjqfp
X-Google-Smtp-Source: ACHHUZ6KzFlBJJ2BWhIVBpcrooP1jSlbqmAboV3bX6vvyONgjzyErDcP+S+IW0LxkHX4xMW4O1cUrw==
X-Received: by 2002:ac2:4255:0:b0:4f1:26f5:77fb with SMTP id m21-20020ac24255000000b004f126f577fbmr2398583lfl.28.1683818269759;
        Thu, 11 May 2023 08:17:49 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id a1-20020a056512374100b004eb3b6da6f5sm1146292lfs.228.2023.05.11.08.17.46
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 08:17:47 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f13bfe257aso9857497e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 08:17:46 -0700 (PDT)
X-Received: by 2002:ac2:4c13:0:b0:4f2:22bf:fe98 with SMTP id
 t19-20020ac24c13000000b004f222bffe98mr2776652lfq.37.1683818265953; Thu, 11
 May 2023 08:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150802.737477-1-cgzones@googlemail.com>
In-Reply-To: <20230511150802.737477-1-cgzones@googlemail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 17:17:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVa69s3g0z6qgayzNx=jT6Ko2RNeZehru0SbzYH8VwkfQ@mail.gmail.com>
Message-ID: <CAMuHMdVa69s3g0z6qgayzNx=jT6Ko2RNeZehru0SbzYH8VwkfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] fs/xattr: add *at family syscalls
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, audit@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, selinux@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,

On Thu, May 11, 2023 at 5:10=E2=80=AFPM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
> Add the four syscalls setxattrat(), getxattrat(), listxattrat() and
> removexattrat().  Those can be used to operate on extended attributes,
> especially security related ones, either relative to a pinned directory
> or on a file descriptor without read access, avoiding a
> /proc/<pid>/fd/<fd> detour, requiring a mounted procfs.
>
> One use case will be setfiles(8) setting SELinux file contexts
> ("security.selinux") without race conditions.
>
> Add XATTR flags to the private namespace of AT_* flags.
>
> Use the do_{name}at() pattern from fs/open.c.
>
> Use a single flag parameter for extended attribute flags (currently
> XATTR_CREATE and XATTR_REPLACE) and *at() flags to not exceed six
> syscall arguments in setxattrat().
>
> Previous approach ("f*xattr: allow O_PATH descriptors"): https://lore.ker=
nel.org/all/20220607153139.35588-1-cgzones@googlemail.com/
> v1 discussion: https://lore.kernel.org/all/20220830152858.14866-2-cgzones=
@googlemail.com/
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Thanks for your patch!

The syscall numbers conflict with those used in "[PATCH] cachestat:
wire up cachestat for other architectures", so this needs some
synchronization.
https://lore.kernel.org/linux-sh/20230510195806.2902878-1-nphamcs@gmail.com

>  arch/m68k/kernel/syscalls/syscall.tbl       |   4 +

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
