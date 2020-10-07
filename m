Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CFE28577A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 06:12:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5gsV4zC8zDq9l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 15:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GGX6rwAK; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5gnw2vK8zDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 15:09:21 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id az3so388669pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Oct 2020 21:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gOvEyfBie8ExKwi3KVqlWE8kb2DNxYPhK7wk+w7sjSY=;
 b=GGX6rwAKR8FoVefamHSsT7Derf74cNRHVpqqn/pC55SvOkmAqa5g8aMr1R3NcR9Nzj
 J/WW+wbwjRCRMHV+iFyWRaw71GqqS3vfGBD+QvGTlC5yT9Qa0Mg8pJLjz8+V4DnuwgcH
 2YIVFqHGGvifRWpqwJHuiIMHwpVpPBK+pM8lAJf2gbMPpNb974wBBGJPN49DgVegum4r
 55THEd2Dr05rE0KZDVzyzr0bAvHb1GThf8AoEaPuoIVexKVKQXQxZl6uiKoQTfWfB6bd
 7fgYIkwYbYjn7RirNkT8BDzklRxntw/4DcAMRtCjpwSXnchLaz3ujX8u8Ifh3W1LtAvM
 athg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOvEyfBie8ExKwi3KVqlWE8kb2DNxYPhK7wk+w7sjSY=;
 b=BV7k8TOTqkGJQcgrUTdOJBEEAfd6RCGkOPXHySVPFdbnzKTXIgIocNUgcmas3h6OgY
 RPw2dq3ICzD+kU5MnWQhI0+8ro8ekYfzEhnrDGnX1imCvleyQCznsHXbl0ZW4LQnn+zQ
 rCH5CpkGb+ixIMCIJ0V8CzPYgzH8SkHRQimHCs6owpNXml2UWQVAoik+pwohAxF00soQ
 ms/2DQb3mL4IYub1Bb5wgcAWQURBLX262S0ijEEhgwWWfxAISNbFgfUUMuVOgkKePvVd
 B0n2IrcT4yNTcCwsdAw0SgXznmo5k+o0/9spftRCvI9jWBFqm7zQTzLgV4RgZ7Q8gZyf
 NpSg==
X-Gm-Message-State: AOAM531OgC62ogRE6ym7pDzsM0HPRB4trWf01hp4YFN0Wf0ou99wXM/d
 86HCHaIYI8DEC5q+u1gWmNHRtmDjh/4+tw==
X-Google-Smtp-Source: ABdhPJwQh+bGEaFimEP/9hpgJNtX154IqOF2XvZI32iPM31z1NqY/lm3cO18cNlf+0Igh+2YSMtEmw==
X-Received: by 2002:a17:90b:30d2:: with SMTP id
 hi18mr1239595pjb.86.1602043757992; 
 Tue, 06 Oct 2020 21:09:17 -0700 (PDT)
Received: from localhost.ibm.com (14-200-206-90.tpgi.com.au. [14.200.206.90])
 by smtp.gmail.com with ESMTPSA id
 x3sm829552pgg.54.2020.10.06.21.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 21:09:17 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries/eeh: Fix use of uninitialised variable
Date: Wed,  7 Oct 2020 15:09:03 +1100
Message-Id: <20201007040903.819081-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007040903.819081-1-oohall@gmail.com>
References: <20201007040903.819081-1-oohall@gmail.com>
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

If the RTAS call to query the PE address for a device fails we jump the
err: label where an error message is printed along with the return code.
However, the printed return code is from the "ret" variable which isn't set
at that point since we assigned the result to "addr" instead. Fix this by
consistently using the "ret" variable for the result of the RTAS call
helpers an dropping the "addr" local variable"

Fixes: 98ba956f6a38 ("powerpc/pseries/eeh: Rework device EEH PE determination")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index d8fd5f7b2143..cf024fa37bda 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -363,7 +363,6 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 {
 	struct eeh_pe pe, *parent;
 	struct eeh_dev *edev;
-	int addr;
 	u32 pcie_flags;
 	int ret;
 
@@ -422,8 +421,8 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 	}
 
 	/* first up, find the pe_config_addr for the PE containing the device */
-	addr = pseries_eeh_get_pe_config_addr(pdn);
-	if (addr < 0) {
+	ret = pseries_eeh_get_pe_config_addr(pdn);
+	if (ret < 0) {
 		eeh_edev_dbg(edev, "Unable to find pe_config_addr\n");
 		goto err;
 	}
@@ -431,7 +430,7 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 	/* Try enable EEH on the fake PE */
 	memset(&pe, 0, sizeof(struct eeh_pe));
 	pe.phb = pdn->phb;
-	pe.addr = addr;
+	pe.addr = ret;
 
 	eeh_edev_dbg(edev, "Enabling EEH on device\n");
 	ret = eeh_ops->set_option(&pe, EEH_OPT_ENABLE);
@@ -440,7 +439,7 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 		goto err;
 	}
 
-	edev->pe_config_addr = addr;
+	edev->pe_config_addr = pe.addr;
 
 	eeh_add_flag(EEH_ENABLED);
 
-- 
2.26.2

