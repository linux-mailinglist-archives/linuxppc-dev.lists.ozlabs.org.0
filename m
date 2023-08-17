Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2487077F5C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:54:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HZzLgdBA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRNhl6gJdz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 21:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HZzLgdBA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRNc72Kq4z3c1t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 21:50:31 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-76d8382bd70so13103585a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273029; x=1692877829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZ+Zsa4ZEmXdPvbwBr1YPTSACyU/1n0KQUOcgncJE3w=;
        b=HZzLgdBA/8SEH50ZDj3oHEfSFPvocgYVgAv3TuTxssfPb3/V0hh2OR1DIM66EfLcfa
         UsjSiTEaZaFFhTXX1vyZiQkrq6XmAO6RAYHIr6zdpHG3q3rcNi5pe30IMjGet3b6rhQT
         3S2dXX++c+KVUybFLXY48nq11UI1IM0xiJMFUoa6wLIr4FEap6oUSgPS3ey6UorOrVn4
         6N+NP5pwhNx1Q3n+fkuVVr+Wyvu3YLHZ0O6he9h9/4l8XR7K71XLGptWppEIqIIYtX5W
         AZSdhcvTaX6ZFP5TPnYCRMAgupPqC+b531pzr9911ZikH6L1SDIJZzKqzx1OXvdBqcWN
         fZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273029; x=1692877829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZ+Zsa4ZEmXdPvbwBr1YPTSACyU/1n0KQUOcgncJE3w=;
        b=HcFyT3xOPqw14gXxIPXZzYEcA+bWQHbuupMsXVpFbpzNq3jqqn18dgDpkFMJcRh8/W
         Iw3qWQfplIhaAH2om1IJa9fNvT36jbMSgRdfbJ/7bqEma5T7QU5UCP+y/6di0PlnkGSv
         Y6i2aaENYBhMJwsfEcumfyoBaj+/2JPidbdA3f6fRItcH8eACl7u8d9xJy5qGypWNadc
         cQDuV3T2/Oae7Rc4CVa396Xq1QfQJCf+6nMUhYHbK5SUKft0Ipob+iF6saJTuSymUxRo
         92qOAyVVEeK8EV3Y3QNIyMC3xSQuPyd8Tp76S3jStL1tWTiKzEEK0MfHCuF4twoNcvHR
         Czxw==
X-Gm-Message-State: AOJu0Yzi+XANNmZjop9w/P4MfB38bscG8613kJvpHhvfyfDHxg/aQlR4
	DFdSWWfqkiphAFxQmUvPPNA=
X-Google-Smtp-Source: AGHT+IFbiQSKDSe4gTLJ2bWwz6IBwKBkogxP7lD8diDOPyUlxXuZx7qBz9naiNHemQYMcPnCfjJYFQ==
X-Received: by 2002:a05:620a:2986:b0:76c:b8b0:769d with SMTP id r6-20020a05620a298600b0076cb8b0769dmr6603385qkp.39.1692273029121;
        Thu, 17 Aug 2023 04:50:29 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 4/4] arch/powerpc/configs/*_defconfig cleanup
Date: Thu, 17 Aug 2023 07:50:14 -0400
Message-ID: <20230817115017.35663-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817115017.35663-1-twoerner@gmail.com>
References: <20230817115017.35663-1-twoerner@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 9db5d918e2c0
("netfilter: ip_tables: remove clusterip target").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 1034aeabdd6c..eaf3273372a9 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -183,7 +183,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba

