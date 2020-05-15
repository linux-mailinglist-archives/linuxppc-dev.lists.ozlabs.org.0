Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 471281D477E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 09:58:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NglQ2x1SzDr24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 17:58:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BhmW7sec; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ngjk4kXmzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 17:57:14 +1000 (AEST)
Received: by mail-oo1-xc44.google.com with SMTP id u190so249539ooa.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 00:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bigjN7k8uUMkc0zxiOUsK2cR4cXAPw785BxZ6z3IrrI=;
 b=BhmW7sec+K7teUUP9U2oWojZYS0b96A2dkD0nhR0RNmLsaWGJBUT2bgV/Rj0xxHdWE
 xFwFop0Bib3YDeX5V3ml7J8rL9UXdkMciQ10jGNndP+fzPbuVsVN7myljGTEi8fvBVZf
 QWAaC69uYjTUtjOLXM5nV6ObEVInrL9F3CsIiNh7oX8fQESng3oEfdajMBmlxIzbWN0f
 e0o4MQ01VsX/hgTFjbuRXUy9v5ichK3KJn8VHg2g/6+CHyJv7PwOHwuWUGE2TD+3NRIc
 /mzDTJVCd1g8qgBnSilNqBjUBRZqEVpNYFlwEbVggWmSouM4IWwl2VtBYC5oxpTn6EzI
 aPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bigjN7k8uUMkc0zxiOUsK2cR4cXAPw785BxZ6z3IrrI=;
 b=DkHImCmcZZDuOhv/CE37yqmaYlLshHcDfofs++mifD8AP1S388t1j907Z7zDQWHBRH
 GeihuTQgh8mADXjoRmByqwZxQw0zsOp4MnX9UT8yOshnORFvGsV1RvtTMGcvUNoqe5pw
 4/JIvo3UedB0jifUjjQ711x8mStTtS8zfcZKmYaIWtFFhTk6leTt2QHE+aLkGUH8uGBD
 T5sfsBonaKNVRS4AU09iTI1bVMTs/ubeN0b7/7ic2FIFfNbP2shUnyVu9sLZLd8D2Y08
 y0GtV8zPSg0dm3Rj2rnp2G9F1LjwnAicTZGi39AkUNE27GCwYIQWX8r3F7hY6+u7Fah5
 JIiw==
X-Gm-Message-State: AOAM533C6Hfd3ktrBJehiCvSfyYnL2BPay95GgwemsM+q+LF/tetXBbO
 IWwKuGxvngak1ty2monOtbf7BiDecwuTMxFuMgf+NAOZX8Y=
X-Google-Smtp-Source: ABdhPJyykYkwdY4ILYixRVIChUY7jzJ3riw1SdTFeKruCCE3hSfu9ZXzpQvhBSgn6cdxB0jW1p0gosaCi80fAhTsN5E=
X-Received: by 2002:a4a:52c9:: with SMTP id d192mr1509337oob.80.1589529431241; 
 Fri, 15 May 2020 00:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-26-jniethe5@gmail.com>
In-Reply-To: <20200506034050.24806-26-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 15 May 2020 17:57:00 +1000
Message-ID: <CACzsE9r=4iRgg1DcXEAuhJkTXRN3bPZ+3WOLgb0ioGQphMM+Sg@mail.gmail.com>
Subject: Re: [PATCH v8 25/30] powerpc: Test prefixed instructions in feature
 fixups
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey mpe, could you add this thanks.
diff --git a/arch/powerpc/lib/feature-fixups.c
b/arch/powerpc/lib/feature-fixups.c
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -689,7 +689,7 @@ static void test_lwsync_macros(void)
     }
 }

-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 static void __init test_prefix_patching(void)
 {
     extern unsigned int ftr_fixup_prefix1[];
@@ -755,7 +755,7 @@ static void __init test_prefix_word_alt_patching(void)
     patch_feature_section(0, &fixup);
     check(memcmp(ftr_fixup_prefix3, ftr_fixup_prefix3_orig, size) != 0);
 }
-#endif /* __powerpc64__ */
+#endif /* CONFIG_PPC64 */

 static int __init test_feature_fixups(void)
 {
@@ -771,7 +771,7 @@ static int __init test_feature_fixups(void)
     test_cpu_macros();
     test_fw_macros();
     test_lwsync_macros();
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
     test_prefix_patching();
     test_prefix_alt_patching();
     test_prefix_word_alt_patching();
--
