Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB56B4248E6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:26:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPnZ94THSz3bXJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:26:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jD+TV2IZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=sohaib.amhmd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jD+TV2IZ; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPcYC1ypqz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 01:39:42 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id t2so9527094wrb.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLdbSR9/I9UWE4egIELKXu7JM87M2XfBH4X1udQ+ZO8=;
 b=jD+TV2IZP6qsQuH03DAH/ZMWUXB4e/5vLES3oQSkseG3yAtg2pSmk+aBsW1wrqRVdv
 GOZ4Ljk8JBMhD1d5aQchNa6gqWDCHIcqYdSSNTl4//ZsGs/9dKNg3BU9FhcvtVPbxtjt
 2UOwNemogzniGxGuxzuQpMNTjYzrxPQZixO9w1srW7DsiE4tHywDtqZibvTKg0QL18JQ
 nqBA3hZPg6zzTgA/v0RbY6+RPU/X0f8GXGMX+f4x9cs/p1P478w1CwMV6zUPUfhIXWCg
 +R4hc75F0YxxLfpphEW5HAfrc66fQfzsn2thkE/2Ll+xm13ZwaeYeAmxS6fyNwJXVfHn
 NOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLdbSR9/I9UWE4egIELKXu7JM87M2XfBH4X1udQ+ZO8=;
 b=TVEFG1cN5NXYskCDxd37HsAkJdyN3qb/9L+iXVXUHRMdCQthwvtTAK6ZShpFFP6+i7
 HBEuaxS57sK4D1q9IVgcYyUGfpQOY5CiLkAY22eBFvsNYCaQ+FGiPX8e+Z4ly/LxSAp1
 avPyVQqacsiiVPpzxrps0546RCMkHWM+TFzMTTqj1S5EgjqjoVCLSpF8nOFTOKoa1+Wl
 1SMPACdPicZB/Xo2CDTEnxjZNvCuxd61HFhkyUqE27I7B77qYVkgWn0MPa1NAD1+ULFU
 oy+Xc9JxVhJoB1fNz7DQK3rlZp3+HLlOJsfKT4Nx8DFdObSzI+VKAK+4KAF7MctY4EFs
 NoWA==
X-Gm-Message-State: AOAM531wQYfyUBo1I8W7ogvjNbsQbRwJL/WreDKtV30kXDuFtm2U8Bgx
 M/v+8p7vlsGkh7RcHAHebdo=
X-Google-Smtp-Source: ABdhPJykIB0WVfubWtk5f4EQngbvyhBx4yZfpBccR0mL1BHAt6DWuoxboQZEHd3HHbWfzEMfQFSuYA==
X-Received: by 2002:adf:b348:: with SMTP id k8mr28057726wrd.435.1633531175684; 
 Wed, 06 Oct 2021 07:39:35 -0700 (PDT)
Received: from localhost.localdomain ([197.49.35.129])
 by smtp.gmail.com with ESMTPSA id d7sm21313944wrh.13.2021.10.06.07.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 07:39:35 -0700 (PDT)
From: Sohaib Mohamed <sohaib.amhmd@gmail.com>
To: sohaib.amhmd@gmail.com
Subject: [PATCH] Documentation: Fix typo in testing/sysfs-class-cxl
Date: Wed,  6 Oct 2021 16:39:33 +0200
Message-Id: <20211006143933.129960-1-sohaib.amhmd@gmail.com>
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

Remove repeated worlds: "the the lowest" and "this this kernel"

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

