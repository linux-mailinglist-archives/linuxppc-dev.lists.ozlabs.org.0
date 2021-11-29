Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD5460D0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2VlM3qzmz3dpD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zakpdd42;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Zakpdd42; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vff5wkHz3c4p
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:26 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id b11so10971698pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=Zakpdd42DzzLMPtbyLcMfalKmxgxOxZjyEYTM5D3E0eZkoSlOjUofzckWeA/vFd2rg
 0Di/vtwzAg0W8s8qflblEEuBb+TS1LtuNGknlVPtZ3x+0QQUl/X5NQlwM+hORPs/kKpc
 xcRnP71fU9eOwcw0a9Pvp4cbnnFtEAJlGz9cGIm5ZfO+Zek/txHtv6czEsXKT2tr6Gle
 xeb9uVbmcU8ByQxEl7xomov33QqkrT9sLu9EuM4zBVeWUZYK/+g+PfG/DkGgKtNGsqrT
 bdf7HlAOmFMNAOySkf+qZzu+y4S7Kqy07V3Z9eyQa1rO3BAVq8rhmiwzckiS7xcG/lv1
 Rqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=hCID7dydRmXBq+AfFaoXl/Gn8DEgKW0oUxzRBKU9gJP0GzPUjv9Ul4U1t7H4IzM9dA
 Wp5wQQF79Cw8BjqXNAempAM7pwoU9Wx1weV3ZzHChUDZfw82A8rocpIHXpfaFoB+2mhw
 CtcDlY9ChAoBdocr0Q7Lzdt9ZwbNh8Cn58O7gMN/mJhPTP+naHxDiTV2OOBdjGn6mvIb
 T94wQHE2ZOU2FMPNZJbkZ9LZbBFIUR5N9P65+UDgusRKGNGZntQ1iJ/yP0LBmsbiQ6Vo
 UdHRi1TwvfdYtoMBocdICM3+4bfjL2BoU42leTMKLrtZMrr0I4aKCn5IaPyL5JeE2/Yn
 yOFw==
X-Gm-Message-State: AOAM53176E/m2rg/njlY0oodqjWbJpgLaWGHy0AKtmfh+DpA++DqItWV
 16j8p+0eUk4vsgzMxP0MkjStG/aUh9U=
X-Google-Smtp-Source: ABdhPJxT18EmJ3DLKo7O0lKDOZV5WtwXhPPsYs4aaudMwL7R4LEHfGVA4ktBpEtrU8KRgVqlGwGftw==
X-Received: by 2002:a17:90b:21d1:: with SMTP id
 ll17mr34757471pjb.116.1638155304594; 
 Sun, 28 Nov 2021 19:08:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:24 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 06/17] powerpc/pseries: lparcfg don't include slb_size line
 in radix mode
Date: Mon, 29 Nov 2021 13:07:52 +1000
Message-Id: <20211129030803.1888161-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This avoids a change in behaviour in the later patch making hash
support configurable. This is possibly a user interface change, so
the alternative would be a hard-coded slb_size=0 here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..3354c00914fa 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -532,7 +532,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		   lppaca_shared_proc(get_lppaca()));
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	seq_printf(m, "slb_size=%d\n", mmu_slb_size);
+	if (!radix_enabled())
+		seq_printf(m, "slb_size=%d\n", mmu_slb_size);
 #endif
 	parse_em_data(m);
 	maxmem_data(m);
-- 
2.23.0

