Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8E139C4E8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 03:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fxj9f1Pm1z3cGb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 11:44:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WW4xgRVm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WW4xgRVm; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fxj7T0YFPz3084
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 11:42:44 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id i34so2810431pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 18:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZkiKtXqsSUWsFPxoaMD52BWVXcB9txjh0r70N9gfwg=;
 b=WW4xgRVmullOrJwODXcaph9gCP7wl4/aB45NW6pjILZwERzHDpOslub+OyR7hv6vhX
 MQF6HrAFrzeiZgWNqLnh7i5L5IUeCDNz4A5ttNpDA19cMy9/mGXcEJT0WbPyaayBmVSB
 bVOuiJ/6Rsgfw8dJqWBlu/YAJYV8e3PSbOsa4f4K9eWKr2Xgo39e1CSlwj7VCjuDyqVY
 S0LwDvr6wJcda9KLJjMBlr2BLG4r6PfTk2tg/qAZCN5xG7q7k/UhBG0CDq4/lfxkpqkm
 0WECU+QAbnudJ7jXiUtvPGGgerN8eW0cwsDgFdV4SroQ2C6/rCsFRueDEuusyXuNkrHY
 BuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZkiKtXqsSUWsFPxoaMD52BWVXcB9txjh0r70N9gfwg=;
 b=GyfxfuKb7WdneGc3GbbiXmcYBOX2GuqWoHjqoKbP9YvCLWvpiaWaxe6ge5lovW0ju3
 BsXRzvG5zXjkFzYWH86zypOxc76kpO9iDQ6uKnMJSL/SBDque9t4vIFqBJ0oaM6v75Pl
 Q32SlP3ILFz2kd5nPwNXq7MJY6IUWofAZ9BnF08hVEnfpgSceGR17gmuYMR4dg4ATamu
 vphNAes2r65KzYqfRxIPG05QKtzBP+ucEeyw/u2KMt7D/ZNSctmFgddnfkzMNKWdyrVW
 Na0ZMLfKXnUqxwW8CeYdxWr2dc6ViWKayjeZpwVcdS/+SRMPtVrclQ+xzf80QI2GU10m
 ozUA==
X-Gm-Message-State: AOAM533EjyTBw8AoPXYas96bGqzqjgYz2hVvqUxdHpYwccPyEqzRKfa7
 aELS6ilmvSJalU+iH9GqyQk=
X-Google-Smtp-Source: ABdhPJyb9zARpDDElBpR8QCJlNYPOxW79PfjHchqfbuf/vsgpBZ0bkxI9OwGFQqJfm5GHitbPo8Vnw==
X-Received: by 2002:a62:3782:0:b029:2de:903d:8640 with SMTP id
 e124-20020a6237820000b02902de903d8640mr7135267pfa.40.1622857362398; 
 Fri, 04 Jun 2021 18:42:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id q68sm5779056pjq.45.2021.06.04.18.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 18:42:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 4/4] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Sat,  5 Jun 2021 11:42:16 +1000
Message-Id: <20210605014216.446867-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210605014216.446867-1-npiggin@gmail.com>
References: <20210605014216.446867-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 16-socket 192-core POWER8 system, a context switching benchmark
with as many software threads as CPUs (so each switch will go in and
out of idle), upstream can achieve a rate of about 1 million context
switches per second. After this patch it goes up to 118 million.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 088dd2afcfe4..8a092eedc692 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -252,6 +252,7 @@ config PPC
 	select IRQ_FORCED_THREADING
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
+	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
 	select NEED_SG_DMA_LENGTH
-- 
2.23.0

