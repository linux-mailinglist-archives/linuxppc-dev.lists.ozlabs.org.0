Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F512BB95D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 23:47:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CdBXC5DBGzDqP9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 09:47:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=36uw4xwukdfoegj3g8gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OpXQz6xC; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CdBN42YZQzDr09
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 09:40:44 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v188so13383833ybc.19
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xf0za0EZfzwKq0aLgV3vktclCGzK3lvHX8ldWBW2urc=;
 b=OpXQz6xCeDxK2yoLHMopYhLuTh0cTAkov0FdkdKhhcBiIO6QnUSeDbIyT7oSDjctMA
 dDI8pQfeiLPBYgjgWl6lQXXwsaNVUH5RU13NZAwli5MUObQD2U+d3FCanPFbzgWMEMku
 IrV00RjLZTu0jYlpm1bh54ZZZdwERYzCMBGcJpNN1qJ+kWflbRE2Hc84p3gjd0iejbmf
 7t/O3K9gHfteXEKjVl8wa4FzJOidOsh9Bc3yRD416TNfXkXpCXHL/wgsuIX9X/E2ErMq
 xSOPN7bZVl7K6v3AB5uncJL7i7VVKOZW9+1N0ZPqJuZ5E/Y45RB+SKBcpWLWAJbJF0jx
 wlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xf0za0EZfzwKq0aLgV3vktclCGzK3lvHX8ldWBW2urc=;
 b=Xw4GRQoQbiORFO8Aa5nOpRIB3AaN0obj3YHLdLJJz9sYg7bvUGfB9mlHnv/H7rELI7
 jtjRpp91SnATA4vbwElYbOTOXQhuxPoFoBCE+FxvebaNRJZXo1+ifr/q+50FwTrE/mr1
 +fFTPlM6rv4eyPoDyJ1uhlzbD3QFyB6rdmC7y3J7H3ZvmPa57j0ASlx0EuKdRDdr/sFd
 UvBQnJA/rzuqLZkqu/P5T/eGtGmX465XhhquzjdItmTi0qyoFdPoh4PIsrTXM6StAp/w
 7B5VAjCkvFK8AJ3ce47vpvtc4UM28oIIB/yR+3OUe6bdD4MHwQMjj4+BlWITH6/IzwKt
 wasA==
X-Gm-Message-State: AOAM531jxK8BTuqgdEsnS0vd8xlGCTQtSpgoHYLP1c0yWnr4idKMwgsW
 Te9BLPmfC5YjH88mNcvQhJURvtyU
X-Google-Smtp-Source: ABdhPJx88nZRwG+JCdZeO/hGPopVZrm65ZBdr1oIhToPWkHoHMvd73EDqhxg8C6eF1lKj+O+Xg7NRZq4JA==
X-Received: from fawn.svl.corp.google.com ([100.116.77.50]) (user=morbo
 job=sendgmr) by 2002:a25:a3a1:: with SMTP id
 e30mr16069828ybi.264.1605912041900; 
 Fri, 20 Nov 2020 14:40:41 -0800 (PST)
Date: Fri, 20 Nov 2020 14:40:32 -0800
In-Reply-To: <20201120224034.191382-1-morbo@google.com>
Message-Id: <20201120224034.191382-2-morbo@google.com>
Mime-Version: 1.0
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH 1/3] powerpc/wrapper: add "-z notext" flag to disable
 diagnostic
From: Bill Wendling <morbo@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Fangrui Song <maskray@google.com>,
 Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "-z notext" flag disables reporting an error if DT_TEXTREL is set.

  ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against
    symbol: _start in readonly segment; recompile object files with
    -fPIC or pass '-Wl,-z,notext' to allow text relocations in the
    output
  >>> defined in
  >>> referenced by crt0.o:(.text+0x8) in archive arch/powerpc/boot/wrapper.a

The BFD linker disables this by default (though it's configurable in
current versions). LLD enables this by default. So we add the flag to
keep LLD from emitting the error.

Cc: Fangrui Song <maskray@google.com>
Cc: Alan Modra <amodra@gmail.com>
Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/powerpc/boot/wrapper | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index e1194955adbb..41fa0a8715e3 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -46,6 +46,7 @@ compression=.gz
 uboot_comp=gzip
 pie=
 format=
+notext=
 rodynamic=
 
 # cross-compilation prefix
@@ -354,6 +355,7 @@ epapr)
     platformo="$object/pseries-head.o $object/epapr.o $object/epapr-wrapper.o"
     link_address='0x20000000'
     pie=-pie
+    notext='-z notext'
     rodynamic=$(if ${CROSS}ld -V 2>&1 | grep -q LLD ; then echo "-z rodynamic"; fi)
     ;;
 mvme5100)
@@ -495,7 +497,7 @@ if [ "$platform" != "miboot" ]; then
         text_start="-Ttext $link_address"
     fi
 #link everything
-    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl $rodynamic -o "$ofile" $map \
+    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl $rodynamic $notext -o "$ofile" $map \
 	$platformo $tmp $object/wrapper.a
     rm $tmp
 fi
-- 
2.29.2.454.gaff20da3a2-goog

