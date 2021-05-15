Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2C381625
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv862SPyz3drG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:28:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3S0mTgz30CT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:51 +1000 (AEST)
Received: by mail-ej1-f54.google.com with SMTP id z12so158816ejw.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8I9eAMgW1d5+6SXiSWDrf1uaChlCS5v9S4POj4RPQdA=;
 b=TdbWR8/AU0HVm8uX6i9HSh+j5ezM8yLcSO7KD0MSwyHfZoxYj/SJBGKAOKdr7u+Eyy
 v++wnnlLKdnB+uMi++FYHFAFaOSMiQqfZpARYnrofSDBb4/GKSLGITyUi7Uc/ZmJPJSX
 rd1HybcqLbNMS80sABxQal9CTFeSne6YDqelM3L7Y91iMcBl+EPYzxfbHj4uT2PwyycB
 ThDmfgja7WkaDp/VjtbuyQmglOVjLbTRxjheFgqgajOSQqL1ViP4fyD18IGFt/3NkN39
 WsUz69l4UTGn+IrWGDKSwLTEvXLggM53cK1+DoJtXEgD6v/XCbNC+GFy0Kw/ICNM3Nqd
 ZXgQ==
X-Gm-Message-State: AOAM531HnePJXucPnykdPqlWxSpDMJ6RBGpIS66EX8pQ1sH/tvMnBs9M
 sSKRiWMMb6QWXlL/9acwYH0=
X-Google-Smtp-Source: ABdhPJxvwuJ+Vc4f4aGryEC1IiRJpvd+1xHQx7CFoqRNrxuoykeL0ShP0qNJDTfuYBVia8rDk6gJDQ==
X-Received: by 2002:a17:907:a06d:: with SMTP id
 ia13mr18482816ejc.484.1621056288974; 
 Fri, 14 May 2021 22:24:48 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:48 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 13/14] PCI/sysfs: Add missing trailing newline to
 devspec_show()
Date: Sat, 15 May 2021 05:24:33 +0000
Message-Id: <20210515052434.1413236-13-kw@linux.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515052434.1413236-1-kw@linux.com>
References: <20210515052434.1413236-1-kw@linux.com>
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

At the moment, when the value of the "devspec" sysfs object is read from
the user space there will be no newline present, and the utilities such
as the "cat" command won't display the result of the read correctly in
a shell, as the trailing newline is currently missing.

To fix this, append a newline character in the show() function.

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/pci-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index beb8d1f4fafe..5d63df7c1820 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -537,7 +537,7 @@ static ssize_t devspec_show(struct device *dev,
 
 	if (np == NULL)
 		return 0;
-	return sysfs_emit(buf, "%pOF", np);
+	return sysfs_emit(buf, "%pOF\n", np);
 }
 static DEVICE_ATTR_RO(devspec);
 #endif
-- 
2.31.1

