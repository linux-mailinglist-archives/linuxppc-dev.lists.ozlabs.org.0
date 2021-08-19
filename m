Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A60B3F1862
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 13:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr2ry141Hz3cVV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 21:40:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=C550/W+6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C550/W+6; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr2rG4D4fz30KN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 21:40:12 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso6593704wmg.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LH0thD0+NKJpZwefQbdyB/s2IsVbxcK0p6p/WAbflT4=;
 b=C550/W+6JNOG5Usrgj2d06WNFA7jHtLKfnCyiZeKt+9LfSl5AhYZ/wJNwW2NwU4nis
 g0a1eIcDOhRuyPzDPtBa68XNNeG9Jo7gqVhEo1MKL7s2js0fVe/imvDDBWhlC6Wkcm10
 jfTcCer5BA0v+l5jN5/8HKYMq+uwICHhww/DxpFr6jV3ADz/2TKu87UU14EAvCtaIndL
 6HJxc4W+mLWs4ls8kOw3bHoWRY6wVXE4UYRloRDnCeSecVlb+K4DvSzfdPd2/Pc3DMY5
 owwLNCutgHbH35e4VGyMu7c9DEB0DP+ZZBC4QRV/ly874mBOUfJes8cqXsDttVQmUaIl
 HkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LH0thD0+NKJpZwefQbdyB/s2IsVbxcK0p6p/WAbflT4=;
 b=KBNNb8vUK6uDGVg0qwf5pq9paM8XMCEa+NM5aoaDkCcgOQRYHtMIB6k14LKsgqSjIK
 IeeOp/1QFDe6czPGTuqVYrjzobO//eYyBbByAKpIhF+m8ZUNmgLLzKPtvqa92TK5Ao+2
 U5dg0rxWY5gqVsCwD4I3iVFMJe051IVcwx/8VAV6XG/Bl+LLccivxMsojZ4QVQ6RpDto
 6ftkqrQkE/pLxctySSlFscPnPYeTth4qbKUjXog6ES+tvtERtPwPaGH8RSkEzmnOtFjV
 HFwb7bCmTBWEtHPWK3jWiZ9kw86QjhtN8HYqHdYjjy7Gna9m6WU3OdVjXed0PijMisrZ
 s/Kw==
X-Gm-Message-State: AOAM5331IjhVh+gDfKuXgcp+R3q6qbMTvxHsQk/m5PJ5U205gVWwBV+x
 xsDMiQLoMPFbv8O1J4uIMag=
X-Google-Smtp-Source: ABdhPJyJwLWLb/+v2ia2UarNfITG8IYmP5cNcCXX+LJHhLkfuq7vAagO8+tguzj1XUjjJcY97N4UHA==
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr3036312wmq.170.1629373207204; 
 Thu, 19 Aug 2021 04:40:07 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id b13sm2650891wrf.86.2021.08.19.04.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:40:06 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc: kvm: remove obsolete and unneeded select
Date: Thu, 19 Aug 2021 13:39:53 +0200
Message-Id: <20210819113954.17515-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
References: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a278e7ea608b ("powerpc: Fix compile issue with force DAWR")
selects the non-existing config PPC_DAWR_FORCE_ENABLE for config
KVM_BOOK3S_64_HANDLER. As this commit also introduces a config PPC_DAWR
and this config PPC_DAWR is selected with PPC if PPC64, there is no
need for any further select in the KVM_BOOK3S_64_HANDLER.

Remove an obsolete and unneeded select in config KVM_BOOK3S_64_HANDLER.

The issue was identified with ./scripts/checkkconfigsymbols.py.

Fixes: a278e7ea608b ("powerpc: Fix compile issue with force DAWR")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/powerpc/kvm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index e45644657d49..ff581d70f20c 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -38,7 +38,6 @@ config KVM_BOOK3S_32_HANDLER
 config KVM_BOOK3S_64_HANDLER
 	bool
 	select KVM_BOOK3S_HANDLER
-	select PPC_DAWR_FORCE_ENABLE
 
 config KVM_BOOK3S_PR_POSSIBLE
 	bool
-- 
2.26.2

