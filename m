Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C08195D7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 19:20:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pqrr2h52zDrFh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 05:19:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pqhC3v7tzDrBp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 05:12:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hrdjt8PAYlRcK9St65pLelHqmaCoNpXHENLe8hK4Z60=; b=xT8bN9F/eZJ4RLy/RtU7AxcqSK
 oiC6+E5oPyjgP+iXJQHQmGEhPSq3VZt6ekoOT3X5T5EXjLntG8R9xOLCRcL8A7+EsmbNeILD8Lg/p
 9c/wtqi+GC3qZOtGX/PtdUuXdQKhEaHfYpl8SIiMjSvDMLkvQ8CkTcWZZFZADzFKuz3WT4he1af69
 hM4Vzv5moHWnS8YdU9LrwffLVPEvNNhCAPDPedwayflbZhHJywXKK4DzxVwLSFw/Ig1AWyTGH5TK0
 L5MXrPoSRT7efDS045qeHFkyuPN/s67G7MUNw7HiDjQcqZ9JGAsYwt0DniYmswIwiTdFsiNHQFBh9
 mTCEsEew==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHtSu-0000z8-BB; Fri, 27 Mar 2020 18:12:20 +0000
Message-Id: <b0e8f05d12b2d253a78a33f0c07084aa74eec4d8.1585332596.git.geoff@infradead.org>
In-Reply-To: <cover.1585332596.git.geoff@infradead.org>
References: <cover.1585332596.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 09:41:41 -0700
Subject: [PATCH 2/3] powerpc/wrapper: Output linker map file
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

To aid debugging wrapper troubles, output a linker map file
'wrapper.map' when the build is verbose.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/boot/wrapper | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index ed6266367bc0..35ace40d9fc2 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -29,6 +29,7 @@ set -e
 # Allow for verbose output
 if [ "$V" = 1 ]; then
     set -x
+    map="-Map wrapper.map"
 fi
 
 # defaults
@@ -500,7 +501,7 @@ if [ "$platform" != "miboot" ]; then
         text_start="-Ttext $link_address"
     fi
 #link everything
-    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl -o "$ofile" \
+    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl -o "$ofile" $map \
 	$platformo $tmp $object/wrapper.a
     rm $tmp
 fi
-- 
2.20.1


