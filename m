Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B93B0211
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 12:59:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Ngm133sz3060
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 20:59:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JYGIHwvI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JYGIHwvI; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NfN5czbz304j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:04 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id e22so10577087pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iddhQBveGl5GMDnvF6dAQD+fqfJW5WKS3bJd2eWY3p8=;
 b=JYGIHwvIcA3Vp1Z971XQwzD37vNZp521vekR0rBE7WPnri7kxzyjbafXsPgZMEJjPK
 Z8Q8m0Uv3af0nvRFsADRt5IafS/yhiB36PqufDCnPvBhFi0BQIWVmt6zNT3TR8/MiYwN
 swR3SULzwgXvWN0kKy85TFfM51uG5FY1xHvZWoBwJVkqKuKEiRYN+rTw1sxz6IeAg9Qe
 d5ZoYcFKpDilUCAiXBveNHXMt75XhAS+ZtBBHHWAI5vMJ4JOA51gPKUgjAH0RANp2nsB
 3CUE0gNiu9wPszFWLWNRgnLFo2D6OlNqQu0/yzGbcPUudR59LGWFU2TSeaRaujUJ1hEY
 bvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iddhQBveGl5GMDnvF6dAQD+fqfJW5WKS3bJd2eWY3p8=;
 b=dHWhZwOq4a0uR89YESiXFP7j0Q0efznScCglKqPh+p8ZaT4eeI1uFaYKBoIU/QK+dr
 eZW4HuYo1Xdqp+qqhEdarue/smwqs0XIX39kfYswWdqPqJuCh3oBp2xEljOTxsS/fAu4
 YhQU0R2OaMPlTrOlOkFzYE92KYdvyyb6Z9qXS3tny0E406PXVfyADTQP1u9US5YwC+Z3
 h1pTv5xYPyDkSGYCT33IbHC+NArW0MkclFdol8h8BRpcsvKwHwb4Vz70qholeIYyp4Et
 6Y4lhh6HFjxLGlkH3w02TjApG2TOL2l94WMOR+QiJW+0KU6FgT3EB2Wkxq+nusf3TViH
 iCZQ==
X-Gm-Message-State: AOAM530HOj/Ec3WmwcNqLTkwuwxyypBwJlhXJ0f4tx++j53p1T2Dqt8t
 41q4rccTDQqteESvm+h/83g=
X-Google-Smtp-Source: ABdhPJwh0OlsptuYnAUfsQYgL8AFiiAVQnUuIpUMie2bSbbSLcWCTZFeKXn3rxMUGQEHOEWO35SjZA==
X-Received: by 2002:a62:62c2:0:b029:2fb:af56:f1c5 with SMTP id
 w185-20020a6262c20000b02902fbaf56f1c5mr3158491pfb.30.1624359481470; 
 Tue, 22 Jun 2021 03:58:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 02/43] KMV: PPC: Book3S HV P9: Use set_dec to set
 decrementer to host
Date: Tue, 22 Jun 2021 20:56:55 +1000
Message-Id: <20210622105736.633352-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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
index 97f3d6d54b61..d19b4ae01642 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3914,7 +3914,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	set_dec(local_paca->kvm_hstate.dec_expires - mftb());
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

