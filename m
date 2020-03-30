Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70F1972BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 05:14:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rHc425MCzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 14:13:56 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=DL3XkY0j; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rHYN3fsQzDqbp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 14:11:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=wRWRm3CEbqLmzeRAHx9r3Gy8NemrnOKKUvYYrTRyXvA=; b=DL3XkY0j6bsD9J8IWKFh+U8Glj
 XEDlFFuJ7R5dOSmRhA62g8Vnl2/pb91+IaLPj/3jVokmFY6ZIfLD5iu0LML9YnBykvrpZ4BV90oXw
 6bcCgEnOsDKnSkaBu7NxkU3foxQ/bwtd/Kfrd2wyyDvBacwZBthMWwLID7mpj+5k/86S74MLf1WuS
 qpcbif6zY17dVZHHGCLlQww5bGUrfVi8yIO+3Y1kA5GUl638mKOmjWlGMMmsGOQewfKVoDDMuVArc
 WwTgESQW4Iz5L/Ix6O9m7luAWTC2oXXEg3/2ZHeyoKBis9zE4ZA4GVZLhc8qUJfnczHQwzUFFYwpq
 Y/zZrz8g==;
Received: from [2602:306:37b0:7840:b51a:dd8c:5d76:65e]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIkpq-0002u4-Bh; Mon, 30 Mar 2020 03:11:34 +0000
Subject: [PATCH V2 7/9] powerpc/ps3: Add check for otheros image size
From: Geoff Levand <geoff@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1585340156.git.geoff@infradead.org>
 <e0dc92ba82a993c845f8d2bf3ace7465ef5ea996.1585340156.git.geoff@infradead.org>
Message-ID: <1bd453f8-fbc0-54d4-2754-7b190a5b954c@infradead.org>
Date: Sun, 29 Mar 2020 20:11:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e0dc92ba82a993c845f8d2bf3ace7465ef5ea996.1585340156.git.geoff@infradead.org>
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

