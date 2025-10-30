Return-Path: <linuxppc-dev+bounces-13560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612EC20CB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:00:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jW3fWCz3dKb;
	Fri, 31 Oct 2025 02:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836415;
	cv=none; b=Q/+B1nZjF6jYUPbQlpqlKGqgsDdh9g7kwisl54svwr2Lg5VSzQn4lEfYNnso9VJPf1Tvmexc8ArZaNHSENgxcG1b0DNBNK8ljO3s8EOlAZDiy6TejBHenSKv95dWfFPoCa8OdzBDEhRF5PUNMmM6OihcAr9yihAPwFa0gVYkfrip7WamywQV1YzHroTox64becqSiLyRzHi3RLZe8xUIEHbXWqfCAmhbPCRWZS+3RbAbtyOB+MmGXFLjPAQmZHFY1H9lYle9FZTg6rE03+M4HZi/G6jcXIR4UofsNU+ERMGYc+ww61YVodlZf1+qwYbeBm+Hi8OSZpf/qxg9d14IrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836415; c=relaxed/relaxed;
	bh=VXEIikwNZXMFCVBFBqxM6HaXHJSUi7LBhkt3S3uocAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A5Cew4fvps5j5n+MqoEFqv9XdHpN/yfixYjaY4an9nP9KmdFN+xvbqOj++YAoMCehd5eL5T8QtoPGwnN13b8ReAXiczMT4ISYWvP5TZTwBYLxRonuIl3B81nNwILJZaf6bMMKilHfPxRbgSlLEZOGPZ3/3ZeF+OJC6Ft1Nw5ZlIyFCWaxR194d4s9d6oEmehWqHZuf9uOVdA8xIzGZjeCamN+SzrQct1mH70rtpRGKsLeb7QRW6RYjFq1C+sS17p8sA38Of2aAy/M1V6tcWXUwi8FT9+pp2YPira9+kT35BpKf7iTAkMH0Jpr2EWt7hXoFObn1Oqpesu7p81OvYYbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ngunJf7Q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ngunJf7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jV6S3Sz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:14 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7a27053843bso1893258b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836412; x=1762441212; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXEIikwNZXMFCVBFBqxM6HaXHJSUi7LBhkt3S3uocAY=;
        b=ngunJf7QDp8d0iQa42TtPCuy9kXd+O51AJY2rA3Qq79Xs8OyCkAPziZSqrKcadYTp1
         arZJRglPHWLZJG2EBaBhtrTgKwd9eqQDuZfXBUrDl/xzGqu6T5BQxYvBiX0Eb0LpR4CU
         dWDLgPiC6eopP+qx6oWRecBW6Xw4ST18sK6ZS/EKT5IDmhotkBDVbFxU7TU7O+7y6v16
         4Z/gqbcDSZ074gYnkfU9oDWk//raZO5YpLaFxX7S7UReWSSOKsXHU2DP1jdT6YIqFaHm
         7DyNFyQ8IJIxC23vcWfz/8E9uMZ53hWTcpi27M4X8VM+uw1piAzW9rqV69SWw2T1+MlW
         ir4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836412; x=1762441212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXEIikwNZXMFCVBFBqxM6HaXHJSUi7LBhkt3S3uocAY=;
        b=Lr2YfX0wQyhrgvBXED9scLe8HmdmsYtPasRBgj4Hy6XyFLHNVulBXFrVO2Ft62zCf1
         6FFbqJqHeHC5Ur3BKCmr+995k79j2d1UHZ5PIX+JqMZIoh8LNlDPKM+Nz2g7bP2q1dUU
         SG6xgPpR3ejKWz5xEmzqM+KQiDNrmAD6pPXPXb6dPnyaCmgrmrtYo3Rqr5eCjUV4PdlQ
         1O67kUsRr4j2gvvUbfkVbhknD65xp/j5b5o1MX3cZIR/utMVSZL7y/ezGvfPuAYorVKP
         42lvq3MAq+Re9M+SluLOfD9DQRXPDlQlb5k7s1w737InyULM3CLUUEXLnI9s8cKXCUaQ
         VHeg==
X-Gm-Message-State: AOJu0YwYp6JfTwpKfK+EJXRbZHScEi62pHAgaIKxKUJSAT4Z8iKzjId4
	Oupivm+mVG9LwM6n3ssHJpPc+sRNWmv/IbdF50WQUq72D+/CdqxhcCE4wdg2FREf
X-Gm-Gg: ASbGncskscmDk/2s7/J94R7RXCGjgAZZRfdtp9ds47vpdxLU75TwyS96L5WOfEuRrCb
	vw3kKfoeuhT24Xes/mrZpbPh3aDrA2bf9zIql2CxPuOxNdGANdlqHbkzR5sYrFjT3i3eZ3D6Kwf
	OIEXzdo/P2fvZz73oPPEhsxyTqU7bDndCVRoVcjO9UBMmJvGNVm3F+09nEgmhSdpc2FfNDdGAem
	E2FUb04MKVHmjvvw/pyUTBYQcdibMQ26VeazEoW7p/zEQRfX5K12w8cwsN5mzOEDtJWwefjF/XZ
	+GHsJ1Uty54PFZeU8+9AORE/65aizSbwsoR2CcEBSVLr+89oQ9ISWhp14dgUPhF7mWtv06EqcJY
	yL8iybziNG7hiKM0sz9g6HMlNIAHLnNSUTxJC2nMjqKlpl55UjCex/ECn4/N0UP5MtB2vGnSB6Q
	+r8ROe
X-Google-Smtp-Source: AGHT+IEhBVavZqrdMQFYnYNNppMqi2XkRUUJU8LiYjHiUeHFqXzK/J/DbjCUVhZtE7MAKpQRTIhnPA==
X-Received: by 2002:aa7:9064:0:b0:7a2:75e9:e745 with SMTP id d2e1a72fcca58-7a4e2cf5676mr7647660b3a.3.1761836411177;
        Thu, 30 Oct 2025 08:00:11 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:10 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 04/11] powerpc/64s/hash: Fix phys_addr_t printf format in htab_initialize()
Date: Thu, 30 Oct 2025 20:27:29 +0530
Message-ID: <4873e9692fc4411099c9741005d218d5e734c345.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We get below errors when we try to enable debug logs in book3s64/hash_utils.c
This patch fixes these errors related to phys_addr_t printf format.

arch/powerpc/mm/book3s64/hash_utils.c: In function ‘htab_initialize’:
arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
 1401 |                 DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
cc1: all warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:287: arch/powerpc/mm/book3s64/hash_utils.o] Error 1

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c99be1286d51..0509c0a436d2 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1394,8 +1394,8 @@ static void __init htab_initialize(void)
 		size = end - base;
 		base = (unsigned long)__va(base);
 
-		DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
-		    base, size, prot);
+		pr_debug("creating mapping for region: 0x%pa..0x%pa (prot: %lx)\n",
+				&base, &size, prot);
 
 		if ((base + size) >= H_VMALLOC_START) {
 			pr_warn("Outside the supported range\n");
-- 
2.51.0


