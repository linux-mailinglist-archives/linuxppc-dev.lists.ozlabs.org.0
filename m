Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A17345499
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:06:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4CqB3YGzz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:05:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JuDOVyXU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JuDOVyXU; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CmR0xKHz30GM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:35 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id r17so10053877pgi.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/SnEbu0v05VvXraZOiAb1e9wcvWFKJdoZf5OUf6Yb0=;
 b=JuDOVyXU2df0CU3+R6S09KRDtVt/8n4GJK0Ch+5DH5ljnxTiVaS3sdai/S8/zQzkDD
 S/ovhELE/16rS+8eVkva1wf/zoK7PIBGgCokdzWtOtpe0eecheLJmvzcPboQHT155fQ4
 syVRm+RXb+pbaZjR1zC+DPni20iVW2uyH8o+qKlChvamO/vxebQbklnTuFVALfsqy+Cu
 zr4tlz4DAE4fYc6hBTIq0aWANeo3m/Vjq2xa7xa0N8QkhKqvKWPDFnUURVU6qHVRoHjS
 BXbiprbmUXW++Q9JDRcNfeCeuwsGUadw2PghxU/OceUoPoshiBy70vJ4HMZZYNIpkdhh
 uuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/SnEbu0v05VvXraZOiAb1e9wcvWFKJdoZf5OUf6Yb0=;
 b=aMu4XtRkLfAgahqxalHGYqsBXvaHRDhF0i4jyLQKIJc/So6uA67RzioOUD6JSjlsrb
 mlN/kUrY8hnyOYrQVrcKWMxU5fxzgXpblGDfAiSycXnolK+rvvSiYPmTZJ2JKYcSjz6d
 CddeNjsTOhlEZ6vXa11xjKRus0X8eHapXqbsMYCRqQsjAEHoVsJ4+x9IyHEU80T0ronf
 pobAQVABjmSwMajs+gVAEyrUnAlYtsYWOpkd8UPIRqtTas2wdj7E8T4RHEBZF3BSy7ev
 U3jtPYaHrgbpDtCVI3JX9r44QdvlCAKEbFdbOBj8MWO0H8DJicrqRx/A4E4S97G4cWZN
 j9Hw==
X-Gm-Message-State: AOAM533amn+ODkVtNyFlu1sBFVjS45tbotAEn/UaXAr2BWZdtksMrIu8
 e+Cr3W/AGyz/zAgDJezVU2cg9rBtP+w=
X-Google-Smtp-Source: ABdhPJxqJvrbrlx/7iCJz0s11fRARFxYLUUGvx9PFsEE91s5bQ+/yI9/oWpFx6L+15k1SwL7NpEifw==
X-Received: by 2002:a17:902:c9c3:b029:e6:f027:b01e with SMTP id
 q3-20020a170902c9c3b02900e6f027b01emr818869pld.74.1616461412848; 
 Mon, 22 Mar 2021 18:03:32 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 05/46] KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
Date: Tue, 23 Mar 2021 11:02:24 +1000
Message-Id: <20210323010305.1045293-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
Cc: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This SPR is set to 0 twice when exiting the guest.

Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1ffb0902e779..7cfaabab2c20 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3781,7 +3781,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_DSCR, host_dscr);
 	mtspr(SPRN_TIDR, host_tidr);
 	mtspr(SPRN_IAMR, host_iamr);
-	mtspr(SPRN_PSPB, 0);
 
 	if (host_amr != vcpu->arch.amr)
 		mtspr(SPRN_AMR, host_amr);
-- 
2.23.0

