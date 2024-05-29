Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 57FBE8D3061
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 10:11:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YIExD2GG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq22Q5PcMz79Cn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 18:03:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YIExD2GG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq21f3rngz3g8B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 18:03:00 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-35af7bf408aso1675288f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 01:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716969775; x=1717574575; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXNn4brV8l1cKgDS0zwRf7wcdauWIB3ooZqqAlvwD7I=;
        b=YIExD2GGTEzoxn8iP4Sth7YGDG4V3g4P2T8s4d9tNQLPuoLgtiD9C5OhabMJ0PPhkW
         BK+3gHgOV8sNmCziOkV3F5JjV0rHJmHgQImCX+UGjEmNNTE24vGXiblZgi5gC9wibXtH
         sacjtaZZtOiTl9Jy3RCZxaQgjQuTcwkx2ucewidflswhahv2Fm8OEAmJnAkJNHawvqg8
         z+RZ/65e3fHlZMGeVuQQcQofDcPjgdCSJlfQ4yhTKrS0gTbWQ6eRrflh2lZRi6cZ+Dl+
         L2B9zyx12zNy+OiqsuWsVD5oUpanbpBxlMVF2NzXaJ8sAJi4O9Rm3qtemj+v8zITtFEW
         1+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969775; x=1717574575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNn4brV8l1cKgDS0zwRf7wcdauWIB3ooZqqAlvwD7I=;
        b=FtTKrjr9Rdmxbd095IIBsjcY/RO0gIuugjTYi02t4n9G6FcBthbZAU3fJu3tDdu5mj
         7PUT8kOqP5VnYnDqOna6+Gr1zVsvc4Z+XOOvrX28/4WneWenB39LXHmYD/sbTi8cVDzQ
         2YpnROjCFgn6g+kvz0BWhettJzbw8Aui0PJPfc2k7IhyoJM7IEvfWm0J/aa5cRspnEGW
         pC8bLDNo0pRubavmoeHq49CnuTqZUTXfjcIovmr8r83ZGVg5s6Rhy4UPekhbz15WjIyj
         uKAGqxD63YxuhDbuUTYLy+X/ZkXGJWKD6PzRJnERqfLBDxMYVSh+eT5gaUrqxiVAbwvt
         SXlg==
X-Forwarded-Encrypted: i=1; AJvYcCW+850RJt82AWVY0oFLITpjp5g0MQBP48kAPHXWUktBXj2zyTX3IUhvpET4BXR/T714rrFH3tWeCPBLPFCCK6Rrq0dX3E4oeojv9QX91w==
X-Gm-Message-State: AOJu0YwZddYwUa5wrJtbvU9pfLdeplX8WgafTH2LIPGPIE6Sirb3Wjj8
	ePI9pxoWRargzTbOECU8xrGDetLyTGiAPSt09Cj/Xy3fUvyVta1VRjbaZ5grzlc=
X-Google-Smtp-Source: AGHT+IGHtnpYsPo68r8KO+o5cak6O4GpcpzRjyYOkzKRLlpb/rBAfxulIRtpV3zXqfuo4S13urHc6g==
X-Received: by 2002:a5d:6042:0:b0:354:f371:de64 with SMTP id ffacd0b85a97d-35526c5a10emr10971727f8f.31.1716969774592;
        Wed, 29 May 2024 01:02:54 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c93c6sm14009154f8f.85.2024.05.29.01.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:02:54 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 10:02:52 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 08/16] powerpc/8xx: Rework support for 8M pages
 using contiguous PTE entries
Message-ID: <ZlbhLJF5w59BQIoK@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <c592d725af6c1a3b81090fd8b25676612430b24d.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c592d725af6c1a3b81090fd8b25676612430b24d.1716815901.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2024 at 03:30:06PM +0200, Christophe Leroy wrote:
> In order to fit better with standard Linux page tables layout, add
> support for 8M pages using contiguous PTE entries in a standard
> page table. Page tables will then be populated with 1024 similar
> entries and two PMD entries will point to that page table.
> 
> The PMD entries also get a flag to tell it is addressing an 8M page,
> this is required for the HW tablewalk assistance.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> ---
...  
> +#define __HAVE_ARCH_HUGE_PTEP_GET
> +static inline pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
> +{
> +	if (ptep_is_8m_pmdp(mm, addr, ptep))
> +		ptep = pte_offset_kernel((pmd_t *)ptep, 0);

Yes, you are right that this should have had the addr aligned down.

I can speak for others, but for me it is more clear to think of it this way:

1) check if ptep points to the first PMD entry for address
2) if it does, we know that the PMD describes a 8MB hugepage
3) return the PMD

That is why I thought that directly calling pmd_page_vaddr() gave a more clear
overview.

Now, feel free to ignore this if you think this is not clear or adds confusion,
I just wanted to give my insight reflecting on what I considered more
logical.


-- 
Oscar Salvador
SUSE Labs
