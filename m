Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804516F7E1C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 09:45:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCN565nNrz3cff
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 17:45:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=3CTGLUNi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=3CTGLUNi;
	dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCN4C3zPcz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 17:44:26 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3318961b385so17167765ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683272663; x=1685864663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lPZVtfp6t3Y0W83bt9VDuQwkydTNBKwgjyEPJPSY9oo=;
        b=3CTGLUNi41774qWN2MdvThPefR+2JWAFFB3SDr72C708dur/f93EMMFzAxRNyK5Ekv
         LIh/Lcfrzmg8Y0JkqH/TP00YbU0LHeEL1FIXunqiWpa/BHRx1Ii+By20gB8tRnqqmxWJ
         7rA2p5REb5sQET6rksFE2VvtWG6saxcb04bES43ic9H+OvnU+FnYTxvEMRhnrsEpzEN4
         +d4ZYueujsNWDQ3FLG9XEtBnnqnhAVfJfQ+Y7acMxW4pEE/2cQiZQhAHohyKuuVvc9Zp
         rMEJng5UAwkEoqOjj0mEMPToPiltEc53F3QJiz88LavqXUJqI0b3h2RCjbQN982JfBij
         F5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683272663; x=1685864663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPZVtfp6t3Y0W83bt9VDuQwkydTNBKwgjyEPJPSY9oo=;
        b=YD7QL22OUEJXPpvu9VxMmRc4hz0IBjZIpc4TN/EpSKQJ0xYDgaIlU4weK9ircrFmVc
         MqCPEUrY4iVAPTv6J4UPWSvG2W9c30DKbZWRZIWnPavROOapZ/Z0Csx4Y5tTv3ATmpAm
         GlQAn75I/tuvznmfCHqEG3KnvysWRkynCYpxoVowjyBdCSIaicSQWMF+qdFjOPJYCBhE
         2PIf/hDFbi189z3cJ1ITNVcZ6IyVrlxOwmvWllT34lKjm8uXMQbrheP8/j83aT9vHXqN
         B7k5uABUiMxqSF1drzoh8ZxQUhn2XmXd63xp5WzXBFCvSmMyyUpQMFVIUay6ZBR1r3ge
         v0Lw==
X-Gm-Message-State: AC+VfDyWHd4bDWs25PighQF04RRQqJ/iInkvkA4Q6h6ljcBkCKODMqxA
	8fn9BqIYCq6YXHqyW3koWGIiWrjcfhSiVz1HqPmoBA==
X-Google-Smtp-Source: ACHHUZ4epH5CJTOlram+1GD8qTmDW8HjKYhj0AillBoub3xAs1nJF7QedWwGl/arLZNXCFh6UVEOeuHiI5Hr+RGxzi0=
X-Received: by 2002:a5e:9244:0:b0:760:af65:4787 with SMTP id
 z4-20020a5e9244000000b00760af654787mr500379iop.6.1683272662794; Fri, 05 May
 2023 00:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230505035127.195387-1-mpe@ellerman.id.au>
In-Reply-To: <20230505035127.195387-1-mpe@ellerman.id.au>
From: Marco Elver <elver@google.com>
Date: Fri, 5 May 2023 09:43:46 +0200
Message-ID: <CANpmjNOmtTU=__W7=pKVibVZ3OnfgSsXeSsqHA7y=e3D-G026Q@mail.gmail.com>
Subject: Re: [PATCH] mm: kfence: Fix false positives on big endian
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
Cc: zhangpeng.00@bytedance.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, glider@google.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 May 2023 at 05:51, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Since commit 1ba3cbf3ec3b ("mm: kfence: improve the performance of
> __kfence_alloc() and __kfence_free()"), kfence reports failures in
> random places at boot on big endian machines.
>
> The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes the
> address of each byte in its value, so it needs to be byte swapped on big
> endian machines.
>
> The compiler is smart enough to do the le64_to_cpu() at compile time, so
> there is no runtime overhead.
>
> Fixes: 1ba3cbf3ec3b ("mm: kfence: improve the performance of __kfence_alloc() and __kfence_free()")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Marco Elver <elver@google.com>

Andrew, is the Fixes enough to make it to stable as well or do we also
need Cc: stable?

Thanks,
-- Marco

> ---
>  mm/kfence/kfence.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
> index 2aafc46a4aaf..392fb273e7bd 100644
> --- a/mm/kfence/kfence.h
> +++ b/mm/kfence/kfence.h
> @@ -29,7 +29,7 @@
>   * canary of every 8 bytes is the same. 64-bit memory can be filled and checked
>   * at a time instead of byte by byte to improve performance.
>   */
> -#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(0x0706050403020100))
> +#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(le64_to_cpu(0x0706050403020100)))
>
>  /* Maximum stack depth for reports. */
>  #define KFENCE_STACK_DEPTH 64
> --
> 2.40.1
>
