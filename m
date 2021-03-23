Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E1B3454A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cr62RR7z3cnL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:06:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GqUpKfE+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GqUpKfE+; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CmY3ZGSz30G8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:41 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so11432945pjq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ig9Ay39viYeapYXuSo6uIf6+TrFfALVUiHXjNAwZBl8=;
 b=GqUpKfE+k22T4VuGRSYX0R8lhDX2hGuJ3WusYa9g7r+0QVceCKe+50oXzHwBFtHtAE
 LqGc0gr5Dq6bNNd5MqKAyLHf0BH4wjzuLRuRRyXiLLi5i0rn79LTVcUUKD5CcQsoNHHY
 mla30zWznzsNZifbJVVLhYQMv1/RlJ2SNXIslyA9ZvyRJb/brRf5gOFp4Sqe7ciDoTDO
 ocoNhpUAqSCJLBX7skBuYJw9rIYfbvrLCk7bINNC+sboEhDvxOKRnKHCC/5Z1JOYZFAr
 s67qHCwO35XtN7dT4VWMhTcxV5AFe3SsgyhEdovqQHuOPWytUjFLUSsQcd2lXaZRYPWn
 67Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ig9Ay39viYeapYXuSo6uIf6+TrFfALVUiHXjNAwZBl8=;
 b=YNx4QHNhUGDYZnEvRK1oBOCV2bg62iM0x3jJn23lkpoI5okntFGyFSdk0vLZGa32cF
 LuEutQ6m0Os6jbNbcekA3MDxs7gglU6ekuGcoOha+JAuO8AHwOgryps74AStEuue7vGo
 rElCHok/7MCMSFCHVq95tl+uxBclu9RIdmHG2aSo3ZYoyKwpmJNkdo/T3e6+hm+NPg6T
 ur7KReNaS6e4IhUeqnaj6bbTbEaHtTXHa7tPcvVhEFWV2+xOQLxwQQ/zH79HJnpgEwhy
 L1PYKDiYgRTjgR/Yj4s6OobRl1/mmatVoNTHP1DH6/QjHlpu3DLXDvz6/O3BMsglDTNM
 LKiA==
X-Gm-Message-State: AOAM530LE0L3xTYFvQOU5ga5k7TdZCDcdRuhCfKOIJmkOlWWqB96NR3z
 CZvPMvv9JkoLhDwJ1f++jyE=
X-Google-Smtp-Source: ABdhPJy/wcnQr9WSn52efZDkznWF4y+UCQZKiwB7oVTMlEKIXMj/jyW39aHj/uAxRgSrYzYStwZ+uA==
X-Received: by 2002:a17:90a:2b4a:: with SMTP id
 y10mr1750162pjc.143.1616461419241; 
 Mon, 22 Mar 2021 18:03:39 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 07/46] KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n
 default hcalls
Date: Tue, 23 Mar 2021 11:02:26 +1000
Message-Id: <20210323010305.1045293-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7cfaabab2c20..7bb4222729b0 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5401,8 +5401,10 @@ static unsigned int default_hcall_list[] = {
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

