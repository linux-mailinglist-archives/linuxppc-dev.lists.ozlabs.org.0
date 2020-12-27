Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D22E2FC7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Dec 2020 04:45:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D3RQb4b3NzDqGY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Dec 2020 14:45:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k+0kpygE; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D3RP92dtNzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Dec 2020 14:43:55 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id t8so4482567pfg.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 19:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=PqQAiv/DQ/uaBJdeYRX64iJn5cpjW9UmaoLzhs/v7gQ=;
 b=k+0kpygEpvpRQrKERc+fKM5XAznyq5hqFRfc60opTUASejqHiJlAzhSZgg4y6K4ShD
 gQIrFeshokZUVkuYDpN8YpyEsI1MM9DHrWrHtctqBKcgFSp4t1kZpn0NayFWWZ/pOAs3
 N+7Z9JgXtxCiK2Ja3sXtXQFNBnrbmD/spdpfLAt74N0cbsfl+Nd/bJlTHsKJRdVPHZhZ
 vudHKtTyU43BtZMVN9FUcKWAruE3ypiJkmwPYPa9VDs8UUf4/4uCv3AUzDcQQXfmBZp7
 i6ePfeeLbsHPMpIGeh5Q940hDMAopGzkoA088506WoIYkP07moagfyL4Co1kPheTmvDW
 iqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=PqQAiv/DQ/uaBJdeYRX64iJn5cpjW9UmaoLzhs/v7gQ=;
 b=q0eKnwKwy0yIXpvI+KdkFUm97zHQ02NyzPGITVnWRHPqZl9hW7ijouJr80a8BrS+Tg
 EDjxk/zn5/paCjL6PtWXo4JW6l2dOaHRnRSQyxXo1kO6pwvK7sEE+RUt5d4l20Ud9gmY
 F4W7/9MdNiq632EgeiDFlaH0oImrhQxpwotfMMC3QvOR5z4SLrZMzeKpGKg5fbZuPp8m
 WXkyIglfj7WaLX5XyqN4ghDQATtMwZdsxvgBZgAWx2c6f9FK2Cgt0QNxcgB00cKXSEeQ
 CAHsLZLj/qI0a2cht/GFhyQdP6LQ8T7s6AgP2FyfopigLhIc8BGAaV0P+KuqO0y1Jye7
 VqHw==
X-Gm-Message-State: AOAM533JyqvRCsa8UVtO2HwKUo8JdRVq9s8tU/s+uvTkCgmhUmE7daAO
 0XA9fj7JnZCdOTHT6Q19qEk=
X-Google-Smtp-Source: ABdhPJzdTwlK7o6258DVLKqKafO4JukKjw1jlnIPg1nVAtK0U/oG+l5aGN/CskMK4XvXkubY+5y0gw==
X-Received: by 2002:a62:3:0:b029:160:d92:2680 with SMTP id
 3-20020a6200030000b02901600d922680mr36208228pfa.44.1609040631533; 
 Sat, 26 Dec 2020 19:43:51 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id a1sm32106315pfo.56.2020.12.26.19.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 19:43:51 -0800 (PST)
Date: Sun, 27 Dec 2020 13:43:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 05/15] powerpc: Remove address argument from
 bad_page_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
 <181cb8d6899a298e8ddab3b8f669a48c11b43cca.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <181cb8d6899a298e8ddab3b8f669a48c11b43cca.1608641533.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1609039746.005aiasorf.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 22, 2020 11:28 pm:
> The address argument is not used by bad_page_fault().
>=20
> Remove it.
>=20
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/bug.h             | 4 ++--
>  arch/powerpc/kernel/entry_32.S             | 4 +---
>  arch/powerpc/kernel/exceptions-64e.S       | 3 +--
>  arch/powerpc/kernel/exceptions-64s.S       | 8 +++-----
>  arch/powerpc/kernel/traps.c                | 2 +-
>  arch/powerpc/mm/book3s64/hash_utils.c      | 2 +-
>  arch/powerpc/mm/book3s64/slb.c             | 2 +-
>  arch/powerpc/mm/fault.c                    | 6 +++---
>  arch/powerpc/platforms/8xx/machine_check.c | 2 +-
>  9 files changed, 14 insertions(+), 19 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bu=
g.h
> index 464f8ca8a5c9..af8c164254d0 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -112,8 +112,8 @@
> =20
>  struct pt_regs;
>  extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long)=
;
> -extern void bad_page_fault(struct pt_regs *, unsigned long, int);
> -void __bad_page_fault(struct pt_regs *regs, unsigned long address, int s=
ig);
> +void bad_page_fault(struct pt_regs *regs, int sig);
> +void __bad_page_fault(struct pt_regs *regs, int sig);
>  extern void _exception(int, struct pt_regs *, int, unsigned long);
>  extern void _exception_pkey(struct pt_regs *, unsigned long, int);
>  extern void die(const char *, struct pt_regs *, long);
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 238eacfda7b0..abd95aebe73a 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -671,15 +671,13 @@ ppc_swapcontext:
>  handle_page_fault:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	do_page_fault
> -	cmpwi	r3,0
> +	mr.	r4,r3

This looks like an unrelated change so I'll leave it out. Nice little=20
improvement though.

Thanks,
Nick
