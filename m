Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2D3250B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:48:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmYym715Nz3d9v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:48:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Vv7+ddpk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vv7+ddpk; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYxY4qr8z3cY5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:47:13 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id t26so3819997pgv.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5WGq83w4nIFDwUXoN/x8ZP7+yYqxduj9t3wxP04w6lk=;
 b=Vv7+ddpkzgRhh9YE/LxLdBIQv0wC/AEbSC/bFbZXXuaa04hFdzuuivvmoimJ1F8RgM
 rURFyGBMf3CY46OvGP3qV/6CE2gdfRA25GbmWoxe+FozAoLGbgB9fp16C9oCNU/33VdL
 wj+pt8WStmbUIeAIBonVDS5qxfDUh6GHHnPDyDQDN0TaryzBgAVzyezFz9T+qIIWBE1C
 0/YmFmkKiuwDSSS6/GqRocgRctogoEVWVwQCzxjfax7PfSgfIyMV8sdSBo3x0LntDxE9
 533fO0ezxc+9TEb2vvdEBYzmomcIVNAIO5Sxov/zf6pNYPvKFGeOEiooEgpV5r3oxz7m
 GaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WGq83w4nIFDwUXoN/x8ZP7+yYqxduj9t3wxP04w6lk=;
 b=aJQE/YwwteVvsD/uEUlzT3nWR4KgjRPB/1ZU7yHiJft1zbYItnRiV3y3UTr4c6vPRt
 ovA0ycE180sTtofyUnUSVw1U5kxEteRxlBMIyZZ+1g1lMT+9zjxokQS9Z7OeMennwjAV
 JJtT0nvwt3zxc3iF6Up6Q0unW6MhYWiOxRgFsNTrz+ELIKMbCfZ3kzAvFpp/WyOJNPEd
 r8xNm9IvVgxH6I8RYqy5x0riNAWVX1CsYT45pGM6PWTOtI5gCVGa/++jD71TVaq+LT6C
 sSaxPzvXuF3zxUvL4gaGMh3QdC8ONEoAqYQeOki8atS/xaigR5s6NpbAUBYGWtfZQ8zz
 fUQQ==
X-Gm-Message-State: AOAM533vQ7O/BJYlVKvimFjWEpI6ISqOEMlERMA4SBauyE05QZgIZoqV
 eeoqQUupk4eGZbum2hZ6ax4=
X-Google-Smtp-Source: ABdhPJy4stBtzZ4ef0AuMSuecUMTr51LG8sJdPr/qiCdGBmQ4BlF+bu+U1GlqC0zzjjuUvXb7e/S3w==
X-Received: by 2002:a62:25c7:0:b029:156:72a3:b0c0 with SMTP id
 l190-20020a6225c70000b029015672a3b0c0mr3312010pfl.59.1614260831378; 
 Thu, 25 Feb 2021 05:47:11 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:47:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 02/37] KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n
 default hcalls
Date: Thu, 25 Feb 2021 23:46:17 +1000
Message-Id: <20210225134652.2127648-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This config option causes the warning in init_default_hcalls to fire
because the TCE handlers are in the default hcall list but not
implemented.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 13bad6bf4c95..895090636295 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5369,8 +5369,10 @@ static unsigned int default_hcall_list[] = {
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

