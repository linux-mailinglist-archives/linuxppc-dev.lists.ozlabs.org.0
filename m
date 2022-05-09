Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F35209CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 02:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxytt5Ll1z3c7R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 10:03:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=fgQGgwon;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=mkhalfella@purestorage.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=purestorage.com header.i=@purestorage.com
 header.a=rsa-sha256 header.s=google header.b=fgQGgwon; 
 dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxq8d6zNLz3bbn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 04:15:09 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so77599pju.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SyowesK9U7eSVq7QMaQPegZAs2FL+kTvFFeYpSRPCwQ=;
 b=fgQGgwonLNudSAc9oIt4TtM9RE17sdmswvDyDJ0PtqtNkRiny6l0en3Jkns0vr/kKi
 1UGmLm2hTfC2iwuhwJutDwXkb558QFwjLEUZRr4+xUePhvmoJ2ZyTUito0NusLIL+X+/
 Z7PuITXKzLlUwXe3pq2kAYJxKJhXFaEg7hTbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SyowesK9U7eSVq7QMaQPegZAs2FL+kTvFFeYpSRPCwQ=;
 b=0k93MjhrIAHH9bE3TdqIUiW6RKSJF8a0/B2vKR8FD7OKUQR9k4wzJ0E5OtSIqMWNaw
 Jhbz2ay4f4z1Xj3bh2jPAYzHJFc1bB2Pfg54BlHalr7IFmrrE+itBuJ7NMb6zSoiMZee
 Nmzq4ouaAsadQEFOYNLbmHIcgjO9+beaN9GqLGAnTTAOz5rTbN7HMiaA2AT/9NjDNQfw
 fsm2KnTmb+fXL99seUhPO2CM67DFu2cZr6FuS0/M1xgsLoF3DzKuRjTWDwlbdvFLKafg
 hnL/fXe3X5dsILFda9CgAZzC8m+S5GnAyyZLtTCXxH3cSDKaowGmGH6ncr3hkDZAkQ/h
 MNsQ==
X-Gm-Message-State: AOAM530KEZvuInpKtQVxXDQjbROO4lAwTv0cjQA/9VgqlHTuG002nR/u
 y3kfG7JKRN48mF2YXxaQB+ft6A==
X-Google-Smtp-Source: ABdhPJzFNBRQ2Q1XDKbHbd7ZYGXOOytDH274fEG/tp2JYfzyhz5+wsbzR7mkgvY/m4+E/0FXM7Wjsg==
X-Received: by 2002:a17:903:240f:b0:158:b871:33ac with SMTP id
 e15-20020a170903240f00b00158b87133acmr16950870plo.135.1652120106524; 
 Mon, 09 May 2022 11:15:06 -0700 (PDT)
Received: from irdv-mkhalfella.dev.purestorage.com ([208.88.158.129])
 by smtp.googlemail.com with ESMTPSA id
 m18-20020a170902db1200b0015e8d4eb293sm152377plx.221.2022.05.09.11.15.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 May 2022 11:15:05 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: mkhalfella@purestorage.com
Subject: [PATCH] PCI/AER: Iterate over error counters instead of error strings
Date: Mon,  9 May 2022 18:14:41 +0000
Message-Id: <20220509181441.31884-1-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 May 2022 09:58:00 +1000
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Meeta Saggi <msaggi@purestorage.com>,
 Eric Badger <ebadger@purestorage.com>, Oliver O'Halloran <oohall@gmail.com>,
 stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI ENHANCED ERROR HANDLING EEH FOR POWERPC"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI AER stats counters sysfs attributes need to iterate over
stats counters instead of stats names. Also, added a build
time check to make sure all counters have entries in strings
array.

Fixes: 0678e3109a3c ("PCI/AER: Simplify __aer_print_error()")
Cc: stable@vger.kernel.org
Reported-by: Meeta Saggi <msaggi@purestorage.com>
Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Meeta Saggi <msaggi@purestorage.com>
Reviewed-by: Eric Badger <ebadger@purestorage.com>
---
 drivers/pci/pcie/aer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9fa1f97e5b27..ce99a6d44786 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -533,7 +533,7 @@ static const char *aer_agent_string[] = {
 	u64 *stats = pdev->aer_stats->stats_array;			\
 	size_t len = 0;							\
 									\
-	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {		\
+	for (i = 0; i < ARRAY_SIZE(pdev->aer_stats->stats_array); i++) {\
 		if (strings_array[i])					\
 			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
 					     strings_array[i],		\
@@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
 	struct device *device = &dev->device;
 	struct pci_dev *port = dev->port;
 
+	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
+		     AER_MAX_TYPEOF_COR_ERRS);
+	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
+		     AER_MAX_TYPEOF_UNCOR_ERRS);
+
 	/* Limit to Root Ports or Root Complex Event Collectors */
 	if ((pci_pcie_type(port) != PCI_EXP_TYPE_RC_EC) &&
 	    (pci_pcie_type(port) != PCI_EXP_TYPE_ROOT_PORT))
-- 
2.29.0

