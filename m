Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CAF7287C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:12:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcYks6zLwz3f8j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:12:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1l3g323z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1l3g323z;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYjy4fj9z3dxZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:12:06 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-568928af8f5so14441887b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251524; x=1688843524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVLRceEeXaiGvlgxdYbIgAo+AcDyW1dS+jDGBb+h1UA=;
        b=1l3g323zHExDgYGww0zFXmVgic3jDwyc0JAOaU14MB4NUoruSezWtFEVocvA8VR+wP
         D+bOPBhVpeN5TR7Q94HiD/7UXFwgvkn75HwqVtdM3hi/WhalPJUwiHRXSp3bpeKIuRdm
         orIqBvL0rae06pUEOxuRX8a0MpgqpKjI5TTzLJ98WQmBBEIDz4RhToD7qotfuISdygmL
         gKqyyQ61v8JQcZhpfriPzCyTWiXBbfQnLuFCKxtspZkjhV60I7fgSoyr0iHs2+KGMqLW
         csaRWwWg7YMEgY5GV8POPk7y+6y3olAQXOM6liWFfJYYRJ0sFo+4jM2u98tnCjYnFP0Y
         93kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251524; x=1688843524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVLRceEeXaiGvlgxdYbIgAo+AcDyW1dS+jDGBb+h1UA=;
        b=ELGT+/4yyCTdZZMCeF5zKPMTbHZpC++LnPskuMkqF1pFAtEmqzb+O2eO2Cz5xcwbOf
         K/a+hBH0UbyogsHmqfSjvpX6hh50rF7OhsQSVY9IaGBcUzO4Ff3++ofMcuAK8jAYjfCS
         sUmBNfCCt4h+EYxqaFUlSXE8Cra+MvqY/Kvw2G/ekExp6DC2KJayRMt6pnrrFsKw3wex
         yPp7gwgqLxTt9+DYBzqOr4An8qfaVzE3R2x0974dY2LPuuOqkJKbzy8g+WYHWm5q7KPD
         l2oODnEo3DpM4DXGUHI3JGrqH8r4p9LuCt1b4Xx+oPReSJSwtXSyhunoJYIJJVJFKLt8
         iYnA==
X-Gm-Message-State: AC+VfDzDEgqcj3Vw3bwSM5PIGyY2M2D2vPakyN8UOEnXoawuywDHapGx
	8HqxloNEy3SrDw+OtK4BxX3p1w==
X-Google-Smtp-Source: ACHHUZ6kOJKeygbedx9f6pcNR03LNZvYC4ZecjCRxiqOz1IuKMf5mVIHIRdEhOcWlcOzm+o3M8bu5Q==
X-Received: by 2002:a0d:ead2:0:b0:569:ec03:14eb with SMTP id t201-20020a0dead2000000b00569ec0314ebmr668029ywe.23.1686251523870;
        Thu, 08 Jun 2023 12:12:03 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d144-20020a814f96000000b00559f1cb8444sm106718ywb.70.2023.06.08.12.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:12:03 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:11:59 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 02/23] arm64: allow pte_offset_map() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <35e46485-8499-4337-c51f-b8fa495a1a93@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, C
 hris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index cb21ccd7940d..f3aaba853547 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -177,6 +177,9 @@ static void show_pte(unsigned long addr)
 			break;
 
 		ptep = pte_offset_map(pmdp, addr);
+		if (!ptep)
+			break;
+
 		pte = READ_ONCE(*ptep);
 		pr_cont(", pte=%016llx", pte_val(pte));
 		pte_unmap(ptep);
-- 
2.35.3

