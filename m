Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE65B3A0608
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:29:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03Jy1bYgz3dgp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:29:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zt5ZaqOJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zt5ZaqOJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Zt5ZaqOJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zt5ZaqOJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03Cc4L2Wz3bs8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:24:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vgj8oqZLl0A1vt9dwKiJZ0f0m4QB6PQYsey/uhZG+bc=;
 b=Zt5ZaqOJyXaFgd2jCCxWYnZJtJwbSvxWhLOwKVvGJgz9tqkWhEM3thRoYmgm+OtR5mTsuj
 V/xVrtW1jX1B0/ovYsZ50pwIDgC73RmS5C9px+r8qH038/HeD+zU2JbT5VdJjhPyFATVxo
 0ERNfpdkcbcL5LAYiyL5156VwAjJJ3M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623187465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vgj8oqZLl0A1vt9dwKiJZ0f0m4QB6PQYsey/uhZG+bc=;
 b=Zt5ZaqOJyXaFgd2jCCxWYnZJtJwbSvxWhLOwKVvGJgz9tqkWhEM3thRoYmgm+OtR5mTsuj
 V/xVrtW1jX1B0/ovYsZ50pwIDgC73RmS5C9px+r8qH038/HeD+zU2JbT5VdJjhPyFATVxo
 0ERNfpdkcbcL5LAYiyL5156VwAjJJ3M=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-qyGjBIXiO5mwOOrsmV-1pw-1; Tue, 08 Jun 2021 17:24:24 -0400
X-MC-Unique: qyGjBIXiO5mwOOrsmV-1pw-1
Received: by mail-oi1-f198.google.com with SMTP id
 j20-20020aca17140000b02901f3ef48ce7dso4012440oii.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vgj8oqZLl0A1vt9dwKiJZ0f0m4QB6PQYsey/uhZG+bc=;
 b=O/NnMeRSCFwWTcsbzyzMzoUuR/Du3sERhmgVX05nX5zdR1ggVuu4laC4dm8OwaInPw
 2N7CPV6i8jy4M1t8PVuBoJEiTnU2yV9ELZ05huBauSdJ/H+3fg9Fun1xrUriJ/GNx/hg
 EpTtElIM8xEVPaVYYqKBGMZ7PKfJsWTFuYu/4untYYJ7NB7NBoYIGDKr0QWKPbjUXPFr
 MRsL4CR0Prkh4kQ5s6laO6xpDt4QnN9Ws5IcPGC93eGjfegRXBaxqSc8Mvgh85RtJaVc
 9LHTSwCrRvgqteuqL7jnJPRpOU9eEVNmregOZRczWgBXBb9kzqOH9O/mPDtPBT1d6kKN
 1lKQ==
X-Gm-Message-State: AOAM533pYVJehpcI83KPdaJY6Ea87Gz9B3dA8mfwMG1yaKRt0cWg+Xp5
 xbzQzddg9/hTN0ECWmTdu6w26BjxMXY2hlzu+8NakqhzZpLaEd1xnI9XK/ynA/yDX2OJhUh1J5l
 e/1KM9qR2f0epVGpooM19jwoXWw==
X-Received: by 2002:a4a:315a:: with SMTP id v26mr18955558oog.75.1623187463593; 
 Tue, 08 Jun 2021 14:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz82nKYiIALAJjZeYKXYeO4V0CO6L9b2b0ozuO1NkuMBf4budBP8Ik6fiODXlFbdCe14KQ8gg==
X-Received: by 2002:a4a:315a:: with SMTP id v26mr18955531oog.75.1623187463421; 
 Tue, 08 Jun 2021 14:24:23 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:24:23 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
 fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
 grandmaster@al2klimov.de
Subject: [PATCH 09/11] fpga: of-fpga-region: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:48 -0700
Message-Id: <20210608212350.3029742-11-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/of-fpga-region.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index e405309baadc1..e3c25576b6b9d 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -181,7 +181,7 @@ static int child_regions_with_firmware(struct device_node *overlay)
  * @region: FPGA region
  * @overlay: overlay applied to the FPGA region
  *
- * Given an overlay applied to a FPGA region, parse the FPGA image specific
+ * Given an overlay applied to an FPGA region, parse the FPGA image specific
  * info in the overlay and do some checking.
  *
  * Returns:
@@ -273,7 +273,7 @@ static struct fpga_image_info *of_fpga_region_parse_ov(
  * @region: FPGA region that the overlay was applied to
  * @nd: overlay notification data
  *
- * Called when an overlay targeted to a FPGA Region is about to be applied.
+ * Called when an overlay targeted to an FPGA Region is about to be applied.
  * Parses the overlay for properties that influence how the FPGA will be
  * programmed and does some checking. If the checks pass, programs the FPGA.
  * If the checks fail, overlay is rejected and does not get added to the
@@ -336,8 +336,8 @@ static void of_fpga_region_notify_post_remove(struct fpga_region *region,
  * @action:	notifier action
  * @arg:	reconfig data
  *
- * This notifier handles programming a FPGA when a "firmware-name" property is
- * added to a fpga-region.
+ * This notifier handles programming an FPGA when a "firmware-name" property is
+ * added to an fpga-region.
  *
  * Returns NOTIFY_OK or error if FPGA programming fails.
  */
-- 
2.26.3

