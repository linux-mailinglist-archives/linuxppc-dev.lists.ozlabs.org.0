Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26737B1061
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:52:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TgDn6H8czF4Sp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 23:52:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="oMeGLKfj"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tg896nDhzF3Fv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 23:48:09 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id n7so29650705qtb.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKkk8JOcHxODl2WFnm1Rghz+daQvfyVneTOsrZmsJ4k=;
 b=oMeGLKfj0ZzTBSi+GKe9O02YwndGj3Ia4Nwi4Q7OXG4tD/6XWsn/cteOXh+cXL63h1
 rzM4QokqWOhUDvER/NKcfzZAjx1FSVZFgxsvsBhIjsaQ10TnR9hf+URAGZ5W84aKdrFA
 kVzXvYlNz0OwGFOQ1iM16sOdYVdaksS9BpU4oE0misV5seyzXCEdZR7b7vlJMfYRGKsB
 QKR0mGRgJVmyx13h8/rphW7k2ggS3bLFiDiXIlaEb8SnJdUOT0AZlbm6rj1RWOj/rV/Y
 EPOFyTMmGYu22gs851nSlU4KjUqLCjAV0fgY7gpYaV3W64mahKEtb53wH4Uh1ugSN044
 GQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKkk8JOcHxODl2WFnm1Rghz+daQvfyVneTOsrZmsJ4k=;
 b=KNL3tmxxYCJXtKJBFJ4axBWxCi+vQ4tOQxF8Ylvp7pTJZXXVS1atdthStIg8BBLpBg
 b9QIZtuSMDQlVC9uDqnp+lpiJkFI1a+a07pKQAewzSwwhMm15ShelfTNf/MLMu+bcLzp
 5NVh2R/Y7L1qrHf9evknMAR/HPN/dANSDeCfjGqjjm6Awm4coWuopMRcIJGqTgbPPxwp
 bZHtbAsE2JqF6X+B79ZxEqsgi5S3vQk+bogB3Md+2f8rCeB9FqPaYMKmWBtmr9oDfv3B
 Dx65sZoQg0ew7oHJyXJP3VaBtsNDfTNI3yIcZsQWx8XL8NhgeCfukcErG1LrWSoywW7n
 X5GQ==
X-Gm-Message-State: APjAAAX+niKIsPkBdIhj+5K3S0vWSnq6q+ZJdSID/iF6dJ9vdREHFAET
 nvB3HxIlCuAblVphv6Acwy4Gyw==
X-Google-Smtp-Source: APXvYqxCe2JMNq1Ggi+fPGa/aLOY3Yy1INyO1KSi1s+atLHs2+agFimmaZvKZC3WEMTxCIm/3yjdxw==
X-Received: by 2002:ac8:5296:: with SMTP id s22mr40614483qtn.139.1568296085053; 
 Thu, 12 Sep 2019 06:48:05 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id h29sm15126219qtb.46.2019.09.12.06.48.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 06:48:04 -0700 (PDT)
Message-ID: <1568296082.5576.141.camel@lca.pw>
Subject: Re: [PATCH] powerpc/mm/radix: remove useless kernel messages
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Date: Thu, 12 Sep 2019 09:48:02 -0400
In-Reply-To: <1566570120-16529-1-git-send-email-cai@lca.pw>
References: <1566570120-16529-1-git-send-email-cai@lca.pw>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael, Aneesh, please take a take at this trivial patch.

On Fri, 2019-08-23 at 10:22 -0400, Qian Cai wrote:
> Booting a POWER9 PowerNV system generates a few messages below with
> "____ptrval____" due to the pointers printed without a specifier
> extension (i.e unadorned %p) are hashed to prevent leaking information
> about the kernel memory layout.
> 
> radix-mmu: Initializing Radix MMU
> radix-mmu: Partition table (____ptrval____)
> radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB
> pages (exec)
> radix-mmu: Mapped 0x0000000040000000-0x0000002000000000 with 1.00 GiB
> pages
> radix-mmu: Mapped 0x0000200000000000-0x0000202000000000 with 1.00 GiB
> pages
> radix-mmu: Process table (____ptrval____) and radix root for kernel:
> (____ptrval____)
> 
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index b4ca9e95e678..b6692ee9411d 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -386,7 +386,6 @@ static void __init radix_init_pgtable(void)
>  	 * physical address here.
>  	 */
>  	register_process_table(__pa(process_tb), 0, PRTB_SIZE_SHIFT - 12);
> -	pr_info("Process table %p and radix root for kernel: %p\n", process_tb, init_mm.pgd);
>  	asm volatile("ptesync" : : : "memory");
>  	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
>  		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
> @@ -420,7 +419,6 @@ static void __init radix_init_partition_table(void)
>  	mmu_partition_table_set_entry(0, dw0, 0);
>  
>  	pr_info("Initializing Radix MMU\n");
> -	pr_info("Partition table %p\n", partition_tb);
>  }
>  
>  void __init radix_init_native(void)
