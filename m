Return-Path: <linuxppc-dev+bounces-6278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253CA389D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:44:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxT4y6ysjz30T2;
	Tue, 18 Feb 2025 03:44:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810642;
	cv=none; b=NYULw1ZzI4+41gBYYQllEZ0EaUpU7PT0BnYDyEZt40cJzlmr+Cn//jMpojsD7th+NbsCVxadwlrsS5dqQhtoSWU++dAlcd2dDMzxR8P124L7r31Jj7ewnRHic40/vcGkymeIUnb8cSkJeJhusvQJq0NAMXkmCpYSru7T7YpqlKgog5OXVdyq7bwQnL2Urt/POHTGwg5ls2sbO+2naITsYJiAwgdGLJoSCvtyq/PhgGp/kOhv0kUKrJiHBtGDOgWGYff92lTP0JpEd09KIRlhf1vquJmqN9IgMXsVUh2IQBtl2RbaH1b6MWHdIacwPlDklAtATb6DEXG0T++vA5fIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810642; c=relaxed/relaxed;
	bh=QeeiiJberKqp+MSuQnxPBfH4/FsnHt7yucRyT35nN7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npXVmrEGw72tzd6KxcxhNMr6nOE6kQg9QkzXr8uwuSeFfWSErG5r6U4ENnBZCd9CZzFjlxnGs7ZJXlo3tcgofBmmyPhq3kuf0wTESJWhgPLnPKhkQi8sAW8XD37yo33zCuRvJRkwXapFbSobwl0OXoPdbn0uvZZHR+YkeCstAxMLflG9CRVblhI12ATNMRl4Ft2ebMYAzue5XkJjwG3BgW4aX9DTVwf9SoE8uL2ep9NLmm3KjpLOQc4it31q5KF1laBA0Iy/EJTbtGk2c1n1lYbNAgXzlJLWn/rIEwTWUKkt8vO183NKSacPSa6LmFGXnPifmJA7pZZkqSmh20lv4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PL3oCXcL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=eleanor15x@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PL3oCXcL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=eleanor15x@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxT4y1PbLz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:44:01 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fa48404207so9157860a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810639; x=1740415439; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeeiiJberKqp+MSuQnxPBfH4/FsnHt7yucRyT35nN7k=;
        b=PL3oCXcL0078dgp1muGuz/xQ8hyzzJxZMLnvKO2bYn2h+E0DYFr+K53VESxmo7pkRo
         UjZFxUKKHiQ9O3mmgAsbuwvZPPmTwiL+oGpcDmFwczooFoVpqUq1Lmi9snPiwY/LJqbr
         J6o1AUj5bCS/YyqyR9/AcoePROuPsZIIqnNp0UyadanfmovdPtuPMD91IA3aGVNXhmWi
         hi4nJLybveVkEC+rqXqAgCKaPplxPWoJT3k9uQBxMKkgCxL7DrYz7O3x7HTj1Ui6Vu+h
         xbDwH0ZmcY+db90Fk235OAZA9tAn1QB9J5akYcgS3hUOzH6zgvulGYvlMkVAvsBmpJae
         wDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810639; x=1740415439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeeiiJberKqp+MSuQnxPBfH4/FsnHt7yucRyT35nN7k=;
        b=L2aaSN7q5pG0NRMqNEfcT9aNUtL1/j32YQr30kp+pN6kMzb2calgwxQXJgtZqlx5ZO
         ltdhmsExWXWG1JC2nUerecnG79qKPncMII5tiaiudGk9v99HYfR0if2k0PgKuoj7jDtr
         YyZrWtpGwEsphrcLPDZ76q1fio1rsUsKbwCDdcHuNrkM9aiiScf1GYNPxsUQx7WwwkGV
         pkxYXZFEYNXoMMPoH9aIMqhq5hcDYmA2lZ18Weg55Gw8+IkyXb7aadrZf0wylsgxYNTa
         ZXnzN2XZXXAo14oZBU4F6nTVwN+t/X20/sSZQNgfoC6FSDTM+lNWofqKj0AHfPxiyXQm
         DQKA==
X-Gm-Message-State: AOJu0YyaT9ZaZHoTJYiyUG8jIc6D9T1hhcwVOLCJc14H811z+IZxbrus
	Im4jgs5KfTdA9o/XV1CX+Sfncyf6KKuw3z0dnlxsiCjpSoUHu9wq
X-Gm-Gg: ASbGnct1M7Fqyccf35sMCc9URFdnlqAA2MnK77oP/tvkgcAGn+NrTdZoAnyxEDDEQiG
	9qqtBcsvcgtQBFtt1AFcLKziqIZyTPHG42c1gsKcpVrGRgznLmH1DI8/F9lnnDWwJmpjccxZOeQ
	b1O3hVSKUONzGns11STSQEoxJBI1mdbq++PYy8f0O7rT5F+h45UEIKZqhTIcE4oZznoKePI32iZ
	ipz/hU6bJsXm6ZSqHUMS+M84/C3tS0/Z+4JRt/CazPwTVJY4/WeohrKC1ZBKYJlnCcw8O53R1bP
	Pi6X8+R3PYvW4xrYxqhV
X-Google-Smtp-Source: AGHT+IEKsuo9K4p+TFMgWRMBmU7I0H/gBvBPtsGGOeSrqFEODTqFS6pZ4ey3eyKwXgZdE/5vDqzimA==
X-Received: by 2002:a17:90b:3c04:b0:2fa:2252:f43c with SMTP id 98e67ed59e1d1-2fc411509a1mr14228429a91.34.1739810638732;
        Mon, 17 Feb 2025 08:43:58 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534906csm73910315ad.52.2025.02.17.08.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:43:58 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH RESEND] powerpc: Fix compiler warning by guarding with '__powerpc64__'
Date: Tue, 18 Feb 2025 00:43:52 +0800
Message-ID: <20250217164352.3123729-1-eleanor15x@gmail.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As reported by the kernel test robot, the following error occurs:

   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:1172:28: warning: variable 'suffix' set but not used [-Wunused-but-set-variable]
    1172 |         unsigned int word, suffix;
         |                            ^~~~~~
   arch/powerpc/lib/sstep.c:1168:38: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    1168 |         unsigned int opcode, ra, rb, rc, rd, spr, u;
         |                                      ^~

These variables are now conditionally defined with the '__powerpc64__'
macro to ensure they are only used when applicable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501100247.gEmkqu8j-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 arch/powerpc/lib/sstep.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index ac3ee19531d8..eea8653464e7 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1354,15 +1354,21 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef CONFIG_PPC64
 	unsigned int suffixopcode, prefixtype, prefix_r;
 #endif
-	unsigned int opcode, ra, rb, rc, rd, spr, u;
+	unsigned int opcode, ra, rb, rd, spr, u;
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
-	unsigned int word, suffix;
+	unsigned int word;
+#ifdef __powerpc64__
+	unsigned int suffix;
+	unsigned int rc;
+#endif
 	long ival;
 
 	word = ppc_inst_val(instr);
+#ifdef __powerpc64__
 	suffix = ppc_inst_suffix(instr);
+#endif
 
 	op->type = COMPUTE;
 
@@ -1480,7 +1486,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	rd = (word >> 21) & 0x1f;
 	ra = (word >> 16) & 0x1f;
 	rb = (word >> 11) & 0x1f;
+#ifdef __powerpc64__
 	rc = (word >> 6) & 0x1f;
+#endif
 
 	switch (opcode) {
 #ifdef __powerpc64__
-- 
2.43.0


