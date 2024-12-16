Return-Path: <linuxppc-dev+bounces-4211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF99F3AD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 21:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBs4x4BnDz2yhT;
	Tue, 17 Dec 2024 07:30:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734381009;
	cv=none; b=R5+UGJRncnjCQNh7xDv2dGU74+aCCHjUTtO+TQ95mBApmenja2FWdAQZZu5wpN0uQnz6k2slULGz1Sw+9LjOk30Tyha69I4S5wkQibQ4/LUnFGUtwZy75kuvdfqZNt8rzq1+QhNeM4U1R1d8WJrE8jDlAQj0VkLMlgkxGGFgo+t51xsXl9gERzzPRgQhkV+EpMF18arrmof5DhWEjH9930SYjIQ3zAVgETS2b0W00xp+pxYZaA7nri9Ng44aG2aW2JzzO5jC0KPkpVOxZrroMBkDmVIjZxs9L5q1E6Tb/fEj48SUCnC9JZzzIDqgsrS10BCvbKOQiGmir0JuxCMM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734381009; c=relaxed/relaxed;
	bh=WtaEiO3qy7uGmEHXhVxEW4P9qn9LSHpYgepEigjukpU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Parq/cSLjnNcWY6HQAO12DTRLMvpepJOLfRQbP5TzBea1iRm5gsMQkADVO74lH7yO8uaGprpu9lYtwbzezpuaPyAF8sOm/bnw+pVoE7xDt0jMxTJ4bzHOMPqU64vm7QGbzs7jH6qwGGI2OGEaqprnAa6PO5uNdxmdGLZI0lRwem21fJwgsHgbNwmFGqh6ghJe/Y0coqShfy49qTnwW3MAu0PvIwRDbrGjctU5jL3rFh8/x1+27JqoS6xSzWiEZJQfKTrw2c5jcsPQ0c43fRb6valZN9JwIjgDu1EXzdGCqK/Woktwmg9A+NI77C45FIgF/Dvj4H6nkYMY5rZopemOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BqxUNLaD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BqxUNLaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBs4v2Nv5z2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 07:30:05 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7273967f2f0so4802941b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 12:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734381003; x=1734985803; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WtaEiO3qy7uGmEHXhVxEW4P9qn9LSHpYgepEigjukpU=;
        b=BqxUNLaDfpjD3QefoWQLfzhc6dripEj6+YTcn6QNP6Epkf8G22SLwKLHb7NL6TY7AE
         ghJ13J3B6FcNu0BlqGn4X5sdyQvlaak9Bw9PzL0DHy7UnZxqkOWvewhEyGyrq6PB8eY+
         7HnmuCKKqnDMrZ9dyzbjZQz2n9AEkuBFO4O4n9GFv+J/EArBcTVEyyL36B8E9pB97jQS
         rFCLgxLtsZihiBV79HjN+W2RIIl2It0LiIUtAeZQfKFVqV9fB3o4rSKpX4m+Wcafs6o1
         0Il411j23OzPV5Ms/d+sWSAaCUWT2iGVgLiRfR5agJKeAhkLwzv9IqMAX0ctkW2MsEtV
         8OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734381003; x=1734985803;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtaEiO3qy7uGmEHXhVxEW4P9qn9LSHpYgepEigjukpU=;
        b=w/4WNEq9LkfL0K9p3hoO7HlATJ3dnsXaJTyrc+fjBD7djDwnQfiNCGyfqGp11FzG9V
         6k53bf2Rl7IZ7xOxC2uVW1q5pewU8NPpqPBNixVdrkvmRlQ2nHY0Vv/T77evuTwGUOVy
         xGcjz6lIaMACLF7zh5nOoeFGSTVoqAyqH5UV+CFjduorXoWP8CJxJsnDPvwZUW7Djpyu
         g92GDfBT9DxTOlgbTXVG0Vbm8ckanqLo8CWG2XKZ7T/ZCAaRKDc3egQmDcBzxIotrE4a
         9CF1pVvk/RZDynkBhOlKMNr91Dw3k2S/QiAdJ4ETshUL9xcqW5eV/Fd/oZi/sXKPy1V+
         jFzg==
X-Forwarded-Encrypted: i=1; AJvYcCUFRtY6czL1hOvwx/8TY5bVfNcKhPDIUwzJgcW/tw+uxTEFXpPDPAA7DtoTf+PjZqo0oq208BHG3449mu0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzi2u8WOKlKApsC1p8FoRuOV8PZn+CMA5eYgCqg652vwixPZOvQ
	i8SiWo4sg0t7M1AIZdgeHE6t2aNDX46b83epG592VLAtnOahnlUd
X-Gm-Gg: ASbGncthRyQyEUq99oeF69CgitiWlZsFksXmCqvfb28JacCiZeJ3vpcWywKzAU4UUAj
	EI/Hi33uQGyg2xPmRFfzPk4PAUcnpjzbfoi7qZRVgm/27GBZGMOSnwRQ8WIy+FSIb7B9RsaGSDd
	ypuh8vVIxXmgAwQ7xdF51LvA2DcQvLfHHL7WP0Ah4aBRtVslfZ8bLcr3UNPA5uwIoH2VUX3gl1X
	eRfjGNQevdaASmoiYp43OnFOAPBfNPCeihJtF8jKiaohARFIQ==
X-Google-Smtp-Source: AGHT+IF+aq8nK0o3WR6t9P9TTMQ9WSJGLRuk+8zUXADbdFywIA7+mwoShrNuR19lAUSYuAgPqceOag==
X-Received: by 2002:a05:6a20:244a:b0:1e1:b183:2243 with SMTP id adf61e73a8af0-1e1dfe23092mr21851517637.39.1734381003404;
        Mon, 16 Dec 2024 12:30:03 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b7896bsm5360642b3a.102.2024.12.16.12.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 12:30:02 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active
In-Reply-To: <20241202054310.928610-1-sourabhjain@linux.ibm.com>
Date: Tue, 17 Dec 2024 00:07:39 +0530
Message-ID: <87h6734gp8.fsf@gmail.com>
References: <20241202054310.928610-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Commit 8597538712eb ("powerpc/fadump: Do not use hugepages when fadump
> is active") disabled hugetlb support when fadump is active by returning
> early from hugetlbpage_init():arch/powerpc/mm/hugetlbpage.c and not
> populating hpage_shift/HPAGE_SHIFT.
>
> Later, commit 2354ad252b66 ("powerpc/mm: Update default hugetlb size
> early") moved the allocation of hpage_shift/HPAGE_SHIFT to early boot,
> which inadvertently re-enabled hugetlb support when fadump is active.
>
> Fix this by implementing hugepages_supported() on powerpc. This ensures
> that disabling hugetlb for the fadump kernel is independent of
> hpage_shift/HPAGE_SHIFT.
>

Thanks for describing the history of the changes clearly.

> Fixes: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
> CC: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> CC: Hari Bathini <hbathini@linux.ibm.com>
> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>
> Note: Even with this fix included, it is possible to enable gigantic
> pages in the fadump kernel. IIUC, gigantic pages were never disabled
> for the fadump kernel.
>
> Currently, gigantic pages are allocated during early boot as long as
> the respective hstate is supported by the architecture.
>
> I will introduce some changes in the generic hugetlb code to allow the
> architecture to decide on supporting gigantic pages on the go. Bringing
> gigantic page allocation under hugepages_supported() does work for
> powerpc but I need verify the impact on other architectures.
>
> Regarding the Fixes tag: This patch fixes a bug inadvertently introduced
> by the commit mentioned under Fixes tag in the commit message. Feel free
> to remove the tag if it is unnecessary.
>
> ---
>  arch/powerpc/include/asm/hugetlb.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
> index 18a3028ac3b6..f294e57663b0 100644
> --- a/arch/powerpc/include/asm/hugetlb.h
> +++ b/arch/powerpc/include/asm/hugetlb.h
> @@ -15,6 +15,15 @@
>  
>  extern bool hugetlb_disabled;
>  
> +static inline int hugepages_supported(void)
> +{
> +	if (hugetlb_disabled)
> +		return 0;
> +
> +	return HPAGE_SHIFT != 0;
> +}
> +#define hugepages_supported hugepages_supported
> +

In include/linux/hugetlb.h

#ifndef hugepages_supported
/*
 * Some platform decide whether they support huge pages at boot
 * time. Some of them, such as powerpc, set HPAGE_SHIFT to 0
 * when there is no such support
 */
#define hugepages_supported() (HPAGE_SHIFT != 0)
#endif

The above comment is not entirely correct after this change 2354ad252b66
("powerpc/mm: Update default hugetlb size early), because we anyway go
ahead and initialize HPAGE_SHIFT even when hugetlb_disabled is true. But
nevertheless - we can fix the comment later. I see there are few other
cleanups which could be clubbed too.

fadump when the capture kernel is active would like to disable hugetlb page
allocation (to avoid OOMs) hence it uses hugetlb_disabled flag to mark
it disabled. As you correctly pointed out, the change in question moved
initialization of HPAGE_SHIFT to early boot as it was required to set the
pageblock_order properly (especially for radix 2M huge pagesize).

Now earlier generic hugepages_supported() was only checking for
HPAGE_SHIFT != 0. This patch will now check for both, hugetlb_disabled
should be false and HPAGE_SHIFT should not be 0. Only then hugetlb will
go and allocate hugepages in hugetlb_init().  


So, the change looks good to me. Thanks for catching and fixing that. 
I hope we can add a testcase to cover this scenario as the problematic
patch was added long ago - but we only noticed the problem now. Quick
qn, was this caught due to any OOM? Or was it an observation?


The patch looks good to me. So please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

