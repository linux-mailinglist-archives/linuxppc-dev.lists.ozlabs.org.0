Return-Path: <linuxppc-dev+bounces-14507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F3BC8C833
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 02:15:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGz4b6Tr4z2yvV;
	Thu, 27 Nov 2025 12:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764206111;
	cv=none; b=IRFTU3Dmr9c2XOWMCBR3C+xvkOyOfn/K4D2bkxXG4wJF3MQEXkf39rg/ZlRxlmUWGTkD3o9yWJRONL1wq3DyYUG0FfUXWVWQfwhsxa9XO+lSUzqkxD/KdoHXwM4heRoAoBpjn37x+PmWs2ztR9jIqcKvRejgpzeWRfXdZcLR5D8i3/GX8YZxbrAuXLuhTA0USk6O4ntBoNIOtwHBd/EhWh++s8m+hboDtTXXgA81VmUP73lBBxoLY6bbmRV0ZLNhKHfKF/SjMs0vNQgJfK8obFkcxVT83tX+3bl9wt34yJmf74+McJwX/ow31R8BwU6tz0ja8vEg3qC+2kD+GY5FJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764206111; c=relaxed/relaxed;
	bh=YN0BTLFbTgqhPvFlS+d/VYwmsgL4p5TAnUdzEI0ntIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dbN1LE0/oUDmWNs3IEtOQKCgD06RW6E2ojbS0aw9GOW5BIeJ4FfCiLKdljA8epq38mBPRXLHVlbW5r9OWIRBSoBDmN5Hpso+2BguQTkHZckUkcE8794tZVDfGvIW2/KS5N89IKY1FTU3iN1K5j4Pcs26rP4P4Z56e1Ek+xAJ8wFs/q14narq7eQd1Dz9s0WNZx8GgbrNseMw/V+iEMDaDPhqEzoPcJHNwmHRNk0rGGH97Awa20syC0yhS39YKv+GyEJig3O+05Ls81114PKaCqoXVVIW+Dz+k6hwyuhjqgzb4IcuPWtxj9Xeu/x7eg+U6W29/DAegFXAfaZB+s8ZVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=btKQHwfh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=btKQHwfh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGz4Y6wT7z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 12:15:08 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so269781b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 17:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764206106; x=1764810906; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YN0BTLFbTgqhPvFlS+d/VYwmsgL4p5TAnUdzEI0ntIc=;
        b=btKQHwfhzxj+M7vT221gKrNDP8q2I1jcAWhDmNOruQU76aW50ro0xBZzb9Tp5GKDoz
         N8Xm2uoOg0IL7kbozVrLBSUHkO2MC9phUSVOhJikOBcy3fmMQ5D5N2+dH+xt4hAXeQzN
         aqYkD3hYVx0O7daUICI0MUEF/XiTRr7n9IGLRY/6HKdkZHNDj9tgwUhlKyUPBjfCWd0y
         +Gc8e/n8rxWiYTX7kj+lhcqA3lFs6UXpEPGjgvdM2QSN5D59ieVIvV+u+1XP0qPNiYGA
         O7dzZCZeg80Ip8vtM4l0xA24RFlCQnjgNFzd9xBJeATwbepj0FKre5qeHQSeKeX5KrHI
         Gj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206106; x=1764810906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN0BTLFbTgqhPvFlS+d/VYwmsgL4p5TAnUdzEI0ntIc=;
        b=PesXUZYKBn5UR6aUkOoxjIJVyZ1cSfwuMBVuYb4zpz6bF+laiedcQAtOVQmml4pzSk
         UIByySvYbSIFtXoutl7gvj0gvykFqvy/XFrNX1GRV5ZhOKjmvSEY5mG0JOIYkOqn4cW7
         Iz5szMJ0xMG/jNg0UJrd662ue01Cdk2R+yqJzlAYXErdPp/AHAgyI5aNDm7JMXgilxy6
         6VLPMis39ZSIKmaG/fINEE5Kx2xcc+fCCFUs25/ciSHjGP37xWrrRXrjpQlsw3otvTVr
         zPn13uT023r1T0KQKsqa8VParIQ+fXNZxG0A1pkFzs91mIqIOtLXnAtpzAf5vVLU2We0
         3h0A==
X-Forwarded-Encrypted: i=1; AJvYcCVdZoHEqfywpr+ZYvxOVlkYOg0pT2NOTVR0t5J7il8SkmMEbeAUN/cyqx0xzDMqwos4L6Dkhm8evz8srx4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxr6p7I+4Wmw11jsjz2nDaRxjWZJhBYoaucetkuy4X7d7D9vnG+
	sN50rZ7euJNDsf/WKLoyO2VW1LbsoMLtTWRyNEAOHJkTr5XrpY1Ziq2F
X-Gm-Gg: ASbGnctGMR5Kkg+tif45GKRkda7CjtXQuCW4H0Jjiji93OeG9pr91eFvj8pFMHYsyIa
	AQmJqN7p94h+s9YNz6VF90W80u1c5nWPmSWG04/lkfznb3LyCiSsdLxCJJM5RnvnXLCp7KrDQ4s
	n6OuH+WsJkWQ+KjNg584YkIkjHGtkrn3p1vrZQKREK5F7B6/oRlpRWsgehXce7w1A+Bdb4M+BNt
	At2k2/bBGWWWJUQsOwSgji1f4HQkfk/mzmY7GiBLvGEy+waNsyGjlaT4XTURQM4+t1wtXwG4uWT
	G8DQB4/FQyo0X8bPMwykkUB8btJG0nf01Fz4s5tqvano47OiCtsC6HGZKNj2EYKp8JKjBk+WIQs
	Bps1c7vUBsY+G3jsoe4RaAFbnUmgiEySf5P7yXl4okHfzjAQXxY2YWwuzTcxc8Z6YUgfqvYBSTi
	ODtUy3Hq9Bvj8SgCpjH3X15dNx
X-Google-Smtp-Source: AGHT+IFOjeQ0nHa/gitKNf1wf8IwI8ZEjtO1qVKyyQQ31rBE2Lfq+ONwSrRkJugnArpqn7KBTPKjcA==
X-Received: by 2002:a05:6a00:114f:b0:7a4:f552:b524 with SMTP id d2e1a72fcca58-7ca8b2b16e0mr9121834b3a.28.1764206105589;
        Wed, 26 Nov 2025 17:15:05 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c414c226f9sm22447356b3a.53.2025.11.26.17.14.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Nov 2025 17:15:04 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: Barry Song <v-songbaohua@oppo.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Matthew Wilcox <willy@infradead.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Oven Liyang <liyangouwen1@oppo.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	=?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Nam Cao <namcao@linutronix.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying page faults after I/O
Date: Thu, 27 Nov 2025 09:14:36 +0800
Message-Id: <20251127011438.6918-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Barry Song <v-songbaohua@oppo.com>

Oven observed most mmap_lock contention and priority inversion
come from page fault retries after waiting for I/O completion.
Oven subsequently raised the following idea:

There is no need to always fall back to mmap_lock if the per-VMA
lock was released only to wait for pagecache or swapcache to
become ready.

In this case, the retry path can continue using the per-VMA lock.
This is a big win: it greatly reduces mmap_lock acquisitions.

Oven Liyang (1):
  mm/filemap: Retry fault by VMA lock if the lock was released for I/O

Barry Song (1):
  mm/swapin: Retry swapin by VMA lock if the lock was released for I/O

 arch/arm/mm/fault.c       |  5 +++++
 arch/arm64/mm/fault.c     |  5 +++++
 arch/loongarch/mm/fault.c |  4 ++++
 arch/powerpc/mm/fault.c   |  5 ++++-
 arch/riscv/mm/fault.c     |  4 ++++
 arch/s390/mm/fault.c      |  4 ++++
 arch/x86/mm/fault.c       |  4 ++++
 include/linux/mm_types.h  |  9 +++++----
 mm/filemap.c              |  5 ++++-
 mm/memory.c               | 10 ++++++++--
 10 files changed, 47 insertions(+), 8 deletions(-)

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Oven Liyang <liyangouwen1@oppo.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Kristina Martšenko <kristina.martsenko@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Wentao Guan <guanwentao@uniontech.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Nam Cao <namcao@linutronix.de>
Cc: Chris Li <chrisl@kernel.org>
Cc: Kairui Song <kasong@tencent.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org

-- 
2.39.3 (Apple Git-146)


