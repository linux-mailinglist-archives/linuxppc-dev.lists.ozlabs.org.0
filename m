Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8F7B0849
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 07:33:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TS9Z5smyzF44P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:33:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H7SNwAq/"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TS5T5vhCzF3Yt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 15:30:03 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id c17so5045705pgg.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQD8TrOfS3maPpbFsY93lDWyVJH7XbSLS4gZhh7W9kE=;
 b=H7SNwAq/Q1NiucsnVEhSntpKXaJLAzjQS91knVgLLz14DXpyZVsZDyasD7h/DMoK+v
 sZmQhTaqlWV2sMHNv8vUEtZM3BeJ411TQ0022TmsDQOYjeQ/f7iemPc0pfuMHpGjlEHA
 zXvxzfy5WDYuTKdZ9o2jEL5Ptm7euulfdmv/IIujZlbtQUpE8F1zmu3Y4H1Tybiiicfw
 A7VRYuUFXEwjl7jln9RaspfjhdN6PMgBbpa1qFkDN+rA2G0ou36My6nEn/sIicYKqzP9
 JAh81+vj8o7motTG+bA7SZejFs2I0V77Fn8+qxeg0rPMIb38T6w9ERGGAEBT7yc3QKVR
 aEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQD8TrOfS3maPpbFsY93lDWyVJH7XbSLS4gZhh7W9kE=;
 b=Z7+65aI0n0qfVIu38eHT+VflFEuPiqWiMmb/Ldauv4ervz3AQOtnNfoTXQNnzwlVJn
 35urn4x0WaXxU0yNkGz+Y5vrClIRzmRkFYvolZdm//yXUR920DYwWEAisqH9w0gNJp3D
 eEjd2flaGE2gAjZ3WV2BGJdeUqdSsDnAXcf4HMu7pLCJWNIDdsQPP+WHM/ZFgMxYahRL
 BGguRC7qvzmDuHagAJqaiBE1MbNInNmPtM9u6qyIYh0pZAv7d3yrxhtJBcs3+nr0T7Ty
 MW/jEDZ1Cy1XMbW84pligOELNMLu/HTh2P2AhvfTxCJUSCYJPdEKzPQwtJV71nKxOV/f
 TNFg==
X-Gm-Message-State: APjAAAUaC5umYzoKrPYdBrlMklSiWsngkCMRBEcVQKLNnKAteLwghxvx
 CQUG+t/pZ66B+i8sMOko/TcaTX5V
X-Google-Smtp-Source: APXvYqyjkymkfhGk5UoP9E6M2Rf+kqzt2zf/SvuzXJUFMaPRNHJ6HbwpZBzUZMi2VoBAlDJfzmsn4g==
X-Received: by 2002:aa7:9688:: with SMTP id f8mr45674972pfk.77.1568266201345; 
 Wed, 11 Sep 2019 22:30:01 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n66sm35884386pfn.90.2019.09.11.22.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 22:30:01 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powernv/pci: Allow any write trigger the diag dump
Date: Thu, 12 Sep 2019 15:29:44 +1000
Message-Id: <20190912052945.12589-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912052945.12589-1-oohall@gmail.com>
References: <20190912052945.12589-1-oohall@gmail.com>
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

Make the dump trigger off any input rather than just '1'. This allows you
to write "echo 1> dump_diag_data" and it'll do what you want rather than
erroring out pointlessly.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index b24339b..f684d3a 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3047,9 +3047,6 @@ static int pnv_pci_diag_data_set(void *data, u64 val)
 	struct pnv_phb *phb = data;
 	s64 ret;
 
-	if (val != 1ULL)
-		return -EINVAL;
-
 	/* Retrieve the diag data from firmware */
 	ret = opal_pci_get_phb_diag_data2(phb->opal_id, phb->diag_data,
 					  phb->diag_data_size);
-- 
2.9.5

