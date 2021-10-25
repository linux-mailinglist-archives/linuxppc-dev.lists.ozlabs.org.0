Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 408B4439CB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 19:03:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdLqx13bPz3cbL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 04:03:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N4v/A7+Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N4v/A7+Q; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdLpz0vJKz3c9c
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 04:02:18 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso5457813pjc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=N4v/A7+QJCcAbm+CvFlnlwM7C67m7YvUb7uDA62Ea6M2zy9mFn7L6qlzyseS/M/hvG
 tSJbimFBdC4p5RReqa2wpV6Qqjd4P24XzwxeLbj00xU7hcRRw5znumqH2s/fOHMfjSX9
 o5nd/AIPR73SqODv5t3sS3lZf5iijuK80MsyWyIw5o0FWX9YKrLpr3FlXwhqmXj9ObM3
 vPpoGZ6V4Jv4wDgtx2wXumflnIweN5T/qLoY7NBdAFL6pkNwLJgP04wR0lIKTa5RLweC
 RqPKrKht1tvRKs6JR6I7M00dsZt0Vx5DzJDUHy6IhLUn99V93sH7dP35x73mQfuyLXxC
 urFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=wszeW46878GNuKrIDdgRludlmlM8FZgDK5l9DZ664sAsBour7jQOguFYaZu7vrU+gr
 7wPXRV3CqXMCW8XH6akSxRv8rHLC5MS4BhdP8eynz1sMHH3uLZdT1xqvB52JTuiIvi+e
 If5xn/OGMdFqvd+Mtbzvd5JmqPM3MBnKxkU9xnIIrdEyTv3QxM+SiY5a7xwX2hUrhkT2
 pvX+sK10gopFGlLZsOvDjhRHMXlp1+QOYFCUj0acmuutZqvP2sOLJcE8tR6/9JXVMOEb
 Us7WdFRq8ZGZnHUsjnmLlidf03n0slygtWpFVoyO5kesMLGpkxNfbRQhI98ewv/npj/8
 9TLg==
X-Gm-Message-State: AOAM533hnpyZ5/uBn72opsQ/v+1SYXSy4KvKby6Ej8GhXQv+Biq03hX4
 j16HjHi2flJxrun5KGXXCZE=
X-Google-Smtp-Source: ABdhPJxPfl0ou0aD/UXHIs1Nj72QAYSTX4fl/euKCb4hAOQJajxyiu9l4DhyC9t/Ht92fYZ9ThIeJg==
X-Received: by 2002:a17:90a:fe16:: with SMTP id
 ck22mr12789728pjb.186.1635181336216; 
 Mon, 25 Oct 2021 10:02:16 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:02:15 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 2/5] PCI: Cleanup struct aer_err_info
Date: Mon, 25 Oct 2021 22:31:01 +0530
Message-Id: <10d354c32e7517ad16e9f37bd4595de83dd7ccbc.1635179600.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635179600.git.naveennaidu479@gmail.com>
References: <cover.1635179600.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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

