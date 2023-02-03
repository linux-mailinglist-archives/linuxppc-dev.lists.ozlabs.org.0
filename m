Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634468979D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Y842WC5z3f8N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:19:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IgA1Hkzu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IgA1Hkzu;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Y616313z3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:17:29 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso4648810pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6F5ts11MhLELHBAH/J0bhcgscz4TyhN8LZqQQ9xVG8=;
        b=IgA1Hkzu4DTdfzmJdcqQvI0iR953fDAQaXe/nlgYGeD9oOFr+cO/4M1aH5Sz90kVcX
         Aa0tLBFG00PpyWRoxbghIZ55kGzBKj3YpYLoTPlV47aef5AZUqWfk8knwSt1wVoKEB1t
         VORZsCqjxveYutamyca3vCSK8t6BvljpZs4Bbt7/ZUcXRnOJSKYrYYyFQPpViaPMbaz9
         OIY3dLklEXk3TLchPrGiLxUmeHdNngSlYFQ10lpttU/8ZRC/xe+rtwjGhySdrL0hzHA9
         4x6AX6Fb2AxOWWkYco/j+oDwKiWYQM00ajucpxaUox9Fipulm6eSf2++BYraQE6JZfij
         +pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6F5ts11MhLELHBAH/J0bhcgscz4TyhN8LZqQQ9xVG8=;
        b=nsQqqbhVPCwBoLjGjczjYGmuKAHIf8FpEwQuFebY7oHQFdR2sO7uTb7rQQJoA9jjVm
         dgJ6guwdTH/bbDucQ5iQwgsKRpE7ScebKKy/6/fcPeTnugUD5KvDswXum0I+BFywaYic
         BzVilPn/Z6vRh8pmMD4otR/iprjDeQgumftgCisSlzISZsm7Q+ST+QTb6GU9l25XzFm5
         e+H1XtnhuHRNdGGuVHYXFenfTGAVXi3XEjKUp46eBp48wa50I52zmK/hXeIx8eNgbwyt
         wWZZ3lSsrTHUSGqRNY8N1K5o7u0zaN45szBCdceEKfS2OYGS5eokJMA07IPFmka4g420
         pP4A==
X-Gm-Message-State: AO0yUKWPzeiIrS9yH6Saf3kGN0EU3Aqh92toOB8bGHgax/tDgRi6wZi8
	EclpYyEqhgvVYROkFm7YV6/N985jcwk=
X-Google-Smtp-Source: AK7set/bnXOx5JOf/CukQE7RLcC+/QSb2kbtT3VXzFnfdCFpn3h0vVb+udUBR+vSQ55qLMnpFlEgaA==
X-Received: by 2002:a05:6a20:3d90:b0:bc:fe09:950b with SMTP id s16-20020a056a203d9000b000bcfe09950bmr12657574pzi.10.1675423046610;
        Fri, 03 Feb 2023 03:17:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id i15-20020a63bf4f000000b004f2c088328bsm1285151pgo.43.2023.02.03.03.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:17:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s/radix: Remove need_flush_all test from radix__tlb_flush
Date: Fri,  3 Feb 2023 21:17:16 +1000
Message-Id: <20230203111718.1149852-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203111718.1149852-1-npiggin@gmail.com>
References: <20230203111718.1149852-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

need_flush_all is only set by arch code to instruct generic tlb_flush
to flush all. It is never set by powerpc, so it can be removed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 282359ab525b..1e451184cba4 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1302,7 +1302,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 	 * that flushes the process table entry cache upon process teardown.
 	 * See the comment for radix in arch_exit_mmap().
 	 */
-	if (tlb->fullmm || tlb->need_flush_all) {
+	if (tlb->fullmm) {
 		__flush_all_mm(mm, true);
 	} else if ( (psize = radix_get_mmu_psize(page_size)) == -1) {
 		if (!tlb->freed_tables)
-- 
2.37.2

