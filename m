Return-Path: <linuxppc-dev+bounces-11682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E47B42936
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 20:59:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBk4095Kz2yvv;
	Thu,  4 Sep 2025 04:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925979;
	cv=none; b=jGK7nWp+1TBMKbjwDqC/JdxAAs+AEVmJPqamegu91UgzRlA+J4+U8xcs24JT9TsbWolaA3k+Zl/PROjNkbBx+rPADpcKaSniBoqwgQqRob0RzXC7WYq3QC5ds2Gh1qbi0FytwD98vWWAeQuBMcTZZy5reKvbUV4CjEEorOAYdxCdq2VcHTSWVxvQpqbB1VYYc3YPHZsFIrTRRofSby/MIHn1lN8ROumK9Vcd6WFb9WVifbsomflu/OOsHCkzhVGusnSlGD0Unwej78zODXcqW1EGdwHqFe3vINfDchTpi4OmqO8hm4y11TWke+J5Z3HzssgP/2SH+/oOKO2oNDAA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925979; c=relaxed/relaxed;
	bh=qZy30c40uMQ+C5mAmU5IprjDTVrN2KgzxusGEfWx0IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foMhyYfQOgkPTbcDo0jMJSsPdmaVaRriFINiFQ6b7jmyvY3Zt9osvJPvHEteklb49zZIz9q0Gnr+CQzPaecfxurSjn+ZHxr/XNeW/Lb/mGEbYbSpZJUum+twC5NYHyJ5Vkjk8hngzi9uK+sUTAD5u1zVEWlmLxVOQjGJi1fV6nl6+uiMY1uHPyP9+SfYb/QUpABEZyz6AR+SmOhrgw732gcgh5GDOzVg+c4lFV+uWJ3M02yDSdzPkJeHGUJwvvTAM1wgktnvzimSB8Sg6vfh0Un5DPTM1gVLrKnqvuAj7uNDJ458cjKGpaAPmTO24pI31EjIQbGKHA4IRyhglWD9GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EW61RNHN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EW61RNHN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBk21ynPz2xnw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:37 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-248ff68356aso8761585ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925974; x=1757530774; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZy30c40uMQ+C5mAmU5IprjDTVrN2KgzxusGEfWx0IE=;
        b=EW61RNHNl+wZQ4pyC03+chCawu0NTV9BXHS5m5uDLG8zIklXU0myR7PJYKYMlbUa0e
         wnkWTQ/muZzxZWVH73GbeNePbqapeY61sOoW07+rOM1z5VXHI4HNoif5myvT1RyNXVrk
         HCp4TGIACDqxJuNL6ZdLjlBCWxK7tK8NSF7egvIrJEmOW/1kop8MDtdpg0P2tz/HErtw
         8Sp7rOU62472L5NrmAgM5azqy1eNkszrkBEyCMxIhhMHfOyTAbtuIks7A7XtBY6sibAS
         QjtVoYF265w+kFJVgnFjSIvyo0CX/NCneQa3eHQwyhF+KexhbwOh9I8sKdWh3k0djN4W
         E1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925974; x=1757530774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZy30c40uMQ+C5mAmU5IprjDTVrN2KgzxusGEfWx0IE=;
        b=UUmXwKbRDPIaeSWeADvPUiRqSjQapdw/vWWlIz6mxQoRnEfvKm+5IyfF60oovVz7th
         w1uGHidOpVecUW8RoA1BBSjhschN7yVxbJAPZNpBIrhc9fgOZU0LiKTJq/R5KFQCJ8o3
         iICVP2R9q3qHuLyqDAvLHdDafvdyKLGDnidGjP52uH3d/V5eDaZiTteBy64laDrGFbtw
         il9mva56SRrOblxbKD/UEdvQIWXtC3i7YizAx64aGRc1lIWvV7TUOq4h055sTbMCFsQp
         snNF1/DbpE6+EOFbY1QWnMv9JJnhnrIGJ3/6WdpDcKlg20R+26Ef62Fnb4ulaFFeb3fE
         0/GA==
X-Forwarded-Encrypted: i=1; AJvYcCWlUbNsCE0Lfnegyr9f17vR9efSI5QK3TWt5Nb5Emu7ywjWId93RSvPTRwy0pgxKeMcSRPD5TtbQjGnPL4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyaXkpKo0wZJ9tI95W5MIKYd8LvwhkjSkcbbdr13iml6MdMGHYP
	STNC+jFsuUTs7FOp1hLBucN/ieTh6k5HD5Sj2uqHT4RpuQbqlGrzr5T2
X-Gm-Gg: ASbGncu11pOSCTaNZD2y50/kU83uOqXGTpTW7tgM2GWqwfD+IUFB0g979G9bGVj7lhC
	GAQM2IU31agt3CWSV/+KfgE7KCdYiT8J70dT++T8Wjs0XMvDwVzQaNrRdXhKMSfAdFOjQORUPwD
	AAlh6M6PkT/uesfbKm10WeO8K0olYbZyS7/Zl40KNo/X/oD5I5xBIrv1etMiDaxZPogOYdjj+kg
	1NbdTyh3CGsiYZm0Imcrgtzhu2RGcsIxVVbt1t05fMFi+6ZzE+Ii+zIZVz5MzTzsYSvKT6STSsb
	nuAX2H/KGsR3k/eaLpK+iPZwuhSLJFbcddDkyQlcPor9wpak8GqaTI/Ln39w23ojo1BLzRv5o4T
	EjzEpwzbJiTPvuMExkhWwQ3qdH+kXqB07rpJNVbNkKVETpMaRdtwtiA==
X-Google-Smtp-Source: AGHT+IGc1hOCFlrmhtuYXy2RF4eOcL1ED3xkJpQYquvPOenW1RGNO8PJflQF3KtC2IpnrJ0auNPnsg==
X-Received: by 2002:a17:902:f642:b0:234:986c:66cf with SMTP id d9443c01a7336-24944ac387bmr203183595ad.16.1756925973872;
        Wed, 03 Sep 2025 11:59:33 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:33 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Justin Sanders <justin@coraid.com>,
	Jens Axboe <axboe@kernel.dk>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 0/7] Cleanup free_pages() misuse
Date: Wed,  3 Sep 2025 11:59:14 -0700
Message-ID: <20250903185921.1785167-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

free_pages() is supposed to be called when we only have a virtual address.
__free_pages() is supposed to be called when we have a page.

There are a number of callers that use page_address() to get a page's
virtual address then call free_pages() on it when they should just call
__free_pages() directly.

Add kernel-docs for free_pages() to help callers better understand which
function they should be calling, and replace the obvious cases of
misuse.

-----------------
Based on mm-new, I intend to have all of these taken through the mm tree.

I've split the patches into separate subsystems to make it easier to
resolve conflicts, but there aren't any functional changes.

v3:
  - Collect some Reviewed-by Tags
  - Replace remaining free_page() calls in patch 7 (all other patches
    are unchanged from v2)
  - Add all appropriate mailing lists that were missing from v2

v2:
  - Reference __get_free_pages() instead of alloc_pages() in the
  free_pages() kernel-doc
  - Get some Reviewed-by tags
  - cc the subsystem maintainers related to specific patches

Vishal Moola (Oracle) (7):
  mm/page_alloc: Add kernel-docs for free_pages()
  aoe: Stop calling page_address() in free_page()
  x86: Stop calling page_address() in free_pages()
  riscv: Stop calling page_address() in free_pages()
  powerpc: Stop calling page_address() in free_pages()
  arm64: Stop calling page_address() in free_pages()
  virtio_balloon: Stop calling page_address() in free_pages()

 arch/arm64/mm/mmu.c                      | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 arch/riscv/mm/init.c                     | 4 ++--
 arch/x86/mm/init_64.c                    | 2 +-
 arch/x86/platform/efi/memmap.c           | 2 +-
 drivers/block/aoe/aoecmd.c               | 2 +-
 drivers/virtio/virtio_balloon.c          | 8 +++-----
 mm/page_alloc.c                          | 9 +++++++++
 8 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.51.0


