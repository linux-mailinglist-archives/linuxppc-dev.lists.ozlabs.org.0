Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7696B1A1FC8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 13:24:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y23v1FH9zDqN1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 21:24:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XnW1v8mS; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y21n4LJDzDqT8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 21:22:35 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 22so2263880pfa.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sMGHMCexb3J0uGLOYLYW/4emP8U4lvDCD7VaquqbelE=;
 b=XnW1v8mSaLVKUwA14VRpEd9d2avxdMj9rKE4G1aF6F1zZjto0rjHrPq+u55HUnPvFS
 WLCLZqIK8ijZWJYQ3PHWqwtWR6oQUGURyBd+VLOIaEjxJhjdUigYV9dz3JeSOV9L/y+q
 jh4Q1u0pjqndefNy7F5RvH9gXh1qfCjM6XNaTBNNfHjTnbo2WmLhT9OdxmNXErwD0XP0
 4XysS5VQJ6A51upfPzxLcVMVFplWI4fD8ZlHbT+rLXQiO/JG/W4QT4mlmhhU9EyURJKw
 /1myqsp24tjqs8TyxZv/YEKYia/3b9VfO66TCSptUazXA4iw6Vnmb97H8qJYpDD9v4dE
 K2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sMGHMCexb3J0uGLOYLYW/4emP8U4lvDCD7VaquqbelE=;
 b=kxcc2dZjMzAYoEUG2GgxhzbWijKjEmSBMfAaeRrMPDzhNdsp40p89PlMLuYZSrUCRr
 2pPmUSs9yP4M5WfnuFhO37dEaYnMJUQ53Rp4iPnqrPrmPJQ4bTbpYoaVEeel/1tCwxLv
 rHkCfdX/H49VvHMrOrQagf3mDH+T4qCufP+Kfchdbu2RWnmuBUP7yErOY5GZLKrY5xPw
 0euiyv7A0gQDnz1jMB0c9Gp/BZW4UVIG3SlMa6oT0NfUqlIprMEhwetqDBsAXZdU/j8m
 qmpI32Si6+z9l6TSl9q23zqT5FLfuLJAwcxA0+lkjznlJhu3oc/R95aOvftb+8+RZfJX
 ADJw==
X-Gm-Message-State: AGi0PuYb08+tpRfEAMvtSLHxZ7DXxtB5q3oiSwBInt/gOmgALwi8sxld
 CKZKOBCTVcInhAO+3DWUcT2D2ixD
X-Google-Smtp-Source: APiQypJfDuXN15RvG/dc695/p1twIfxN37RlBa89BjFhgjNDcW/TfWfYQ0m++XJC3H6A0WNU4TGMKA==
X-Received: by 2002:a65:56cb:: with SMTP id w11mr6072431pgs.400.1586344949162; 
 Wed, 08 Apr 2020 04:22:29 -0700 (PDT)
Received: from 192-168-1-13.tpgi.com.au (14-200-20-104.static.tpgi.com.au.
 [14.200.20.104])
 by smtp.gmail.com with ESMTPSA id j17sm16498437pfd.175.2020.04.08.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 04:22:28 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Add a print indicating when an IODA PE is
 released
Date: Wed,  8 Apr 2020 21:22:13 +1000
Message-Id: <20200408112213.5549-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quite useful to know in some cases.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 3d81c01..82e5098 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3475,6 +3475,8 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 	struct pnv_phb *phb = pe->phb;
 	struct pnv_ioda_pe *slave, *tmp;
 
+	pe_info(pe, "Releasing PE\n");
+
 	mutex_lock(&phb->ioda.pe_list_mutex);
 	list_del(&pe->list);
 	mutex_unlock(&phb->ioda.pe_list_mutex);
-- 
2.9.5

