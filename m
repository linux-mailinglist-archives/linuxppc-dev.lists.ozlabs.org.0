Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726C67E2D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 12:13:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3FLS3czWz3fJ0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 22:13:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r3/7/ud5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3FKb0Rtdz3cH1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 22:12:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r3/7/ud5;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P3FKZ6Rgvz4xG5;
	Fri, 27 Jan 2023 22:12:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674817955;
	bh=HkSp7Wnxq2Z3nPJKXlXV4u/CrrBr82U1fuR5hzJobOU=;
	h=From:To:Cc:Subject:Date:From;
	b=r3/7/ud5V36zKrAmtTCfwVmgzROzb0/xjiabvifl5GkIMqlr42ipRvsuIlBvlnudE
	 9Zb7GnDie6gehnwg5gOd91zdVUHflPEqcTE5eqPmFXiRyIIicwM49/fNm91yhdCxrF
	 4bUE8E1c/loXBXdOnhUvQit7/YS128Uli165gn1TRoi+5dNzS2PNIZvE5h3mT07Fnx
	 MItsG+O3/UOVBRskGnfI10N1ZFZ3m774e61Bb6+7YS4bcvt+vV3ggPDA58r34hPj95
	 J8F0zrVtM6RBpICd0VlApJ4jZWSpEsS8AQy6z3y8i20guAOSBMa/MxYsVz9j1phAGS
	 HFji5d2+tuuJg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/rtas: Drop unused export symbols
Date: Fri, 27 Jan 2023 22:12:31 +1100
Message-Id: <20230127111231.84294-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some RTAS symbols are never used by modular code, drop their exports.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/rtas.c | 4 ----
 1 file changed, 4 deletions(-)

FYI: I'll slot this in prior to Nathan's series changing the exports to GPL.

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 6c5716b19d69..149742119b6d 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -341,7 +341,6 @@ int rtas_service_present(const char *service)
 {
 	return rtas_token(service) != RTAS_UNKNOWN_SERVICE;
 }
-EXPORT_SYMBOL(rtas_service_present);
 
 #ifdef CONFIG_RTAS_ERROR_LOGGING
 
@@ -356,7 +355,6 @@ int rtas_get_error_log_max(void)
 {
 	return rtas_error_log_max;
 }
-EXPORT_SYMBOL(rtas_get_error_log_max);
 
 static void __init init_error_log_max(void)
 {
@@ -622,7 +620,6 @@ unsigned int rtas_busy_delay_time(int status)
 
 	return ms;
 }
-EXPORT_SYMBOL(rtas_busy_delay_time);
 
 /**
  * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
@@ -820,7 +817,6 @@ bool rtas_indicator_present(int token, int *maxindex)
 
 	return false;
 }
-EXPORT_SYMBOL(rtas_indicator_present);
 
 int rtas_set_indicator(int indicator, int index, int new_value)
 {
-- 
2.39.1

