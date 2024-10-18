Return-Path: <linuxppc-dev+bounces-2367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4BA9A380E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 10:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVHT23Pb7z3bm4;
	Fri, 18 Oct 2024 19:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729231670;
	cv=none; b=ByeCmsZMMA2bL3pt7iAvPE59TyIuXFaaXkHLCEQkhlPmss7ECe1m1JCfAs4Dy7wG3ZlMiaSbqHTP9haluYz9dPDWOxw86XuqxK5aFK7h0RKBd9V7yIyG3a4+Q2urFtIONamxwah2ZxTHz2+gUYoyy1IlQ1suZKI+G/XYDOS8Xzws/Iz+/YEapg1g4H7/PXJ6QsR83F6GwYIPMCncOYJpUseFt/k3OvZPGhlrVd0Q0+xQc47Qh7ypmx/EVo5p6bZIIMt5qOXDYad2mKH4ZX25K12q/naykrdUWjALJonS2qIOQUJxdH5HCuIGPGWGDhqiYAD/g59KIJry99qPA+Axbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729231670; c=relaxed/relaxed;
	bh=+neT5OpriWjps6KWJbIFkh/0/1ZoC1TLK72bxGIagaY=;
	h=Date:From:Subject:To:Cc:Message-Id:MIME-Version:Content-Type; b=nJs6jbX9SCTKrDucSgblA3Pi+/5lxg+FTmN6sLK88v8RmEi3e7Nbruow0P83cbeUsYdizHSsK6jWQDgdSnWG0U7GlGql1iuNWwXenS3yDllA1kUv4JO8i+O9aOGwejwyAAcLlbxHndbsRsrm1qkxfUxtGuqFHkBBtneWWtOYNOk8RN1RkrmKRO8Q8k4ot4XgEjVO8WjV0UsNmt+JtNyfcAE0d3BTMTtse63AvPq54qizoitQDAUGRXvVkmX4xQZ6+6CnOTSL2v0vTg05LG8xoWQ2e2V3gIQNS5EfaPOQHdV/vHmYECF/rFV6t6yKpNrMwCQyk69g10kukkhzza78eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20230601 header.b=bSA7gWdD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=edd.robbins@googlemail.com; receiver=lists.ozlabs.org) smtp.mailfrom=googlemail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20230601 header.b=bSA7gWdD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=googlemail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=edd.robbins@googlemail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVDl823rNz3bkd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 17:07:47 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so258274f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 23:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1729231658; x=1729836458; darn=lists.ozlabs.org;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+neT5OpriWjps6KWJbIFkh/0/1ZoC1TLK72bxGIagaY=;
        b=bSA7gWdDyXHa+Rjbxg4ALLJWiREOkZ+vkWgJLjKCcM9l/wiAA2DHT4KBg3kVklTM//
         BBZjc2yLUgrWAghmWL/mPBV0vCJU0E75lPY9VUAYhuVUHw/hwjEOE74tYqhWKv+U4hIb
         F4TygDf+iNdzwvM1UnePXOj9yjlKA6mTkm1sYxVeRTi0K8R0GtPGHN5nKCm1hcjmH/y7
         ESXNamdUgTG332T2w136PwPMS9u275UP7GJ0/Q/dTBYZwtmyQl3xPFa3JAdkd8JnivoN
         1DHTqmbML/1VBYy0WvWG64PxVN2fCjKYriF37jggLtg1waNu1s8uwe5trxCT8yWZ/OT7
         kDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729231658; x=1729836458;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+neT5OpriWjps6KWJbIFkh/0/1ZoC1TLK72bxGIagaY=;
        b=XZ2wZh/zQYh7k7PYI/4Ks94j8dKf4e9g23AJRHBuBeK41eOrKLoA/9TxThbmZvVHFG
         EJBpSBiemf+6FAdwOEqmb/trnywQ1xQ8Ysl3yFJ0iCumfg71cBYIgLhmRC/gmaU7mao0
         OMqSmhhj0lN2zlNGj85sJezGwTF6Vpj9rSrF+M5PPLaXjuEPY1x9Gm/rdIDtfc7BaW4P
         RfN8dPnVERi6QoprWds7T5DFyOC430ga4hFaCURFXqUt/d+djZcYYCJLcyPQak4vSxeV
         VBj1FghBPbKiJAhbz1f12BvEn0ToCWFYAajRIAWE2+KIhUwwTEzsQEJvsfRzp+f0PS/H
         9kDw==
X-Forwarded-Encrypted: i=1; AJvYcCVoyLPqjv6hvZ5DUPB59LZWysUzDfk5JlAXqN4XJVq0Z7TsbBnm86hmSxI9kzSOKj1fj1V7AmS/zkKNj+Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyp1lcxzJE+TTzzXsmEjZqBNPxL21mVbe5khHlHJTh3R2oRMHxW
	rmqbIPDk7ByD3OgdZVCQxWTbY4pWhwcjt6jFLZdjvNlefFKlZcds
X-Google-Smtp-Source: AGHT+IHpl5/hGJVbSRbu76Pbt3D3nd73JqcA+FmPyiKSp7+epboy3/jCCcWZ7Z8yarGgtxPGKIKaRg==
X-Received: by 2002:a5d:5e10:0:b0:37e:d2b7:acd5 with SMTP id ffacd0b85a97d-37ed2b7afc9mr104331f8f.8.1729231657902;
        Thu, 17 Oct 2024 23:07:37 -0700 (PDT)
Received: from ada ([2a00:23c6:7616:8b01:c50d:30d2:69a0:7638])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf046bdfsm981043f8f.31.2024.10.17.23.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 23:07:37 -0700 (PDT)
Date: Fri, 18 Oct 2024 07:07:30 +0100
From: Ed Robbins <edd.robbins@googlemail.com>
Subject: [PATCH] pmu_battery: Set power supply type to BATTERY
To: linux-pm@vger.kernel.org
Cc: sre@kernel.org, linuxppc-dev@lists.ozlabs.org
Message-Id: <IOFJLS.120OJ5KJG9R72@googlemail.com>
X-Mailer: geary/40.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

If the power supply type is not set it defaults to "Unknown" and upower
does not recognise it. In turn battery monitor applications do not see a
battery. Setting to POWER_SUPPLY_TYPE_BATTERY fixes this.

Signed-off-by: Ed Robbins <edd.robbins@gmail.com>
---
 drivers/power/supply/pmu_battery.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/supply/pmu_battery.c 
b/drivers/power/supply/pmu_battery.c
index eaab7500d9..ed83c5e05c 100644
--- a/drivers/power/supply/pmu_battery.c
+++ b/drivers/power/supply/pmu_battery.c
@@ -170,6 +170,7 @@ static int __init pmu_bat_init(void)
 		pbat->bat_desc.properties = pmu_bat_props;
 		pbat->bat_desc.num_properties = ARRAY_SIZE(pmu_bat_props);
 		pbat->bat_desc.get_property = pmu_bat_get_property;
+		pbat->bat_desc.type = POWER_SUPPLY_TYPE_BATTERY;
 		pbat->pbi = &pmu_batteries[i];
 		psy_cfg.drv_data = pbat;

-- 
2.34.1




