Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785234C049
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t5s1nVTz3c5y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:01:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uqre0zmS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uqre0zmS; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t0j6ntCz30Hf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:53 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id q26so10932310qkm.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FFq3P7yiseEEIQs2lgtrYVJcUzd7SMyJml+jQ6mPYF4=;
 b=uqre0zmSKtKLv++i82S0mbofGjuwskwC3CvMsmMtmcwjGtVJxeycjVJ6RpN1VYBSe+
 0CQzJMu7PEalUVZXmadGM2px6kQtZ3N7tNZA8m0dvlRcCIAf2qxYblhfj3libS6ly7pM
 7cP6Y7jQrTC4iCIUP2k8mrM8YO2OpsBVZioO1TYaUyX8FXX33csqU52/jNiOF/7HzRdW
 h0q2j3ogjbDgvmDtoSNvMcXXBHSfFF65U6v9ngv5ZS5aXjxah14f4OMwQwxkXQDvmGYq
 AtbeqfKk09GWR+OXgzvinDBtt6Vlb1woQTa7OM74PpgkMbt4TVzXSvTJ5IGTkC59YqDm
 2KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFq3P7yiseEEIQs2lgtrYVJcUzd7SMyJml+jQ6mPYF4=;
 b=LjQQiTKoCIPBENv+2p3DsyNL4tjsxspROrg13iZmGOIjgsFI3JuEL2NU+gNpVEyWaL
 NMrL403diW+M0anRZOUc5X45Wq2FMH/EDwIENIusBUR4Ek4YYM3ez2CSc7uNcAVOiFTC
 2N6pEQbK0NnE4dHyqDHa2wgnDxPuzcHtCc+HPzck7f4mcBpjVubEsqLNUZFgp3YQfmE8
 uLRhv1/HrWJvUnPzWPfQRcHNX63K0RZFxka7lQ/npgibbqeN2kdiWeeEZC01Nrz7nMgv
 5i9JILSmXsUmn3NMR8kGovps/jW83IXum/C/UY+nIIzAvVWIYfb4QMqdQ98Fhzk9Yyf0
 m6aw==
X-Gm-Message-State: AOAM532KCCHCBG7HhnoHTNCFDGTE4AU3iRD3L55W0TxJBDzDRosM8rl1
 4xQ0NNFb8kf+RCFygYYeq9Y=
X-Google-Smtp-Source: ABdhPJyLHhya4uvoU4yUX2xpbMzIUxvQ1LFqJZoKSNEtSVlVs50tStFXatwwOAyjof/U/tKgBPUUrw==
X-Received: by 2002:a37:a10a:: with SMTP id k10mr22547586qke.171.1616975812145; 
 Sun, 28 Mar 2021 16:56:52 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 11/30] nbpfaxi.c: Fixed a typo
Date: Mon, 29 Mar 2021 05:23:07 +0530
Message-Id: <4171b74a36b486ce83fd019e654660d7cbe2dae0.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/superflous/superfluous/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/nbpfaxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 9c52c57919c6..9eacaa20ddb3 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -898,7 +898,7 @@ static int nbpf_config(struct dma_chan *dchan,
 	/*
 	 * We could check config->slave_id to match chan->terminal here,
 	 * but with DT they would be coming from the same source, so
-	 * such a check would be superflous
+	 * such a check would be superfluous
 	 */

 	chan->slave_dst_addr = config->dst_addr;
--
2.26.3

