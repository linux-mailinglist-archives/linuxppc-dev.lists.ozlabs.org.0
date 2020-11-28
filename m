Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D48422C6F40
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 08:17:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjjVl4NxWzF154
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 18:17:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LRGZCBGa; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjjHt45VZzDsPf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 18:07:54 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id e23so1149192pgk.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 23:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4hsbV9WTjMt7nZtZJaSJ1Z2j4r46XROS78uy2HuICb8=;
 b=LRGZCBGaSS0w37y+qBkTudJGUdXhwbeixTJMVO0+ofjtdeBbmI/3FRlEkjAgdKsvuO
 r7WDtIRJdhTwoVFmg9xeRDsFhoc+ryMR6zbMh3UuO88llTXZ3VFo5aum4GiM8xx7uTN7
 JIhFsDj9Pm7w8BxZHb4J3nNe+MT53k09goapKBTZi84SwbPCzDlJ58uC0VAzIeKhT88J
 h3tu41aS+4uY8EWSGXaZNzwrzxWe2gl317T5yXpI/pzOrAuC8+FSu/iJ2t6s8tEBEOAp
 8/uLoiC4AHbzfJc2vpZUozefZj34jKANawQXNfMNh1eJVJi2yVz4UKe9X+vnaMRp3JXn
 jkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4hsbV9WTjMt7nZtZJaSJ1Z2j4r46XROS78uy2HuICb8=;
 b=NUZd2L/+EwQmXPQC72DcqSZ+3eSAxjtZk4k604xSAJZSY2zPlYeXysUJH4vo3DRv8q
 L3MydnUhEHsRwTESSjOhbFEUqr9wR1YQZxJ96yr9hcK73dle1ReEmAOEDEIXS4Pylz89
 nzEB+4bq7ILrh18Spr+RXWC6kDeRAle/S+3i6WfS6uTqI8aJ6Vf1lDlHL2s6+fAD12Aq
 Yx50+RxAt7vnZD9nViMaPYEGLTk3AlRucwRmJrl+wzA9mRAY+hvPCdWBAXgwiAe1Slef
 DQcdAWU4mZgpEXjB8m8tX4CRwWA/H54VXDu1li3lK3nw7OHpIUr8cKOclITDoVlNepvR
 qlSw==
X-Gm-Message-State: AOAM532Z2FAfU1Z5oPh0/LuFRNKzXY7kzeyLusFpBWxtMQPQu7REqfyP
 2SG7yDsfgFHcL6y1QdI38N7XH7zM8BY=
X-Google-Smtp-Source: ABdhPJzaGShDY2Gq4eORt0NVOarw+k6MNYM36qhjKb9ZBYvKwpnUsV+/FcTpf/+hi1XAcRKwlSs+TQ==
X-Received: by 2002:a63:83:: with SMTP id 125mr9782638pga.423.1606547272372;
 Fri, 27 Nov 2020 23:07:52 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id e31sm9087329pgb.16.2020.11.27.23.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 23:07:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/8] powerpc/64s/powernv: ratelimit harmless HMI error printing
Date: Sat, 28 Nov 2020 17:07:25 +1000
Message-Id: <20201128070728.825934-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Harmless HMI errors can be triggered by guests in some cases, and don't
contain much useful information anyway. Ratelimit these to avoid
flooding the console/logs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-hmi.c | 27 +++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-hmi.c b/arch/powerpc/platforms/powernv/opal-hmi.c
index 3e1f064a18db..959da6df0227 100644
--- a/arch/powerpc/platforms/powernv/opal-hmi.c
+++ b/arch/powerpc/platforms/powernv/opal-hmi.c
@@ -240,19 +240,22 @@ static void print_hmi_event_info(struct OpalHMIEvent *hmi_evt)
 		break;
 	}
 
-	printk("%s%s Hypervisor Maintenance interrupt [%s]\n",
-		level, sevstr,
-		hmi_evt->disposition == OpalHMI_DISPOSITION_RECOVERED ?
-		"Recovered" : "Not recovered");
-	error_info = hmi_evt->type < ARRAY_SIZE(hmi_error_types) ?
-			hmi_error_types[hmi_evt->type]
-			: "Unknown";
-	printk("%s Error detail: %s\n", level, error_info);
-	printk("%s	HMER: %016llx\n", level, be64_to_cpu(hmi_evt->hmer));
-	if ((hmi_evt->type == OpalHMI_ERROR_TFAC) ||
-		(hmi_evt->type == OpalHMI_ERROR_TFMR_PARITY))
-		printk("%s	TFMR: %016llx\n", level,
+	if (hmi_evt->severity != OpalHMI_SEV_NO_ERROR || printk_ratelimit()) {
+		printk("%s%s Hypervisor Maintenance interrupt [%s]\n",
+			level, sevstr,
+			hmi_evt->disposition == OpalHMI_DISPOSITION_RECOVERED ?
+			"Recovered" : "Not recovered");
+		error_info = hmi_evt->type < ARRAY_SIZE(hmi_error_types) ?
+				hmi_error_types[hmi_evt->type]
+				: "Unknown";
+		printk("%s Error detail: %s\n", level, error_info);
+		printk("%s	HMER: %016llx\n", level,
+					be64_to_cpu(hmi_evt->hmer));
+		if ((hmi_evt->type == OpalHMI_ERROR_TFAC) ||
+			(hmi_evt->type == OpalHMI_ERROR_TFMR_PARITY))
+			printk("%s	TFMR: %016llx\n", level,
 						be64_to_cpu(hmi_evt->tfmr));
+	}
 
 	if (hmi_evt->version < OpalHMIEvt_V2)
 		return;
-- 
2.23.0

