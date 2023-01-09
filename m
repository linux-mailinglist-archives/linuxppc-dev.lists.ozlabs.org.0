Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD996633BC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 23:13:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrSs01GSbz3cHK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:13:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=avwgqVIo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=avwgqVIo;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrSr546FNz3c2W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 09:13:09 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id s3so4776492pfd.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 14:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe6A//qmJ4NnWbVuXzR/SPLnXLfnt5V0+ditkKxdD0c=;
        b=avwgqVIoXCpLRgL2rsbCwZk0+FJkhMDJvlfNCKRUfVdJskLNjDTEzit1skN/ZlDe3T
         R4r88LCIkzuGmRlRfgYxMpZlD7ZQ8qIJT0x6uZxwzNzAIwkcBLcBXmLsLe6xmo4jbR+8
         BddQ+9IEl/FL+GcFcDjRQnvhsj3/k2N6WpOnOJIXa+jd8/Qt4rM5go649f1Ve2iEqVxA
         Wwvyrgxb/ZPP8v5V9xzX5o1EFc+KUs7qPXPBnIuI3HUnZ2l7+lBWtwJtQnlK14+xFYLR
         sNCpJroLJ2+SnjtIbGfkqlwz+ePnTt2aNE1eKtJ+tBXfhOulflt9EqgIVYQEezgG5/3h
         0lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe6A//qmJ4NnWbVuXzR/SPLnXLfnt5V0+ditkKxdD0c=;
        b=mbD0gP+pjjMiK/fY94WKT3cytwHITNpIIhkhsav0jN6zqRBhbya9AVgW/t350/7kr4
         D1Ev04yHZB6/Jumi4bZiBqeXjFaGtYpb1NZiiVS3HmE+MRvr+vGROc0ZwEnMrxl8s7ax
         mU1QiFgasl5ueU/2chW2mmAr8lsoctOQEb92rbez0dVXr06id/g//GurWY40zFjspM4N
         LXynYqo4H37LKbHG4iYROfCR15fVtcg5D9f6taHkXeEDOv39WeH18ZI+GHthNN4p9lVE
         eh5jqrfAZwXTb0BMjGMLQKdlw7pDmJwXeAA49JEv/H7HCFBz7PdgV5GhlFoVq/tiMWBT
         FwYg==
X-Gm-Message-State: AFqh2ko1eJhj4A97g7L1stCZyNeXl1STmKyKi/8vGlXR/FYwa+rJgLN4
	gMi3LzUnPDXGwnKxbipes17V/Q8KhhjTuDPVNHYK6w==
X-Google-Smtp-Source: AMrXdXtMcFa+l6kAazK251eqZGx6C7sgD9DBhmYRg4WNsq57PkL6XzXoZvYpynLFe25uQvunKx2n9ndiQ0ZxzuLH2tc=
X-Received: by 2002:a63:c50:0:b0:494:7a78:4bb0 with SMTP id
 16-20020a630c50000000b004947a784bb0mr3997953pgm.427.1673302386285; Mon, 09
 Jan 2023 14:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 14:12:55 -0800
Message-ID: <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com>
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
>
> This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> been done for other flags previously.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Hmm...so this was added by the top level Makefile doing a cc-option
test.  How did the test pass if this was unsupported? That worries me
that perhaps other cc-option tests are passing erroneously for certain
ppc -m32/-m64 configs?

> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 769b62832b38..4ee7d36ce752 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -16,6 +16,11 @@ ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
>    CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
>    CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> +  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
> +  # an unused command line flag warning for this file.
> +  ifdef CONFIG_CC_IS_CLANG
> +  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
> +  endif
>    CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
>    CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>    CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
