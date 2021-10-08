Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF574272F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 23:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR1KY0ZmFz30Bm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 08:19:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BhVVj3vK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=BhVVj3vK; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR1Jq61rnz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 08:18:51 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 oa6-20020a17090b1bc600b0019ffc4b9c51so10189810pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHy4HvfxK920/DAzRQ2LEGB6EW308Wa/3xEBO3I3ZhE=;
 b=BhVVj3vKt/JTppbgAK2mAsECRb50DXsS6r6M65L9zK/mN6kuIBXR6Buqs3rERRipGg
 1fFkRryHhsSY6tHK3Na1GTCd6pXVcac06u0Oi8e9R8Y/sXRYy7YNOsnPYVgk2OqMOeIz
 29j82p/ttntW9wToU6jvggtbtH4TaDHv5o6HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHy4HvfxK920/DAzRQ2LEGB6EW308Wa/3xEBO3I3ZhE=;
 b=d56C68CYC22Bu5NayGS/W7tFZCMJ7ZKsivbJobCtkH2pqqRcOoQA6ReTucSTypwb/+
 OSQUtZaivUptCnb8E0uvKsfxJMGZf2ARetkqvGGb9Z8M0HkfI0Ms2PyW4fGLZawq2jWk
 rxOYaTpszlxVDJhUvX+Mb7JPBR4e3rj71L2MsoTgO/pNTlu0diU43GxtUzKBkIfmomLf
 1hbyDdhA883YUq/qXy3DDI0mYQDoffpbn42rHKPI+4e6tqK4f8YtExjGq1Z3HPPzKls5
 m0nYBM15L5TFuSqKv3pcoxAye/WfyzTcA+rOr+2/zOXyMvIsREjdC2qc0VwU1inkqb9j
 lTCw==
X-Gm-Message-State: AOAM533Rsha+HrvpKQbk2oVsL1vlocgpuaZDx8hUru3fD/MFfZR4YysR
 JX5zGg4sknxtbIEzHH+kR1+Ang==
X-Google-Smtp-Source: ABdhPJyv4C5+P+SgYIf226CgVLrqAnPgnVXY5QUVMiim6AYeLnzTfC3cD84QYWdFL1q3lMAKjijtkw==
X-Received: by 2002:a17:902:ea05:b0:13f:4b5:cda2 with SMTP id
 s5-20020a170902ea0500b0013f04b5cda2mr11620979plg.86.1633727928442; 
 Fri, 08 Oct 2021 14:18:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n1sm228706pfo.116.2021.10.08.14.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:18:47 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] lkdtm: Fix content of section containing
 lkdtm_rodata_do_nothing()
Date: Fri,  8 Oct 2021 14:17:49 -0700
Message-Id: <163372786562.2954264.14524923434528443035.b4-ty@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <8900731fbc05fb8b0de18af7133a8fc07c3c53a1.1633712176.git.christophe.leroy@csgroup.eu>
References: <8900731fbc05fb8b0de18af7133a8fc07c3c53a1.1633712176.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 8 Oct 2021 18:58:40 +0200, Christophe Leroy wrote:
> On a kernel without CONFIG_STRICT_KERNEL_RWX, running EXEC_RODATA
> test leads to "Illegal instruction" failure.
> 
> Looking at the content of rodata_objcopy.o, we see that the
> function content zeroes only:
> 
> 	Disassembly of section .rodata:
> 
> [...]

Applied to for-next/lkdtm, thanks!

[1/1] lkdtm: Fix content of section containing lkdtm_rodata_do_nothing()
      https://git.kernel.org/kees/c/19c3069c5f5f

Also, can you take a moment and get "patatt" set up[1] for signing your
patches? I would appreciate that since b4 yells at me when patches aren't
signed. :)

-Kees

[1] https://github.com/mricon/patatt

-- 
Kees Cook

