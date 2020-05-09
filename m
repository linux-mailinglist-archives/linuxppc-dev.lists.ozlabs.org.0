Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8A1CC3EC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 21:06:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KGrz0xbwzDr5D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 05:06:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KGgz0zr2zDr5L
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 04:58:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XOsPFhZvDalAS3vFr6joJg0AJSe60kFvmzO1zvera5c=; b=bvM4gjTnCPJocdDP/UNwOvFwP/
 65iMTbIVG5d6o9lwzwms9d8ITcyhqf5etxXxhuCZ27UPmWQnjfYGJJhQ17szED/Y1129B6Dvl7Hqa
 YaSlgYbL/gZWLRalTmk6ZDQVqAEoLAToVuJ13UsoVNMyNt7w0Y4h5J5YD/t11hT+QLL2EAebEpoW/
 Bt4J4ZSWKeK3TzBaKn99AjO0Ya/6zKZWpKcwQSLlPkJtGb6vvXxzCBW1mirliOtQAl7qmjeKXYsic
 E6uYTXVlhAwbZ2nFoLV1mQWeLVBIOODn0ltufOuFdztZpo0tq+3xBa/js06fWOdpYmpygCPTurVXO
 IxyQVJDw==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jXUgB-0003Dm-So; Sat, 09 May 2020 18:58:31 +0000
Message-Id: <872b6c84a4250ff140e476c62cabe9e56a02b6c2.1589049250.git.geoff@infradead.org>
In-Reply-To: <cover.1589049250.git.geoff@infradead.org>
References: <cover.1589049250.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 09:41:41 -0700
Subject: [PATCH v2 3/9] powerpc/head_check: Avoid broken pipe
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Sat, 09 May 2020 18:58:31 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
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


