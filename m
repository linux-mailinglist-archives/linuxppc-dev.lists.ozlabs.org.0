Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 437A62AA4E1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 13:02:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSwqD1gj6zDq8g
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 23:02:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=xiakaixu1987@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pbhFpHUj; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSnMw6zrqzDrPx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 17:26:32 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 13so3749681pfy.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 22:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=C4lftI3jjKtV0YPJpfDM7T7PI8bPMBY4WAPtMXGKPTQ=;
 b=pbhFpHUj/V75ectClm9ghdNvCryoMyQfDPSQmx+Y4A6ihEx5NR8AqX2nA6s9RG4o2K
 7pues3/1m0otmnSw7QNHyfkThYO1Z94iv7W6BAMDm1YP7W3lBY+X1Z5fIeRgeK8MxU+2
 Dcba8hvxPTw+9b0LmYgvqQI+vOBSTaqvcY0nE8Es7TyNGHkxyTSxHGdJUGzCmyW8LqoC
 QDj9HszIZX6u8kAnMcXdA8UrFlTtdtAuZCiQ2G747WMQEp3Qk8EmpMWerDu7bX9KkX58
 tE3Ocqok2YnmPkbtIyYqE6hBblfmOPun0tLQQecxytmnzOYNCvehX2D5d9Np7gF5iZqX
 1C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=C4lftI3jjKtV0YPJpfDM7T7PI8bPMBY4WAPtMXGKPTQ=;
 b=eoYQ2j+wkb5BgEdjGFkC++JmeE4/La1+An/0e+9Sb+YBHocMXLPt+5n2eYULwmxeuu
 nJBceF/7OCD4qDX77D9CgYsJ5c1kuI9Jd4W0Ta8JF0LDS1kDYwc/BGHLREeskQI/oI9Q
 hu0OY1BA5ihs356vxf/N6SNPVGmiFL2/2q6mhFCRJIig/sv0PotBo2iEWAJLnsHU5u7J
 TjBkdBdwo4MTB7SN8BDHwxIl4t5bNR5juYlYNj9NoF+HzR1SXsCIiZ1hHSVCQpVd17z2
 ERrqfLbIcXlhjdxgbN9zRFtSlO567h7imh74q6k3wPpgCIaoQx+81Mt80OS+pt9GE90U
 +Vvg==
X-Gm-Message-State: AOAM5318G4CPGhEjHZwHhAKjSUQwg9qbbAZL4B939KNifEb9CT0wWrxH
 r4xCG1q0Ihrz7bA2yQnfGA==
X-Google-Smtp-Source: ABdhPJzsrhuSEE///ScJ3QwAorHPL91XbpaZNC9/mvUmP+XANlnyfOzlq6TsFfm4ijBHYFyvfc5SwQ==
X-Received: by 2002:aa7:80c9:0:b029:164:4ca1:fff with SMTP id
 a9-20020aa780c90000b02901644ca10fffmr5103575pfn.11.1604730389045; 
 Fri, 06 Nov 2020 22:26:29 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com.
 [67.216.221.250])
 by smtp.gmail.com with ESMTPSA id y124sm4039019pfy.28.2020.11.06.22.26.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 22:26:28 -0800 (PST)
From: xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To: paulus@ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S: Assign boolean values to a bool variable
Date: Sat,  7 Nov 2020 14:26:22 +0800
Message-Id: <1604730382-5810-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Sat, 07 Nov 2020 22:58:34 +1100
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
Cc: Kaixu Xia <kaixuxia@tencent.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kaixu Xia <kaixuxia@tencent.com>

Fix the following coccinelle warnings:

./arch/powerpc/kvm/book3s_xics.c:476:3-15: WARNING: Assignment of 0/1 to bool variable
./arch/powerpc/kvm/book3s_xics.c:504:3-15: WARNING: Assignment of 0/1 to bool variable

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 arch/powerpc/kvm/book3s_xics.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 5fee5a11550d..303e3cb096db 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -473,7 +473,7 @@ static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 			arch_spin_unlock(&ics->lock);
 			local_irq_restore(flags);
 			new_irq = reject;
-			check_resend = 0;
+			check_resend = false;
 			goto again;
 		}
 	} else {
@@ -501,7 +501,7 @@ static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 			state->resend = 0;
 			arch_spin_unlock(&ics->lock);
 			local_irq_restore(flags);
-			check_resend = 0;
+			check_resend = false;
 			goto again;
 		}
 	}
-- 
2.20.0

