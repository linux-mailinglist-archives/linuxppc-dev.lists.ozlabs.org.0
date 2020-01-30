Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2014D66C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 07:33:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487Vsx06XRzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 17:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZCGHTqe/; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487VrR6qM3zDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 17:32:07 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id z124so1096654pgb.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 22:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aiIv7BR4lBXqbaAn948s6C/PVELDA5YM0WOpkGkhJLg=;
 b=ZCGHTqe/rYgwMK558BvTKgbeGblyE9d3yhsFSTS3djgrqeCh4/tEsL6khA02oEXUTd
 MD0UtQBCA1wN/AWqX3dDgMWF/elPh4J2K0f/RecxGiUQVMEf9KpJEF3AUHkNI/T9SsYW
 40g8m0OM9aUctCvDX0jxzRjZkyDCWbYa2Jsq+uyT2DQkbfUqJ+hg62wI2SVhphtX6atT
 X9LNWob6Au5gTMQ+djIzhHWaercvJhnTODoYZOW5pK/hsfcgkFmYJJCM9W6yEjbgJs97
 HbWh7P0PHoaIpbpUQ1t5mUvMRbqT3FLfjr8Pd2YJnsBTd7oEtcjDeCsSbD5e/JANEZwi
 UOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aiIv7BR4lBXqbaAn948s6C/PVELDA5YM0WOpkGkhJLg=;
 b=BPHcjrpDjV6lONrTp6kiHmfgY1Yjl/PfYyaB1iX0la/M8SdkTVxRkHT275ctsgs2iJ
 fV7CkEJT9/PCkp8L07SZGJDgQBA176Y3T0ff0O41ET2XLjOW6roz15E01SCFrdNKX0/M
 4FJrW4eiiYpoFIHgD8FbTyP+KW9zAGiglHWPUuJIhZpg+h1uL5/XTukXuSWUB7zv6KRI
 0I/SVY5uI3Jggs5I0exi1zVUQRZc0sJP6gmJD70bluaRmkUhZKtWiiSTRsBjzyBUX4wm
 LJXcQxJzpyHOyDADueQoAEnb2hzcuUwf6Iq2mEtgfQOMLrDEZrWxwwoadvjSYJXig/B8
 dzCw==
X-Gm-Message-State: APjAAAVNkny7efph2Zy5L7ESNTNizvQiTQm6h5kpzFB1Ww7dwIf44t4c
 LqHiVVLvMQ5CuYzXV9PbnBvAbyMW
X-Google-Smtp-Source: APXvYqzwGKggVfCruyuqqX8wuzfFJR7Sj4CH5j1o5rBiOd+aYMJHJRY8mDn/Edctx/pGNGxsUklQ+Q==
X-Received: by 2002:a63:48d:: with SMTP id 135mr3103650pge.66.1580365925728;
 Wed, 29 Jan 2020 22:32:05 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 199sm784100pfu.71.2020.01.29.22.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 22:32:05 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] pseries/makefile: Remove CONFIG_PPC_PSERIES check
Date: Thu, 30 Jan 2020 17:31:53 +1100
Message-Id: <20200130063153.19915-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200130063153.19915-1-oohall@gmail.com>
References: <20200130063153.19915-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The platform makefile (arch/powerpc/platforms/pseries/Makefile) is only
included by the platform makefile (arch/powerpc/platform/Makefile) when
CONFIG_PPC_PSERIES is selected, so checking for CONFIG_PPC_PSERIES in the
pseries makefile is pointless.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index a3c74a5..c8a2b0b 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -29,6 +29,4 @@ obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
 obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 
-ifdef CONFIG_PPC_PSERIES
 obj-$(CONFIG_SUSPEND)		+= suspend.o
-endif
-- 
2.9.5

