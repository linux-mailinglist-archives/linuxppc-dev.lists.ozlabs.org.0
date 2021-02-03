Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DF30DC54
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 15:12:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW3Xs1rwYzF3Dj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 01:12:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=kxSOKcft; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0cM4DNLzDxTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 23:00:19 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id c132so17233439pga.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 04:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq2AQYTBwcMSkk50BfF3YUyk3WvoM0RKP8OIdZyLogM=;
 b=kxSOKcftnvedIIGNh+Rmx/90TUe3R1oO3MkN0JUpxFJLTNpmrNHIABU4ygCSFGF9yJ
 wa8fYCx2lAbqno3BetWwbGgNuRYlXc6TnQDcfpCsYsLqbAfRCvTVBKFiR2Tctk8nhWL7
 O8eR3Vw4c9b8hzwQ//H/3YNKtg5JA6V7pwwPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yq2AQYTBwcMSkk50BfF3YUyk3WvoM0RKP8OIdZyLogM=;
 b=lICl9we4bSdVYQaI0Ce77C5S66VZsew+2PvdLIPY1e4hrKxLALaNyZ37zf6G6S3Jpu
 0SDkIvcixZvnILx6w3j+iAPGMpaB/dnL4GL45FQb9njCpnpTo4iK/bwaBNRpOg2EJnkc
 ykKHKz1DsrporP582VhTZt8jbLb34P7k4tuM+HVHEYIBClLgL/Z/WD0V7uWzr3iuVs14
 dNRkhhqdnxNU3zSoSPYvVrqIWOgpWk5EwH2CZUKap3sME6PTnBxBSCEH7r1D78RiO9Iw
 PI3xEoEamgrV04ey1YbXIvAooCEmlsrMe/WtB8t6H/ZbKDay/stxbjklfptZCNUnrH3U
 wyHA==
X-Gm-Message-State: AOAM533t+fw5AVexnGhJY2Wx70lciBULpu5DV00Nh0B9mV/Y6bjrQu05
 xfMQ0w03kstqBdzfjMpiBxw1fw==
X-Google-Smtp-Source: ABdhPJylOcEKYT+ONyuxZ4XMSGIDwgjVoa4qT8JnoW1O4tFZEA5p4U/CgRlYK/suDWOPVp8KZjr5cg==
X-Received: by 2002:a63:5f93:: with SMTP id t141mr3293691pgb.299.1612353615412; 
 Wed, 03 Feb 2021 04:00:15 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1c59-4eca-f876-fd51.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1c59:4eca:f876:fd51])
 by smtp.gmail.com with ESMTPSA id l14sm1991737pjq.27.2021.02.03.04.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 04:00:14 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v10 5/6] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Wed,  3 Feb 2021 22:59:45 +1100
Message-Id: <20210203115946.663273-6-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210203115946.663273-1-dja@axtens.net>
References: <20210203115946.663273-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasan is already implied by the directory name, we don't need to
repeat it.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/mm/kasan/Makefile                       | 2 +-
 arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)

diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index bb1a5408b86b..42fb628a44fd 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -2,6 +2,6 @@
 
 KASAN_SANITIZE := n
 
-obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC32)           += init_32.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/init_32.c
similarity index 100%
rename from arch/powerpc/mm/kasan/kasan_init_32.c
rename to arch/powerpc/mm/kasan/init_32.c
-- 
2.27.0

