Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E15C780
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 04:57:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45d8644XrjzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 12:57:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OQloBSmL"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45d84R43h8zDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 12:55:35 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id e5so8310847pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 19:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=yh72SMFSBekrHMHAzJEsEH43qcxL2exqJGEt88fMstM=;
 b=OQloBSmLK7yZ68Nmhh3ZNo6BLX04mI8FD6n8AeTw37MNwj0uMNbWidDAheX5FJ/Znt
 FRzI3+hb/f6xTgs8hr0qR9TZ9OHETLisz4gXDouc1TOgihYQlbeV4GUgK1BwxOdpvGMc
 hGQj+HGKUJUHtHB1LSlUfu6YD9ajCK+Jq5Giva1slXFpNcXTmhPFtFKvyolKV+VnvwCs
 +mcnr4ORNAQD3T8DPa0Izny+94iWrnftJZ5i+foB8mwBago8ICdTU4o6YjGfQgtq2Gjs
 0fIyhWwDKZdJk7d3KDG2qYX7D/1tuC7vaBUyAchhzuMG+JtMHLXqu3nFv+R8NsJW09zS
 9omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=yh72SMFSBekrHMHAzJEsEH43qcxL2exqJGEt88fMstM=;
 b=AtOxJAC6p9LITv78oEn9mcBowFdHZQX0sXu5M+y9t+MM218YinsuRpakMs9ofRyVX8
 LizzFpmPiiRy96mFXyKVzjcfvPQYAgaQhA7XWTVycCBtgrUtYn6EO/LKesQoTwPwtlel
 +h0B6MMyf73FNJ7Nrcxsoyb0uRjCnN9lGDCVcNcHC8IpFT6uvIXe1ntaDB0DbhhYcywL
 YBfYBwVnx5QC9N4nYEUrHzAqw07n+iLB1MKquN4L0rBBQd8QVLJYSeHzFabLHrFN4PZG
 9whRKF0uFYNS+Ru/PDWgHVzYzHZ83i2YWBYHNlPR+2GrmrOG5eQ8J6Brhd+y2lT0dF7a
 gfGw==
X-Gm-Message-State: APjAAAX/h4kiFD47EDW0ys9RXQ/4cCp2WcO6sjECpJM42Ln0ZD40sBb0
 RIq0pK06U+jCxt9GkvoJWK0=
X-Google-Smtp-Source: APXvYqx4btuHxQBeOFukhSzSKKwHsk18ZBVKxKzevK0qIIRUp7DmMiBws+GtDKL9X7ZhzyJrivZoIg==
X-Received: by 2002:a17:902:f204:: with SMTP id
 gn4mr32852271plb.3.1562036132165; 
 Mon, 01 Jul 2019 19:55:32 -0700 (PDT)
Received: from localhost ([175.45.73.101])
 by smtp.gmail.com with ESMTPSA id cq4sm769147pjb.23.2019.07.01.19.55.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 19:55:31 -0700 (PDT)
Date: Tue, 02 Jul 2019 12:55:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: mm: Add p?d_large() definitions
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>, Steven Price
 <steven.price@arm.com>
References: <20190701064026.970-1-npiggin@gmail.com>
 <20190701064026.970-2-npiggin@gmail.com>
 <0a3e0833-908d-b7eb-e6e7-6413b2e37094@arm.com>
In-Reply-To: <0a3e0833-908d-b7eb-e6e7-6413b2e37094@arm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562035876.apiyxfrmrw.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel @ lists . infradead . org"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Price's on July 1, 2019 7:57 pm:
> On 01/07/2019 07:40, Nicholas Piggin wrote:
>> walk_page_range() is going to be allowed to walk page tables other than
>> those of user space. For this it needs to know when it has reached a
>> 'leaf' entry in the page tables. This information will be provided by th=
e
>> p?d_large() functions/macros.
>>=20
>> For arm64, we already have p?d_sect() macros which we can reuse for
>> p?d_large().
>>=20
>> pud_sect() is defined as a dummy function when CONFIG_PGTABLE_LEVELS < 3
>> or CONFIG_ARM64_64K_PAGES is defined. However when the kernel is
>> configured this way then architecturally it isn't allowed to have a
>> large page that this level, and any code using these page walking macros
>> is implicitly relying on the page size/number of levels being the same a=
s
>> the kernel. So it is safe to reuse this for p?d_large() as it is an
>> architectural restriction.
>>=20
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will.deacon@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>=20
> Hi Nicolas,
>=20
> This appears to my patch which I originally posted as part of converting
> x86/arm64 to use a generic page walk code[1].

Hey, yeah it is, I'd intended to mark you as the author but must have
forgot to change it in git.

> I'm not sure that this
> patch makes much sense on its own, in particular it was working up to
> having a generic macro[2] which means the _large() macros could be used
> across all architectures.

It goes with this series which makes _large macros usable for archs
that define HUGE_VMAP. I posted the same thing earlier and Anshuman
noted you'd done it too so I deferred to yours (I thought it would
go via arm64 tree and that this would just allow Andrew to easily
reconcile the merge).

If your series is not going upstream this time then the changelog
probably doesn't make so much sense, so I could just send my version
to the arm64 tree.

Thanks,
Nick

=
