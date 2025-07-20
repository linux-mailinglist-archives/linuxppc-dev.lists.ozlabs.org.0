Return-Path: <linuxppc-dev+bounces-10330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95672B0B30F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jul 2025 03:06:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bl52023Wcz30Tf;
	Sun, 20 Jul 2025 11:06:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752973560;
	cv=none; b=GpeATIEUlpMugKjUmUFGUJINeCKiSsZclgE2g3NZKUkYbpwhzpKpxKTCuEV0zoqW+EjKWcnRyv7/Lhk8qa3l9K/uE2FLYvYjtP4UCnodeD/2rWZSPyuatV3u0ewAOTnWNoUUeQQmVDOgNfQJpryCYzEZoOH8U69P+96oOVdNDWcZnY8ePUDPEr3T7/PB0vGY8bsmJ7jokhF1ows0frSVFlBVtpgILEy8TmcyqCDAY8z+z+kBJq9NHq7XnLtQ3ZLBksZ/Dv25UbV3lGJxJr0njYFepwLkVoQByDtz/3JKW09XJOZrcSG65HBiNY/DThKv+CP2j8BTnfPurgBRfTvZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752973560; c=relaxed/relaxed;
	bh=mQmf+c5bZ9rMmpqmhX1dMY+jiaKOV1/OjtVkovYw+zM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZyJ35aFDN3cVQWGxmJ9m5mOJU31pMVxPaxAVkU5LWzAfDq4oJ4Xr2PJefWY1PhAtbRiP5zIqWoOHnEFSI7W2DLG6cbESYo5R9XZcNSw9BcB/SB7PpSi2WXyDAlihptVm0O6ORbLGxWzHlrsQIYvDMngn06g5dAfvw2OdAeg2V0DzXfOUje/QHGIIzc5V12oIASckHTgvfQskCm+IsyFUmZSofAV0GPIyjh6ps1TfSpJ7v5rAkzn989WoWekDHgw1yPVZpLYp6tXhiyvvCpob/owfHeF3aqfIyadfXbmS4TjGwjD8ti5jNVWPrFbMtQdq6o8OL0VZDuy6Cj4SOm9qBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFPd1Uh5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFPd1Uh5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bl51y754dz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jul 2025 11:05:58 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e8275f110c6so2485944276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jul 2025 18:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752973555; x=1753578355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQmf+c5bZ9rMmpqmhX1dMY+jiaKOV1/OjtVkovYw+zM=;
        b=IFPd1Uh5Gf7ePl1lK+E2txGTdNb0+xYL2vaKf4vmvqz487J0GPP3SGOe3PXFZL/VCp
         hK0P4yGx6sYbM2nnoCjrZva5eyt5oRciFWoalTkGsgP4dcq64Y9N5ipvtSSRajQmeMOT
         c2/SH1snU720qlgVIW7Lz4+R+BLKOjLYadoP2lRdhYVJLw8muOdqcpMoZX4+E/ALp0W6
         EALN2tCXYZDgLSbEQViWTtthdp8hIceZDEmtnj88M8bcuGLGpouHZfzyXDQG63hlKrI3
         5ZDu1TZAuG6Rx1G2o/r0NCm1h4ZMf2WWbRd7IdJnXwrNBaGQflMcm08/c++n90eapO96
         lLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752973555; x=1753578355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQmf+c5bZ9rMmpqmhX1dMY+jiaKOV1/OjtVkovYw+zM=;
        b=eo1V4d5hU37S5GLBD7JXzl7eM3XParYCvzs69VHhreKKmiqsEYiMXwv4TD80p66860
         yMGjhzbyWWrnWILnbmQkr5U7dVCjvSwXJR3/m7LV6xQdZQTsgBwBFC5BgLLA/ZRlCaKQ
         2MzANU3SvW4fVuYAz3GVud1m9NkwxoD4yQuhi7Mjju41ubCtCWi+gPMLIgP1OYF2dllZ
         xobvc4ckyJcsFHHbjgr/sFhksIpwYx3VKRnqKc/d7pC1OKn2rUHA49yVwm8l1uDjk54I
         C+sPGRoCXH2P2jP4shsTDSQIPqQIzMk+1Pe1KpXjctY39ySrtjhgC++SyeCl3+nTjEGe
         DTxA==
X-Forwarded-Encrypted: i=1; AJvYcCUx27VPPAh5j+X1b4cAxDUdlX1yiJ2+Ubs8ZEe1NiCX59J8C3TkRnjn4lSj5a7KO2rSyD7mXomdmL3zDjk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYmj8VHgG5Tvcc/l/KM7us1g0hufnBrF9dXEweRU0glKdWaPJL
	NB+zbJICOOg5XLo2J9Kp4GUBAeDXansO2IahMgnVW9RD8PvWXYpzqe91
X-Gm-Gg: ASbGncsE4QaMfjM5U1kj7sPt1WPqIUDhzg2uknjQn8+aETTvI3q4BvSNfocvYg5Fj0Z
	hS8wp772TCcSWPCnqCX6gt0NEa6TBe+gPpIl1rQGdo5PJzySzBk8FJr4qvZjnmxgcU7GerckGvD
	OGs831yg3XvWCV188b16/cs7x8dbxfWbgjhZjM/a/Pk++8tQ3WpwnhYD1NOWiK7gx5yPaeu4bZk
	CiJEaWs1Or75zFhj5W+oa3QcvUdB/qON885rlwCI+Wv++DPVdGwALTc3Gm5VOQwO7f9FnNMoNxm
	Bh7e9bi5kWMkG39+IAQCzRsFPbwPtl7BEFDuBXvJrZTummyxoPUMTcPy5Tmul9EbHaXyQ/XqycW
	NUeiaWU+OS2hdrJYiki9rv87qqf58viW9kEvjauQ06hX/c8T6MmLZdRHR9Q==
X-Google-Smtp-Source: AGHT+IGu+G5AiJkiYySFy9R0/aF0YP+PLBPO+QptaRa6ym2gOBhSNYj4CwHNuN/M/zM8S9U7NAIPMA==
X-Received: by 2002:a05:6902:c09:b0:e81:7e60:c158 with SMTP id 3f1490d57ef6-e8bc261fe8fmr17241942276.24.1752973555357;
        Sat, 19 Jul 2025 18:05:55 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8d7ce4a667sm1495227276.37.2025.07.19.18.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 18:05:54 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Yury Norov <yury.norov@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: pci-ioda: Optimize pnv_ioda_pick_m64_pe()
Date: Sat, 19 Jul 2025 21:05:50 -0400
Message-ID: <20250720010552.427903-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bitmap_empty() in pnv_ioda_pick_m64_pe() is O(N) and useless, because
the following find_next_bit() does the same work.

Drop it, and while there replace a while() loop with the dedicated
for_each_set_bit().

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d8ccf2c9b98a..c7a421ead992 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -313,24 +313,16 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 	/* Figure out reserved PE numbers by the PE */
 	pnv_ioda_reserve_m64_pe(bus, pe_alloc, all);
 
-	/*
-	 * the current bus might not own M64 window and that's all
-	 * contributed by its child buses. For the case, we needn't
-	 * pick M64 dependent PE#.
-	 */
-	if (bitmap_empty(pe_alloc, phb->ioda.total_pe_num)) {
-		kfree(pe_alloc);
-		return NULL;
-	}
-
 	/*
 	 * Figure out the master PE and put all slave PEs to master
 	 * PE's list to form compound PE.
+	 *
+	 * The current bus might not own M64 window and that's all
+	 * contributed by its child buses. For the case, we needn't
+	 * pick M64 dependent PE#.
 	 */
 	master_pe = NULL;
-	i = -1;
-	while ((i = find_next_bit(pe_alloc, phb->ioda.total_pe_num, i + 1)) <
-		phb->ioda.total_pe_num) {
+	for_each_set_bit(i, pe_alloc, phb->ioda.total_pe_num) {
 		pe = &phb->ioda.pe_array[i];
 
 		phb->ioda.m64_segmap[pe->pe_number] = pe->pe_number;
-- 
2.43.0


