Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C225EB53
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 00:13:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkTN31c7QzDqW0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 08:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L7xXcYri; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkTCh4BgNzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 08:06:38 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id gr14so11964111ejb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=64pulymg8upcn5ooNDwq4fDRvEzDLb+c8LADu532gJ8=;
 b=L7xXcYri0vheic+7Bg0Hs16cq4QR64s38owAc0tQvTg9nYyJ1Ti7HmlyD6LMzNK7ju
 lc+65YMIKhsaTPDPUqjvAJlOTE3j27zyEoffXt7MPyjEc2kYYwrU/edHW9C4IE6xR6lx
 zNgEQiZ0HP0yEBHPnHdisIBkD4aSLV0n8Lj1G2qnI4RaQNpgwFulou6hnhODZZLGjF7e
 LIV1yJkbTDnSk/C3PGzknTqzXGPf3NoztFft/6SqO5fjSi0EnyO/0sG5Xl9RzYwGLyU4
 MidezhSFprJWRFFrYb0SDuqcxTpG1R6B6Io4kE+JMig/cwRxOJam3oerzLRapqXYGFS8
 axXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=64pulymg8upcn5ooNDwq4fDRvEzDLb+c8LADu532gJ8=;
 b=IQF0P1rEkRNFFI+niKdSLcx261Uo6nR4kb/dmnCI+ZHlqQR4ysqr/NSHqgRt4J8wy6
 yIk9L48xlJEoIMSOjo7QPDrDsCdMUdn0vQnUEYc/PSJHyotfHnOAPqFz72A+BrfDgXWS
 8jmKwGmPi9qVyNTSYqEd1ZYt+rFglvUFkMjGVdOWn0PEg0Dn7YfNGiZ5oOK5tMH1wDyd
 iCJsZ3UePh6MQt7TJl0m80hISu5Imrj5hv2mQN2fZ0PQPdibYFQn1SIKrm713s322lTF
 PyQeiC+HGQ45sn47UFuTgan116n5T2UKrohSp2lYxfRj6ZfRrwwMx6OPmlmfsrWx42ac
 dWPw==
X-Gm-Message-State: AOAM532QTfAm0oFSXLvefE2YNQSqeKGW5Wxhb/JX2J0E7p3nMQHDKWXH
 +fbbZnpSZOxAoILxCGut34Bc9KM/HFI=
X-Google-Smtp-Source: ABdhPJzXuqb9wRJESKMWWIbfoTO/dAaWoL/qfK/IYXFBslhLqNl+RSHinaaxYHIZ+Z8DPDjLZgPY5A==
X-Received: by 2002:a17:906:e4c:: with SMTP id
 q12mr13904690eji.425.1599343594311; 
 Sat, 05 Sep 2020 15:06:34 -0700 (PDT)
Received: from debian64.daheim (pd9e292e7.dip0.t-ipconnect.de.
 [217.226.146.231])
 by smtp.gmail.com with ESMTPSA id ci27sm10568379ejc.23.2020.09.05.15.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 15:06:33 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kEgKB-000FIi-KV; Sun, 06 Sep 2020 00:06:19 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/5] powerpc: apm82181: adding customer devices
Date: Sun,  6 Sep 2020 00:06:10 +0200
Message-Id: <cover.1599343429.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Chris Blake <chrisrblake93@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I've been holding on to these devices dts' for a while now.
But ever since the recent purge of the PPC405, I'm feeling
the urge to move forward.

The devices in question have been running with OpenWrt since
around 2016/2017. Back then it was linux v4.4 and required
many out-of-tree patches (for WIFI, SATA, CRYPTO...), that
since have been integrated. So, there's nothing else in the
way I think.

A patch that adds the Meraki vendor-prefix has been sent
separately, as there's also the Meraki MR32 that I'm working
on as well. Here's the link to the patch:
<https://lore.kernel.org/linuxppc-dev/20200822154045.16036-1-chunkeey@gmail.com/>

Now, I've looked around in the arch/powerpc for recent .dts
and device submissions to get an understanding of what is
required.
From the looks of it, it seems like every device gets a
skeleton defconfig and a CONFIG_$DEVICE symbol (Like:
CONFIG_MERAKI_MR24, CONFIG_WD_MYBOOKLIVE).

Will this be the case? Or would it make sense to further
unite the Bluestone, MR24 and MBL under a common CONFIG_APM82181
and integrate the BLUESTONE device's defconfig into it as well?
(I've stumbled across the special machine compatible
handling of ppc in the Documentation/devicetree/usage-model.rst
already.)

Cheers,
Christian

Note:
If someone has a WD MyBook Live (DUO) and is interested in
giving it a spin with 5.8. I've made a:
"build your own Debian System" sort of script that can be
found on github: <https://github.com/chunkeey/mbl-debian>
(the only remaining patch hack is for debian's make-kpkg crossbuild)

Furthermore, the OpenWrt project currently has images for
the additional apm82181-based devices:
 Cisco Meraki MX60(W) - Needs DSA for the AR8327
 Netgear WNDAP620/WNDAP660 - (Could be next)
 Netgear WNDR4700 - Needs DSA for the AR8327

Note2: I do have a stash of extensive APM82181 related documentation.

-- 
2.28.0

