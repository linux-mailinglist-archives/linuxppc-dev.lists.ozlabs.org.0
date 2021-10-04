Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E62AF4219DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:19:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZs169y3z3c9f
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:19:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m7Cii4O3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=m7Cii4O3; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMcv6PS3z2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 00:53:35 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id s75so5729063pgs.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=m7Cii4O3QZLRYFRd30tuRa1ZGW5M1nO9R064AjZksMB9Vx2UcoVaHIPKQCoCpX+ab2
 xxE5BgKLDZb0+xhrQH1YgdG4LisEAqX4cNSdHTyaDqk9I1QBxLGXsGie8FtGgeSoFxXn
 QQiNcRbsZwcNAGpjW/E4nmrU3+Kf7dVizxU5cjmihNXPDWSNuQgiez8sI61FGn0OqBu6
 AitsR5SoUvrPwOGHAoWpYb+itJUZr75vuT2EYNrhkM7WfNUHAti/qP//FRdpmFZQHAq2
 obH22mG+VGLBeBSn7dGb8kMWwjIIJ6Q3OV/kZw6S/ny0IYyJvSK1lbfR4Sc6UTdmO2EU
 RJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=GvCbXeRmOLqS5KAemiJvPtCnF5RYE344qpFT08MML5W0GCVPRcyjJreK9pTVuHTFWN
 s4RZpXWix8NBk2Yr6mhkZq40BgDriqR1hNoImlbFCGJcS6JYD+A+RbUg0zvJDNJaaRTt
 u/ZpYUlmONH9zpzMS2LUOBR1scOwik24AjAiIgAOfJenINdkU9133lTLWmwFk7Tv7PtH
 nd+3UHjaUSRoxuTaLIqW4kwlaX+Pp9LG5700RfC1wFLSsjpC1uPFDkg+6kgKQQTpsX/R
 2FLd4YNagh1gV10/i3pxMJE/FcsUgR6REdsRcanWkL2yTGvS/GwzuQiW/JHwB4wBaQ17
 PGNg==
X-Gm-Message-State: AOAM530plcGeiqmGbzlEcJInQ9ftgwXHB7TrQF0zLrknniHLFEXFKeyQ
 +51/mTmVe/wTsgtECJGIXBY=
X-Google-Smtp-Source: ABdhPJwqgQQmy2bTDwBaFQ3GZmWyi+4O57N3AsLw3XYvg9TAQJSn+qRPsDk/VZ0CSFCVCv/AP5hqmw==
X-Received: by 2002:aa7:8bd4:0:b0:44b:1f60:497 with SMTP id
 s20-20020aa78bd4000000b0044b1f600497mr24979664pfd.78.1633355613620; 
 Mon, 04 Oct 2021 06:53:33 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:33 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 2/8] PCI: Cleanup struct aer_err_info
Date: Mon,  4 Oct 2021 19:22:37 +0530
Message-Id: <247efb0e4168393f4aee5e267a9aa8b3a8adff0f.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: Naveen Naidu <naveennaidu479@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The id, status and the mask fields of the struct aer_err_info comes
directly from the registers, hence their sizes should be explicit.

The length of these registers are:
  - id: 16 bits - Represents the Error Source Requester ID
  - status: 32 bits - COR/UNCOR Error Status
  - mask: 32 bits - COR/UNCOR Error Mask

Since the length of the above registers are even, use u16 and u32
to represent their values.

Also remove the __pad fields.

"pahole" was run on the modified struct aer_err_info and the size
remains unchanged.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pci.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1cce56c2aea0..9be7a966fda7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -427,18 +427,16 @@ struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
 
-	unsigned int id:16;
+	u16	id;
 
 	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
-	unsigned int __pad1:5;
 	unsigned int multi_error_valid:1;
 
 	unsigned int first_error:5;
-	unsigned int __pad2:2;
 	unsigned int tlp_header_valid:1;
 
-	unsigned int status;		/* COR/UNCOR Error Status */
-	unsigned int mask;		/* COR/UNCOR Error Mask */
+	u32 status;		/* COR/UNCOR Error Status */
+	u32 mask;		/* COR/UNCOR Error Mask */
 	struct aer_header_log_regs tlp;	/* TLP Header */
 };
 
-- 
2.25.1

