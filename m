Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7A64096
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 07:22:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k6xj4fB4zDqVp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 15:22:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uKB8N6ET"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k6vy508ZzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 15:20:30 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id k8so603097plt.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 22:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5rUyUi+/bd+6qEVO/sl11sgtfPyle5F8fJNWxg2iDIg=;
 b=uKB8N6ETap6aNkS+sTFnPn4HWE6ZnQ3a7IWljWoKb6m1To9GeAGIkK0SNI9A+p0lGc
 ybG/XXTupfcuVBhLSQ6kgfssbsu9T82+XqxRvX41y2RIxETiw6DvEuAgCdSnGiOoQhSq
 teFxTJJ/FCBG8JSFybROewCfrnbid5Yozb2nPqhtwNSI7hqEJOfYxG83aBa9+9wym3p6
 noIu3wIrWISaniP4DVhQuEMkBCjssSH1JhodSn6Hmxv591WTjsmQeCdFOW4+JUkYhLAg
 07/pbrNyXRWgSFQ4PFVaOd46CQ4sIGFgmUNd8Nju3aQ7pqPFHOy/ycUZ4DfICJ9H2Neb
 Cixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5rUyUi+/bd+6qEVO/sl11sgtfPyle5F8fJNWxg2iDIg=;
 b=gUti1PBMdlSMmrMHI2nBb7BdhylaS+dQnJSxnnYCLXW9EOsZMqzlJvWRUAdij/OhLK
 /wEm85toz1o+FEs5ffOzQDEE9mudm2X47UdZ5/cLvV9g5YpS6z7sGE+pamY3+9Mg6EHb
 shLTvclz3xGG1lW5D0G2xaOoAFVHfbWKdTJoTA6GZzIaLlNpqN3DIK0Dm6YQUpCXK6mz
 KZYCygyf6OPgws57T3ELv0mSn+KwjOU2/TZWQpVjbU8N8tL1ajV5R11PnUC82xCEb06W
 CMNlp1v2xXjCX6niQSS7qmCLeDWM0xepEV6eM/4eNUTgKrqd2DMeLsWN2Poe/vnYpVP1
 sgQw==
X-Gm-Message-State: APjAAAW3GZ2I2XliKDY14o8cB+dY0VK6l0SVqUjLKwW+l4KipVs+cgIc
 X/hH+3zm0Gpqq8NzwFvpyXUG5XNh
X-Google-Smtp-Source: APXvYqyBNAjrPuoGsI7fRrsFWqSydS9GzPahdqbMQBXIzD2zBI0rP093rtvFKGcIDkwhju+2uXMt+Q==
X-Received: by 2002:a17:902:28e9:: with SMTP id
 f96mr35291638plb.114.1562736026842; 
 Tue, 09 Jul 2019 22:20:26 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id l31sm1410899pgm.63.2019.07.09.22.20.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 09 Jul 2019 22:20:26 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: mm: Limit rma_size to 1TB when running without HV
 mode
Date: Wed, 10 Jul 2019 15:20:18 +1000
Message-Id: <20190710052018.14628-1-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
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
Cc: sjitindarsingh@gmail.com, kvm-ppc@vger.kernel.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The virtual real mode addressing (VRMA) mechanism is used when a
partition is using HPT (Hash Page Table) translation and performs
real mode accesses (MSR[IR|DR] = 0) in non-hypervisor mode. In this
mode effective address bits 0:23 are treated as zero (i.e. the access
is aliased to 0) and the access is performed using an implicit 1TB SLB
entry.

The size of the RMA (Real Memory Area) is communicated to the guest as
the size of the first memory region in the device tree. And because of
the mechanism described above can be expected to not exceed 1TB. In the
event that the host erroneously represents the RMA as being larger than
1TB, guest accesses in real mode to memory addresses above 1TB will be
aliased down to below 1TB. This means that a memory access performed in
real mode may differ to one performed in virtual mode for the same memory
address, which would likely have unintended consequences.

To avoid this outcome have the guest explicitly limit the size of the
RMA to the current maximum, which is 1TB. This means that even if the
first memory block is larger than 1TB, only the first 1TB should be
accessed in real mode.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 28ced26f2a00..4d0e2cce9cd5 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1901,11 +1901,19 @@ void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 *
 	 * For guests on platforms before POWER9, we clamp the it limit to 1G
 	 * to avoid some funky things such as RTAS bugs etc...
+	 * On POWER9 we limit to 1TB in case the host erroneously told us that
+	 * the RMA was >1TB. Effective address bits 0:23 are treated as zero
+	 * (meaning the access is aliased to zero i.e. addr = addr % 1TB)
+	 * for virtual real mode addressing and so it doesn't make sense to
+	 * have an area larger than 1TB as it can't be addressed.
 	 */
 	if (!early_cpu_has_feature(CPU_FTR_HVMODE)) {
 		ppc64_rma_size = first_memblock_size;
 		if (!early_cpu_has_feature(CPU_FTR_ARCH_300))
 			ppc64_rma_size = min_t(u64, ppc64_rma_size, 0x40000000);
+		else
+			ppc64_rma_size = min_t(u64, ppc64_rma_size,
+					       1UL << SID_SHIFT_1T);
 
 		/* Finally limit subsequent allocations */
 		memblock_set_current_limit(ppc64_rma_size);
-- 
2.13.6

