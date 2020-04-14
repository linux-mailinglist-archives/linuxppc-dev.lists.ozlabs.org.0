Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF51A79D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:43:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491kBs3qpSzDqDY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 21:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ocqZqq6s; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491k8z1WBLzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:41:38 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id cl8so3959639pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8Esq4uJjc7hCqZPSyfuH3UXfV8N/MZeW3NHhinZ8EQA=;
 b=ocqZqq6sP10NyE5Oqrsyu24BO4bUv9d+CybYLvjUEA0qRTbQq8IAo2pJTWQfIqu4RO
 sPTYsA+WN55nEjfpiAKwJ3efgvE0y02zIRGr4QJLeGvUEOTkWEwmF8lPwgWo+rxrPEs5
 VDTf42M1YbD+ARAsRZhdeD47bvnZpwfdPk63IxzHlEP4FOS+xZOTFLokGOmvq6qCsYSC
 9tfWtMbUwXgESksl6KkJnUtYDYhwxUwpcnrbpFt8xAH3B/hJvFo4WpPegEXCjs4dhUzZ
 W26SU5gqovyT9qgqJ6qWu6cT8BV0oBUpmf+pSVOyif6EAbW821Qd95yr49cfUdak8sxQ
 mhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8Esq4uJjc7hCqZPSyfuH3UXfV8N/MZeW3NHhinZ8EQA=;
 b=GZPd7SDL6Vh/7U7DYiq3K2swMMoSKKnZL9nrl3lmoEzh9koTuPvfvif3XGXDHfiWJT
 kSi6aLl5oNxGygyQaZdDHH14lJWGz60VhrA9i0IQgtFaA3MHFfrvLrGS5p0vTR5H4jSi
 +be5OlsCVhTY5mM6jqIrTfYrF1kqXuRmdw4HYPXs8Ri5nKg/p4FYxLNCa6u/BI1zfKvU
 NPr0FtnlwUbINXbkBeLdqwb1HSSwxQtOC6WdC3E+BXGnaH6ocMOaxEnHFAzYd1BAI+U2
 lHiISVPlVJXjRmq0nAjxLljFg1AnGuO+BJRAEBuOJqqOKxO92aWBhhbjFbzyVVMeJWHM
 Z2eg==
X-Gm-Message-State: AGi0PuYXTrExqjc7oaC60TPF4PQ+1cESHxONh6+Nr8B5okb5U3wAWOpF
 jC+ei/OGA+ODfYcJuukosqM=
X-Google-Smtp-Source: APiQypLIBjtk6RQd/AotCq9xnqN6ML09PMuOg/nS9Dm4xLrHmr38av9P0xvvmudk1+K5veWBSwJi4w==
X-Received: by 2002:a17:90a:2281:: with SMTP id
 s1mr27766299pjc.68.1586864495571; 
 Tue, 14 Apr 2020 04:41:35 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id 132sm11155833pfc.183.2020.04.14.04.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 04:41:35 -0700 (PDT)
Date: Tue, 14 Apr 2020 21:39:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Matthew Wilcox <willy@infradead.org>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <20200413125303.423864-5-npiggin@gmail.com>
 <20200413134106.GN21484@bombadil.infradead.org>
In-Reply-To: <20200413134106.GN21484@bombadil.infradead.org>
MIME-Version: 1.0
Message-Id: <1586863931.xb4yeowkao.astroid@bobo.none>
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

Excerpts from Matthew Wilcox's message of April 13, 2020 11:41 pm:
> On Mon, Apr 13, 2020 at 10:53:03PM +1000, Nicholas Piggin wrote:
>> +static int vmap_pages_range_noflush(unsigned long start, unsigned long =
end,
>> +				    pgprot_t prot, struct page **pages,
>> +				    unsigned int page_shift)
>> +{
>> +	if (page_shift =3D=3D PAGE_SIZE) {
>=20
> ... I think you meant 'page_shift =3D=3D PAGE_SHIFT'

Thanks, good catch. I obviously didn't test the fallback path (the
other path works for small pages, it just goes one at a time).

> Overall I like this series, although it's a bit biased towards CPUs
> which have page sizes which match PMD/PUD sizes.  It doesn't offer the
> possibility of using 64kB page sizes on ARM, for example.

No, it's just an incremental step on existing huge vmap stuff in
tree, so such a thing would be out of scope.

> But it's a
> step in the right direction.
>=20

I don't know about moving kernel maps away from a generic Linux page
table format. I quite like moving to it and making it as generic as
possible.

On the other hand, I also would like to make some arch-specific
allowances for certain special cases that may not fit within the
standard page table format, but it might be a much more specific and
limited interface than the general vmalloc stuff.

Thanks,
Nick
