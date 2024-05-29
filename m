Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 3E80A8D349E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:31:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IESCZqYR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq58Z24DWz88bx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:24:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IESCZqYR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq57q0Bhsz889f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:23:34 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52ae38957e8so567170e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 03:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716978205; x=1717583005; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cv/PfQ3ipIos9jd7Od+Go1+GxK7Z1oC1HCEzh3CcJkw=;
        b=IESCZqYRGOsNQaxZa1EG+9EfbXEqjzez09R0r7Qc+lWf9ALg9o251qQePu3R6vHuGn
         wEj7kri2eYkmYVlGC/SC6VnsUxmAmuHnl3RmE+FYyIrnDNnPT7laCORcx38JV+aXyuOz
         DVzKpZWzGfE3uyG3T5K02SDrx07luLVqMsTzTFOvki6JikKm1Req1eoaGIlSp2QkS2I8
         kq3QdStl/54K5jTfT02BCUPoM3tmHlw8glH+DMRYSN+hJH/5H/C6KgJ6Ch5Wwbr61feP
         aEVv0F/YdctCfeptimok0x8/8z90V5w1rIL9ZAniGIvXPT9orMQ+Ypw8TI7LgKuGTn+y
         fjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716978205; x=1717583005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv/PfQ3ipIos9jd7Od+Go1+GxK7Z1oC1HCEzh3CcJkw=;
        b=fyg2bHIrZNiVFPUEOgKTp5cHwuILKMsNf/NmkJaHh7woGsWAF+HrFRPFwD+k3tVsJZ
         ZMK1d0NtvtS0pfoaEwtvaz512bTbr30lWcAD3XZeg+CbusYbyNDlImsEUBkrbsKQZYMI
         v5YyaWadEmZQy2k5YcQqvi3grpGAXoukvU5Aix/zmHYS6kd0yciBPe9i+xqfL37SeYgv
         sfQLm9lhZLYsU/e600dhVmynT7nP9XkNC9GZsRmcQ6QTfOTqZNxi6av/fyLTUDUJNDam
         g4H7N2HKLIB6h+3ZsNfOoVN1vyAdtk9Ha71K3ZVcnp9ATzPdynzyZoMvHCBEH6A0Rp6F
         cKQw==
X-Forwarded-Encrypted: i=1; AJvYcCUhiGmWKWnNo81KJQbUKLWqJuYcwQGNzAuui7nWuIWKQzAx9pfbzPmSZ6iIdXPw+g8JaEFn1uS0R4cmXiy4Ee7IrkmR3gMuampMXPciXQ==
X-Gm-Message-State: AOJu0YzJFfam7t9rpFKJYOzUzCSZbacj0r9+GpGaxEYkCRtSi9lsMRhX
	8ExMGs/QqRMLIgNlx01mlXKtBL220fSJQ3QoT1HkKgo69gz9jc/LdqAZNPxuxWw=
X-Google-Smtp-Source: AGHT+IF7IgN4nPJ8uxsJPr2FPONLdRAirmEdNuIVjpikXZwr3Zpn2fZcBlzyhSXu1nTASxB+UaNCCw==
X-Received: by 2002:a19:7717:0:b0:51d:8ff3:d156 with SMTP id 2adb3069b0e04-529645e3335mr8922884e87.19.1716978205294;
        Wed, 29 May 2024 03:23:25 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f759f0sm201856835e9.28.2024.05.29.03.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:23:25 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 12:23:23 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 00/16] Reimplement huge pages without hugepd on
 powerpc (8xx, e500, book3s/64)
Message-ID: <ZlcCG8DZk6CnMPzQ@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1716815901.git.christophe.leroy@csgroup.eu>
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

On Mon, May 27, 2024 at 03:29:58PM +0200, Christophe Leroy wrote:
> This is the continuation of the RFC v1 series "Reimplement huge pages
> without hugepd on powerpc 8xx". It now get rid of hugepd completely
> after handling also e500 and book3s/64
> 
> Also see https://github.com/linuxppc/issues/issues/483
> 
> Unlike most architectures, powerpc 8xx HW requires a two-level
> pagetable topology for all page sizes. So a leaf PMD-contig approach
> is not feasible as such.
> 
> Possible sizes on 8xx are 4k, 16k, 512k and 8M.
> 
> First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD entries
> must point to a single entry level-2 page table. Until now that was
> done using hugepd. This series changes it to use standard page tables
> where the entry is replicated 1024 times on each of the two pagetables
> refered by the two associated PMD entries for that 8M page.
> 
> For e500 and book3s/64 there are less constraints because it is not
> tied to the HW assisted tablewalk like on 8xx, so it is easier to use
> leaf PMDs (and PUDs).
> 
> On e500 the supported page sizes are 4M, 16M, 64M, 256M and 1G. All at
> PMD level on e500/32 (mpc85xx) and mix of PMD and PUD for e500/64. We
> encode page size with 4 available bits in PTE entries. On e300/32 PGD
> entries size is increases to 64 bits in order to allow leaf-PMD entries
> because PTE are 64 bits on e500.
> 
> On book3s/64 only the hash-4k mode is concerned. It supports 16M pages
> as cont-PMD and 16G pages as cont-PUD. In other modes (radix-4k, radix-6k
> and hash-64k) the sizes match with PMD and PUD sizes so that's just leaf
> entries. The hash processing make things a bit more complex. To ease
> things, __hash_page_huge() is modified to bail out when DIRTY or ACCESSED
> bits are missing, leaving it to mm core to fix it.

Ok, I managed to go through the series and provide some feedback.
Sorry you had to bear some dumb questions but I am used to x86 realm where
things are farily easier wrt. hugepage sizes.

I will over v5 when you send it, but I think this would benefit from another
pair of eyes (with more powerpc knowledge than me) having a look.

Anyway, I think this is a great step in the right direction, and definitely
a big help for the upcoming tasks.

I plan to start working on the walk_page API to get rid of hugetlb
specific hooks basing it on this patchset.

Thanks a lot for this work Christophe


-- 
Oscar Salvador
SUSE Labs
