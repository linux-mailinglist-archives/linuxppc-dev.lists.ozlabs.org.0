Return-Path: <linuxppc-dev+bounces-10329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3169B0B308
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jul 2025 02:50:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bl4h61hR6z2yhX;
	Sun, 20 Jul 2025 10:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=98.137.69.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752965599;
	cv=none; b=fjMKJOex0b+Q9dKUOv+OMANVJ6ShcfNsOvIDJYh84LSGje8M+wXa05hTYz3o4oqryaCHfQBMzWCRIqHFbWQgoysq6/YJax8+pNy921AHZ9IuIir9NKsATCFtYTX6VAVVn9o+PixaDiW/YlAYYzX3Pevmmgap4KY5tmbg2sEQB0fdtU216Gu8DFxDZl/aVEPtJz0875dtAVtMJ/RSTpT6f3cLuMhYWhTu25KbLs1Tq9SDGCOj0NU6AXRTp5IdiFCH99t7G78DxD/tc8NfyzTRv8TjyKrGNk7Ra1A7F4j8ck7hvooyW5x/CMB3AdRCFRov2RK+hvggiN6mKa01AAPR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752965599; c=relaxed/relaxed;
	bh=JEiodri88Z4z/m8fDG33CTdtkKjMr4cOm6shKeQiIc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=eFHvQaIpn/623CNEDKAPbSy+/aQNBG5khBJYIGerVWRAmMdpocH0WN7Pj6FFbJ8ClKiF9hQjFtzQiQEa3E1nTSIufUoFpweGOzMq/mnB6QqmyfFSez6K2MPlv+f4MDzS96d+ti7ibX3K/N0Tk6U8k3SmeNJOK3G9hbKH/duy1mBI+IAFh5h5zRcyOG/OtSiydxzIrezXcHd/BjUtGe0WrRMZ4p5VsVokVQWzZ0z1gxjO4jT6Ee/ydAal5bEsoXczDCkEJCoyvirPaSE8lUQ8c96th4+g/ZYXahrMNownPxq9Whxu6hFNFOXhFV6YFXFGZTR51W4ODHnGeyoCXVQEbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=aol.com; dkim=fail (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=oy2kVx49 reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=98.137.69.148; helo=sonic310-22.consmr.mail.gq1.yahoo.com; envelope-from=rubenru09@aol.com; receiver=lists.ozlabs.org) smtp.mailfrom=aol.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=oy2kVx49;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aol.com (client-ip=98.137.69.148; helo=sonic310-22.consmr.mail.gq1.yahoo.com; envelope-from=rubenru09@aol.com; receiver=lists.ozlabs.org)
Received: from sonic310-22.consmr.mail.gq1.yahoo.com (sonic310-22.consmr.mail.gq1.yahoo.com [98.137.69.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bl24s3Mdnz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jul 2025 08:53:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1752965592; bh=Ce6Dt8pLkw9UGkCntDHrb1L0yj8e9KlBmSuxz9VENrA=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=oy2kVx49eBmuVDp7f567YKUorPmteLDsERLA8Mu6vbyRyP6pTGQyPm22Uubv2KBO6aAMx1PccIhDE53RCZEshn9fA1Uhe1st/iaKhELw8u0Z2jovdIZeHIrr/J/OUs/blSNrHTrbRzKLo2g+YwINYsU7akFGIt/RrmpDcqLD5Yi1l/p4eQHBQZle9dv3c8FwwX4iX4uWbo8iViqeES6/7InH4WhNNiIhxNpJ5DLpdm8FOimMoLPh8AZT8lZZBgGKRCI9rsVfdKd/uQRU7UAztVK2UEmXUnZM46x9JLyGR151BWLWpv8fBgy16NCX+zZIc6zvIqfTbpuIY4OviALE1g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752965592; bh=7LEVqfNOpUz1S0Jqw9SnfEF6YgCkOa9qcePHSEu3VpW=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=G8LUccZ2a+gHV4v9mHL3dOGKfbPAwggHogXtP/efj+SnZRPt72zapKEwZE39nQf5RKwQGrh8cLUiD8OD37054HxBqQUAWvu5OHiEoBAlokQfw7x0evRfW+uIw+mrGwEgqpue4frZ12NRxsf5+Z7Exq6kxrtiAKCGZxRh1J3IfuDaMmiGOXqTknFZHqBJCdu8zLWPpRZiBcWSHslwrSudtSZry4VZm18WgXTcYUrwxOJaZxOyYNyT5AdQ3tmCVmLcvWpL94hyhE4kNhh/maU4iTsOvwT2tFrxUgxO+mCwZtwVAY6JQMA1ntQvSlt19EPH5QgGNgLG9mmeG0Xt19/Ahg==
X-YMail-OSG: GgHGVHsVM1le1GpABCKtwqX3OS01ervBkTlED5XMfdsnHr3RMJF6oFAxjLDW6g_
 KRhlBdWsrojSjC.kHno0xJL063g4cpF5eL5rUWB74i2bTjSUd6D8IqPeoWsoyqf8xlfNrVUCsVHv
 p7U2KxlkDZEoKBEkzLxuM_pTiIGES1DfvEqYcZh8wL0Uf1Qj0Uf2KH7rB4zFwSHjCluRYHmn2IMV
 Jt31W9fM0UH59k4n1vYfl5rXJVPa.mF8VroMWLWM7Q3IonJbRlpP0ZRfmDIJbkWQSHnqeXMqXpRE
 cmQvrtQsTf7qidtLYLyHWzzqa4ZlSDRLAXnNGD0I6Acqf73PZ6byyvn9rRgF5ENKYMX.keLeFUw8
 ybuGvCPTFWjEpo14U8dCiAg850l4d9NywWW8EnOa5fk7AKrCaa2F3Z8HcASJ0RZMaAMvtVtcUI_s
 mKeNa3HJTPBsDiIN5Ov8C_fOMWLuz655QL8t8w4U.Oi0riyTGpi6W8MqwL5xNQLi5BKwUrY35qhc
 npi1XhrJVobRxuUqyiX0WwqB4VhQ_1J_Eerjat5hx8PEELjqSdPLVvWC5jASzQd1ndCacrxE5Nfp
 _W5FoGMZVw75W_Rx.z3ZDaS6biPoGnTi_UQo6cQw2QbADbtb4c0haxg_i7SyUeIC5hYI0UY7RTQs
 19S6KcPHjFAKzza1a0qlqizNoUcPZuZVYq9Z6tEmJ_2IX9c43iGFZ34sWOB7Zr82DIzRlx7PSVaV
 7_2gM.lAHU3zcV8BW0PbFNBTmhHXFlkupnVtUXdbS74_YW9WRzRiq2Nvsu7Iv1mA.g8ED.JrT17j
 CKDA0KDYNf7Hn.srBWdcKMHoUMOZeztRfUBonQCcmZi.lAfS.AEunFXJog3Xz.M1f5_qXO0GISx0
 UX9B6O7WhvEw6yzyxCyIFpoSx0YfvRdHRMw4psRJfhibOHPPrqlVf2bwjCElQQkfGBlUGtOYFlK3
 gio4UaSvGTNqGyBw9USMdtoysm0b1dG9qTnT_ex_cUY2HjMYkWbkSxEHSU9YUF6Sr.3BxQSaXJ7R
 Usx4taPFR7YJQDFUwM8xagG_MAm_yKve5CIX.GX.sfn1N8cgWuP7hOsqtYoaWKhiEOnNQyhZtqov
 TdUsxY.q.KouB4DNZGZKfQW5eJaTdZxj59H.6ZsFaPICXFPlPkfLtUuS1dWhYlJxO2xjQeLsP5rr
 aubhwCGF0TXH4hdGHg_uC0963xhVrp4rU8EZbePUjio6G8LYtYPc.2wWhv52cWz4A1L2rJr6.Hlz
 WlR4muIOkma9gI_niUNgfuElPrwLazOruia6TbTITQK53i2j8rD.NyvgSvPBf6fgA5DWtqmAs4AG
 UNQqoeM7r7ychG7Q6f6AtF9vAhREIRq0XFloYD0NA8ZXWInNlFODKQxIte2Of3fbsbseNdujtaCv
 DbEtt4u8xCoUqv83VwehJME6EhcpjS0uODXGs8EWn0dAAQkbb.InQDMD1aEJPS77HZr7z9rdvocA
 EjAWOqUM4WTfu2vEajZ_RlR2xQi.rrHAwovU.H9TG80HT8BQjJsykM.ELrP7sUXDh4SSJMc18Ktx
 .Mxc9lUjFBDXgGNf_4qEsyfVOEwaCohE5Vc8LyVcmUoO0vXr3MTB5gR8my1ummIIWaH1p.P9L0qb
 6RO7Wz5bbI1kD6mXFqfISlcj8y1XhzX0ThUO00BGFjbGPrvLSxLW.1NfcwVbHfJhTyCh40s4eQ9G
 0ChNcKzSDb4rK6Clw5LBDwH8NYP_GVVlOElhgOXRxOmUvdJxJoMI2tWDKt56hmIIyEQcvPYF1Nug
 FEUA87_xGFIiCtvBP_SJbZcnxldpGGXkFXpMm4PiBRodwhIuf9UkBCZSOc1BJPFt5Wh47JbJkt8s
 ma7Cjk2M34wr_NlLclR27OtnuitXH66YxBBJjd.GIsmAb6BPL_IJvkGPmW3v05BzSHb8U5N_0lXZ
 fumvA6gFQTpEJG_P4DkbEChy5lDaup_16KqJn4Jt2QM5vZ3bZMsrDF7QmrHwgV67HGn3sl5feqZ_
 nJPs08eTERGgARJaEU5hL7AoDE.oy1EELIajodW5bD56YqLoohB8O5eXlwgN2jmu83RTMJklO.ZD
 JuMk9_Moy7liZiHSIzwcTw2UWvr0tkwL.JVvFAxj8nf3Ep8VmEF3xNhOrn6RcOrQQv2INYnmwtLe
 GLfQgi_cIGBLv.l6olIlDqCTkK1d8o8nd3nzVDjSVWbzNpjXuSlRcSDo8ixOhQ47QInNRVs3N1H0
 mn2Q0cJrcJmKzbG97.sBJgY2CuoYvYMZNj5CHK7p4iy7A1hF4wFxCRV3MEJZrJBI1Gjg6WNE-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: fa017355-6ef2-460f-a50d-35f54d9307d6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Sat, 19 Jul 2025 22:53:12 +0000
Received: by hermes--production-ir2-858bd4ff7b-q7k6m (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 320ab1abfa6527764d3740cb14f93fe5;
          Sat, 19 Jul 2025 22:53:10 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ruben Wauters <rubenru09@aol.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] powerpc/xmon: replace sizeof calculations with ARRAY_SIZE macro
Date: Sat, 19 Jul 2025 23:43:10 +0100
Message-ID: <20250719225225.2132-2-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
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
References: <20250719225225.2132-2-rubenru09.ref@aol.com>
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The calculations for operand/opcode/macro numbers are done in an
identical manner to the already existing ARRAY_SIZE macro in
linux/array_size.h

This patch replaces the sizeof calculations with the macro to make the
code cleaner and more immediately obvious what it is doing.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 arch/powerpc/xmon/ppc-opc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
index 0774d711453e..de9b4236728c 100644
--- a/arch/powerpc/xmon/ppc-opc.c
+++ b/arch/powerpc/xmon/ppc-opc.c
@@ -954,8 +954,7 @@ const struct powerpc_operand powerpc_operands[] =
   { 0xff, 11, NULL, NULL, PPC_OPERAND_SIGNOPT },
 };
 
-const unsigned int num_powerpc_operands = (sizeof (powerpc_operands)
-					   / sizeof (powerpc_operands[0]));
+const unsigned int num_powerpc_operands = ARRAY_SIZE(powerpc_operands);
 
 /* The functions used to insert and extract complicated operands.  */
 
@@ -6968,9 +6967,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"fcfidu.",	XRC(63,974,1),	XRA_MASK, POWER7|PPCA2,	PPCVLE,		{FRT, FRB}},
 };
 
-const int powerpc_num_opcodes =
-  sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
-
+const int powerpc_num_opcodes = ARRAY_SIZE(powerpc_opcodes);
+
 /* The VLE opcode table.
 
    The format of this opcode table is the same as the main opcode table.  */
@@ -7207,9 +7205,8 @@ const struct powerpc_opcode vle_opcodes[] = {
 {"se_bl",	BD8(58,0,1),	BD8_MASK,	PPCVLE,	0,		{B8}},
 };
 
-const int vle_num_opcodes =
-  sizeof (vle_opcodes) / sizeof (vle_opcodes[0]);
-
+const int vle_num_opcodes = ARRAY_SIZE(vle_opcodes);
+
 /* The macro table.  This is only used by the assembler.  */
 
 /* The expressions of the form (-x ! 31) & (x | 31) have the value 0
@@ -7276,5 +7273,4 @@ const struct powerpc_macro powerpc_macros[] = {
 {"e_clrlslwi",4, PPCVLE, "e_rlwinm %0,%1,%3,(%2)-(%3),31-(%3)"},
 };
 
-const int powerpc_num_macros =
-  sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);
+const int powerpc_num_macros = ARRAY_SIZE(powerpc_macros);
-- 
2.49.1


