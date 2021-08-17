Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B73EECD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 14:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GprXc5j45z3bZr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 22:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q3G7FtWh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Q3G7FtWh; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GprWx2XcWz2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 22:51:57 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GprWw6dhlz9sSs; Tue, 17 Aug 2021 22:51:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629204716;
 bh=mQUAK/HzO9T7KBftkpjO2ercyE19GP6SIB20HYPz1zg=;
 h=From:To:Subject:Date:From;
 b=Q3G7FtWhjXyb76GKBJog4TQcTO/HKCYw1UVUEAAiV6RRrY8wNkCLUpKgB6sBUm8oy
 maqKUkbvsYm9/KGgOjzPLlKqcyQq6bLjLONvD2dhtelePAKo5cE4EuMI3BHnF9dah0
 RApYxzrqk7KSgKc5v0C9+oXfPn0atjUJojdg/sC1hgeL0MaBxci1Skhvp7a4NFtAmR
 QlBeh/x3NmjnKdCrvYuv5UZfy5wRgP8GMSvFGS/EsA5SGnuXGqzvo9SGfkMqjksAuI
 cnHR+gvAgiqq6OC+jMO2ymabxEVsllklKR8T/PpR/b465UJJO/yGapHNCV1uQVB68r
 AgkFS84AFovNA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/head_check: Fix shellcheck errors
Date: Tue, 17 Aug 2021 22:51:54 +1000
Message-Id: <20210817125154.3369884-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace "cat file | grep pattern" with "grep pattern file", and quote a
few variables. Together that fixes all shellcheck errors.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/tools/head_check.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/tools/head_check.sh b/arch/powerpc/tools/head_check.sh
index e477837fdc58..689907cda996 100644
--- a/arch/powerpc/tools/head_check.sh
+++ b/arch/powerpc/tools/head_check.sh
@@ -49,11 +49,11 @@ vmlinux="$2"
 $nm "$vmlinux" | grep -e " [TA] _stext$" -e " t start_first_256B$" -e " a text_start$" -e " t start_text$" > .tmp_symbols.txt
 
 
-vma=$(cat .tmp_symbols.txt | grep -e " [TA] _stext$" | cut -d' ' -f1)
+vma=$(grep -e " [TA] _stext$" .tmp_symbols.txt | cut -d' ' -f1)
 
-expected_start_head_addr=$vma
+expected_start_head_addr="$vma"
 
-start_head_addr=$(cat .tmp_symbols.txt | grep " t start_first_256B$" | cut -d' ' -f1)
+start_head_addr=$(grep " t start_first_256B$" .tmp_symbols.txt | cut -d' ' -f1)
 
 if [ "$start_head_addr" != "$expected_start_head_addr" ]; then
 	echo "ERROR: head code starts at $start_head_addr, should be $expected_start_head_addr" 1>&2
@@ -63,11 +63,11 @@ if [ "$start_head_addr" != "$expected_start_head_addr" ]; then
 	exit 1
 fi
 
-top_vma=$(echo $vma | cut -d'0' -f1)
+top_vma=$(echo "$vma" | cut -d'0' -f1)
 
-expected_start_text_addr=$(cat .tmp_symbols.txt | grep " a text_start$" | cut -d' ' -f1 | sed "s/^0/$top_vma/")
+expected_start_text_addr=$(grep " a text_start$" .tmp_symbols.txt | cut -d' ' -f1 | sed "s/^0/$top_vma/")
 
-start_text_addr=$(cat .tmp_symbols.txt | grep " t start_text$" | cut -d' ' -f1)
+start_text_addr=$(grep " t start_text$" .tmp_symbols.txt | cut -d' ' -f1)
 
 if [ "$start_text_addr" != "$expected_start_text_addr" ]; then
 	echo "ERROR: start_text address is $start_text_addr, should be $expected_start_text_addr" 1>&2
-- 
2.25.1

