Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58B1D6290
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 18:22:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PVsv5dDWzDqdR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 02:22:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=AbwQD0Rd; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PVrL0XN9zDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 02:20:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=v6KXTKkKWcH3h/NoWYB6y2itmLIC5aAQ2rZTASG7d1Q=; b=AbwQD0RdzYCPM5Bj9E9AKRvO9l
 SEQChO5x3/akZ82vrcYgc7OogXMzHokTGNW1IdjZta+nPNvOircRCXCY7lsMs7t59S3CEvVmVq7aq
 F1eHth/DEY0dGBB6liIxUJu1q7nxKCNPNx+JwQ/CqXL3aM5Hnr4PphsXQc+fke4LmNKkBbRi2KRQr
 VPiizBfQfYcBgkegPnvzXTrnDVyL0YAHGFPh3O/XGn4tp4E5UA9ufDKSNGD/E1IXBBxhQ68Bjn32T
 QgSue5I/ViXUVvt+XRiCYY/CC5aLKhH9QA+nENcCKVA2YZW3QQEHVLQnZqnSh7YdgZICByBxURrS4
 41/E+h/g==;
Received: from [2602:306:37b0:7840:3026:8ad1:a7be:5db7]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZzYO-0003hx-DN; Sat, 16 May 2020 16:20:48 +0000
Subject: [PATCH v3 7/9] powerpc/ps3: Add check for otheros image size
From: Geoff Levand <geoff@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1589049250.git.geoff@infradead.org>
 <4e8defeb49d62dd9d435e5ea3ddc5668e56fa496.1589049250.git.geoff@infradead.org>
Message-ID: <897c2a59-378e-7c9b-3976-d0a0def90913@infradead.org>
Date: Sat, 16 May 2020 09:20:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4e8defeb49d62dd9d435e5ea3ddc5668e56fa496.1589049250.git.geoff@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
v2: Change from decimal to hex values. Output an INFO message to screen.
v3: Remove the INFO message.

 arch/powerpc/boot/wrapper | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 35ace40d9fc2..d0b5f202c49c 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -571,7 +571,18 @@ ps3)
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
+    fi
+    gzip -n --force -9 --stdout "$ofile.bin" > "$odir/$bld"
     ;;
 esac
-- 
2.20.1

