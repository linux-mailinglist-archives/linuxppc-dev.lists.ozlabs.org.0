Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAED45EBFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:56:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0s9V3TpCz3cPv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 21:55:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A+nPgsq6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A+nPgsq6; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0s8m2wT2z30Bm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 21:55:17 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id q17so6432775plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 02:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=/+3K8pSROXYDMK1l00CaCgD5ieiFBfDt9BeFjZv0RYI=;
 b=A+nPgsq6WPS6Q24T951EpxMhIxv7vYMkQ9HkRTHNNeBCJ79+oJCrA9Z7dqGadoIKHR
 EAimH6sHFmmoIL7w4GS2BaH6OVGP6v99Y1dNoegWDzAcutd+9105v2DdjQexITqRAUHh
 94mG6scGwlAtVD7Zh2izfc8neYoKKUM0Gzu+jfH1+K6M6Ak1RRpEa0eUfZA3GKoguKAd
 Fej2MtYHIlCLSw4H0DU+Y8B9y/pbUdbi7cthZgL+ruwroM7ZIq8Ia3aQvQbjrmMZBA5D
 hBIAO0wv4Vii6BUE29VR0GktaXHt3XbI5n4a69+DHpQN9Wse4Ty0yXDCMJtXacQVrjTl
 rIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/+3K8pSROXYDMK1l00CaCgD5ieiFBfDt9BeFjZv0RYI=;
 b=29JPBZ1G1eJrylnTpBhccj/rpL2FgCfHve7uScLA1HA/A3Hohvm8Oi9QbBsbF4lMiU
 yo/vVTsGAa68gB9ZqIp5lUZlWaS+itzQSTP3Kk4H6dSh+iCpvGQboa5g6CBYCq/f9xn1
 3590AO71NfNXFZlOhYt95ViIJd3yRBWLOxMtdPM++OGPS8YogaNy3BRv7znC6jRdJg52
 C3NLuCooM4zr+m4S5ne6bkFtTfMYco6Zt7dTLxSfTxcZrLzM+yiDd1a8ZLpKRqOYhFp6
 7YVIfZ8NWvUN5S6oZnwlcqTsceBXvBQT4P5J+xSQxgyFFLIlt7YHxIIXyiaNm+/SFWJB
 IhhA==
X-Gm-Message-State: AOAM533cM8rXi4kQXXHp6SdXxrPiLAgQ52OAawprQl8/PM22Y4GCMVOq
 tkdCrB8JxS46FCc+i4FLB3tAO663dE0=
X-Google-Smtp-Source: ABdhPJzpNFZVxlaQY0NK6fgUczKzhGQGLXVpEUCmJongqGuzBSP2siQH9kKgz/FmXbmnkK1MMjXmWQ==
X-Received: by 2002:a17:90b:4f42:: with SMTP id
 pj2mr14777223pjb.7.1637924114064; 
 Fri, 26 Nov 2021 02:55:14 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id i198sm6433069pfe.81.2021.11.26.02.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 02:55:13 -0800 (PST)
Date: Fri, 26 Nov 2021 20:55:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/radix: Fix unmapping huge vmaps when
 CONFIG_HUGETLB_PAGE=n
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20211126022834.1622106-1-npiggin@gmail.com>
 <87tufzzbwh.fsf@linkitivity.dja.id.au>
In-Reply-To: <87tufzzbwh.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1637923590.e73r0616uz.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Daniel Axtens's message of November 26, 2021 4:09 pm:
> Hi,
>=20
>> pmd_huge is defined out to false when HUGETLB_PAGE is not configured,
>> but the vmap code still installs huge PMDs. This leads to errors
>> encountering bad PMDs when vunmapping because it is not seen as a
>> huge PTE, and the bad PMD check catches it. The end result may not
>> be much more serious than some bad pmd warning messages, because the
>> pmd_none_or_clear_bad() does what we wanted and clears the huge PTE
>> anyway.
>=20
> Huh. So vmap seems to key off arch_vmap_p?d_supported which checks for
> radix and HAVE_ARCH_HUGE_VMAP.
>=20
>> Fix this by checking pmd_is_leaf(), which checks for a PTE regardless
>> of config options. The whole huge/large/leaf stuff is a tangled mess
>> but that's kernel-wide and not something we can improve much in
>> arch/powerpc code.
>=20
> I guess I'm a bit late to the party here because p?d_is_leaf was added
> in 2019 in commit d6eacedd1f0e ("powerpc/book3s: Use config independent
> helpers for page table walk") but why wouldn't we just make pmd_huge()
> not config dependent?

I guess so it constant folds code if hugetlbfs is not configured=20
(and maybe so !huge kernels would correctly print a bad PMD warning if
they got huge PMD in user mappings).

>=20
> Also, looking at that commit, there are a few places that might still
> throw warnings, e.g. find_linux_pte, find_current_mm_pte, pud_page which
> seem like they might still throw warnings if they were to encounter a
> huge vmap page:
>=20
> struct page *pud_page(pud_t pud)
> {
> 	if (pud_is_leaf(pud)) {
> 		VM_WARN_ON(!pud_huge(pud));

Oh, hmm. That is used in vmalloc.c so maybe that warning should be
removed as a false positive. Good catch.

> Do these functions need special treatment for huge vmappings()?

find_linux_pte etc could be called for vmaps. I'm not sure I see a
problem in that function.

Thanks,
Nick

>=20
> Apart from those questions, the patch itself makes sense to me and I can
> follow how it would fix a problem.
>=20
> Reviewed-by: Daniel Axtens <dja@axtens.net>
>=20
> Kind regards,
> Daniel
>=20
