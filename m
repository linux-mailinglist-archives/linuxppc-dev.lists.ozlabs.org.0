Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F374EA9EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 10:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSNm73K50z2yb5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 19:59:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K2+PYaWK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=haokexin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K2+PYaWK; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSNlX0nz7z2xWm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 19:58:47 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id w21so14252592pgm.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0p7oGF78pyLa31k+lawytwlQ6xJZv39195qO2yxlauo=;
 b=K2+PYaWK8Vo/fMgU1C8OyENnamxtca8wdCDB6JWx2fWeROG8BEEiPXjFOYYV3fF7xK
 iGvj6MiRNX1r8hQs+lXF2xaH+jvS6FXsptyGRjPDwNweAfQ7pkeLaVcZbo28UYQrr5yu
 9ryADZmT2cy+4TRt7Uta9gjk2QYqV8mip1kYxDfG2rb7W5wS5oeWKNhvdhtQJGiUe+q6
 ORs/vCm9qHOPIjR1Pu9cOW3nPKllXxTPouC/MudOKT/G6ks2f2XMAxsJVkAsS1B4qMGB
 FnQBYaOWbVI+FJBJ5VHCdDJJJiFfcIpvrMI7lvVY2xBc/vWogw8grUfH1I0QjIxotE3+
 oLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0p7oGF78pyLa31k+lawytwlQ6xJZv39195qO2yxlauo=;
 b=UhgB+CfZFe4FYLMBSX2BhWAbehRsKkmJbtkevj3kyGbFW0t8jjjZlA2Fpaa19LjzN4
 G9pWjNO+B9AVWA4xBtmCAruvuB9ag5dyLFBEitMgWZMZRLuiD58kDCLnNFRrqbchWLZD
 8wgl/8ri93Ocvv6evdD5XCN7s3H2IugdVsxH226EWxk7wXNFUf1Yi9ZOFU2ANi9EbsOW
 UyT48KDyMfw5riKiLy7xh7G+qSaIQa5380NmzeXAMVY/9Qc2HOo4b68CP0hOF3IS+xLh
 LBlI52PSoF/mSIMaxg7s9QdmxsB/pvw+XJSf3oOBwmep8eOIcg5Tp07feOmA/QsTaPVu
 HJHQ==
X-Gm-Message-State: AOAM532iorX4n6tiEN5GuC6Q7tGPIDOWXROqF8hdVivAyDlI4BDkv0Ok
 MykdowL7US2FgZQuixvZMEkZHbMbLgw=
X-Google-Smtp-Source: ABdhPJwy9+nzrEzWM/jLOETpcDFpi3F+Zv9M473GSTo5V6TmX09Do5Shc7uLCSlnTXibz4hOjf/BjQ==
X-Received: by 2002:a65:4c0f:0:b0:373:f389:b7e0 with SMTP id
 u15-20020a654c0f000000b00373f389b7e0mr1262219pgq.411.1648544325590; 
 Tue, 29 Mar 2022 01:58:45 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com.
 [147.11.105.123]) by smtp.gmail.com with ESMTPSA id
 p27-20020a056a000a1b00b004f3f63e3cf2sm20745057pfh.58.2022.03.29.01.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:58:45 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Export mmu_feature_keys[] as non-GPL
Date: Tue, 29 Mar 2022 16:57:09 +0800
Message-Id: <20220329085709.4132729-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nathaniel Filardo <nwfilardo@gmail.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the mmu_feature_keys[] was introduced in the commit c12e6f24d413
("powerpc: Add option to use jump label for mmu_has_feature()"),
it is unlikely that it would be used either directly or indirectly in
the out of tree modules. So we export it as GPL only. But with the
evolution of the codes, especially the PPC_KUAP support, it may be
indirectly referenced by some primitive macro or inline functions such
as get_user() or __copy_from_user_inatomic(), this will make it
impossible to build many non GPL modules (such as ZFS) on ppc
architecture. Fix this by exposing the mmu_feature_keys[] to the
non-GPL modules too.

Reported-by: Nathaniel Filardo <nwfilardo@gmail.com>
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 arch/powerpc/kernel/cputable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index ae0fdef0ac11..3a8cd40b6368 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -2119,7 +2119,7 @@ void __init cpu_feature_keys_init(void)
 struct static_key_true mmu_feature_keys[NUM_MMU_FTR_KEYS] = {
 			[0 ... NUM_MMU_FTR_KEYS - 1] = STATIC_KEY_TRUE_INIT
 };
-EXPORT_SYMBOL_GPL(mmu_feature_keys);
+EXPORT_SYMBOL(mmu_feature_keys);
 
 void __init mmu_feature_keys_init(void)
 {
-- 
2.34.1

