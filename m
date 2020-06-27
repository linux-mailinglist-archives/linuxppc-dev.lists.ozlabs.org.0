Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2B20C2A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 17:16:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vHQz4k7czDqvP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 01:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GDfnQLNC; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vH9C049FzDrCT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 01:04:46 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id u26so10775871wmn.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Awl2+Dc84pQS8EzxldlSJeEwx2uf/L+aZYvfx6Px2Ys=;
 b=GDfnQLNCjBrdUZQ8qkyI7bF7evpAV+G5A2n0GySEIkc6XcnUmURExoJ8n/6u7TqhWu
 H4BmcQPWlR2afJdhBNTX71eh5V77xt2/pYQGdsW6xrXEv21F2gkKjL+uT53h8nU46Yj7
 K9OzUCGyUIvIPOir3LueFvDgZW301eFX8/Js4kGKdPNy8Ci/BxQpTujVCPYCOmhhJR3r
 +HPGKMXVUerIe/JSZLBKi5Bauqx0IZDux5A7DBsKTjZ4ST5xaf2W0br4YyAM3R6S2KYv
 8Vy+niBw05j4FslzlWxSwJmvFfcN4vWt3xXz6wtc0Z+lKjhRlc6RKGEm0TK/xo+EINn3
 Kurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Awl2+Dc84pQS8EzxldlSJeEwx2uf/L+aZYvfx6Px2Ys=;
 b=Q+mjFJZOADjYuVo2zohNeEcj5XvT43P6axxFGpYKnNQG1q7IlNStojpJJBeIVElWXv
 /M+QnGsIONsVrlcAIIyh3MT58jaFEuZypbuH2FzU636Yr1ShdWKvb+zY4DcKc2ebhM5n
 BGTLo9CEASp5vdn+au6cLSklzbTve6WYizqm8904KXsz3m8ObIXMVC/SY279XXRq5iTQ
 +sWRGQp3a0E8SuGZP84t0qvr9Y9rIk0m4K0cEzY+QI9v84HKl73rQU2nS7tWnBKecnbw
 fG3b5EUKK6ViYKqLcJ/cdB0qmAvahnvQAXbg8jBanfKMoQfOtAVQF+yRpzDMJNperwk/
 BHdg==
X-Gm-Message-State: AOAM532pfVSSKqHkCjYrw89GYi5xbt5i0/rEO4fxtTVcO+pC5sZv+iIq
 jMqEQolNlWuxrYzLIPE8vLiDpUOX
X-Google-Smtp-Source: ABdhPJydYKhNv8V62RpFGbSQwGzEQ0A4XVBchhpf8civ1Im7u8WD89P9Zo0bs0VKz6JDlh/ly07ckg==
X-Received: by 2002:a1c:7e94:: with SMTP id z142mr8458109wmc.124.1593270281597; 
 Sat, 27 Jun 2020 08:04:41 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id d132sm21722029wmd.35.2020.06.27.08.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 08:04:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] powerpc/pseries: IPI doorbell improvements
Date: Sun, 28 Jun 2020 01:04:25 +1000
Message-Id: <20200627150428.2525192-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 Anton Blanchard <anton@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the review, I think I incorporated all your comments, I
also did add KVM detection which avoids introducing a performance
regression.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc: inline doorbell sending functions
  powerpc/pseries: Use doorbells even if XIVE is available
  powerpc/pseries: Add KVM guest doorbell restrictions

 arch/powerpc/include/asm/dbell.h          | 59 +++++++++++++++++++--
 arch/powerpc/include/asm/firmware.h       |  2 +
 arch/powerpc/include/asm/kvm_para.h       | 26 ++--------
 arch/powerpc/kernel/dbell.c               | 55 --------------------
 arch/powerpc/platforms/pseries/firmware.c | 14 +++++
 arch/powerpc/platforms/pseries/smp.c      | 62 ++++++++++++++++-------
 6 files changed, 119 insertions(+), 99 deletions(-)

-- 
2.23.0

