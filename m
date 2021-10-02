Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1941FE5B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 00:10:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMLl30zJdz2ywk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 09:10:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YSYMM4Fk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=anyfinetworks.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=johan.almbladh@anyfinetworks.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com
 header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YSYMM4Fk; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMDXL242Kz2yb7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Oct 2021 04:30:42 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id s4so11292292ybs.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Oct 2021 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXMJtKlLUkpkTeC/ZpG6R1dp/ShOwvvXqINiBv7rTpQ=;
 b=YSYMM4FkUE8eZebYGJWRLl0+IuMVzn3R2Haf+PpJJFPbAPYWcXc2cXByOZcaQPcCg/
 lG6FnIIwo67fIC58k0cQUJEJWEisW1zgl3904xD7+XA5mQZQCRkOHPdbYRpimIthdvop
 7YENn/BkXqvM4zBQidXgTnRTmNsEHXL1UWgZVu+8q9s/XryNUfqjQ4AC3R/I+vPYtUPd
 trumoXBvLA57f4c7OSuo+ynZhKGt2+5askS8wLVKDrmMn8Td0zwAmo0VkZMcnAIqwCZ5
 FtX+lCu+q4B3tNIMfgS68IIPz1tBX5UVnOryRZRUr1TpMuo/A78E8WfrqK98KgTYa1+M
 K14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXMJtKlLUkpkTeC/ZpG6R1dp/ShOwvvXqINiBv7rTpQ=;
 b=Gwe+QmOT+NlAsyFCcyYlRk6iZzzxjRakJyP3rFjUU4eyfMzpG3HkQMcXjwmQXp+HQQ
 zPIxlmQM06Jl7RQITx9+o0dA0DmLjkKbyUpJCPHVlatdy3xvd5BNnGiloalYTZXE88Rq
 VWzgkQMalzcReTmQIZPuBZdjSITk18yuPPdb+XgbsWzsgxibWPAfH2FG648sH5PkWIlt
 Nmrm8lgJqAonDUzHDJ/gmJVw+f0gU6PWQ8vslGKAGkER3M38p9XrmBEStYv3fr/HJmTe
 3exT/t1F7RY4lqvbrTHex2UlTF8gD8BnU9heBgIVP/apsMtikJLiR03gQqJ2pSNNrTxY
 lJnw==
X-Gm-Message-State: AOAM533QO8L0JKiJnv7qSn2Ve5kKLF0/pwugLjv9HXP8jJ6dVfp2VW4l
 08nrJkeF9u5Y6cPte7UFkyDFufli5/eJdi2VymddEQ==
X-Google-Smtp-Source: ABdhPJx+jygCqca4NLWugI+qdhvBayAOnFyq54a2FPzwA2PSth4+amv+zq5sCxgcWPbUB7b0Z/Z+ZlfkSCgfhNhn53Y=
X-Received: by 2002:a25:c986:: with SMTP id z128mr4811601ybf.112.1633195839032; 
 Sat, 02 Oct 2021 10:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <92fcd53a43dede52fbba52dc50c76042a6ce284c.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <92fcd53a43dede52fbba52dc50c76042a6ce284c.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Sat, 2 Oct 2021 19:30:28 +0200
Message-ID: <CAM1=_QS6GCA0zAUgWSiW8eR6GiVjnMzCWvGrdkmY9nnseeCFeg@mail.gmail.com>
Subject: Re: [PATCH 3/9] powerpc/bpf: Remove unused SEEN_STACK
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 03 Oct 2021 09:09:12 +1100
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Nicholas Piggin <npiggin@gmail.com>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 11:15 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>
> SEEN_STACK is unused on PowerPC. Remove it. Also, have
> SEEN_TAILCALL use 0x40000000.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

> ---
>  arch/powerpc/net/bpf_jit.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 7e9b978b768ed9..89bd744c2bffd4 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -125,8 +125,7 @@
>  #define COND_LE                (CR0_GT | COND_CMP_FALSE)
>
>  #define SEEN_FUNC      0x20000000 /* might call external helpers */
> -#define SEEN_STACK     0x40000000 /* uses BPF stack */
> -#define SEEN_TAILCALL  0x80000000 /* uses tail calls */
> +#define SEEN_TAILCALL  0x40000000 /* uses tail calls */
>
>  #define SEEN_VREG_MASK 0x1ff80000 /* Volatile registers r3-r12 */
>  #define SEEN_NVREG_MASK        0x0003ffff /* Non volatile registers r14-r31 */
> --
> 2.33.0
>
