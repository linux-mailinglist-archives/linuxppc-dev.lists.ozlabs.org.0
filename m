Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9133AF0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 00:14:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hq9T25jdzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 08:14:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F39ZYDel"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hq890JV5zDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 08:13:44 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id w33so28957436edb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QO9b5Do5ysQrr7s3GzcTFKoPLVja1hwLd/j7EFbklsk=;
 b=F39ZYDelGutNNCw6Bm7MOuBQURzN8FAvhTNI9xGoMNHwOACNWjg9BFnW+WeFnsIQq7
 Q0VASU62D/QuJQjOsiMtpEez8Etq7laX3OFIvnaD++/DW8DLB8ztNIkDoAITNGzs61ho
 5MogTKA1mgmgCZsXjFQePNV6uXanaRvbqXK+zvg1ipmxn6fgfuINLrh2epN64OPP7Hga
 jR9dl+Ejsp0swrOCM12w4x2LOgpskEk1EuaM9DdE0zsyT9PgQU3dNV60i5pv/47x9g21
 s/o5Uy8CbEpI/Fba6v4MqWyx6TiJcKHSNLRn/NS1ok0Q2ltXR3aDtEfgHNdtp/fIPZ2L
 uTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QO9b5Do5ysQrr7s3GzcTFKoPLVja1hwLd/j7EFbklsk=;
 b=Jid2Q2wD/m9gsYo2QyxYUf/aRNy/abTvHHuHNtM+rLIDO+J6BakAWlEG2fckuGqAfY
 vf2ddbHrXBfrWTGO1EPBRdQR5Dn6tub1wegC3VTTD6Z/v6KDVA0uNb/Ha/zisfuRHHsS
 peT37G9HPgIoMTvePx6C7O4oV+TXPp7K9Xxdu43pKRqZwFs0JuPhzPXucBr1Szgnu566
 5nheQK2F/yyRlkWut/DN2Dv4dy02SrCLczD/GXpTf0pT+G2mH5lhYqW5j+SB8ON3l9O6
 Jb6GUcf2oxlxJMN2kKzV3Jv38LXeBNlHnAZZhMg/JmBOAJy9dnMAJYgE3GBCMDuJxXxR
 xPRw==
X-Gm-Message-State: APjAAAUDz9fmK4b3wuWXgf5NNyTCSsJCFzpgm0C/3gRIrW6s8oAL5q7t
 RipYnHyMsO5LHkc3xT6O24o=
X-Google-Smtp-Source: APXvYqzwJdJC5UuqbhofMI8Wzs9XZsjOp6JuZrA/isKGIP5Cjz3CHyXpt3g0enOrim2YrrRwlSlnkA==
X-Received: by 2002:a17:906:1c1b:: with SMTP id
 k27mr1364028ejg.13.1559600021948; 
 Mon, 03 Jun 2019 15:13:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id r9sm3869840eds.61.2019.06.03.15.13.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 15:13:41 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] PCI: rpaphp: Avoid a sometimes-uninitialized warning
Date: Mon,  3 Jun 2019 15:11:58 -0700
Message-Id: <20190603221157.58502-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0.rc3
In-Reply-To: <20190603174323.48251-1-natechancellor@gmail.com>
References: <20190603174323.48251-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: linux-pci@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building with -Wsometimes-uninitialized, clang warns:

drivers/pci/hotplug/rpaphp_core.c:243:14: warning: variable 'fndit' is
used uninitialized whenever 'for' loop exits because its condition is
false [-Wsometimes-uninitialized]
        for (j = 0; j < entries; j++) {
                    ^~~~~~~~~~~
drivers/pci/hotplug/rpaphp_core.c:256:6: note: uninitialized use occurs
here
        if (fndit)
            ^~~~~
drivers/pci/hotplug/rpaphp_core.c:243:14: note: remove the condition if
it is always true
        for (j = 0; j < entries; j++) {
                    ^~~~~~~~~~~
drivers/pci/hotplug/rpaphp_core.c:233:14: note: initialize the variable
'fndit' to silence this warning
        int j, fndit;
                    ^
                     = 0

fndit is only used to gate a sprintf call, which can be moved into the
loop to simplify the code and eliminate the local variable, which will
fix this warning.

Link: https://github.com/ClangBuiltLinux/linux/issues/504
Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Eliminate fndit altogether by shuffling the sprintf call into the for
  loop and changing the if conditional, as suggested by Nick.

 drivers/pci/hotplug/rpaphp_core.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index bcd5d357ca23..c3899ee1db99 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 	struct of_drc_info drc;
 	const __be32 *value;
 	char cell_drc_name[MAX_DRC_NAME_LEN];
-	int j, fndit;
+	int j;
 
 	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
 	if (info == NULL)
@@ -245,17 +245,13 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 
 		/* Should now know end of current entry */
 
-		if (my_index > drc.last_drc_index)
-			continue;
-
-		fndit = 1;
-		break;
+		/* Found it */
+		if (my_index <= drc.last_drc_index) {
+			sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
+				my_index);
+			break;
+		}
 	}
-	/* Found it */
-
-	if (fndit)
-		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix, 
-			my_index);
 
 	if (((drc_name == NULL) ||
 	     (drc_name && !strcmp(drc_name, cell_drc_name))) &&
-- 
2.22.0.rc3

