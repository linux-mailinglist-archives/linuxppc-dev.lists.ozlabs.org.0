Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7626AB25F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDfx4GSFz3chv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:02:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mU214HoB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mU214HoB;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXw1s0Hz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:04 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id k10so6899640edk.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKMdOBSHNrQUgSWU9KR0ogbHUm36R1MCQj8zVPpN6EQ=;
        b=mU214HoBD9PhosOri5UfMQjRIEUU9I7ZxXJTaKzr9RcaKrtgXfOrYoiIrC1H/cgukR
         nGR3h38W8sHvMacW4UFXHQQDKZCvOloFPDQjKO9O//zDviZ9mQzevFeYU88TK71GZ7Yl
         D/k8cQsg+q4J+35dqG/OlVnh0MnVnhlAufeVmyjxTwVhOBT0LoXY5y0X7PCib/wU0Eyx
         +QpOr0musHR7lTYq7pSl2aAa1WKY3GvzHvpUUY9s2BqBAo6O2o2u90yeCuiEiCaWos8D
         58spoyzzG9c6tD9JstLQOIUhjogJWxBR9MJwe+mON+OA4NcDB3DdTwAuF12GKQUZRS1z
         /wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKMdOBSHNrQUgSWU9KR0ogbHUm36R1MCQj8zVPpN6EQ=;
        b=sopnnTxAlWYuOsDnK4y5cnKtDQrjspWAwMeYyMudBzRF/SBxZZU+K0PJtYA2YcmzV6
         yP2vEdyoWgcI+PKfLV9GExt6jPCwEHLmo3UhZlgGUobov8yfqOh7+FVywCOMgyYEkze1
         5YvTKCH7kOjKWpOknYnhE8GtAxygDEw+Q0BASY0nfaUZrE9B21xdAdg+Bv5DCk1Itffu
         e489Uhzfjkf/REcuDJ5BM/9seBcTXtYCrTRbzjG+hxUcbcGktKldjFfK1qulIlWitcS8
         mCtC83HfWep+UGE66C3bbEGIkTf81sLhE6443r/IHh1FL+jqy0RKRMjM1y/WJ7nmRmfA
         gzvA==
X-Gm-Message-State: AO0yUKXUjkusb7mX6siu+w0vOBLaUTBCw+iY8EdXmxHu/HY3aP0smcmq
	zBgj2jx0wOsYBuTYviTgbcE=
X-Google-Smtp-Source: AK7set9JmkSQG/Vtrq8HSHi055snSsQ75iU15X3bC3GR1ZZPzMtMJBUaiieJD+9Jtu7PbJHJEQIXfg==
X-Received: by 2002:a17:907:1c1d:b0:8b1:3a8e:232 with SMTP id nc29-20020a1709071c1d00b008b13a8e0232mr10822778ejc.74.1678049820999;
        Sun, 05 Mar 2023 12:57:00 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:00 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 05/10] locking/mips: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:23 +0100
Message-Id: <20230305205628.27385-6-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Uros Bizjak <ubizjak@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement target specific support for local_try_cmpxchg.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/mips/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 08366b1fd273..b611361a760b 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -96,6 +96,8 @@ static __inline__ long local_sub_return(long i, local_t * l)
 
 #define local_cmpxchg(l, o, n) \
 	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
-- 
2.39.2

