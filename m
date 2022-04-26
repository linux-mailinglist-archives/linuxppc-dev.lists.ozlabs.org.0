Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C4050F516
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 10:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knb0H1FZ1z3bYZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 18:39:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TljaTwoD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=bagasdotme@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TljaTwoD; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnYsg4SxKz2xrf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 17:48:39 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id i24so17225965pfa.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 00:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f3CunhxLC3mb3e6UNr+xNX95pgRojNIa+JUKiN4OUms=;
 b=TljaTwoD8SLvOhWYTxOMKfYY4caoHsVCypcKaTpr1fj0K9eavwC4WSrr8G2XGElv8x
 TV9kj4OpypB/7rTo+tSov6Fhh50nCp6quQer1GYUvmSyAxLUzyGDQwX6SW4ddDzFDIOx
 6NB1aq9idon2IZZRJdp8SP825iqygYG2wCZap9YmIKbCh1GtDzbZSPKq6e1EU+rYfu3Q
 DysNrV27KbaIKIkDTDBGraC+yTWaPMQGx3+ki4BKfk4HizU8csvTp0Ol0uCs3egEEEzh
 S0HZdkVei0DhgK4TtYnkwmcRYoRjDjQH2Ho5T6mcxx2QupLuE1DZthyiYYsEEzAdy8aq
 DKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f3CunhxLC3mb3e6UNr+xNX95pgRojNIa+JUKiN4OUms=;
 b=AzLXoHUXxcilz1t8zBQnQQuMsi4hAKk60A/nw7SQ7/KBTwX9z212nOeL5kWUitlBmJ
 i5GsUcVrSFTEGZPyvOpx43PKZstqSGcGk9y7TnRt7GbMlcMW+RafIsqGDTEm57qgrClF
 xIM/ND9MFdEDtwEwPgGK6HZuv8/XUXbBj76SbYYw/gNOYlRNugBvAqpaXdurHmR58wvF
 Uiq6q1d69BvK1uyhxweq2UYZIj8E/NAELftqCnOtfW1XWmRV+V6CikVCpONv+bv+uFFX
 3DclfNW2LjA+Upsib5zsjIdmHUZy/s68d5gUetxhPZwpW254X2Vyvym6JkLPQdNj4qYO
 3maw==
X-Gm-Message-State: AOAM530W57hGQ063wD275ukMXP3GUJ0ZVEscG011bXZ0zapfNxHjI5h0
 KBOln7Ndpu0JzvORXubbUFM=
X-Google-Smtp-Source: ABdhPJzbS6CSlbSiL3g2XpFHPHeAZCURvdyStjTGUIx8QfAcYIPh4pe5nzI/LP307yAagUaH8Nk2Bg==
X-Received: by 2002:a63:3115:0:b0:3ab:2131:5f12 with SMTP id
 x21-20020a633115000000b003ab21315f12mr9658991pgx.0.1650959316856; 
 Tue, 26 Apr 2022 00:48:36 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-30.three.co.id. [116.206.28.30])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a17090ade8c00b001d25dfb9d39sm1845467pjv.14.2022.04.26.00.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 00:48:35 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Subject: [PATCH] KVM: powerpc: remove extraneous asterisk from
 rm_host_ipi_action comment
Date: Tue, 26 Apr 2022 14:47:51 +0700
Message-Id: <20220426074750.71251-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 18:38:54 +1000
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
Cc: kvm@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 stable@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 Suresh Warrier <warrier@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot reported kernel-doc warning for rm_host_ipi_action():

arch/powerpc/kvm/book3s_hv_rm_xics.c:887: warning: This comment
starts with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst

Since the function is static, remove the extraneous (second) asterisk at
the head of function comment.

Link: https://lore.kernel.org/linux-doc/202204252334.Cd2IsiII-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Cc: Suresh Warrier <warrier@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm@vger.kernel.org
Cc: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rm_xics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index 587c33fc45640f..6e16bd751c8423 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -883,7 +883,7 @@ long kvmppc_deliver_irq_passthru(struct kvm_vcpu *vcpu,
 
 /*  --- Non-real mode XICS-related built-in routines ---  */
 
-/**
+/*
  * Host Operations poked by RM KVM
  */
 static void rm_host_ipi_action(int action, void *data)

base-commit: d615b5416f8a1afeb82d13b238f8152c572d59c0
-- 
An old man doll... just what I always wanted! - Clara

