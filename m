Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD251CAAE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 22:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvQPz3t9Xz3cDF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 06:33:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GcsLNO3y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=GcsLNO3y; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQMY5YgGz3byT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 06:31:20 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id x17so9323867lfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May 2022 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KzJXnZ7chU1+5zJp4Dgvp3VaPPi5u4rVhagYP/eqQQE=;
 b=GcsLNO3ybt8b4qYioRwjRsGo24/f0OAD/JE388Gc5emmRyTIhlyYUbKzIgZyv53hb1
 xhiVCmKW0WOkPCvBf1e4g28vMmUQUkmrVh+o51YOtKO8cBVzloYHCXntPyZO/l8A9u4M
 5CxbT9nvJ8k+TaFHNOPLcGCSi7HogLmrn63TqdbSnLG4WHsAsFmI3EppXVPekhAxB05a
 NEbtgx7QVCxIiRy2eSQmkdwO62yYlPePGIiYe39mbWzh5zAEXFGIG2orgZSXN6r69srE
 z8JRd8pqir9+V0J5tZrITxsJOR+WTOS0fPBTlN8HA0KMIdLI2QtAq3P5nFh0k988K2Jw
 qG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KzJXnZ7chU1+5zJp4Dgvp3VaPPi5u4rVhagYP/eqQQE=;
 b=tyyUEFmDz9CYLnWCNUorcHrs+Th94ug2Awlu53yeVCGhQEmffkNsFSHDzsmL7nULKm
 dLKEtoJuJmKqX9JtRDjVtdMq2IqOOcCStPWmmY0SNTye4e5PqszsbInpibsTO3XyEBFC
 VFKqybSFUyC5l1xZlhQv3Maln/rjDgVq1uV7iCWyy4slXttaadaKa92MhvVIyTM+EM0d
 /Y4FuyCzL7IivJ5OT/SV/f6r0IBV/MEqLEsNrVxZB8SyJkngpv8aLoybZ7JJxPvoAlYA
 aozAQWrJfOsnCi+cjt9E6RrFLp4xlF8tZc6LNGWcKB1INItZB2lo67YZtIVTwMm8Qp52
 NYGw==
X-Gm-Message-State: AOAM533zXUhlB3C7wmXcus+uTdKM9mPC+T1iWezwiL74+T7HGE7yox/n
 eVRM9VMKxfPcby5HHK65SVZ+A/I2iJXsmayNa9ulcQ==
X-Google-Smtp-Source: ABdhPJwbhs3kr3NEQrD1kb2FM5lFdKjT3Fw4s9E6Bf+BV+NG8NhQY5rDLxGeb5Ices7vG2JpejLiHgrpcihMdzG04I8=
X-Received: by 2002:ac2:5e86:0:b0:473:d044:60f5 with SMTP id
 b6-20020ac25e86000000b00473d04460f5mr49308lfq.87.1651782674718; Thu, 05 May
 2022 13:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-15-masahiroy@kernel.org>
In-Reply-To: <20220505072244.1155033-15-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 May 2022 13:31:03 -0700
Message-ID: <CAKwvOdkTOv1VZti3KH9zxXT1xceogUPxdCV1JqoYbTKtdUy0qw@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] kbuild: make built-in.a rule robust against too
 long argument error
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier a <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 5, 2022 at 12:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Kbuild runs at the top of objtree instead of changing the working
> directory to subdirectories. I think this design is nice overall but
> some commands have a scapability issue.

s/scapability/scalability/


-- 
Thanks,
~Nick Desaulniers
