Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7902B87CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 23:37:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbyP05kXBzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 09:37:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com;
 envelope-from=3sag1xwukdm468bv808805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=c7vIr04t; dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbyLw1cn4zDqbt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 09:35:32 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id w15so2099704plq.17
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 14:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xf0za0EZfzwKq0aLgV3vktclCGzK3lvHX8ldWBW2urc=;
 b=c7vIr04tr/EOXskts0BeZ8KrPTrhGpS4BCw2qmB7tU57HNSWU/44Vgj82EdVgoe8jP
 ey56i/RYLo6vG7JnywZs1ZG93wo+W1rRL5EnVX9FoP60uGhU3QgM9ilp90VG6FS3GxRh
 tIwXpZWR8RqSqOBOlPeRUtQbJfrwXKCws2xAukcegaeYw53R9Gtg6piu8hmj9rMC6Gk/
 enVV76K5uY3L1D1MwmTPErUXNMZ81FjWY8IWuUSb6vlmisKNEeTi/F4HywGvKtC7rLND
 nAe6bHfhkqSK9AYwnckm04Cf11FPcYG/Bj8ipli81X3HBSSfUWpLR0cpEbTJPv/ybSnb
 W4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xf0za0EZfzwKq0aLgV3vktclCGzK3lvHX8ldWBW2urc=;
 b=gJVo/uDLFI9FK2TvoIgzA/0vtzTPjAHxQIEMtwUWRb6nXOL7wZtOB7qOI3+b8jDpck
 W2TFWOVO3cNoR+k9xVN9m1WQ+cbkwAadnMKMuh1RVtRj9zlShdGJtwT6OeMe1NnwCzF0
 eNCmuiyjuezL7CtpjagQQVINde8qMNEP1taLr05uiqfIWr7+1QYbppm20fEd23VdiZn4
 HHdyUV+aHHBHeKQjWw5NoubjMOIzwbqGzGFVxOlnF8EGkd198vv3FtyIEuwqWlBMDAjP
 waebyS0oKI3NhAlDUzOnA4jSYn1hwWHknJBdY7giESRL1gBtFXwilwI2gQNaKjvuVVEr
 fhCQ==
X-Gm-Message-State: AOAM532Wklq9pdrXpO/52cbRstYVbnojHpINHDjYQNEsuUk84fkET6S6
 92tBjHwUtj7xVpvt+xLrAJ7WTG+6
X-Google-Smtp-Source: ABdhPJy27mmd/3h/9P5sVR8+AzlRZq4hNPgyd4VAQL23Q1sh7UsbcHubrLTfzwRFrsFeYgtpMLYGmtTwPw==
X-Received: from fawn.svl.corp.google.com ([100.116.77.50]) (user=morbo
 job=sendgmr) by 2002:a17:902:ee54:b029:d8:b660:122a with SMTP id
 20-20020a170902ee54b02900d8b660122amr6395543plo.46.1605738929754; Wed, 18 Nov
 2020 14:35:29 -0800 (PST)
Date: Wed, 18 Nov 2020 14:35:11 -0800
In-Reply-To: <20201017004752.415054-3-morbo@google.com>
Message-Id: <20201118223513.2704722-2-morbo@google.com>
Mime-Version: 1.0
References: <20201017004752.415054-3-morbo@google.com>
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

