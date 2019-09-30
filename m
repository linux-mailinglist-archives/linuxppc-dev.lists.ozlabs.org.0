Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FDC1A25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 04:10:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hQq91kvHzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 12:10:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="asNdDYu0"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hQnG4yj4zDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 12:09:06 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id t14so6496212pgs.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 19:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUoklqhdz+06Es4zydiqQcrTeUMxMd/mLUALLm71lfY=;
 b=asNdDYu0omLbaxUEQaI81/0xPdH6rv7dCsYzRxa5Ypn+z7n3HhcsnxqqXJ71hDmPR1
 xztElkuHfkuxIOzFh4a/AtJMWn0dSigtHeS+y8qFyQJ3xbXcoTcNrmBfswV57qKm3Y9b
 wmDJkLvYRLZFJserkfEBtvuHEXaJI/ZyH3rXOPELswCKLz1SQkGjFIxkwVP/td7Y3ZeG
 w6EKaJf+bvfYdxVTs/4LA5wX7dFZMiTtcFmHE0V5Xf+E0jrHF8YRRbr6PQbZ8J/hFoeY
 ufdJ1zLjDRx/vAZVkRtfVofyB326sUtc17XXJZBsnm2lMjZuVPyhroXEU+iAqpy4bMKV
 wW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUoklqhdz+06Es4zydiqQcrTeUMxMd/mLUALLm71lfY=;
 b=EjRTnLn0+7beJAhL4MlbnkYnUazQ0CU8iHs54+8ZW4npxSxYMlx+Ylk/EKFR78m5BD
 /7iuKlQok9L1y6Cbji+kAjNWQITKeOrCaNgXOBUSATz6qBCJUVuG59vgr9R32VTBz3YH
 nynndKgL51zaoiisoVetSrtj5mbzfc312imXxgP2EKUnM3NjBGAPVJpmTtsZ99H88FIZ
 BcpU4VeeOfSm7DGucTfQ88VWFCxsdzK1degI6sTnkArbd/VOkviqfgq8XZ44I2qqH4tO
 RdcdM+cvuYVs1nUrFG1OArNaT65wL1YgTE0qnknqqfvg1aFLji034o/H26vEj41rkWY8
 a9Bg==
X-Gm-Message-State: APjAAAXO64A9GhxRej87EQe6z+nbXhoqBSDnJElb0sZUTHnu8b4IJXsi
 WvBRCyWjFC6vF+xP6YgJ/wU/eHK+
X-Google-Smtp-Source: APXvYqyK6ilpREDn7g+CUxhDDvcld71JHVsbWRjGK9GVV2y8MzPM3ByZJAbP+y91ViNrEB1ey2l3mg==
X-Received: by 2002:a62:7912:: with SMTP id u18mr18249781pfc.242.1569809342296; 
 Sun, 29 Sep 2019 19:09:02 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x72sm11450733pfc.89.2019.09.29.19.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 19:09:01 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: IOMMU group creation for pseries hotplug, and powernv VFs
Date: Mon, 30 Sep 2019 12:08:45 +1000
Message-Id: <20190930020848.25767-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org, shawn@anastas.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A couple of extra patches on top of Shawn's existing re-ordering patch.
This seems to fix the problem Alexey noted with Shawn's change causing
VFs to lose their IOMMU group. I've tried pretty hard to make this a
minimal fix it's still a bit large.

If mpe is happy to take this as a fix for 5.4 then I'll leave it,
otherwise we might want to look at different approaches.


