Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA181FF49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 13:02:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Iq4v4fNY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1kXb5JDXz3cW3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 23:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Iq4v4fNY;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1kVv3Wjhz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Dec 2023 23:01:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703851287;
	bh=wm/fsqpowae/1/KFnL6vpH1fal4nKzG+BQQ3RhSEM40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iq4v4fNYmqlp/3S2ACsOmnPu66IElzoVGDbY0mofPyCfidCkJNL99cnv9xPdHua4B
	 rnkWtRBl7g0ReDNMT2dOFZ0ze4iyTX7XHKaye8nbLl0+2pwVtJKtzpHhg9J//qsv4C
	 2qZHJiDYzPkM3erehFmrCUlg+4zcCayv12IJfPIP05TgdWNAgZSYXBZvnNRmiZ20kN
	 cdRaahFZ3Zc+XgEwmjwQn2S6WheKKvCYAHpvaLyfUM3MpTYu6iW8vpIuVOMRNlJFUt
	 8v6BZXu0+g8nyJ65UnwKX39u+G4JCOeTww7DN6WRzoBmQukly9kCL2ZtQ9OYPIsU25
	 mNvITj7jnTUew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T1kVv2pWhz4xTy;
	Fri, 29 Dec 2023 23:01:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 3/5] powerpc/smp: Lookup avail once per device tree node
Date: Fri, 29 Dec 2023 23:01:05 +1100
Message-ID: <20231229120107.2281153-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229120107.2281153-1-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <piliu@redhat.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of_device_is_available() check only needs to be done once per device
node, there's no need to repeat it for each thread. Move it out of the
loop.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/setup-common.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index ec02f9d8f55d..ff7616023ade 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -468,17 +468,16 @@ void __init smp_setup_cpu_maps(void)
 
 		nthreads = len / sizeof(int);
 
+		bool avail = of_device_is_available(dn);
+		if (!avail)
+			avail = !of_property_match_string(dn,
+					"enable-method", "spin-table");
+
 		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
-			bool avail;
 
 			DBG("    thread %d -> cpu %d (hard id %d)\n",
 			    j, cpu, be32_to_cpu(intserv[j]));
 
-			avail = of_device_is_available(dn);
-			if (!avail)
-				avail = !of_property_match_string(dn,
-						"enable-method", "spin-table");
-
 			set_cpu_present(cpu, avail);
 			set_cpu_possible(cpu, true);
 			cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
-- 
2.43.0

