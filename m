Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C1195FBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:30:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ptlQ0FgMzDqDL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 07:30:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=qfs4rat9; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ptg65gNyzDrJq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 07:26:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nNW+VZqPIkkd9WE8RQm9Ys7RYPfSjlZQhX588ZRLppo=; b=qfs4rat98Td92Hh+idGxqckMgS
 +cfehCqB8uuC2Tb017HEz3EybwqORcXfgiq5GZW2W16On+JnoSmWDxp7PGYQ1+8lv8FNiazjYfOBd
 taDCCpfAJYXzGRV67dd+xwFZz5csKku2fLtJAGJW4raah39B32aC3dJWaOWzGS8OnEL0OC5xQ/rYV
 sDKV7HbSFR4iuojRycvREcVZwqXexIWnBbdgDpOtXx7cupMuB//6Jk64Y1yBi5aPck0mYp4UfAiNw
 mZ1dSbcNLLvpY4y4ZwJkQicsZJUYPGoJC4ewVHAWFutKJt8EYfNeBov9oBekNEm5+ZmVReqQ0NXSK
 ALJ9hCxg==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHvYd-0003It-Nu; Fri, 27 Mar 2020 20:26:23 +0000
Message-Id: <e0dc92ba82a993c845f8d2bf3ace7465ef5ea996.1585340156.git.geoff@infradead.org>
In-Reply-To: <cover.1585340156.git.geoff@infradead.org>
References: <cover.1585340156.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 13:07:31 -0700
Subject: [PATCH 7/9] powerpc/ps3: Add check for otheros image size
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 20:26:23 +0000
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
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ps3's otheros flash loader has a size limit of 16 MiB for the
uncompressed image.  If that limit will be reached output the
flash image file as 'otheros-too-big.bld'.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/boot/wrapper | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index ed6266367bc0..1dfd9fd929c8 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -570,7 +570,16 @@ ps3)
         count=$overlay_size bs=1
 
     odir="$(dirname "$ofile.bin")"
-    rm -f "$odir/otheros.bld"
-    gzip -n --force -9 --stdout "$ofile.bin" > "$odir/otheros.bld"
+
+    # The ps3's flash loader has a size limit of 16 MiB for the uncompressed
+    # image.  If a compressed image that exceeded this limit is written to
+    # flash the loader will decompress that image until the 16 MiB limit is
+    # reached, then enter the system reset vector of the partially decompressed
+    # image.  No warning is issued.
+    rm -f "$odir"/{otheros,otheros-too-big}.bld
+    size=$(${CROSS}nm --no-sort --radix=d "$ofile" | egrep ' _end$' | cut -d' ' -f1)
+    bld="otheros.bld"
+    [ $size -le 16777216 ] || bld="otheros-too-big.bld"
+    gzip -n --force -9 --stdout "$ofile.bin" > "$odir/$bld"
     ;;
 esac
-- 
2.20.1


