Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E51CC64893
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:43:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kMPK2bf2zDqdW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=stackframe.org
 (client-ip=2001:470:70c5:1111::170; helo=smtp.duncanthrax.net;
 envelope-from=svens@stackframe.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stackframe.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=duncanthrax.net header.i=@duncanthrax.net
 header.b="g3KFFk7/"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kM6L0rlXzDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:30:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=41hNx7RJF3M/NVaosyif8t4ddhlZec6gxVrDuKDyR9E=; b=g3KFFk7/4Ly48Hiu9KlSjq+2/V
 yR9iPrXXUi5c/HfDTO1IbPKsXls8XtBRFjcShorqoELXRa22SU7KGD0cta7UB45GX+6rY+AUgeI2c
 Crt8HOLG5WZg4qi1b0+hjNxXh/G/VITFWwpU1Hht8dp5+Gu+ios25tGUBIB3ULsmfT2Y=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hlDbp-0004hm-VU; Wed, 10 Jul 2019 16:30:14 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v3 2/7] kexec_elf: change order of elf_*_to_cpu() functions
Date: Wed, 10 Jul 2019 16:29:39 +0200
Message-Id: <20190710142944.2774-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710142944.2774-1-svens@stackframe.org>
References: <20190710142944.2774-1-svens@stackframe.org>
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
Cc: Sven Schnelle <svens@stackframe.org>, deller@gmx.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change the order to have a 64/32/16 order, no functional change.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 kernel/kexec_elf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 6e9f52171ede..76e7df64d715 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -31,22 +31,22 @@ static uint64_t elf64_to_cpu(const struct elfhdr *ehdr, uint64_t value)
 	return value;
 }
 
-static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
+static uint32_t elf32_to_cpu(const struct elfhdr *ehdr, uint32_t value)
 {
 	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
-		value = le16_to_cpu(value);
+		value = le32_to_cpu(value);
 	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
-		value = be16_to_cpu(value);
+		value = be32_to_cpu(value);
 
 	return value;
 }
 
-static uint32_t elf32_to_cpu(const struct elfhdr *ehdr, uint32_t value)
+static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
 {
 	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
-		value = le32_to_cpu(value);
+		value = le16_to_cpu(value);
 	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
-		value = be32_to_cpu(value);
+		value = be16_to_cpu(value);
 
 	return value;
 }
-- 
2.20.1

