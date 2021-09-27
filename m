Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B1419F0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 21:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJCDB1SWKz2yfZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 05:21:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dZbo+94n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dZbo+94n; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJCCX6lGrz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 05:20:40 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id b22so1692981pls.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kS8u3k5T1KXA08+OAzc9EUAXo0kiIq8HfbP/aenr9yo=;
 b=dZbo+94nVzqa6PhiObb1saphVxQtRll6AqXxDp6vjbf76Tw8oNJktDWLETGZJTa0ds
 xO9ucCFdhg9o3rwWLsDKuQTCfffL36OaB4W74TFKXUN5usJoxD0MPeItdSCudnOG177A
 yot8wdZXINTzZk4E+RpCy73VnwCfYPFAPQYXaM1Cu1IdhhO7ZwWbWYqJUI08XPBLASHj
 uRJBa6p7LEeLSvoUIiO49Qg9u1rR7gx1Vpik3QHTnZ91k2BKqczwqbyfj1sTQQLf5Mi6
 q8eY/y02lILEdMOzS6QBfbGhjUc3aJWO3YzP0HuBhA5Z5HDxjAQyErWfD7Ep8/BclbN2
 7i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kS8u3k5T1KXA08+OAzc9EUAXo0kiIq8HfbP/aenr9yo=;
 b=QH5OFqJKipYxJ0kD9JROs9eQvIRjsEKd810GRXsNRfRG19k/H3F+45Vkjx36seGKG7
 g97O62O0YPqYbTIk6NxL47LCgKMwlU9rE6e9uSWLXv+9RX7Qw14LmqYa3SJubnzCWT/e
 IeRQG+WmZIOyyt4UYZHrShjfG/h6gmOkJlOHBH+sfXTJ5tb63oWeOEIQTp09L9QKpduK
 stPb+DVGik+ZI3RhNh2pUtxV4+uHuHGqqpt0VRfPRjR9sN34yC9OLW5XrapTQAnYtqIe
 y3QoxEdbj/8kbwPTISNeJTHDCwgNuGirFWKBhhYMC6lVRrd8pzauwpfqO2VOpnb0jRzR
 u2IQ==
X-Gm-Message-State: AOAM532anP8fd0KiP+9vvZluAN3Us+xdUMgNB0zqG7OyAPbjRS3Rao5E
 zBcvtLIbK5n0djIkqvLSfZ2f66c5npDJ7gqm9ve1HLjT39s=
X-Google-Smtp-Source: ABdhPJy/674FVtThOSCXhyTVZAITma+wt/E1md8iTFo+8nDDEO6cGAyoy9t4dtJi3iGifOCR71ntbJUkFiRQorbu3+A=
X-Received: by 2002:a17:90b:1041:: with SMTP id
 gq1mr804156pjb.11.1632770436627; 
 Mon, 27 Sep 2021 12:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QBN9AFNSf3+U4iMhwZx7c69MLk-BtSbVODBEA97ObYWRczbQ@mail.gmail.com>
In-Reply-To: <CA+QBN9AFNSf3+U4iMhwZx7c69MLk-BtSbVODBEA97ObYWRczbQ@mail.gmail.com>
From: cp <carlojpisani@gmail.com>
Date: Mon, 27 Sep 2021 21:20:26 +0200
Message-ID: <CA+QBN9CD4dNdATO0qWqmoCMGAEQwmkp0AK=mbDfME-3HZbK1sA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/40x: Map 32Mbytes of memory at startup
To: linuxppc-dev@lists.ozlabs.org
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
Cc: torvalds@linux-foundation.org, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi,
this is my first patch-test report.

Today I have successfully tested Christophe Leroy's patch.
I had to manually edit lines, but it worked with a kernel sized 9.1MByte :D

used toolchain:
- powerpc-unknown-linux-gnu-binutiles-v2.34
- powerpc-unknown-linux-gnu-gcc-v9.3.0

host:
- macmini-intel, Gentoo cross-compiler

target:
- AMCC PPC405GP

wrapper:
- cuboot

Applied to kernel-v5.2.1-vanilla

Attached I report here is the difference between the original file and mine.

Thanks guys!
Carlo

----------------
Map 32Mbytes rather than 16MB of memory at startup
--- arch/powerpc/kernel/head_40x.S.original     2021-09-27
16:32:04.536000000 -0000
+++ arch/powerpc/kernel/head_40x.S      2021-09-27 16:32:04.532000000 -0000
@@ -38,6 +38,8 @@
 #include <asm/export.h>
 #include <asm/asm-405.h>

+#include <linux/sizes.h> /* hack, include/linux/sizes.h defines "SZ_16M" */
+
 #include "head_32.h"

 /* As with the other PowerPC ports, it is expected that when code
@@ -839,18 +841,25 @@
        mtspr   SPRN_PID,r0
        sync

-       /* Configure and load one entry into TLB slots 63 */
+       /* Configure and load one entry into TLB slots 62/63 */ /* hacked */
        clrrwi  r4,r4,10                /* Mask off the real page number */
        ori     r4,r4,(TLB_WR | TLB_EX) /* Set the write and execute bits */

        clrrwi  r3,r3,10                /* Mask off the effective page number */
        ori     r3,r3,(TLB_VALID | TLB_PAGESZ(PAGESZ_16M))

-        li      r0,63                    /* TLB slot 63 */
-
+//-- hack begin
-----------------------------------------------------------------------------
+// TLB 63 is used for first 16M page
+// TLB 62 is for the second 16M page
+//        li      r0,63                    /* TLB slot 63 */ /* original */
+        li      r0,62                    /* TLB slot 62 */ /* hacked */
+// ------------------------------------------------------------------------------------------
        tlbwe   r4,r0,TLB_DATA          /* Load the data portion of the entry */
        tlbwe   r3,r0,TLB_TAG           /* Load the tag portion of the entry */
-
+// ------------------------------------------------------------------------------------------
+        addis   r4,r4,SZ_16M@h           /* added, hacked */
+        addis   r3,r3,SZ_16M@h           /* added, hacked */
+//-- hack end -----------------------------------------------------------------------------


        isync

        /* Establish the exception vector base
