Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C822B3098B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 23:57:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSqNP5M6ZzDrnp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 09:57:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jtOeDLjX; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSqLm61QmzDrSc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 09:55:58 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id q2so7872169plk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Edg7SZe/LYVxNnbqgoVBuhXRLciPrmz39JuMkpRhFiA=;
 b=jtOeDLjXqNR+NBB2WQniFEW0/yIOiVzAwR7rltKGD+fPE41wL2WNKadGm1B+2q2qIO
 CoGQv7UBcY34jlC8792KbsLWCUGpH5Fl9K+5XAOpxiZKPBHzl1ozreywYYwjumKb9V+o
 yGUYQMadNYKoIgB5fRIGvUTQshE513XPXA2xh7a6SWZtklWL4BCVQ8mgj1yLK26X4zmb
 OOGMMmjtsDEGwB4DW+4L8bvHpA7fJvFmlldBNkGSE3ZBS/ctgc2extbBAYU3DXJ7h83w
 sri7VPyE7k2BJU1oZh4eg7+e7LRfDBrSD4tz/q0t/Wa8aMBuLwZDlQFvonfwZjJ83uQQ
 BPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Edg7SZe/LYVxNnbqgoVBuhXRLciPrmz39JuMkpRhFiA=;
 b=saHSEnWuV+8+3fI1MbMo3JP8LwPSun5TIRiCZtEOAAxVAbEOlgFmSmfIu1z1b0EQg2
 8EKTv1VUvawSVxrgYT1IEIVKNt+t/Dmw98d0lcNaLtrpPcvA2jkdzO5syOfv6UlUSo0Y
 sE9SCX/TF9rHVQ78VWvQcGQEJdO6eoVgweYgLcC8dixJriVbAD7ZA4M/+AxHemy8oZEV
 3FU6zXZLMFWgW5HqvHwXsMnww6bhPDDaB0mAX/G+hgS8+wTfXdCyCvOjE0lUTpLdXvp+
 CwnD4KOYQ1oZsXvLo1OglEgX/cOJ2You5qgxdwWTv5wABD+l/9qxa+ZMOBrFHmwmOACF
 g65w==
X-Gm-Message-State: AOAM532H745gA0gmILyKMf5JMlutaaQ7KvVkMPJRFWMy1GJyhuNm+QBI
 VdZm/VHMfquKVtsxX4n6X24=
X-Google-Smtp-Source: ABdhPJyxErqd59tSEM3iz4Sx0478rW57srYbnQpr9fq+lnOhrqy3rvjMYzKoZnS7LUbYWBTkx5opxA==
X-Received: by 2002:a17:90a:3988:: with SMTP id
 z8mr3665888pjb.46.1612047354575; 
 Sat, 30 Jan 2021 14:55:54 -0800 (PST)
Received: from 1G5JKC2.Broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id 14sm12989104pfy.55.2021.01.30.14.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 14:55:53 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org,
	arndb@kernel.org
Subject: [PATCH 1/2] powerpc/Kconfig: Fix unmet direct dependency on NET
Date: Sat, 30 Jan 2021 14:55:37 -0800
Message-Id: <20210130225540.1639-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Michal Simek <michal.simek@xilinx.com>, Paul Mackerras <paulus@samba.org>,
 "open list:LINUX FOR POWERPC EMBEDDED PPC4XX" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kbuild test robot was able to generate a configuration where
ETHERNET and NETDEVICES was selected by the Akenobo platform but not
NET, which resulted in various build failures and these Kconfig
warnings:

WARNING: unmet direct dependencies detected for NETDEVICES
  Depends on [n]: NET [=n]
  Selected by [y]:
  - AKEBONO [=y] && PPC_47x [=y]

WARNING: unmet direct dependencies detected for ETHERNET
  Depends on [n]: NETDEVICES [=y] && NET [=n]
  Selected by [y]:
  - AKEBONO [=y] && PPC_47x [=y]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/powerpc/platforms/44x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 78ac6d67a935..68bd647c878f 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -206,6 +206,7 @@ config AKEBONO
 	select PPC4xx_HSTA_MSI
 	select I2C
 	select I2C_IBM_IIC
+	select NET
 	select NETDEVICES
 	select ETHERNET
 	select NET_VENDOR_IBM
-- 
2.25.1

