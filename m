Return-Path: <linuxppc-dev+bounces-7302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AFCA6D10A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 21:31:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLSWT6RCkz2yYf;
	Mon, 24 Mar 2025 07:31:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742757089;
	cv=none; b=fX/rn65Z8v7iIe5SZ6GAE4g/TqmcV7cFXTwIcHM89u+phcWDAV9qnIrSfQXsSmdSCFUP0oYi4CvqVWbYUWvPTRhVF6MmXVq6VVl0vyWEvblo5LAf8JmdKteZxm7FlQtE/1UyayC+Uh1Gb1YXurIuKp6nwIJbGrjTL682e8scVEVjyU6OmXR7s2A8pYIVznzjWkiqKqM3H334aHC7BokPEvcGJwiEUKMOy8bvi2+ahJRJ3zRvI6SwOkD8RUeC7zARZiDW48i+I7rJVNMwG8MpnrQEm7KqdRtU4EyCJAq664VeO4PO845b8LllBFyaxQzWVRcvI8jDwM7vOx3wJPGgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742757089; c=relaxed/relaxed;
	bh=k2UXDREX7NCT6rzJh9pIz8VRGqLG/DrIFKyvimbffiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNnS45EXv2gv47rRGtGLWZ0RhCSUoNxAfo40uxiHJD5YCcZhROX+lD+R5Nfrwa/3ft4tejN4dwhdHsSUWp7naA/4MD4i1J7Vo5X8ScD4cqb96H0YcPBCqpZGIMwfaOOC1eY5izERwh+pzzsZaozAYyOzQ7mFLmIb7mwQ1DVSEg+YYs2LlNUO1RdVpGSP3th+AE9Rhqnl3s/XIax7VGz3jchv4ctA7eV/a/BMTl8AWFpiPxDx+clXiK+UDhdn8BsPM786u3t2uGj6dwJqihTN2H12+1lCM9PTfzhky5yrNHm22qwWSIHGAny/TI48rJ4afzUcag8s3sAoFbi7RXQpQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dmOhlouG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=johan.korsnes@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dmOhlouG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=johan.korsnes@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLQlM2LYTz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 06:11:26 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so3837494e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742757081; x=1743361881; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2UXDREX7NCT6rzJh9pIz8VRGqLG/DrIFKyvimbffiE=;
        b=dmOhlouGlHqL6YnMUsexLmGdYVTe/8iA7sTMhQBm0HdVj8mt/AvA91I/muqXESeqsX
         F9dBD4zmK9gHWie4xCQW7tGco6PvNkLFjiCrUYR5vQidMyl972xNoNN1N564VpumvulF
         sWwzbn88u4O9XmmYMeOP3pXs9pueSdz4NLU17tNjicC0rGSlA6cumdFu8560DW5NhTeT
         8AbmaNwnWfiMjnOsJ2JX1nXn89dZqykYac8JgVZw/kqmDaSkW0IUzAG1M0zW63uN34+b
         JTjRAAX/a4ouPdtaBowJfNm1SC8NG9nFseeTxC1XpPNcDRx5IF3JpiSPtg8TP4wlKz78
         nQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742757081; x=1743361881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2UXDREX7NCT6rzJh9pIz8VRGqLG/DrIFKyvimbffiE=;
        b=DT0eyQ+XcCwpUY7Y8IikW9/U/Sj/40D0saDQroZFOvWOWNq3hYTrN3OP3iv98y3wct
         V+kLCQphggbV5Y4O81BbAx7H6hF7IGX6XiITNNpLN8TgobGqfQ78Rno+5Kr6HrnpPKss
         5M0ZZni8Mu/9iz1kXJRUXQP51gCqJJ+UPTUwIp5s1Jttmf1giI9bkNUSupitKNAof+Fd
         opRlVEkrLz8ODvMv8NmhXMk2IjH52riI7fIb88LpTQ7AGJQj6s00GsM+OR6ldUS8v+3j
         oy/cnKTVgdWrZTc2WI9FDlJuYODU0MarLOndrk7IE0WNS7XvjERx+Mh5tExF2yGHOfFv
         r1Ng==
X-Gm-Message-State: AOJu0YyvgocIB/TMqnfJOV9KUZVN7FjvkSGgoJes6WkU6ZtLdwFV/e+x
	C8CNmUAYetLBHeHhgyUTy97lO9H6aLKzf6woMdbsawo2SlQmRKARcsUfEu/oYtE=
X-Gm-Gg: ASbGnctiE2I3laLq6ZIwSo0WXThxq9gmBWP9m+SIJ/VUOiDLX9DHLN6/JBqGvTmnaGV
	KRoV9MJxg9ccwaH9qsD2uJVCps+fMOtfmA6Pmm4yhsgDioALVHY9jVrHe2OGrp7R4KTiSyc94I3
	VXA4U7iDkZe7nxWaLYsu5yQweRGeWgXSapJabH1s7jzsyUMOeIHA3CuB8FI7ddCYnkORr9rBHX0
	gjk5S+5EG8rBTIIJh9dvpyS/C66jJOCgQWkCwjGZ5Q8Z0yfzU9RFzuVMlswLNTrGx10fmlcFOI/
	3qXrKVUwPoVxMoJyfmtFowoBNQQUdMGNhH5/tWyxvBJu+ui5iVDGr5pdOiAFHjl74v8ZWvoPLqb
	i1VXXTWXKsX+zloKIGIs9SHKtbe9/i6AWDJl69xiI06mKDhR/lL6PJ65+GDxclapdZA==
X-Google-Smtp-Source: AGHT+IHEt8V1Ivgl9FvA7bVKb5eP/O06ebVpeeumRBqq7MHpg+hehnYl3kYEYuf0dv7BuuXK3fURSg==
X-Received: by 2002:a05:6512:68d:b0:549:8f24:b617 with SMTP id 2adb3069b0e04-54ad6470ad5mr3594493e87.4.1742757080119;
        Sun, 23 Mar 2025 12:11:20 -0700 (PDT)
Received: from yocto-build-johan.c.remarkable-codex-builds.internal (122.96.88.34.bc.googleusercontent.com. [34.88.96.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468948sm862482e87.47.2025.03.23.12.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 12:11:18 -0700 (PDT)
From: Johan Korsnes <johan.korsnes@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Johan Korsnes <johan.korsnes@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] arch: powerpc: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX
Date: Sun, 23 Mar 2025 20:11:16 +0100
Message-ID: <20250323191116.113482-1-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.49.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This option was removed from the Kconfig in commit
8c710f75256b ("net/sched: Retire tcindex classifier") but it was not
removed from the defconfigs.

Fixes: 8c710f75256b ("net/sched: Retire tcindex classifier")
Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index ca0c90e95837..b8eb158a80fd 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -253,7 +253,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
-- 
2.49.0


