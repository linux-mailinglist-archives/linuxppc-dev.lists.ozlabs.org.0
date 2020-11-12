Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97E2B0273
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 11:01:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWxv02m8rzDqrV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 21:01:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bdUZdwS1; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWxps3m75zDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 20:57:25 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id 33so5310227wrl.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iYp4liH6QtuFMXY8fnKB9zBXABbAMYcv+7gF3AlAZms=;
 b=bdUZdwS1oHyphT4MiY5fuJuSHleFsAMvbaM8db1XRxOT716qg1IRdUoVmUzFlpT+nG
 9gCJlWNx2qumzMjuLRaz6pMapA8jN5KX/onENKyLqd8fmWQVqlLv37M7yNBMdHrkRG8m
 Ce5OzzdiOlLVY5UjDV4pXwSRUItbhrlVDg2LMZJkR3fMJMD8oE5J2qgMS78nCx1CGaSu
 QH/hVQwngfaP/pn80wu7WMQGUpJEHXNzTqFbiT4wzU+ewGsAccit57KiJOKZopKSq/eF
 f1X0STlN0+kct9AkS2v16Wwuo7yx6CR8xbmba8GcKm/9xfrIrx5jEKCM+6P7rSDFqHZO
 l/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iYp4liH6QtuFMXY8fnKB9zBXABbAMYcv+7gF3AlAZms=;
 b=aSNWxWgy0KHFAY2UjTpxH/5E08JUEZpgiGMjpB/eLOj0ZLOko7etAIcR54vbA5KVML
 4CkleH3Cieh2Ljwrn+nvMCKObE7Bcx8RjOpOedZbs2GJ3gIt89zaRE5YCaCE4BFWTYad
 aqS/AEBjg0/qru+s1nIgmbPdftKRldmpM6uwUUdJGLlamcmuRsXLRuFFeQ+piybYpPNr
 3euFE2KFUHXaM+wEYh6g50DVvu4IUDJGNUdmujnkUPOz8ItBfeCI4EPeVRqXC5pxgVvv
 4/77Ncg1E+CJVzk6AbpNMQCB9QNE1XmgB5xNOVqvmIRr1ZeeJoR1MQy9UEdfnBTFhv8P
 rt/Q==
X-Gm-Message-State: AOAM53124Yjx8SSHhjW6ykfb/eWG4eJq6HVNvreLmP/kWyDvN8f6AfM0
 U/gvQVo6xiJagSPjl8372ut59Q==
X-Google-Smtp-Source: ABdhPJxKfGioiUbjQWMEIpOjWDSlwsWsdf+ZB/gdqtMiJ065DaMLD1p6GwzO8zDSAzKlSqTxRNVq+Q==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr20538303wrq.210.1605175041676; 
 Thu, 12 Nov 2020 01:57:21 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n15sm6138792wrq.48.2020.11.12.01.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 01:57:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: jdelvare@suse.com,
	linux@roeck-us.net
Subject: [PATCH 3/3] hwmon: ibmpowernv: Silence strncpy() warning
Date: Thu, 12 Nov 2020 09:57:15 +0000
Message-Id: <20201112095715.1993117-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112095715.1993117-1-lee.jones@linaro.org>
References: <20201112095715.1993117-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 from drivers/hwmon/ibmpowernv.c:11:
 In function ‘strncpy’,
 inlined from ‘get_sensor_index_attr’ at drivers/hwmon/ibmpowernv.c:243:2,
 inlined from ‘create_device_attrs’ at drivers/hwmon/ibmpowernv.c:280:8:
 include/linux/string.h:297:30: warning: ‘__builtin_strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
 297 | #define __underlying_strncpy __builtin_strncpy
 | ^
 include/linux/string.h:307:9: note: in expansion of macro ‘__underlying_strncpy’
 307 | return __underlying_strncpy(p, q, size);
 | ^~~~~~~~~~~~~~~~~~~~

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Neelesh Gupta <neelegup@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hwmon/ibmpowernv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index a750647e66a47..8e3724728cce0 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -240,7 +240,7 @@ static int get_sensor_index_attr(const char *name, u32 *index, char *attr)
 	if (err)
 		return err;
 
-	strncpy(attr, dash_pos + 1, MAX_ATTR_LEN);
+	strscpy(attr, dash_pos + 1, MAX_ATTR_LEN);
 
 	return 0;
 }
-- 
2.25.1

