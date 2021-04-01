Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A313515D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:07:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB63n4jTkz3cD2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:07:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PqNK0pVt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PqNK0pVt; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6011pyXz3c1B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:01 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id k8so1705451pgf.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akE4Bh1LcVOdXlv04bpZUL91EDUzw6Ofnv5OK5AoVW4=;
 b=PqNK0pVt7bPqUnrKo8LLjI9pB0RsY2a1c7s/OXW+RZzwrUkItn02jrF4xZM27CdTMj
 R8naDz+Ld535BrKABlCh1n61+lJkegIbeDRPYAClGkb6VDGaQWY4euWFzvu3xb+JAUXM
 Z2Yh4Q1oT/wlukteOCuuC9qo3hLNndhepc4MK/puGOzrjOximNnsDa/88UElk6JCdvup
 huan8wOPV53/F2vPSEhLGJMuzqFx5U6AU5ywze+tLnv2rLSrH3qJsT2t4Q3p8IIj7FQw
 2+2ZBHTD2P074MwXvPdyeKaXw8aYebFe3iPmahErDZsrEgdw+k0x2pKKIA4jor+EKZ3f
 Yxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akE4Bh1LcVOdXlv04bpZUL91EDUzw6Ofnv5OK5AoVW4=;
 b=dojNTPxH4IbCbcmZS89ep7d/GzSnAQncSrov9yMmCEKpdczDvUGDrSE6ik3eqnhtKk
 SLPY6pBroorL662dOkhYmQBc7nyi2s9MWqzWLk3JeDSnFKBDkbl+FPa266xHkQcQU6fA
 jr4aIwMhSLBGH78RgnFceb8HsAe6rQEep1XmlPNDALdWMW22mGB+NTse9tzV71IxNPu9
 PuiynxHEszBNfZMj5roYmPHh8AQAOud+Q+9pwIrpUPiW2tbA7lyZ5KuPkvlhq80Y2bDC
 IyXNgG0dYFEZ0K4Ye2Q/1TjOlrxjlLv4oKDR+r4K3iXzSZaLyCBj2vCh5sRxlpYJNfSK
 ajNg==
X-Gm-Message-State: AOAM532hYcJN6Jo9bo3ULfzv0eT57S+IBR51MEFgitscDMNO2+VZh3oh
 zjD54Y41Vh8JD6HEqLSHHVc=
X-Google-Smtp-Source: ABdhPJy1nERcXRk7g7oDC/QQgNRKAGxmpIwfbGVPpWK/ujVaLR7b8+e0LWqQRrvAiDGc95rL93ysPA==
X-Received: by 2002:a62:2c12:0:b029:22b:2c97:15a0 with SMTP id
 s18-20020a622c120000b029022b2c9715a0mr8114703pfs.77.1617289439018; 
 Thu, 01 Apr 2021 08:03:59 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:03:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 07/48] KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n
 default hcalls
Date: Fri,  2 Apr 2021 01:02:44 +1000
Message-Id: <20210401150325.442125-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This config option causes the warning in init_default_hcalls to fire
because the TCE handlers are in the default hcall list but not
implemented.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8bc2a5ee9ece..ed77aff9cdb6 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5409,8 +5409,10 @@ static unsigned int default_hcall_list[] = {
 	H_READ,
 	H_PROTECT,
 	H_BULK_REMOVE,
+#ifdef CONFIG_SPAPR_TCE_IOMMU
 	H_GET_TCE,
 	H_PUT_TCE,
+#endif
 	H_SET_DABR,
 	H_SET_XDABR,
 	H_CEDE,
-- 
2.23.0

