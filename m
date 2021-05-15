Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626538160A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:25:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv3g1q6Sz300K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:25:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.43; helo=mail-ej1-f43.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3F1D4Xz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:40 +1000 (AEST)
Received: by mail-ej1-f43.google.com with SMTP id lg14so1565618ejb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/Vo3vzWm4D00TYgfRuuEzVZKXz3CRt/yuqfwwH8YIU=;
 b=n14uIwRHZNqj+OM6VEX05f45ndXg+Bv/akxtl3aIcDpMfoaamNakctJXX7AAdWWDXV
 ho1LF4ZPCGaTpYHkgkhn6oNnoVQpQLdX5y2wQss62erGkupeayrCPveBsYMcBJMUUUvt
 Sbdeoqn9DlM+egVkE5I0kT8AKhiRlhedNKqCldWqh9JgliJV96lP/uejkrl1nxlyGhu+
 WsvXY3XcDhGHXTzebX/5IDeBYNUSBF7ws+OPRVQSiL5MGnjFJvKzS2DEx8Pqtj3ZcA5E
 zJKQMMLahhv6QuwaEW3bXysUT/bFlbHmjfeHsTcj2pmJZklmGn1PhPlMacqUnBwglR8P
 Bn0w==
X-Gm-Message-State: AOAM530uZ3JugM6dklJCS7rE28BVeVOCtmH3c0u2lP681LD3kWoLulGd
 h9TxDcFvcWp/ZsO5v0u0szM=
X-Google-Smtp-Source: ABdhPJwvfP1drkhLOi+o1WZL+eJ9323MVgRNp8o3OCPnzYBWrwDvAHI0LcagZhbnOoFcGoXpLrERxQ==
X-Received: by 2002:a17:906:b0d:: with SMTP id
 u13mr8097847ejg.159.1621056276491; 
 Fri, 14 May 2021 22:24:36 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:35 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 01/14] PCI: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
Date: Sat, 15 May 2021 05:24:21 +0000
Message-Id: <20210515052434.1413236-1-kw@linux.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Vidya Sagar <vidyas@nvidia.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joe Perches <joe@perches.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sysfs_emit() and sysfs_emit_at() functions were introduced to make
it less ambiguous which function is preferred when writing to the output
buffer in a device attribute's "show" callback [1].

Convert the PCI sysfs object "show" functions from sprintf(), snprintf()
and scnprintf() to sysfs_emit() and sysfs_emit_at() accordingly, as the
latter is aware of the PAGE_SIZE buffer and correctly returns the number
of bytes written into the buffer.

No functional change intended.

[1] Documentation/filesystems/sysfs.rst

Related to:
  commit ad025f8e46f3 ("PCI/sysfs: Use sysfs_emit() and sysfs_emit_at() in "show" functions")

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b717680377a9..5ed316ea5831 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6439,7 +6439,7 @@ static ssize_t resource_alignment_show(struct bus_type *bus, char *buf)
 
 	spin_lock(&resource_alignment_lock);
 	if (resource_alignment_param)
-		count = scnprintf(buf, PAGE_SIZE, "%s", resource_alignment_param);
+		count = sysfs_emit(buf, "%s", resource_alignment_param);
 	spin_unlock(&resource_alignment_lock);
 
 	/*
-- 
2.31.1

