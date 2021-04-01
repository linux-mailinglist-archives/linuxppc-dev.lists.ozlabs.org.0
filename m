Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BB351603
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6GV0xKNz3gJW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:16:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TDEwc9Ye;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TDEwc9Ye; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB61G1ytYz3c23
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:06 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id v10so1679383pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q4fgmV/3XV+48nC3cNxw1X5+GU534mYi5sD1C83lc+s=;
 b=TDEwc9YeeBBmqq7MEN1e/fuAml2ZZjFA7LGujh1rLMDTt+hQnMgwU9RUmNq9rAKUBX
 DODeq7+m050gJUW9gceGC4R26aVrcKNA3jLBjOESoelObyAqp4WlqVtlmVnUCR0vGi1t
 G2nuIjdOfv0MkBmSn/wQ8IzOQTUwUZP6YOqNl2JP5j0bviZv/hC7aX1m6OA80b0O2SqY
 OHrIlgQwa2a6Q6zPsUbhSNBNtZ02wyCyLlqeYA3XrZwbVoRjId40Gs5H9q+26ilBcNLr
 VjTH1Er+J06z9BWiKeQuMB50wS6cT+6913J2aRv2l7QRjQzJE55IvTQazM/1pJzst3Xd
 6anA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q4fgmV/3XV+48nC3cNxw1X5+GU534mYi5sD1C83lc+s=;
 b=aAbssjHBMvBp3kS6wbg3H824O3L/Lk7HEVpcuL8UanlBMZ164ne/FhkQCWm0YIdb9q
 Gwi63agYJI8LbZoHm4sgjME3F0h3mAtUZVau0itYs6E48B6mI6kV2JSCu6ecl76gUwKU
 eqHMHQ4ZIewhDhlZuVhtR5YZscgUBw2qJextoNzh+9mcDLv8UNk8vBqRvOXeYQNQLski
 AZRDIsSuixaaVmioSjisx4dCUGQzVYmEKFcdxux63M4NqcVVfsJJRKYmXP3BSIZdoSGw
 xuPBZJgyYVrNSyhZsNrSejfN29YEFPSBLc2K4OU1dIJs4OMQAP8cafAyzUSy+O6GSVVl
 K0kw==
X-Gm-Message-State: AOAM531ifs8vOEwM/+dtnD+Ufvc9udhkKqwDTMp8sSdDrRhzWGmnFSLx
 TM0d6C/0DHTGZD8cSCl9DOg=
X-Google-Smtp-Source: ABdhPJwPoTXLdkt/dX23LTNqkNvKDKBJwh3bcHsDIxILvPa0jaQCii3N9KRxEZoV4OX84UPLlTkl6g==
X-Received: by 2002:a05:6a00:2b4:b029:1f6:6f37:ef92 with SMTP id
 q20-20020a056a0002b4b02901f66f37ef92mr7872629pfs.56.1617289504093; 
 Thu, 01 Apr 2021 08:05:04 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 28/48] KMV: PPC: Book3S HV: Use set_dec to set decrementer
 to host
Date: Fri,  2 Apr 2021 01:03:05 +1000
Message-Id: <20210401150325.442125-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The host Linux timer code arms the decrementer with the value
'decrementers_next_tb - current_tb' using set_dec(), which stores
val - 1 on Book3S-64, which is not quite the same as what KVM does
to re-arm the host decrementer when exiting the guest.

This shouldn't be a significant change, but it makes the logic match
and avoids this small extra change being brought into the next patch.

Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6cfac8f553f6..8c8df88eec8c 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3902,7 +3902,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->in_guest = 0;
 
 	next_timer = timer_get_next_tb();
-	mtspr(SPRN_DEC, next_timer - tb);
+	set_dec(next_timer - tb);
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

