Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741C41A40A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 02:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJKb40ggLz2yPd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 10:08:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SXOchIUR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SXOchIUR; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJKZQ2YvSz2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:07:24 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id y186so7998888pgd.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4c+8E3LNnj+fGPh7i46JnKrtOF4Hqb4QVetAaHa0UJQ=;
 b=SXOchIURzjlclAP7lC+wkoMtOSItNYqrU3uprnIURpJDITJKHCSEBZI6F2SD5+RuvR
 H+lg13otN8iK4lRPA2mEa8il5MuhvWHSGh8gw8xDto2uOvAg4JySxQyofXAEPyDnA+pB
 MJLcU1/1QOjpxISxC4yCbdQEHiO7R4tyXJb06ALfH02qGI5IzofxTq3Ct61clshLNqbf
 0FLjUo4E1bXt+pKAVv9o+9Y43GS6A0N0mDFRX2GiFw6C/QlYlVRrpL4CgjQ0GtXpCg6T
 CHnFoqRS9jilhHmKFePYd1feu0CD6y80gVAe3MbeIF8mXfAbFj5zJuO9kKCnAkJW6Txi
 ETWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4c+8E3LNnj+fGPh7i46JnKrtOF4Hqb4QVetAaHa0UJQ=;
 b=gOyhML3PIqRIAPwHB1ub+UP5xiO4c/wxmHys3OIt2DjZhZD0VKLO4aDjYMNeUgHkqD
 28PQv3uIpTWW6hFtO/h78dq+8n4uQB9IvOLewgIhrVLJQvNacfpnZHpszXhtiUj9nl24
 w5ShqUHoNKfPlOqi4OxPUN3DxX0zR6DLEdNZhZB5Ub7fh/SuSPzuPXD+P1NRk9OaTksQ
 6InJHM8O53/XAgwzuni0kS/KF8KTZInAPBGxU/+LTsL+Ah1WSjMj3WDTTy87YudWOV8w
 pN+ivGUA1xY0ll5UPC5ERmwzPN6N+A5y1sobFRrJuRtouJmLmZfkNXLQ2CUobuHQT+Bc
 VwCw==
X-Gm-Message-State: AOAM532ihw/fG4gfyKrcr+7ZMZ4FSrvYJvToqdhUSgw8BZkDFlnnnVeI
 Br8BRK3PwrHLyB1C/cILCzkwYByoCAOyHW0jmEc=
X-Google-Smtp-Source: ABdhPJye7YMVRRutSyVlj+AQWwWyXw849PayoVF3DKcBnCgpn7RuLBHEUOyV9fqt/vLuWpEUjaPoi2wg4GrFXTltMsI=
X-Received: by 2002:a63:5911:: with SMTP id n17mr1971527pgb.177.1632787641133; 
 Mon, 27 Sep 2021 17:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <e2b142ad4a44535d5aa81b0c00c5f05f312f9097.1632738876.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e2b142ad4a44535d5aa81b0c00c5f05f312f9097.1632738876.git.christophe.leroy@csgroup.eu>
From: cp <carlojpisani@gmail.com>
Date: Tue, 28 Sep 2021 02:07:10 +0200
Message-ID: <CA+QBN9Cfd2MKyQ3_0jNzVzPbwZsSAA_XB5kvOe4Tad2_QmB-Sw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/40x: Map 32Mbytes of memory at startup
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi,
this is my second patch-test report.

Today I have successfully tested Christophe Leroy's patch.

Attached a cleaned patch. With the previous one the kernel booted, but
there was a line missing.

I have also tested two different kernels with success

both kernel sizes were ~9.4MB
the Entry Point was always 0x00901b00

used toolchain:
- powerpc-unknown-linux-gnu-binutiles-v2.34
- powerpc-unknown-linux-gnu-gcc-v9.3.0

host:
- macmini-intel, Gentoo cross-compiler, 32bit userland

target:
- AMCC PPC405GP

wrapper:
- cuboot

Applied to
- kernel-v5.2.1-vanilla
- kernel-v5.7.19-vanilla

Attached I report here is the difference between the original file and mine.

Thanks guys!
Carlo

-----------------------
map 32MB of ram rather than 16MB
--- arch/powerpc/kernel/head_40x.S.original     2021-09-28
00:07:27.768000000 -0000
+++ arch/powerpc/kernel/head_40x.S      2021-09-28 00:07:27.760000000 -0000
@@ -25,6 +25,7 @@
  *      Kernel execution entry point code.
  */

+
 #include <linux/init.h>
 #include <asm/processor.h>
 #include <asm/page.h>
@@ -842,17 +843,33 @@
        mtspr   SPRN_PID,r0
        sync

-       /* Configure and load one entry into TLB slots 63 */
-       clrrwi  r4,r4,10                /* Mask off the real page number */
-       ori     r4,r4,(TLB_WR | TLB_EX) /* Set the write and execute bits */
-
-       clrrwi  r3,r3,10                /* Mask off the effective page number */
-       ori     r3,r3,(TLB_VALID | TLB_PAGESZ(PAGESZ_16M))
-
-        li      r0,63                    /* TLB slot 63 */
-
-       tlbwe   r4,r0,TLB_DATA          /* Load the data portion of the entry */
-       tlbwe   r3,r0,TLB_TAG           /* Load the tag portion of the entry */
+        /*
+         * Configure and load two entries into TLB slots 62 and 63.
+         *     TLB 62 is used for first 16M page
+         *     TLB 63 is for the second 16M page
+         * In case we are pinning TLBs, these are reserved in by
+         * the other TLB functions.
+         * If not reserved, then it doesn't matter where they are loaded.
+         */
+        clrrwi r4,r4,10                 /* Mask off the real page number */
+        ori    r4,r4,(TLB_WR | TLB_EX)  /* Set the write and execute bits */
+
+        clrrwi r3,r3,10                 /* Mask off the effective
page number */
+        ori    r3,r3,(TLB_VALID | TLB_PAGESZ(PAGESZ_16M))
+
+        li     r0,62                    /* TLB slot 62 */
+
+        tlbwe  r4,r0,TLB_DATA           /* Load the data portion of
the entry */
+        tlbwe  r3,r0,TLB_TAG            /* Load the tag portion of the entry */
+
+        addis  r4, r4, 0x0100           /* Map next 16 Mentries */
+        addis  r3, r3, 0x0100
+
+        li      r0,63                   /* TLB slot 63 */
+
+        /* Load up the kernel context */
+        tlbwe   r4,r0,TLB_DATA          /* Load the data portion of
the entry */
+        tlbwe   r3,r0,TLB_TAG           /* Load the tag portion of the entry */

        isync




On Mon, 27 Sept 2021 at 12:35, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> As reported by Carlo, 16Mbytes is not enough with modern kernels
> that tend to be a bit big, so map another 16M page at boot.
