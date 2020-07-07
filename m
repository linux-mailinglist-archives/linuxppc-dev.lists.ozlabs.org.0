Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8EC2165B5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 07:00:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B19HP3v6tzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 15:00:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uftFUaF0; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B19Fl5tjRzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 14:59:07 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t6so19453196pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 21:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fnf5BOlLTguFdAJt0eKBqSFaZTROPVc2dJ5RoFXNCYA=;
 b=uftFUaF0PjHg0naEaC4J+NSl69Db+2w3bJ6URTUu0NQ0/8Syog8GFyJos/mOW2tD3B
 jgroHtO7cic5K99ZvRpTyH3vKylb+A0A4Z0kAt/s3H68nivRpBkODHGFo0SSHvHlypwh
 39U/wnLwe7ElfgFYL2M2narCr959zv9/REkd3bVvgAHOKfWH7bzVQO/xuHkcaI+QvRSB
 gY0D5JyQgoohO2h9EN1s4UsZ/KR50Mpd3MUHjvAuX7FkSxFL4Bc+vX5F5Sfp+0a4wgOH
 /hOfzJ5VbGOy6fluH/BL0dg/w7IxdNeK6Y4yJ5pAwXEVI9VWsrihdxwX7DdXV7ywcCzw
 H5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fnf5BOlLTguFdAJt0eKBqSFaZTROPVc2dJ5RoFXNCYA=;
 b=RPIicRygPffhbQ0EiomYj7X7nARV/TrR0eJcDy7jzt9o8rZLa2VMB1yI5WbpzLxr7+
 Jk1thRMJRsCHuivSuJ2r3nLNLvz2+V4wSSSgziuchp0Zzv+pMxCn76DOLhr+FS/xTlbW
 yLmpjMcT3x+uU8UkfKMLSJmFbk6rpvrk7EHeA970bQRbS/p5szueyOms8P9EZ+PdUTyo
 2DraDEnraR6z9bJgaa/QEYjvh4HSrY2WE+ApHc9Kceh7tEi31omeFVkIS6GI/bkXGCfV
 JK2iRwZ60Z06srILqngbEZ7+YCYhaa2dpGn9ywqU82LKzFPDQVEAhwqbP54FbV+3B/ha
 mFPQ==
X-Gm-Message-State: AOAM532cqRVQ6hJNmwXsBCnTqKNX2crrxyLT5EkVsPzV31I6vhnebhRH
 YRVpxzrmUXzrhHN0RjszLTo=
X-Google-Smtp-Source: ABdhPJwwBjwRcBhX5cznZ+2DvGqB7QhUlH1A9wSx7ThIxOU26AbLCZvRJz73gSNVuaTqZ6nuI1r/Kw==
X-Received: by 2002:a05:6a00:1589:: with SMTP id
 u9mr49055656pfk.201.1594097943614; 
 Mon, 06 Jul 2020 21:59:03 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (searspoint.nvidia.com.
 [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id d18sm1017930pjz.11.2020.07.06.21.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 21:59:03 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v2] MAINTAINERS: Add Shengjiu to reviewer list of sound/soc/fsl
Date: Mon,  6 Jul 2020 21:58:29 -0700
Message-Id: <20200707045829.10002-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: alsa-devel@alsa-project.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, shengjiu.wang@nxp.com, timur@tabi.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
Changelog
v1->v2:
 * Replaced Shengjiu's emaill address with his gmail one
 * Added Acked-by from Shengjiu and Reviewed-by from Fabio

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 496fd4eafb68..ff97b8cefaea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6956,6 +6956,7 @@ M:	Timur Tabi <timur@kernel.org>
 M:	Nicolin Chen <nicoleotsuka@gmail.com>
 M:	Xiubo Li <Xiubo.Lee@gmail.com>
 R:	Fabio Estevam <festevam@gmail.com>
+R:	Shengjiu Wang <shengjiu.wang@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
-- 
2.17.1

