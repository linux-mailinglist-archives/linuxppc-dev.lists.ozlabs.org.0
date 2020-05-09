Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 926751CC41D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 21:26:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KHHD06tzzDr48
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 05:26:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KGh36qjszDr5h
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 04:58:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wRWRm3CEbqLmzeRAHx9r3Gy8NemrnOKKUvYYrTRyXvA=; b=Lel4qLHP8GdYPJMEzF8/AWhign
 seJn1Ya6EyLDGM4fVBJEpW6HM5cz4Z6QwCQzik32n9mhmuN9/XmFJjgCE368jGViHeyEoZ3yMZzTd
 EO+Y/XIDBlTyViQb0I0sDdJSHraJ7vNq9Y9tg+h7HQhWWmoKFy3eyM1CVL1kgYNpihIEElhqR8CX9
 UlFReCSosrXIuD0xr5gISno5z1u6eyC6+6C7t8d4MKRWDtFv6N5OQWpRC+Dh5oteIU7izY0d8wcz/
 gi73BrmFzdXVlcuOQNQVqo6XeuXjsl6GttO3EFTzDDiQFoRe8P0G/EDeXg8xIYmPNVVq0w0RJoyjn
 TImS8wPA==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jXUgC-0003E2-7X; Sat, 09 May 2020 18:58:32 +0000
Message-Id: <4e8defeb49d62dd9d435e5ea3ddc5668e56fa496.1589049250.git.geoff@infradead.org>
In-Reply-To: <cover.1589049250.git.geoff@infradead.org>
References: <cover.1589049250.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 13:07:31 -0700
Subject: [PATCH v2 7/9] powerpc/ps3: Add check for otheros image size
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Sat, 09 May 2020 18:58:32 +0000
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

The ps3's otheros flash loader has a size limit of 16 MiB for the
uncompressed image.  If that limit will be reached output the
flash image file as 'otheros-too-big.bld'.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/boot/wrapper | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 35ace40d9fc2..ab1e3ddc79f3 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -571,7 +571,20 @@ ps3)
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
+    if [ $size -gt $((0x1000000)) ]; then
+        bld="otheros-too-big.bld"
+        echo "  INFO: Uncompressed kernel is too large to program into PS3 flash memory;" \
+        "size=0x$(printf "%x\n" $size), limit=0x1000000."
+    fi
+    gzip -n --force -9 --stdout "$ofile.bin" > "$odir/$bld"
     ;;
 esac
-- 
2.20.1


