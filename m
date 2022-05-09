Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85052071D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 23:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxw0b47psz3cBg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 07:53:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mmprp3lz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e;
 helo=mail-yw1-x112e.google.com; envelope-from=samitolvanen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Mmprp3lz; dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxvzx6X1tz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 07:53:00 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f863469afbso160403657b3.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LglPYsJyh/Qh1FDu94XGq/MV3fomSZvl10mHqijKUDo=;
 b=Mmprp3lzuQ9S3U5gBRl4SSYLlSOiIHLBvkcz5iOM/dqvawddalywuHly3fYkYSta8a
 /wHH97/JwQuaJpGbSbc8YAh/70zYOA45R/uKi8HnO1a2FSGw1hEO80O8h+7YS8CvTNy/
 Euq2/8lKMsPIykCcaR4MuOWPN6ENvIUCu3LU2TT18vptardX8ldDEZoc6ReZ3taS3hlH
 ppaK1jD3PGKIDopg2Ag16lSA/ACo6BplIpJZzarADCnbXO9GoV38XDz5xn7QDtvn169K
 iMBMjnNR/3DlG0wrr7uwC6BKfn+gNjtsaTLfXV1sdAvCLbMqgxZewCokViv9D/I9eVdh
 91qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LglPYsJyh/Qh1FDu94XGq/MV3fomSZvl10mHqijKUDo=;
 b=pGnlPlPRhXiQNZfb3fqK9a0tLbSq/8JVmJaXD/SSKmjU+e782G8y07b2fzgCRw6OEh
 0XRcwLLZ4HdlBO6xX75Jddf1k12mtN38Sqqt6gOkoNL3+wS8o7gLf2bvT1i+w8d0OyTJ
 AI4m/3NkKNlVnfE4NcqxXPe1RkmYTa0QDqswe6nEMLCB+BCZWL1HcK9s30bXnDOlu1Xb
 LUugTsePJ/Yw2NBdYyjGOauiLZzk1FRAvwqauN/Khdori0c7unFlSdt+yCfiRGclOH/Z
 3IpZkTMJFaEw2E+HmdykypX1Vh5t2qEKIfsW/Qxw+pMn6ssdY/0lvjQYapJ8u+T8ptRa
 OtNA==
X-Gm-Message-State: AOAM533T7yV+f9cItZgpUZPGCUrBlKETzxnw+gC5G2undHX06RrUL8N0
 EComdMfT7NN/k0vpq6unXK7QUvWmdAR7vDoiWo2m7w==
X-Google-Smtp-Source: ABdhPJxS9tOjdEtMe9p7ieQ7qesYkE+zdDxRJCQOrQnBBXsYJfCE0f7NGG8AtIWCus/riFP6yEy8E50WALQb9P5JyvY=
X-Received: by 2002:a05:690c:13:b0:2e4:da22:27d9 with SMTP id
 bc19-20020a05690c001300b002e4da2227d9mr17078815ywb.298.1652133176908; Mon, 09
 May 2022 14:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-6-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-6-masahiroy@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 9 May 2022 14:52:21 -0700
Message-ID: <CABCJKucG4dOLm9pPWrACc+YReBXG4GNM9V0djsy0YTp8pRGmaw@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] modpost: extract symbol versions from *.cmd files
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 8, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, CONFIG_MODVERSIONS needs extra link to embed the symbol
> versions into ELF objects. Then, modpost extracts the version CRCs
> from them.
>
> The following figures show how it currently works, and how I am trying
> to change it.
>
> Current implementation
> ======================
>                                                            |----------|
>                  embed CRC      -------------------------->| final    |
>        $(CC)       $(LD)       /  |---------|              | link for |
>        -----> *.o -------> *.o -->| modpost |              | vmlinux  |
>       /              /            |         |-- *.mod.c -->| or       |
>      / genksyms     /             |---------|              | module   |
>   *.c ------> *.symversions                                |----------|
>
> Genksyms outputs the calculated CRCs in the form of linker script
> (*.symversions), which is used by $(LD) to update the object.
>
> If CONFIG_LTO_CLANG=y, the build process is much more complex. Embedding
> the CRCs is postponed until the LLVM bitcode is converted into ELF,
> creating another intermediate *.prelink.o.
>
> However, this complexity is unneeded. There is no reason why we must
> embed version CRCs in objects so early.
>
> There is final link stage for vmlinux (scripts/link-vmlinux.sh) and
> modules (scripts/Makefile.modfinal). We can link CRCs at the very last
> moment.
>
> New implementation
> ==================
>                                                            |----------|
>                    --------------------------------------->| final    |
>        $(CC)      /    |---------|                         | link for |
>        -----> *.o ---->|         |                         | vmlinux  |
>       /                | modpost |--- .vmlinux.export.c -->| or       |
>      / genksyms        |         |--- *.mod.c ------------>| module   |
>   *.c ------> *.cmd -->|---------|                         |----------|
>
> Pass the symbol versions to modpost as separate text data, which are
> available in *.cmd files.
>
> This commit changes modpost to extract CRCs from *.cmd files instead of
> from ELF objects.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

This looks good to me, it's great to get rid of the .symversions files!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
