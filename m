Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C8784C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 07:58:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xprk37zXzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 15:58:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="KK55/RyU"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xpp75vJBzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 15:55:57 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id i189so27424082pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 22:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W1DfZds6xBoRUPBt8YeZHcvX6B6rKw2l9PJf9RBdjkI=;
 b=KK55/RyUoRADBlapeU/YD1FNBOcfDTS8oVJFzHDO+jF9xTgamdBtxB8AI4qsOoNX/n
 xiF61eni/SVJq+tjx6SA2gTIXiio30nDN2JHItS7FxKsWXZOskGt6jv7B6p8m5TyROAo
 afGjsw6gI3KoPhqdWabVWMalmeMBPrl52KWoWtmG0T5AtV24Se/uM5cgqCCzpHXvWvG+
 UV/g/Ymynrmb4B8sDThkx5ZEF/MfATDEiYDCQMPWQgHJtOP/OaMpHAqhx9yuFDK0kZCs
 9+ev1O3LGgddSs6OPn9JVdTQn3Jq30PI+5q2amHYtaqorfZ/o13V2oOoZ87pM3F7YVjg
 0+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W1DfZds6xBoRUPBt8YeZHcvX6B6rKw2l9PJf9RBdjkI=;
 b=OveZC1FlHLC3QXMYrZPbg9AvLnmbIrjgx8ybj2G9VbkPlxZymM5jLmL+1zG/uhijC7
 EjwdhvBeGx0hOgaXmfbvi4NkcqsX0LqELgUmY8ioDgpsV0bLGnCZNeIFIbYTsCLI+sAZ
 57b8sY4xmHWS/ShsC8c7wAYNdNt8YH8IAwIoerYgz+ZJ+anSkqvS4FCB/mK0UQCKbq/M
 r/dzpqNd4rH6ztwZQXSEqW3V5LgvltWv1CFW0I4+Ew/3jd0tNG2+vRvsjvVHiLYKGLFa
 xlVa2oEn1KZ0BrxlLsJrKbUDOFudAmpf84xss9enuOUZMyEnh7+ZMF5J2cVdE8y4IFa9
 mNKA==
X-Gm-Message-State: APjAAAUOwGGrqIBysHzYULGg7n30jVRPVfR4GVM11hhda5oIkQrheRv9
 +ZiG5Lv9uXuMObS6WUJH72U1rjkG
X-Google-Smtp-Source: APXvYqx7uJ/1bcTksJHhbcZx6SGYzvqytGZIA7zlKvjIxmijZaYNNlXuiOErqPjQqx3LzvzX1OmgOA==
X-Received: by 2002:a62:78c2:: with SMTP id
 t185mr35625686pfc.142.1564379755227; 
 Sun, 28 Jul 2019 22:55:55 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([183.82.17.52])
 by smtp.gmail.com with ESMTPSA id t9sm41003240pgj.89.2019.07.28.22.55.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 22:55:54 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/kvm: Fall through switch case explicitly
Date: Mon, 29 Jul 2019 11:25:36 +0530
Message-Id: <20190729055536.25591-1-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implicit fallthrough warning was enabled globally which broke
the build. Make it explicit with a `fall through` comment.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/kvm/book3s_32_mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s_32_mmu.c b/arch/powerpc/kvm/book3s_32_mmu.c
index 653936177857..18f244aad7aa 100644
--- a/arch/powerpc/kvm/book3s_32_mmu.c
+++ b/arch/powerpc/kvm/book3s_32_mmu.c
@@ -239,6 +239,7 @@ static int kvmppc_mmu_book3s_32_xlate_pte(struct kvm_vcpu *vcpu, gva_t eaddr,
 				case 2:
 				case 6:
 					pte->may_write = true;
+					/* fall through */
 				case 3:
 				case 5:
 				case 7:
-- 
2.20.1

