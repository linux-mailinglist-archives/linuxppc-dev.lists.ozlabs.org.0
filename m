Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD22553DA56
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 08:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LG5bQ4JN5z3byY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 16:01:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=joXN6VFa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=joXN6VFa;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LG5Zr1sjtz3bk4
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 16:00:50 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id a10so10395360pju.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jun 2022 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysE83jJ6Rj+KdZGwx/lN3TOtV5szciIQ5SeiJ9lm3xA=;
        b=joXN6VFa/zS212kRkOBaaslZIZEQNAfdrdmvPnu+pzGUBcrZpZuD06kbp6765/EtU9
         EoaVxbNVy4GA+ThTyiF4OryCeG8K9CFVSJrndLz+aG9hmXCxsaZGS/ZFQo8lN3Vvey5B
         jObFZluzuTcxUcNaoSIbJGLe3HAdzqjCzCqExCv6QghAeUxWCKhK8HxMGixvX3p6QWSY
         2gH56QB6cqxbjreb5BdAjGDsWaUfvh9wHHWK8/fIHTKLH7kIc1a9nAvp4j8vXuadrkKp
         ALwEe2roz4Lf9CdKjwVyGtPKuCVwjS6P1gw4QFWthyXHI2jS0TPT7BKAdzE9MtAFaWrK
         nUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysE83jJ6Rj+KdZGwx/lN3TOtV5szciIQ5SeiJ9lm3xA=;
        b=VsfiX741Um+FVKmEIJ1d9gJ0KYiLis2OfZyHnhL+UZlUg36ushSYaWR0XPqPqmyl98
         dISlVB22ZF5RJ2jtbqbDTgCOr1mWL7zBFKKxGbzcERMwmc5HjFyLWMVM5JI5iiHQzGh1
         T1lb+MKXM/CDKCRo/FTC14h6nP6DTUdEY9XCJri3LXX9iPcLQdttYfZXnYysTfKXFi2Z
         N2NLFm9ubjkDWK+GP7A1nl2rmoPCrsea9m2Tp65XRR0bhdd/bhUUBuIxVlOufEnDQSdw
         h1tcq6O0jGG7lnFpvekyX4hArQlkU7pYljA1DaGeUvwPIY5xq4ZUobNUtGLfcsqKTrTv
         QC9w==
X-Gm-Message-State: AOAM530A44K9WIdkE1amMxKhM1rb9vSrMFfPrFZ1oO5GMMLXC2T0A4Ay
	vyyknXUlXfb/ET+UIyaRuH0uUJggTl+6SSd3
X-Google-Smtp-Source: ABdhPJzSRKj0blBkRBlUSCMYcB5IWuG6qNWQy7Pw40C6ZLjK3F/KhvGCZsmWFO9s6iL2JV3BzxFJ6w==
X-Received: by 2002:a17:903:1205:b0:15e:8cbc:fd2b with SMTP id l5-20020a170903120500b0015e8cbcfd2bmr18105312plh.99.1654408847301;
        Sat, 04 Jun 2022 23:00:47 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id k189-20020a6384c6000000b003fcde69fea5sm6261014pgd.81.2022.06.04.23.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 23:00:46 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Lombard <clombard@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cxl: Fix refcount leak in cxl_calc_capp_routing
Date: Sun,  5 Jun 2022 10:00:38 +0400
Message-Id: <20220605060038.62217-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_get_next_parent() returns a node pointer with refcount incremented,
we should use of_node_put() on it when not need anymore.
This function only calls of_node_put() in normal path,
missing it in the error path.
Add missing of_node_put() to avoid refcount leak.

Fixes: f24be42aab37 ("cxl: Add psl9 specific code")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/misc/cxl/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
index 3de0aea62ade..62385a529d86 100644
--- a/drivers/misc/cxl/pci.c
+++ b/drivers/misc/cxl/pci.c
@@ -387,6 +387,7 @@ int cxl_calc_capp_routing(struct pci_dev *dev, u64 *chipid,
 	rc = get_phb_index(np, phb_index);
 	if (rc) {
 		pr_err("cxl: invalid phb index\n");
+		of_node_put(np);
 		return rc;
 	}
 
-- 
2.25.1

