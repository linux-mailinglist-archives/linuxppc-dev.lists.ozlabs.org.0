Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ECD45E7B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 07:09:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0kqG0HLvz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 17:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=eL6X1m0g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=eL6X1m0g; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0kpZ4VcSz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 17:09:08 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id g19so7874568pfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 22:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Hs9a+ZiTlZA6Gkk3kiV2RW3d8HLh7Xt0cL7JLFGKFoQ=;
 b=eL6X1m0g4MqluMR/4GorsaGi4MCWJPQF/hsCtZamhdCj6D+JX1KnphLTzrCOHaGv0i
 JmZ6uyp2MiVJ9V7EPweG403t+NiHHe35jULoZDFbG8//JzUuWJGA/Ata335fbG/2oDbZ
 xyY/oNWBMRmpzxjM5076VGbzSSXhPn/R3Lmic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Hs9a+ZiTlZA6Gkk3kiV2RW3d8HLh7Xt0cL7JLFGKFoQ=;
 b=l1M+bEWE/uC99XfFQL9zCVmb2bpzsmsa9lPu0LhKJ40u3JQlbOcD3Y3YnMnQSjmE3P
 JtfBSMvkDO6srATr3A+AJiQQ3/zBxlO39nwckf7MAU4Mgp++8cSsoQh09RMt0wBiljxf
 mHsiOFoTk4zu5+I2+s2OLvVcdLZfdNQAnqvcNLqOOa7JXdCzf16JXjr4hEuyBDGusoMx
 pPFx18/G0PJEt2rnBkgnEySkJiF3TgdADa4J0O3LQnVZLvFLEIbs8x64sx+TXkgun4JO
 a9yYKNrVlS2aLvWenf0fX0lQc8VzwbCj8CnaIJSTvT/FbYMdV4mIIztoCgf8A/7elXST
 C21w==
X-Gm-Message-State: AOAM5301bEcygKGHHi8whQJxOQefDKXXDMEguNjl+OCnX891jpWcGy+D
 yqiFBEkyWd9xXFD8oJt2A81H3A==
X-Google-Smtp-Source: ABdhPJyUKHRkZqs8VKAWxJq+jiC4v7DguZ5wDjuNE00RzxpnI6G5oZ7P5P6TOaGjcK0masGpZW+0xg==
X-Received: by 2002:a05:6a00:21c8:b0:4a8:125:de32 with SMTP id
 t8-20020a056a0021c800b004a80125de32mr4760964pfj.49.1637906945672; 
 Thu, 25 Nov 2021 22:09:05 -0800 (PST)
Received: from localhost ([2001:4479:e000:e400:90aa:d61c:4f97:c608])
 by smtp.gmail.com with ESMTPSA id f15sm6104415pfe.171.2021.11.25.22.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 22:09:05 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s/radix: Fix unmapping huge vmaps when
 CONFIG_HUGETLB_PAGE=n
In-Reply-To: <20211126022834.1622106-1-npiggin@gmail.com>
References: <20211126022834.1622106-1-npiggin@gmail.com>
Date: Fri, 26 Nov 2021 17:09:02 +1100
Message-ID: <87tufzzbwh.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> pmd_huge is defined out to false when HUGETLB_PAGE is not configured,
> but the vmap code still installs huge PMDs. This leads to errors
> encountering bad PMDs when vunmapping because it is not seen as a
> huge PTE, and the bad PMD check catches it. The end result may not
> be much more serious than some bad pmd warning messages, because the
> pmd_none_or_clear_bad() does what we wanted and clears the huge PTE
> anyway.

Huh. So vmap seems to key off arch_vmap_p?d_supported which checks for
radix and HAVE_ARCH_HUGE_VMAP.

> Fix this by checking pmd_is_leaf(), which checks for a PTE regardless
> of config options. The whole huge/large/leaf stuff is a tangled mess
> but that's kernel-wide and not something we can improve much in
> arch/powerpc code.

I guess I'm a bit late to the party here because p?d_is_leaf was added
in 2019 in commit d6eacedd1f0e ("powerpc/book3s: Use config independent
helpers for page table walk") but why wouldn't we just make pmd_huge()
not config dependent?

Also, looking at that commit, there are a few places that might still
throw warnings, e.g. find_linux_pte, find_current_mm_pte, pud_page which
seem like they might still throw warnings if they were to encounter a
huge vmap page:

struct page *pud_page(pud_t pud)
{
	if (pud_is_leaf(pud)) {
		VM_WARN_ON(!pud_huge(pud));

Do these functions need special treatment for huge vmappings()?

Apart from those questions, the patch itself makes sense to me and I can
follow how it would fix a problem.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
