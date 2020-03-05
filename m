Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6137C179EB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 05:50:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xywz1dRrzDqnV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 15:50:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=B+rC3aCe; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XytV2R5tzDqlL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 15:48:17 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id o18so1888146qvf.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 20:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bR0yHX0jt6RtU935MOjekAD7bW6X/oaFERrZJKbX81c=;
 b=B+rC3aCeemmKXHBSwju8vpHFCDXJcRs2zcFIZabqMKtnfwyC5IFe4UBlPY5IdtlbNT
 1TyZfkxYuwzKwN0UMI8cCtJb36E2zFRjAVnc0eTu/XkdwYPFezn/waq+VXkI+VqRmYnU
 n5Um4fRTCPyM9+n/57/Kx2tFyn3M9rwprh2/LZ9DPO1FiqsAsrfikh2KWR9wnIKxWeKi
 wQuv8uUejauid1qLg6ALj5Gl8V2WZ9t8GxEn4fMgbfQ68WJ41HfHuFXnXVo8/TisXRLL
 WU552JRA4VWKoyjVV+yCz4b1HxFOcjwfXTk29A3DP/yP+yFI6w8eE1hHRmZI3KKRG/Kg
 1B9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bR0yHX0jt6RtU935MOjekAD7bW6X/oaFERrZJKbX81c=;
 b=umM1hS0tOl7SDLw0TEOn2FC859v/vgZkA7wXHo2yFirKHIhm014OfNXSbpO42tNeoO
 9qH7Ix+z+ldgf9uOSmRkmxB6NdMZpyVkIRVFIm8/v1nbYJFciaU4dySrcFkjSHm/nnxk
 +fXmatkYLeV2KOb9nyJVyAGATCaPkfsx5uc4Cdlj+y4YboQrJHFY/SLtRSGBO+jGlfV1
 j23P2YT/oazw9X8Rn0vMFNOeyJ1fOzL7b+P+qa5Hp6oeASPuSM5wLCeQdlqmtfNZPh+X
 mX+Ix1qFU0WgqqXTedky03eyH5+qD8W67yAYj6kf0vBhmO4b3sqxm86vtWmPMEbe5Iul
 dalg==
X-Gm-Message-State: ANhLgQ0fS+TK0wRHGQvqIVGhMUsmjI+8j3ESPFKez+sIJESAHEIScHK8
 YOQeaPtByeEtBlYXEyTxD1ag7A==
X-Google-Smtp-Source: ADFU+vv4UwakNttileojs5+Urm6yioCkCkSY1Y4lDvERapnfL62VOgXHTglEEbpPG2qMx2Kb88J8Iw==
X-Received: by 2002:a0c:b669:: with SMTP id q41mr673037qvf.20.1583383693207;
 Wed, 04 Mar 2020 20:48:13 -0800 (PST)
Received: from localhost.localdomain
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id f13sm10558859qkm.42.2020.03.04.20.48.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Mar 2020 20:48:12 -0800 (PST)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au,
	akpm@linux-foundation.org
Subject: [PATCH -next] powerpc/mm/ptdump: fix an undefined behaviour
Date: Wed,  4 Mar 2020 23:47:59 -0500
Message-Id: <20200305044759.1279-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
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
Cc: Qian Cai <cai@lca.pw>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 rashmicy@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Booting a power9 server with hash MMU could trigger an undefined
behaviour because pud_offset(p4d, 0) will do,

0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)

 UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
 shift exponent 34 is too large for 32-bit type 'int'
 CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
 Call Trace:
 dump_stack+0xf4/0x164 (unreliable)
 ubsan_epilogue+0x18/0x78
 __ubsan_handle_shift_out_of_bounds+0x160/0x21c
 walk_pagetables+0x2cc/0x700
 walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
 (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
 ptdump_check_wx+0x8c/0xf0
 mark_rodata_ro+0x48/0x80
 kernel_init+0x74/0x194
 ret_from_kernel_thread+0x5c/0x74

Fixes: 8eb07b187000 ("powerpc/mm: Dump linux pagetables")
Signed-off-by: Qian Cai <cai@lca.pw>
---

Notes for maintainers:

This is on the top of the linux-next commit "powerpc: add support for
folded p4d page tables" which is in the Andrew's tree.

 arch/powerpc/mm/ptdump/ptdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 9d6256b61df3..b530f81398a7 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -279,7 +279,7 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 
 static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
 {
-	pud_t *pud = pud_offset(p4d, 0);
+	pud_t *pud = pud_offset(p4d, 0UL);
 	unsigned long addr;
 	unsigned int i;
 
-- 
2.21.0 (Apple Git-122.2)

