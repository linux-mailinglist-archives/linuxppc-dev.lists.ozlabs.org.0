Return-Path: <linuxppc-dev+bounces-14116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71AEC50ACD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 07:09:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5tJm71RCz2yvR;
	Wed, 12 Nov 2025 17:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762927752;
	cv=none; b=MjJ+QmYsCQuZBlIg3fM7AQ4M/OYZ6bJ+UAJtSetaUIIuk1vK0T3IgVVNqI6AxLHMgGf1sInDQ5yK1QsslalZZXlucaVZUeov50AAvxG7fAXnWBfr+ykkemfiaWXOeDXt/oLuZztZAdFhpikUcYEPIpvO4tqD0J5L6rth6gXfPHTIYXuGDABXaScU2b2sIzdBBk96OxZDjbvUPdRjzucxo2WebL8ikO8J7OgFb+k1UiWCwSR6rpii3aPECdS3IPVTktbQ5nVme2NtQY420h/lsG7HPnTd5fUX53ERHCVwSKb7HQfuoUMGFirx1NF8gqD35bj0axLymxX1ljs2eca+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762927752; c=relaxed/relaxed;
	bh=Vf+V3xa9EgGUbHOlQxF1xdJJTU0DRTndVUemiyXUeyI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=k5iXlyaxJdmGzGBpTFbh7Kmub+n1xAJ5uu37/iiUXU5/3pao4SkOTPY5P+WvNxOp8mDvx6duG0ygJGBbpLdlQO5yZd0SVjgb+fKrBCAznEboBDYyb9KaPjVZuMr795G7BGg+7K1EJxySgLecXsoGs9KwuaoltwOE3Iyb2QeeNOhM4p2r7AlERzB85bEIgpevHb6HCUHEuGorSXuoVVWvmEAz1bgnGMzQxbk1MVzgSvAPHXgyvoO9AvrH095fdzxvG7LJQa8Mwfz7564NG4NizUCl48UBmk0aiIyoV8dmA6Daq89XBoZxZFykjTH5BjL9GGY0rhswo3OVG4J50o57UQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lsT5VQ0Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lsT5VQ0Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5tJl2kfhz2yFT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 17:09:10 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b553412a19bso293383a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 22:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762927747; x=1763532547; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vf+V3xa9EgGUbHOlQxF1xdJJTU0DRTndVUemiyXUeyI=;
        b=lsT5VQ0ZSRvzmq+a9vWaMiMFqf+b9y2UsOCpsjD+decZdlZZ+OwD4C4XXHkzNqChL6
         wxZY3b0lNYL+08hWj/jECtB+2d6Nq7yCncjzNdGDgHjGi2vcoDFbneRinn1CHeWpPh5V
         Aml3KNv/qZd/8EW1vn+A7rtHDHkvmfyg9CTAvBRYxyk/aiD7onmiF1ACrKikAQ6VxAYm
         oLQ0SsISng0coI/RYn2ut5YFltMhDI7ytA9+jqLfNWs0UqhxMxJvvxTpOAEyPg6p8i9T
         yODdE7ngFQKtyeesX07SCvd6URfKSGadtk84FbjGim7ZlytEmt33xOO2l3K5GPny1cFm
         v5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762927747; x=1763532547;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf+V3xa9EgGUbHOlQxF1xdJJTU0DRTndVUemiyXUeyI=;
        b=Ir65dxg5kKAXwPMHSWz7yI+9BCClSinJN96xFZo/b+2TBzyDGW4s9GS9RW+Mf4qyTH
         DoLgopDMpGky6WGCeAuYijtKvW0RMU0doZUNQDdpc4SLBJNnq0HlRYLYKxEhXVFmwfnG
         Yc9bJvHjE0Sa7Aexe14Spyk7vc4vKAMT5dSC/y/bxlqkcUzv3Yl5GxyQDVITsVhqqfM6
         qKN0PWEZa3OddN0iI5Eao9IOPvVwOiePl4QRluL7RGWHd0CF5YqZbmRUHshtMsve3Nus
         KslflooUwh4aCLst9+J/Ay/tK5W223Wxi4VGmdje4hhXWsFI55PWXkn+wvk16Z3fz0by
         2P1A==
X-Gm-Message-State: AOJu0YwR42XJeFd7smo/FjukFVhPdk1/ivAJfoaqND8ICmcnfoGy64PX
	ZqDduKKwHcITgY0UxhLls+bTX1sXui3xXmaqilHN9QoT51kaQmbjJ1Ty
X-Gm-Gg: ASbGnct5b9H5yVOsFYNfXK0T0JV5uOfIy7E3hOlYzE8o+S1jZCxbgkSQgJXKq8QPY7l
	KW/tGKv2tjDVyjxzFHDLLgiLqkUhEQh2mZr7PC+59FPcygVWn+I1CMuw7FLbLZ5RX9SRHXbHElg
	+7n/VworkU2uA3PxzPTf40xtWRTHjAYfCmTnJPiAAq0LWbMeAl0wu9GdhZ5c8cQ/K0iQLvrX56W
	jkd64voCOzAjU19boZAcULo33eDpp5mZhG2wDSN4l/hS5p4IPS93ttD+9GepgpRZ6xgGScZXTxJ
	z3JcBMwxzEoSsYrUd8O5pfZ5G7etCaWs/9eRWFNqV5F0Ru6izlhqC9ITl7lLpU172uzOFsbK3ai
	2KJzmutL6dWAYx+6rO7N6fibETmyIglx7y7RHVtQlYSf/OUf0Gs+H/Z8q5Y6PiZjzkiISJA8=
X-Google-Smtp-Source: AGHT+IEohiT6l/U6Q6cSeQX1Sd4BBaq0PAFAEVh2j8GuYXQZDYJogJ/Y0Dgu8WSYVH4jJhCDgr7O2w==
X-Received: by 2002:a17:902:e804:b0:296:1beb:6776 with SMTP id d9443c01a7336-2984edf314amr25324145ad.58.1762927747094;
        Tue, 11 Nov 2025 22:09:07 -0800 (PST)
Received: from dw-tp ([49.207.219.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbd8cd0sm18094405ad.4.2025.11.11.22.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 22:09:06 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Dave Vasilevsky <dave@vasilevsky.ca>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nadav Amit <nadav.amit@gmail.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org, Dave Vasilevsky <dave@vasilevsky.ca>
Subject: Re: [PATCH v2] powerpc, mm: Fix mprotect on book3s 32-bit
In-Reply-To: <20251111-vasi-mprotect-g3-v2-1-881c94afbc42@vasilevsky.ca>
Date: Wed, 12 Nov 2025 11:03:52 +0530
Message-ID: <87ikff95mn.ritesh.list@gmail.com>
References: <20251111-vasi-mprotect-g3-v2-1-881c94afbc42@vasilevsky.ca>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

Dave Vasilevsky <dave@vasilevsky.ca> writes:

> On 32-bit book3s with hash-MMUs, tlb_flush() was a no-op. This was
> unnoticed because all uses until recently were for unmaps, and thus
> handled by __tlb_remove_tlb_entry().
>
> After commit 4a18419f71cd ("mm/mprotect: use mmu_gather") in kernel 5.19,
> tlb_gather_mmu() started being used for mprotect as well. This caused
> mprotect to simply not work on these machines:
>
>   int *ptr = mmap(NULL, 4096, PROT_READ|PROT_WRITE,
>                   MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
>   *ptr = 1; // force HPTE to be created
>   mprotect(ptr, 4096, PROT_READ);
>   *ptr = 2; // should segfault, but succeeds
>
> Fixed by making tlb_flush() actually flush TLB pages. This finally
> agrees with the behaviour of boot3s64's tlb_flush().
>
> Fixes: 4a18419f71cd ("mm/mprotect: use mmu_gather")
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> Cc: stable@vger.kernel.org
> ---
> Changes in v2:
> - Flush entire TLB if full mm is requested.
> - Link to v1: https://lore.kernel.org/r/20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca
> ---
>  arch/powerpc/include/asm/book3s/32/tlbflush.h | 8 ++++++--
>  arch/powerpc/mm/book3s32/tlb.c                | 9 +++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> index e43534da5207aa3b0cb3c07b78e29b833c141f3f..b8c587ad2ea954f179246a57d6e86e45e91dcfdc 100644
> --- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> @@ -11,6 +11,7 @@
>  void hash__flush_tlb_mm(struct mm_struct *mm);
>  void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
>  void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
> +void hash__flush_gather(struct mmu_gather *tlb);

Maybe I would have preferred the following naming convention for hash
specific tlb_flush w.r.t mmu_gather, which is also similar to what
book3s64 uses ;)

- hash__tlb_flush() 

But no strong objection on this either. BTW - I did run your test
program in Qemu and I was able to reproduce the problem, and this patch
fixes it.

The change overall looks good to me. So, please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

