Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB17D6F96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 08:29:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sls91XPGzDqrM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 17:29:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="BrUhn4gp"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46slqC0QrJzDqnp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 17:28:05 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q5so11760414pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 23:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=NXE3NjexAQXsjlqVk+3nF0FjJ7hypONs1Weo4aM4img=;
 b=BrUhn4gpvpU5Z1D3BIYiGb5+BX15AlS0UBGrN2TfSOqnRdqvz5ESw5SxNRYtS6rfNu
 yEEKByqH3yonfpP8XawOOPCfeNQSFnK5jX/7PnK2qG0KaOjg7QKYKECvhz/2DsUi6qL3
 idKHz9QtT8s/JH4+qA0A7Xc0ogpK60OJ9OHFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=NXE3NjexAQXsjlqVk+3nF0FjJ7hypONs1Weo4aM4img=;
 b=XqDv2dSwuMV1b+m/ffiviXHqn/7nbDQ3xK3Urbdfng6IkGR6ftB9EqlrW+MCOdxky3
 cPM75sGNi8qbDkU+sNiI/TflOPw1EJTLzqzwb5Vons/Zst7gG1VaC2v3uwn/AqL434Pw
 nbFTHy20dTcsQC8+Rmt1oEMKP7IIAl33rzYloE3qqYL27acyUXahDDJLMAbCs28YsJQj
 qTLc2Bpg7USBwLTZ4NCFDraBXArLqptjV4BFwEwNeW507IdYeZgvs8I7RRYyRm6R7sxL
 z0VLD6M2t0z0/fQafW87+sxiDyl0J+VsL512H5AaY0eVjgeHx8/ucF5qtmmGWnkB1rUS
 jyHA==
X-Gm-Message-State: APjAAAXDk6wc6HewtxVdimZKKlIxuhAnajB4eRrBJidxbgg7s8dLunx3
 yxCfl1G4AXLi2TFHG3abGHWfMg==
X-Google-Smtp-Source: APXvYqx2YnPD7idhykG7qGhqI/5d0pFVNgvu+VZ7HdsMybk4ZNBm9CymFRlu6abFrzqOPws1e0wZyg==
X-Received: by 2002:a17:90a:6302:: with SMTP id
 e2mr39528114pjj.20.1571120881762; 
 Mon, 14 Oct 2019 23:28:01 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id q76sm44206995pfc.86.2019.10.14.23.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 23:28:00 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <20191014154359.GC20438@lakrids.cambridge.arm.com>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <20191014154359.GC20438@lakrids.cambridge.arm.com>
Date: Tue, 15 Oct 2019 17:27:57 +1100
Message-ID: <87a7a2ttea.fsf@dja-thinkpad.axtens.net>
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, aryabinin@virtuozzo.com, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark Rutland <mark.rutland@arm.com> writes:

> On Tue, Oct 01, 2019 at 04:58:30PM +1000, Daniel Axtens wrote:
>> Hook into vmalloc and vmap, and dynamically allocate real shadow
>> memory to back the mappings.
>> 
>> Most mappings in vmalloc space are small, requiring less than a full
>> page of shadow space. Allocating a full shadow page per mapping would
>> therefore be wasteful. Furthermore, to ensure that different mappings
>> use different shadow pages, mappings would have to be aligned to
>> KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE.
>> 
>> Instead, share backing space across multiple mappings. Allocate a
>> backing page when a mapping in vmalloc space uses a particular page of
>> the shadow region. This page can be shared by other vmalloc mappings
>> later on.
>> 
>> We hook in to the vmap infrastructure to lazily clean up unused shadow
>> memory.
>> 
>> To avoid the difficulties around swapping mappings around, this code
>> expects that the part of the shadow region that covers the vmalloc
>> space will not be covered by the early shadow page, but will be left
>> unmapped. This will require changes in arch-specific code.
>> 
>> This allows KASAN with VMAP_STACK, and may be helpful for architectures
>> that do not have a separate module space (e.g. powerpc64, which I am
>> currently working on). It also allows relaxing the module alignment
>> back to PAGE_SIZE.
>> 
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=202009
>> Acked-by: Vasily Gorbik <gor@linux.ibm.com>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>> [Mark: rework shadow allocation]
>> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
>
> Sorry to point this out so late, but your S-o-B should come last in the
> chain per Documentation/process/submitting-patches.rst. Judging by the
> rest of that, I think you want something like:
>
> Co-developed-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com> [shadow rework]
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> ... leaving yourself as the Author in the headers.

no worries, I wasn't really sure how best to arrange them, so thanks for
clarifying!

>
> Sorry to have made that more complicated!
>
> [...]
>
>> +static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>> +					void *unused)
>> +{
>> +	unsigned long page;
>> +
>> +	page = (unsigned long)__va(pte_pfn(*ptep) << PAGE_SHIFT);
>> +
>> +	spin_lock(&init_mm.page_table_lock);
>> +
>> +	if (likely(!pte_none(*ptep))) {
>> +		pte_clear(&init_mm, addr, ptep);
>> +		free_page(page);
>> +	}
>
> There should be TLB maintenance between clearing the PTE and freeing the
> page here.

Fixed for v9.

Regards,
Daniel

>
> Thanks,
> Mark.
