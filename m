Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 145356974C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 04:20:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGjxq0727z3chn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 14:20:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TDWQ9Pmr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TDWQ9Pmr;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGjwq6j64z3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 14:19:21 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id o8so16635640pls.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBDtDorWVGGnbAJlstCVLXC4KgZYcpfN89nn0eLodho=;
        b=TDWQ9PmrwvLUcTo0lBlRuDBs6LfyqBjYoFXCZSj6/7iKJCjhRwcJUbUfI2buPyb9rd
         xeco65Idbt5F69GXs19eLIIr/E1mdOW2sDO18XzrsZBD+rCxSEr0HrphkGMlLecQRNWE
         fKVUl2wxjhX+iWtZIZ57DBC+0rBbt0ZIv31fmglw+YVgSA6KxZa6p66Eua+MsJsNGMI8
         QUdukJNui/NdiTy6lOPb8nzXYjzh8NSH1P61qaqV/ULSjXcyz1Qe24/S8Er3ohkeZQiP
         ZlVHKsxbxVvaOFpdk5QC1EZcAOetNy6F/lOwxCTH9nYKnwp5L9U3HtfofiOq7NcIsB2B
         A1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBDtDorWVGGnbAJlstCVLXC4KgZYcpfN89nn0eLodho=;
        b=OMzivZi1xBJm/lCmjJdQVa7fito41YKJVl1Kv+Hk0G+DakMbA0TxaBOmocVBXGZ/Zb
         mEvgju9FOVvjomvosLYpeQa0XvUNsSWE3CG6AaqKEhd/ga/qpNgjLG3ldval2Su8nvP3
         bqqN4QYyuBDyQrn9NhddXev2k+P9kqmIhjoX+/Mb2ITjPQHpxakVKRlJ+mHXO1mvf+6U
         Kkh4rJzrfgqzLbOY7O4CkWV+YgD2tu1AERHUysez8VVcuGnwOQ2pIIDIwT5cfDrzAjqK
         TheqJ166Kd+fqmnJ0At9lXiRApxNxM0oXYSpXm98bufCXC0k5CliD4kO0dQ4JTbYkaLt
         oFAg==
X-Gm-Message-State: AO0yUKWrrnfYsrFcL7hnvX4p8vgNED2af+goD2JBQpFEMOkNjG0SjW27
	qk2jGXZdysAsZaGcCfrMnBDCmg==
X-Google-Smtp-Source: AK7set8IZlzKTCD+NS6NLk03tw12Y2YvjAU5Kw+8dpbaSxkri3GTeMpV3jTg9FWVdAem4jZpgiABJg==
X-Received: by 2002:a17:902:d2c8:b0:19a:85d9:93fd with SMTP id n8-20020a170902d2c800b0019a85d993fdmr938693plc.22.1676431157460;
        Tue, 14 Feb 2023 19:19:17 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902b18f00b00189bf5dc96dsm10887390plr.230.2023.02.14.19.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 19:19:16 -0800 (PST)
Date: Tue, 14 Feb 2023 19:19:16 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 19:19:13 PST (-0800)
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mike.kravetz@oracle.com
Message-ID: <mhng-6dc92fd9-0fe6-4a0d-974f-4f4468f143e4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: mhocko@suse.com, david@redhat.com, dave.hansen@linux.intel.com, peterx@redhat.com, linux-mm@kvack.org, edumazet@google.com, linux-riscv@lists.infradead.org, nadav.amit@gmail.com, linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>, willy@infradead.org, Christoph Hellwig <hch@infradead.org>, borntraeger@linux.ibm.com, riel@surriel.com, vbabka@suse.cz, brauner@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 03 Jan 2023 16:27:32 PST (-0800), mike.kravetz@oracle.com wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
>
> Instead of fixing zap_page_range, do the following:
> - Create a new routine zap_vma_pages() that will remove all pages within
>   the passed vma.  Most users of zap_page_range pass the entire vma and
>   can use this new routine.
> - For callers of zap_page_range not passing the entire vma, instead call
>   zap_page_range_single().
> - Remove zap_page_range.
>
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

[...]

> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index e410275918ac..5c30212d8d1c 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -124,13 +124,11 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
>  	mmap_read_lock(mm);
>
>  	for_each_vma(vmi, vma) {
> -		unsigned long size = vma->vm_end - vma->vm_start;
> -
>  		if (vma_is_special_mapping(vma, vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_pages(vma);
>  #ifdef CONFIG_COMPAT
>  		if (vma_is_special_mapping(vma, compat_vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_pages(vma);
>  #endif
>  	}

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!
