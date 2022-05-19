Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B552D359
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 14:58:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3qdz3vssz3bl4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 22:57:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dg034D09;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Dg034D09; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3qdJ4VyYz2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 22:57:24 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso8711562pjj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fmLcmCjg9h5Oz3JC7MKiNxmWuvxrT6emqkVBUzSF+XA=;
 b=Dg034D092Vgvh75Dd5pqYSARxnef9XbBotLOx5fDvi561o0OkVWYWYTv86+ATwAdnF
 818Nb2gmztPEFNcfdB9HrGiGUlU2LMG+yFoaQVRzFWfUPjubqHEpNEO6IQtbuvy4O0Kb
 xDpHjsT0GElVihZzP4aeRF8eDFMDP5aEGZVDtwF6KK/A4DqRk/UrU1Yjcf0lVn3P+yXM
 t2jBotQbcaTDt2zR3FVajblT6XmV8BiquiFVfoQhC0Q/DK501Avcoj26BuozzkNvtAaf
 V6YpptSYfmCtiz6Q5c7wbZ4NJuZrgC8cxloZ+1LrhUH/Ymj5MVkqbOd9cBquPR4DSOFZ
 7TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fmLcmCjg9h5Oz3JC7MKiNxmWuvxrT6emqkVBUzSF+XA=;
 b=D2j9kILyl0oUeEQQKUNqKNuJgq5vupU3zJqc2aJh/VRUmPeukjBTZlZzLX6HUZpBWV
 XKsM6CmvMkPsPZJUo2EcjMrF0aNXCSDfSkbStzUnYgt/lJv+BNLiA8ohFj7oQZ11BsI1
 a3T7YR9z2Y2SgL8RixPiNwzE0aonUmOXsB2IXeWF15b7n9Os9b4bM0HET1RiLEO3RSHO
 CGluY1cH7ygLvSYsnMg5whSSx/CW/YnB145ZdXEa0nA//LbEPOOBs8/tw01WTQTcT1jh
 q1zBCiM0OiT6tlWbxVH5+/690dEYax+28lgoxxkB5yErUrODTIriEyEy4nPk7z0YAVSk
 yqlQ==
X-Gm-Message-State: AOAM533jKnJGfU24NzhH2hXTxX/JY1E2/b7kZ4C1fhA53VJQNuzE4ykU
 j0O4gqYXuaffCLz2QxE4cdA=
X-Google-Smtp-Source: ABdhPJxtWQMwZ6AC/266T8UscsQLwwoBQGSF9Ff4nfzhDUgUdUu47jYo+rYWCnu0Af9ffPQ3qVwV1Q==
X-Received: by 2002:a17:90a:64c5:b0:1df:d3d6:8921 with SMTP id
 i5-20020a17090a64c500b001dfd3d68921mr3866226pjm.87.1652965039940; 
 Thu, 19 May 2022 05:57:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a170902969400b0015e8d4eb1f6sm3678596plp.64.2022.05.19.05.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 05:57:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/microwatt: Add mmu bits to device tree
Date: Thu, 19 May 2022 22:27:06 +0930
Message-Id: <20220519125706.593532-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 5402e239d09f ("powerpc/64s: Get LPID bit width from device
tree") the kernel tried to determine the pid and lpid bits from the
device tree. If they are not found, there is a fallback, but Microwatt
wasn't covered as has the unusual configuration of being both !HV and bare
metal.

Set the values in the device tree to avoid having to add a special case.
The lpid value is the only one required, but add both for completeness.

Fixes: 5402e239d09f ("powerpc/64s: Get LPID bit width from device tree")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/boot/dts/microwatt.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 65b270a90f94..b69db1d275cd 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -90,6 +90,8 @@ PowerPC,Microwatt@0 {
 			64-bit;
 			d-cache-size = <0x1000>;
 			ibm,chip-id = <0>;
+			ibm,mmu-lpid-bits = <12>;
+			ibm,mmu-pid-bits = <20>;
 		};
 	};
 
-- 
2.35.1

