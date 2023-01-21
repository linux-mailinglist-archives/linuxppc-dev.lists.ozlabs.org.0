Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A412567658F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 11:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NzX2Y3xVVz3fPF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 21:01:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NbJjkZ7P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NbJjkZ7P;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzWyh6P9Yz3cFm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 20:58:20 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id k18so7350510pll.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 01:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE/QrZVua/oHdeAS1hpKjtYLTBvAE9JdoecFn0UJ3t8=;
        b=NbJjkZ7PEQdowKNo0JaCxfHi/u55zMSu/FZlSWFhJxKZP+HH4b9vnAuLTjIGPOPP4U
         IqprlwI6jFzWSr9nsxkiQzM7gJoFoMTRUvOms2OENCQ7D65T3ntEo6NejGcnDi9H5GgH
         HtEIvtUUK9/YweVwzC+D+9Ee6p6gm0oR/v5iU/ac+V21eLG3mYS5CgACeeCcJ2BZi0NL
         pcmiTftVqUOpOE2S2hyxO4npxDAW7cq3vLSN/0+GU41n4PIxTHGIVhdsu5RZUh3vb+n/
         QwhZG92Mmhd6Pk6VOZWgC/5qYdECfuAnnvZ9iKWVw6fBfAZMUapzAHzbw7/AC5D8Mc3K
         TZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE/QrZVua/oHdeAS1hpKjtYLTBvAE9JdoecFn0UJ3t8=;
        b=mB2oBNVU4nNapLv+olXCDwbxEep4jmDtC1tJNo81j6L/aGNNolp9f5zo1vZzBZJljV
         FntH3iruCEmpjhMjtzbv6dMG84XYLW1AeTt57gUM6YHIF4x8BV9ksxac1Wfjwtb3wXth
         P/x3wzVu9pP3FFjyjV5KCRF0QbqHr84ExwT5daTLiXU9BkDkNXsnoyKWYz1WCjQBgt9q
         j2TO5OmxKiSy+byN1oh907QAXh8hAOpeuCaxV5JrJ6o4vlJTaWJz0X2McC19DOpW+47a
         igwvtlzs8yS1cHSOTCpWBd/xw101TUqln8zO5Yd/7LuEZPNF0PHDI0DPOck1lNvrIq+m
         xRVg==
X-Gm-Message-State: AFqh2koEsoNrWCRzuMZFBK+YQqvVSKLScNNQmDz0zBviC+zhbi+oFS2b
	lkZm/nIJnCyk7jfTnCCmCm6KuEzpQIk=
X-Google-Smtp-Source: AMrXdXsC6PTR3xYxDvUQ9g3GXYAkCb6GS2AuvJxSjjuEjh8X8UE2yzJZ4XA3mtc2OuPS5Nl8pMlHcw==
X-Received: by 2002:a05:6a20:8c26:b0:b5:ee8a:9a with SMTP id j38-20020a056a208c2600b000b5ee8a009amr18317789pzh.44.1674295098387;
        Sat, 21 Jan 2023 01:58:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id r33-20020a635161000000b0046f56534d9fsm23733539pgl.21.2023.01.21.01.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 01:58:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/32: select HAVE_VIRT_CPU_ACCOUNTING_GEN
Date: Sat, 21 Jan 2023 19:58:05 +1000
Message-Id: <20230121095805.2823731-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121095805.2823731-1-npiggin@gmail.com>
References: <20230121095805.2823731-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cputime_t is no longer a type, so VIRT_CPU_ACCOUNTING_GEN does not
have any affect on the type for 32-bit architectures, so there is
no reason it can't be supported.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7683788af8cb..51ec10e951f7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -257,6 +257,7 @@ config PPC
 	select HAVE_STATIC_CALL			if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
+	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
-- 
2.37.2

