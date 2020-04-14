Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E755B1A79A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:35:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491k1Q0NJHzDqd0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 21:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VRrPqiVD; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491jzV5YDRzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:33:26 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d24so4541975pll.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KZ+sHNUWTGOOngDZlWZuibRHv6pBV5xa/Uz2LHhglIw=;
 b=VRrPqiVD/QCxdjEBbskkY+yCiShEK6wsEIXtHjLXfpvij1ltRLBYW8NzIJJmPGw7Jl
 7O9rXprSSg2KypN2/n22gPbfrV2ko9yTd5ZQA5X2LQDSyGFUWQu8QBnphH70gUe+/FRK
 5/ysYWz68GwkQi8JYoDLAb1lhU/6pBp5yLlGMV7SiRr2jMJHGt/nW+uAjgiUYV7ycto8
 eFxubCIicj7SXfgr/8LiQbyXdkpfNE6H1TDEa73cP7OLaDzRMX9MMI1VYP3Q3GlNdo69
 gNWUpXzn33RucYnWizv9TVCwAa7EJYfdk5B6bGls6Fic9fwDW2teTKTU4yxceD2TRnfL
 dySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KZ+sHNUWTGOOngDZlWZuibRHv6pBV5xa/Uz2LHhglIw=;
 b=WWpS9jAYdD0wHdZL/M2qXCntul5erK+BoEilf+KikeOHjZ5qtyAhI3nCp1eIJtVjR6
 nXHkLXXiyeqUwNL7zGY8L4XcTZ+ybJQiqhZBwCxU5J8Vn2em2c5gARDuHT2lYFQ2xCOR
 VwGElUZzMsomU9YgYqn8uKgM0VPLikylyNFkpMWmOC3v1hhnxFpVJMVQ57AKshjoNHqf
 f/4OWtlREJ59XJEGkcIs5Ug2JXEG/DEgaxx5j++SPCUW76nX2hIV2PcRV7MohW8YVwiq
 bSiduaCIYAZNUWxM4856jikNdNIBYFtGd0DT2/9L4IcOVzBLOAttIOXXgPmxXy3CdHEU
 I00A==
X-Gm-Message-State: AGi0PubjiioyG2b/7Z1llNoX6S56Fp4S8mSltvGvF06RAn+s7okzA/q/
 1T4tDvzhOR+t/k1l1r6FI8c=
X-Google-Smtp-Source: APiQypIcyr6/I0Kkbv3wlFcU4/Xr/0wS9p1hSr/PXKwlPWpCeFL0ysIODdUC3n5T/abK9CdK/6LdFA==
X-Received: by 2002:a17:902:6a88:: with SMTP id
 n8mr21744267plk.292.1586864004572; 
 Tue, 14 Apr 2020 04:33:24 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id w2sm11023334pff.195.2020.04.14.04.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 04:33:23 -0700 (PDT)
Date: Tue, 14 Apr 2020 21:31:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/4] mm/vmalloc: fix vmalloc_to_page for huge vmap
 mappings
To: Matthew Wilcox <willy@infradead.org>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <20200413125303.423864-2-npiggin@gmail.com>
 <20200413133444.GM21484@bombadil.infradead.org>
In-Reply-To: <20200413133444.GM21484@bombadil.infradead.org>
MIME-Version: 1.0
Message-Id: <1586863573.ufpx8o7f0i.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Matthew Wilcox's message of April 13, 2020 11:34 pm:
> On Mon, Apr 13, 2020 at 10:53:00PM +1000, Nicholas Piggin wrote:
>> vmalloc_to_page returns NULL for addresses mapped by larger pages[*].
>> Whether or not a vmap is huge depends on the architecture details,
>> alignments, boot options, etc., which the caller can not be expected
>> to know. Therefore HUGE_VMAP is a regression for vmalloc_to_page.
>>=20
>> This change teaches vmalloc_to_page about larger pages, and returns
>> the struct page that corresponds to the offset within the large page.
>> This makes the API agnostic to mapping implementation details.
>=20
> I'm trying to get us away from returning tail pages from various
> functions.  How much of a pain would it be to return the head page
> instead of the tail page?

Well, this is a fix for the interface for HUGE_VMAP stuff so it
doesn't really make sense to change the implementation here. If you
want to change or make a different API that would be a later patch, no?

> Obviously the implementation gets simpler,
> but can the callers cope?  I've been focusing on the page cache, so I
> haven't been looking at the vmalloc side of things at all.

Well callers that operate on ioremap today (and vmalloc tomorrow) won't
cope, because they're expecting a base page. If you wanted to change it
I suspect the way to go would be introduce a new function and move
everyone over individually.

Thanks,
Nick
