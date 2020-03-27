Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF54195D84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 19:22:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pqvV2jK1zDrHn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 05:22:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pqhC48lRzDrBq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 05:12:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XOsPFhZvDalAS3vFr6joJg0AJSe60kFvmzO1zvera5c=; b=oQa4pNxckze/2up20vNdPKqevS
 +IvFV+qk1RNnUJNzLLUo43r/SOf/+1UHi3uDef0vMK51bvS4xKaoN0ElN/ceb3OpHRgnk7Ir0BpOg
 llwqvs1QGjhkLibIQMwYZQNLfiSHUy9DtzZu+Kh1FOhSmU/QTDKVo4zMIcGZicBEIvhJH3Y+Jd7p+
 KN8tlQr/36KI0tx7uUywmRK70z6B+8crNj/D1Q1FsWkE3OzIh1d1l6ez9smbANagG0Hq5Myl9osIs
 9k87ivniSeO6hGswnaxaHQ3PTiSRB74KT+1BtUza/WZ3FYJbTJ+CLoe7RQ7rCvIQBFUF+ehA0vvJq
 O993fEpw==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHtSu-0000zC-Dv; Fri, 27 Mar 2020 18:12:20 +0000
Message-Id: <e6fb89a0946dd620f1d8120578744942ca934e11.1585332596.git.geoff@infradead.org>
In-Reply-To: <cover.1585332596.git.geoff@infradead.org>
References: <cover.1585332596.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 09:41:41 -0700
Subject: [PATCH 3/3] powerpc/head_check: Avoid broken pipe
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 18:12:20 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the '-m4' option to grep to allow grep to process all of nm's
output.  This avoids the nm warning:

  nm terminated with signal 13 [Broken pipe]

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/tools/head_check.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/tools/head_check.sh b/arch/powerpc/tools/head_check.sh
index 37061fb9b58e..e32d3162e5ed 100644
--- a/arch/powerpc/tools/head_check.sh
+++ b/arch/powerpc/tools/head_check.sh
@@ -46,7 +46,7 @@ nm="$1"
 vmlinux="$2"
 
 # gcc-4.6-era toolchain make _stext an A (absolute) symbol rather than T
-$nm "$vmlinux" | grep -e " [TA] _stext$" -e " t start_first_256B$" -e " a text_start$" -e " t start_text$" -m4 > .tmp_symbols.txt
+$nm "$vmlinux" | grep -e " [TA] _stext$" -e " t start_first_256B$" -e " a text_start$" -e " t start_text$" > .tmp_symbols.txt
 
 
 vma=$(cat .tmp_symbols.txt | grep -e " [TA] _stext$" | cut -d' ' -f1)
-- 
2.20.1

