Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E724248E7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPnZv5Cyqz3cGb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:26:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iyOXjM9w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=sohaib.amhmd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iyOXjM9w; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPf6q70fBz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 02:50:26 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id u18so10255835wrg.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cCqWG1MwEY4yYdxCME2ROilZdOUtSzSai+WEWHRm8RA=;
 b=iyOXjM9wDFuHQIxXuNqOlfREgSV+GdfhpvqkcFFQNasGiu3rb2rsiI6pZ40Pww/7XK
 wgB9Nwpw6buIM/WrCAKMYBFWcxsGK8UyuFl/PMvnDjdCa39XntP6WmGODP82KXGJK9AI
 ljp6sffETP1wamXxobYs6U+227xf2fbEFCj5Ez4kkbBboUpgiZ0aEb6qoORmJyYJ5/p3
 vpD1YidCEEG0cS55gvZ3caIfCaOhiv3lpNzJBADnzYh+UT+xarud8xxmAnU3XbGtRTAm
 8Ar1Aro75dVvvuGkxqZxq+taMIb2USsI5kaHRhAiijCkTxsCDXkf8wblKgKyjKFqxfug
 SEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cCqWG1MwEY4yYdxCME2ROilZdOUtSzSai+WEWHRm8RA=;
 b=6UKpNm2pXRascJDK7CfVcW09KxJ2uEHYyXd3OQUshX3pAZaXR8+5uU/31K5D4leDFZ
 mvW0lLGIfFFDB1CQvzJ3hW9gVio9E3zNyXTqa/XzHg5II+Mo+CogrrVPS3bvFyGEpF4I
 YFGj7Qr8d3xV9azjRov8kqxmPJM0/CwUXAqXj1MJBHzY218giZZNOisWYOEtEQpIRANe
 7CDsSxbu8lNFp1jkN1ta/rY6+70WKB91C97S1lybuRj0z7LN9+VzeBqJNJvQYnkt5B+F
 0xeV//4K/QIPETN98QV3IzkW8N7ETaZh7TtW7RVe+tmATT3jNh0KvzXR8H2ie7WwZA8U
 2Hog==
X-Gm-Message-State: AOAM53160Ug3RZ0VolxuzAaNiV8CZmg/XJDCBvibJeydUPYKM+us/mk7
 CJehedbWMZj08Fuy9NiTJ2A=
X-Google-Smtp-Source: ABdhPJzaKAqSTjDB3cmj0NV4WVtEgdbmLFCvNqTtMjsXHjNRIICaxYehx8hx0gelq+H9vx1C4gMt7g==
X-Received: by 2002:a5d:4601:: with SMTP id t1mr29024727wrq.298.1633535420022; 
 Wed, 06 Oct 2021 08:50:20 -0700 (PDT)
Received: from localhost.localdomain ([197.49.35.129])
 by smtp.gmail.com with ESMTPSA id q16sm4355868wrw.23.2021.10.06.08.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:50:19 -0700 (PDT)
From: Sohaib Mohamed <sohaib.amhmd@gmail.com>
To: sohaib.amhmd@gmail.com
Subject: [PATCH] Documentation: Fix typo in testing/sysfs-class-cxl
Date: Wed,  6 Oct 2021 17:50:17 +0200
Message-Id: <20211006155017.135592-1-sohaib.amhmd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Oct 2021 08:24:18 +1100
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove repeated words: "the the lowest" and "this this kernel"

Signed-off-by: Sohaib Mohamed <sohaib.amhmd@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-cxl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/testing/sysfs-class-cxl
index 3c77677e0ca7..594fda254130 100644
--- a/Documentation/ABI/testing/sysfs-class-cxl
+++ b/Documentation/ABI/testing/sysfs-class-cxl
@@ -103,8 +103,8 @@ What:           /sys/class/cxl/<afu>/api_version_compatible
 Date:           September 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read only
-                Decimal value of the the lowest version of the userspace API
-                this this kernel supports.
+                Decimal value of the lowest version of the userspace API
+                this kernel supports.
 Users:		https://github.com/ibm-capi/libcxl


--
2.25.1

