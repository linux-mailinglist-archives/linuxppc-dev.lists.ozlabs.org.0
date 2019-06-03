Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDC33709
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 19:46:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HjCM0QPgzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 03:46:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mDpQCM0t"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HjB30qRlzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 03:44:58 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id r18so26999311edo.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UvPJ0pMiZoixpn1vorRDAMa+r0PwCmpA/CAl7+RUBFU=;
 b=mDpQCM0tAqeODReAP8OTV9DQoxN3yLTrbJtlUsVjnmtI/1iuLx7p9FbWDiC0DYh6UQ
 Y0jCK+ksupdzG1tNrJR5ovgGWsKJ78pddBKDrQ33b4nE4T0Iw58uPk+joii9Zs8Fj7tA
 UFLSIUl8IF4g9SukjZM3OHserAnn95viimi3WLCbD1Q2sx2tghWyqFQFfOWOgCLR8sk+
 J5e7xvriKldbYic86yWsDLSX8O+We57jRa9t30ZRAN79w2hxdd3Ts2NDWXdaC3si33zD
 +fd75c1OaYBe1maShaI11cbdIvM7wrX0TRoEYAXqBQW2Aw1PvXbI2y4M5QySroTMvWmp
 33ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UvPJ0pMiZoixpn1vorRDAMa+r0PwCmpA/CAl7+RUBFU=;
 b=osRfZxYvNrdX0Ni1QiM8fD9KJsePRK9FqKj92k1dLKScQTHxnvTEdR2NnoCLYr3fOn
 8UVtP9h4z6C++HXTRKc9qQkgUd7vYsTthzaObhceiTHelaKFotnU7e0BHHibKypwEFj1
 +RorLHz6MwlFq8dFxWcIYvLHZfftsmuiCx4Rq2tcr1eUxbuCVQiQrtzYvIUfAk7x9Yg8
 /Zt/MnQQy0w14yN29q21lv3+af8dKk2OHspWXkV14TxzzqpFwGCCxkEb3tNPtmoTHk+6
 F5aL8ye02zWYq8M2mFnIPPymJunmifpraDIO3nKQ+7wd7ocVBm+0raruVqo9bjOrLS5E
 ZmYw==
X-Gm-Message-State: APjAAAVdn7gxfP6YHgqrkJpDNaQeX12RrZNxzx3UDPVRMb05wiWwnPXs
 KZ8ahTXx2BrQiU9cSfc7CLs=
X-Google-Smtp-Source: APXvYqwYAH8FNbjJRPVG0DUMG7ZcBF+6mEqLYoc4xqQXZ9P5ym/vMa4fHhFVqcDLNjjZ9ibMHPZOTA==
X-Received: by 2002:a17:906:951:: with SMTP id
 j17mr23314130ejd.174.1559583894230; 
 Mon, 03 Jun 2019 10:44:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id i31sm266996edd.90.2019.06.03.10.44.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:44:53 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] PCI: rpaphp: Avoid a sometimes-uninitialized warning
Date: Mon,  3 Jun 2019 10:43:23 -0700
Message-Id: <20190603174323.48251-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0.rc2
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Bjorn Helgaas <bhelgaas@google.com>,
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

Looking at the loop in a vacuum as clang would, fndit could be
uninitialized if entries was ever zero or the if statement was
always true within the loop. Regardless of whether or not this
warning is a problem in practice, "found" variables should always
be initialized to false so that there is no possibility of
undefined behavior.

Link: https://github.com/ClangBuiltLinux/linux/issues/504
Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/pci/hotplug/rpaphp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index bcd5d357ca23..07b56bf2886f 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 	struct of_drc_info drc;
 	const __be32 *value;
 	char cell_drc_name[MAX_DRC_NAME_LEN];
-	int j, fndit;
+	int j, fndit = 0;
 
 	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
 	if (info == NULL)
-- 
2.22.0.rc2

