Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2A034395C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 07:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3kvq58YJz30Fv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 17:23:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Tq3EIItt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tq3EIItt; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3kvN4xS6z2yj0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 17:22:56 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id q3so9502778qkq.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 23:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fWgRUYEuMUUVkXBcd2OYwANj6EMz7TTGepw25B/1h0c=;
 b=Tq3EIIttN+HTALS/Lx/GIwHllpnrxvs27w/1RaoEyxBrrkiIFNqAPzQodvY3zWnHXJ
 hSN16evPv0o8ANqEDnHeu43njqMf/ZKnFNcQshux7/Bdue3m4qUwZedQc1dEHdUUwwMn
 IOWLpbik2kPCe8KRTjHG2B+i6QJJu+bWTZINxKuKLAHIbm4JaalVgnSsqojT2b8T/T27
 mACmwyeBgVyT6d2BNn3feilfG/S2aDkWUNdMYpG3rCqofT4HDzxHVSOV4RIdZqeAHEOf
 h4Pbxrdt5YYZzNz2X+d2zR895ipdx9Io46hTH5oI5m/HUG/4ukozrxhrwaFPQI2EE9r+
 R49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fWgRUYEuMUUVkXBcd2OYwANj6EMz7TTGepw25B/1h0c=;
 b=Us7dKNzRiI+I2JhUMsxKqWSZfJFP1AefVQHfXx4eXoksFMOccShcx9wbvl3ROCaA88
 HnmtyrH93rmnqJsTS1Dum7YEVyCZ/siBOJvpH0XbzWYrk2Jjgow2MEsEwKKuCcWCRB1F
 Jm550PGFPeQas3ea7L83UqJcUeEOR1FUHCK1eG4GovWgFet8gSYyNvovuTtkGDJiZSME
 E/69I0v5jCgAAiz0/Cy5egW423lUDoSK+Uc1lVQdsRaHijwp5R/2LTZ9Uc+ViJNCjsj5
 /AfTg+mwspT+o+SqJLcxa6pTbvnMMIuHnWZrw5NHGxYOWBsh7oCFDwu0Zn8wzZBLBLLu
 o8fw==
X-Gm-Message-State: AOAM531XFqouLsTAZOCcaumkKbnO3zknAoeZ2PcJLpmZHItFfMxhjoU2
 Koz8wkP/pzx+BL/1txEFrIo=
X-Google-Smtp-Source: ABdhPJx7XfGH8Jy1ODOOB9Mm1UUAZ5d4LPz7WKIupSLPG/SfdW8m7tZ2OZeqX0h0yGYuDu2WvlnVCg==
X-Received: by 2002:ae9:f80b:: with SMTP id x11mr9504441qkh.220.1616394172611; 
 Sun, 21 Mar 2021 23:22:52 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.40])
 by smtp.gmail.com with ESMTPSA id i93sm8673119qtd.48.2021.03.21.23.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 23:22:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 corbet@lwn.net, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] docs: powerpc: Fix a typo
Date: Mon, 22 Mar 2021 11:52:37 +0530
Message-Id: <20210322062237.2971314-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/struture/structure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/powerpc/firmware-assisted-dump.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 20ea8cdee0aa..6c0ae070ba67 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -171,7 +171,7 @@ that were present in CMA region::
                                            (meta area)    |
                                                           |
                                                           |
-                      Metadata: This area holds a metadata struture whose
+                      Metadata: This area holds a metadata structure whose
                       address is registered with f/w and retrieved in the
                       second kernel after crash, on platforms that support
                       tags (OPAL). Having such structure with info needed
--
2.31.0

