Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BFA5A0A32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 09:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCvgf1yThz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 17:27:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kctbTtHy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kctbTtHy;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCvg00mH0z2xGR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 17:27:05 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id q9so8087300pgq.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=DeOoCBmYTbzbWF96BhTxAeOzrBznw/YqVHZq/NamK7c=;
        b=kctbTtHyHjVSHiLzpfNpZkNeUVECwQpwgeNOukjxiT4oiTxjYQKUUeGgGWTsEM26GL
         inkf/8v1m4y0j6kTO+4V8eh5eDXjLXOetrTrIWbjEAtz/URG3nTaYDFp2QkCw05LEp/D
         nYpNbrHq/EyqaYoq3REJe4le8AS+L5sPy9vyCHW1co7zS/1FgJ3LH3Wbbg8ZCtVhiC5w
         e98xW0gA7ZxtFw5R2OhkX1k67CyDPZgNtIWQ7s1m/C9PfocD32YoYXwV8ebWYi6VVwN8
         YCm3v/H88abUYYkMBSJECOUjrPhiRvUshpx1xCF4F+SMWN72MOp5K+8h/2wVFLrPX0zN
         0LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=DeOoCBmYTbzbWF96BhTxAeOzrBznw/YqVHZq/NamK7c=;
        b=y1UQ+V4YhA4sBu5UHEYTTM1Ol3eR1bZUIjH6+k1TM+HnFE6VSaGWYWGOGAASwU7ZWa
         akDp/7+WUQ5LPn/j3Mr/1D2cWRptvDF7fUxlCx80pB1yd+dWU0AGBjyWixzMfxPg+DOk
         619VOOUP9TTIKGKi5SywYlE8+TkYjlexlih51h6kwsX4WOatNtVF4t5YjDV8hAIubOj4
         71JUs0FC3srGpBJZSiiO5cZD/zX0gDEl3TrrvAyjwnH25mBr8HY6ELasYkcJ882FnJ1x
         YBVLcA+zGQDQQOHRY/C0EMUUZO3/DFNHDMXrE0/OdVeel/ce0WvhruHh1467vwsRDGl5
         /8sw==
X-Gm-Message-State: ACgBeo30YvJPnddHcLUK7dbSiHjsYDkpSPhu0kot6flfAwQryBh4q0se
	HJGXhQKEws6yx6OwxqYAyyk=
X-Google-Smtp-Source: AA6agR6MH3KeKxwOkT2brR7yFR2ml8cTVD19uCi8UCGmAoH6KDDMnzxwF4Cqs2OCYj+qSqKlNT39TA==
X-Received: by 2002:a65:4d0e:0:b0:42a:88f7:d723 with SMTP id i14-20020a654d0e000000b0042a88f7d723mr2241789pgt.400.1661412422988;
        Thu, 25 Aug 2022 00:27:02 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id z124-20020a633382000000b0042aca53b4cesm6004732pgz.70.2022.08.25.00.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:27:02 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH linux-next] powerpc/pseries/vas: Remove the unneeded result variable
Date: Thu, 25 Aug 2022 07:26:57 +0000
Message-Id: <20220825072657.229168-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: nathanl@linux.ibm.com, nick.child@ibm.com, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, haren@linux.ibm.com, linux-kernel@vger.kernel.org, wangborong@cdjrlc.com, Julia.Lawall@inria.fr, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value vas_register_coproc_api() directly instead of storing it
in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 arch/powerpc/platforms/pseries/vas.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 7e6e6dd2e33e..46ea4e252f97 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -501,14 +501,10 @@ static const struct vas_user_win_ops vops_pseries = {
 int vas_register_api_pseries(struct module *mod, enum vas_cop_type cop_type,
 			     const char *name)
 {
-	int rc;
-
 	if (!copypaste_feat)
 		return -ENOTSUPP;
 
-	rc = vas_register_coproc_api(mod, cop_type, name, &vops_pseries);
-
-	return rc;
+	return vas_register_coproc_api(mod, cop_type, name, &vops_pseries);
 }
 EXPORT_SYMBOL_GPL(vas_register_api_pseries);
 
-- 
2.25.1
