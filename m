Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3C8C17B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:39:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n1/ZEkf3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb3mB0Mjtz3cYx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 06:39:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n1/ZEkf3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--axelrasmussen.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bzq9zg0kdayg3krxgys0yyktmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--axelrasmussen.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb3lT1xPYz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 06:39:15 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61be452c62bso18760797b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715287152; x=1715891952; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8H0foUzLc+DNKUibRdC2bbcsFy9WZnKfOBJjcXN9vjM=;
        b=n1/ZEkf3RHii+FGrmzo7cA44tjpkGsVf68JbSmeYcIWbuqhT5OYkoNat8CqbMdcegI
         P0Oa5h4JHBk9/lrpi5ZMvCrB40B0q9K3jSXm160SKVBH+9JqX5en8mdzmJziOZLkok2p
         n12/YpHslG1A8fn/wfAW+WqPgiasSxSHPrYL0MFK5DnY6tdlRrNuEa/eNtqfhJkE2msL
         An3EOtYr7Z4eUixkhsZh250LDlFeut7c4mb/TmITTK+7NOaVoMhuiggyilQqrKYp/Nl8
         oCAhkIQYNlHqX1tkuZMR2sD0wS8POT3R3hGb9lAl9gxJL6BFV39/RGxL9Wmtr3Xfloto
         XbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287152; x=1715891952;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8H0foUzLc+DNKUibRdC2bbcsFy9WZnKfOBJjcXN9vjM=;
        b=sMJFhCX2StpK/GX75Q9ofFZtdMX2aYE4GnaMrmDmcMSqgIS2luQpbij0DSFMD6QUVF
         5lyGjlZEwqLDA5T9CaLSxSWYx/k1SlgDiJJRLLNkU7NaA19CtLKdVl+aqzwW+uBaVEp6
         Kyg6QJ0VD21pIIAbxgkknPhISk4Rf2DyFzBcdN/I3GDvkAdlfNAzH+7zz1Y8QZWBczcx
         2HiWmLc4BmwQKq/EGaJzSlobhfhGb+AOJbtO0dWYOKpyhaBQNsfsUZyd6Je1qsabCfiA
         jeI3KHCQXkC1LdTIdVhCRUU2/uDbMymdzfmb5KJL7rQBBkR18XpyxHC3yLe1Tjfwrk7F
         3oEw==
X-Forwarded-Encrypted: i=1; AJvYcCWoxyfj+ZZzDgkCRzmghVzuNPsCHIccBFAQbFfbMIGyldk8Vm/XsaBlPzP0mpSlY7K0hZLgCLZ1oCjjRZxRFMod6ek0jwQ7MlsItpAJ6Q==
X-Gm-Message-State: AOJu0YzYV4wUOD/fwfTy3/sRGMVUqQrXFKsiP/sbmGZv7Nn3Nlik1/Op
	zfGjy/1IaWaKQz4+DaQcrxUICJUpwYATTGoesb+obxZqzu3jGEAeHLzG8DUV4NfJXfzCiE0cJ7/
	XKV3zF9clR5VqwdtmJSeQJwMBGuwnJA==
X-Google-Smtp-Source: AGHT+IHw+Ly/UkJisBJVqZ94ZjHYJRR327iKkqlhJCNLn3MTfbX2oJhIScyImN5vnpoTsLVJRylwSVasWSMq7OxW06/3
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:22b1:9c9e:3544:83b8])
 (user=axelrasmussen job=sendgmr) by 2002:a25:1982:0:b0:dcd:2f3e:4d18 with
 SMTP id 3f1490d57ef6-dee4f364f84mr62533276.12.1715287151918; Thu, 09 May 2024
 13:39:11 -0700 (PDT)
Date: Thu,  9 May 2024 13:39:06 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509203907.504891-1-axelrasmussen@google.com>
Subject: [PATCH 0/1] arch/fault: don't print logs for simulated poison errors
From: Axel Rasmussen <axelrasmussen@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, John Hubbard <jhubbard@nvidia.com>, 
	Liu Shixin <liushixin2@huawei.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Axel Rasmussen <axelrasmussen@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch expects to be applied on top of both of the following related
fixes:

- x86/fault: speed up uffd-unit-test by 10x: rate-limit "MCE: Killing" logs
  https://lore.kernel.org/r/20240507022939.236896-1-jhubbard@nvidia.com
- [0/2] Minor fixups for hugetlb fault path
  https://lore.kernel.org/r/20240509100148.22384-1-osalvador@suse.de

The latter is in mm-unstable currently, but the former is not (yet?). It
would need to be taken before this patch for it to apply cleanly.

Axel Rasmussen (1):
  arch/fault: don't print logs for simulated poison errors

 arch/parisc/mm/fault.c   | 7 +++++--
 arch/powerpc/mm/fault.c  | 6 ++++--
 arch/x86/mm/fault.c      | 6 ++++--
 include/linux/mm_types.h | 5 +++++
 mm/hugetlb.c             | 3 ++-
 mm/memory.c              | 2 +-
 6 files changed, 21 insertions(+), 8 deletions(-)

--
2.45.0.118.g7fe29c98d7-goog

