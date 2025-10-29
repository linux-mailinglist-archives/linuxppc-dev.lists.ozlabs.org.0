Return-Path: <linuxppc-dev+bounces-13518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE33C1B8EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 16:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxVz41kbpz3cZj;
	Thu, 30 Oct 2025 02:09:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761750592;
	cv=none; b=EAwcvi0c0/dvFmB4khlSSORoKoWbh04rS1KQAltxuIZst7xA2AmC87uclXMWdt8XTaEheoiYB7gXxJs39KgxWlYUGRKo4Ve2N5bOozRBjjv1yeKdTPcWoRc8QI0qwdfiXkgr7Mq1ldSsFaOuUTGeeSUsGa3XGAVayWgop23W4s+h/vTxyakcSRjm/xsVOvCR/IwZ1GZC02OmKFtR9CD07+mM9Z2XRlnoaugdoCV6Gf+xY0TPDPnSUnw72ZFxlGaYJJfQM/vhjvjj7Y+0CiJLPNLEE91Gdc4vQecCQ9N+ipjxLE0CqKFyZbZviBYEODqvJgaowb8DYZAXkqYK/5qKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761750592; c=relaxed/relaxed;
	bh=SJ45qfcg/AiWri4WRgxlSUGeApHftRNlJg58Vjygo7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnPtYJWaNjFS6G0+gDYQfl+ipGurR/HxzZCRiWCpwi7jtMaOkViuMw2febgJGcxXuvwSFjeOsQISeCpfBZ0kXhUcasCLKCmSp0P/VWuxmscVQjxAHnXU5l5yHwKJowHRPUGXnpLjxz2eeDfXBX7A6RQdenxikGGNO1qEnSThxZ/gK5E9T+44AwqILo+RztdqwNiRPztHFhN70XdlpPL4W+WWin+zEPzTFFY0x+UVesy91D+fhuaKDO6kHJ/w/ZE3uF2B4o3YjyI326MvVjmcVn3dVzG8GK1BF4djaRYvwTEEZhhRwqJ2tiTcUdHoOFvAXq4y+ggo4fOr3KjPPEB8ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CF2X+L4L; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CF2X+L4L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxVz31yXqz302b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 02:09:51 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b6d402422c2so1708227766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 08:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761750588; x=1762355388; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ45qfcg/AiWri4WRgxlSUGeApHftRNlJg58Vjygo7Q=;
        b=CF2X+L4LgSR2JxtPpe2oQC2WJFhJ1N33OSz/n6fYMWy7L9jl+jAfu/dHAgcqInEorY
         Apk6BWnY31OD9el7Ma7Awk1EqKjaqnCUPH2ab/d6aGMV5+NICkLvSWmg49BW+u1NeSUE
         epTGyIEjWcD7xSzHrPsYKN+8ne1TQtY2xXh0VSTC1y5VEhq8K5bts6yg5/GiLtcTOktZ
         PBWrNw4pvriA+EAkUDIIl80cp82jXGk+v9w1ew6/3wzwwiz84U9/9BfT/iShfEoN5zBi
         Rj0X69Jf78oqcxyEbPwWclTBgStakg/7yDpmoie8ZzIdIc6xQ5JUHSiEEbYyXrhYEeKo
         iT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750588; x=1762355388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ45qfcg/AiWri4WRgxlSUGeApHftRNlJg58Vjygo7Q=;
        b=EG8ycwIvIzc26iFmjoezwg+Bh+AOBC1sPETMY6GrPYhWKmoTeY8Vx61+bPH50U97Fo
         oZkFO2mPezrzb3ixdyXDdoiOpA+TxXwcvfgJNl82DvOueiZ1B4D+WyOoNLLIsCRlN9wg
         TrEpSNn0Sze6Ei+W0qSjit3bMaQObitxGTue41PkwFJNCxmniHfUUoGXDAlKgbBnmEvo
         pvC7hTP9ajNEf9ArJ4m3AWi9Z3250Wg8MUkZ64T21BLyRdYWj4xUyU4Bjh10Y9bHmiCV
         mgAmEferRoMKbe1Kqgt0+MvESBu8kuzRk6TsFXYb7T1KM9Tfz09oa3aaIUzgO5NGaRwt
         UYsg==
X-Forwarded-Encrypted: i=1; AJvYcCUnXWDmlsUtH2en2setENgDPwtmQUKQ0zLzRlc7JOfsXY5ziqhntozqjyqTt4fhH7kJnWiFjuGqgfV1Zi0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwV18/2sr0IKB1EmmB8rPvvN27NGWuonGsUZ0ljPMpyS+Lku7ph
	v0wp4M9ObjeO7RywrVT44nbmNK3XC1Gv3pKbwXRIzcHV3XFZCEI8RK3K
X-Gm-Gg: ASbGncu6/DHpvBKQbwcgE9A9sci0VI030YNIksgRksMs5OHNQjSXA+tKmaGDb+EwuyY
	7kCiVG0a2bg2EghQhBKs8EzmA3V0OEXdxdPQrWEf1ZiKDGDvTktz61ZD/5dx2hPY5aeE3pz/OaW
	sIZMtrL1/qxMqjJv4BOi/zyvSaJuLFsyAxHYcrKAf8YJZ2vvyQ/fC6CNNObZmUcPbM53JWeHW+R
	PeBiQxhmFiJOqiOnMmBCwlid1f3RCyVYHMc9UBsN+i8WFpSDSyyhsV0eV19dHHe0nX1hYLYR5CR
	WcIjf4gOvj7blCq0XiPcvNO1zWCGU/12Px4fU6amctZ+t9xkqeJSal/9PAqBG3wGtmQfRB9VYtV
	xmNRlysQnt156XAS9u5u+1hUbKwNoSaYZb23qTJBZcDFfSto8NFOZh6sOpRdSXAHvX/2NtANjgl
	5A2OVUbArIFn8bTAaiog6kUhjC+hwb3MyHuX9/WTX3ZNMgHg+X/zIpeDv8GRhC5cYBd36C
X-Google-Smtp-Source: AGHT+IHDlTb5X7VV5e2XjFqocJOsF7vLRX65oGQx9zCAKTcQ+9IOyOUoUo5S/+LU/FJ3oKPg1ypHaw==
X-Received: by 2002:a17:907:7b85:b0:b46:6718:3f1d with SMTP id a640c23a62f3a-b703d4571f5mr331200366b.38.1761750587895;
        Wed, 29 Oct 2025 08:09:47 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d8530905dsm1451781666b.6.2025.10.29.08.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:09:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] macintosh/via-pmu-backlight: Include uapi/linux/fb.h
Date: Wed, 29 Oct 2025 16:09:40 +0100
Message-ID: <20251029150940.2523328-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029150940.2523328-1-thierry.reding@gmail.com>
References: <20251029150940.2523328-1-thierry.reding@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

This makes available several of the constants used in this driver.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/macintosh/via-pmu-backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
index 26bd9ed5e664..aef8930a505b 100644
--- a/drivers/macintosh/via-pmu-backlight.c
+++ b/drivers/macintosh/via-pmu-backlight.c
@@ -13,6 +13,7 @@
 #include <linux/backlight.h>
 #include <linux/pmu.h>
 #include <asm/backlight.h>
+#include <uapi/linux/fb.h>
 
 #define MAX_PMU_LEVEL 0xFF
 
-- 
2.51.0


