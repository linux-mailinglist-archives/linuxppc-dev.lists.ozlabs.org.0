Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DEFB9165
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 16:07:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZbCF6cpFzF35K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 00:07:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="NO0/kwiM"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zb6J5342zF15J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 00:03:36 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id p10so7388563qkg.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=L7RuMAWb39SKa2KSDUpnhn/WYPqF8ZgNcdG8xyngyco=;
 b=NO0/kwiMlrquEUDojFfFwuhDiadYS5FpTfczDYCVtDyMD1FTwhaYY0o8st6uKTL052
 HE6nTnD9ZpDARbznFQW24Y2I50WbpveoF6DKZrgLMOwwrq2/Cp67T9txTNLVZ06RdkaV
 2aQit8GiFY0Xs73/kVBtqrN+dm7jVYs9tbMCDVZRTPzFpcYINjnUwM2EJGAB4dWNJha/
 7iWiX3NYR1pmwzFWydQC0etnDIlcSG+xsT6aV/K8nXp1Pl+sB5eRa6S0fnf7IGUMpqEw
 ADbxwZftvl+wcrJLa8zPMBJz4zI7OWLeZd4EIpPeT32AyGyhP4ugiEoTRcTTTnlMTLcT
 Y3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=L7RuMAWb39SKa2KSDUpnhn/WYPqF8ZgNcdG8xyngyco=;
 b=omxltyxsNnwUgf1fS6n6OsoFPnQ2I6BbHAgd7spUOaGtqyopynRe3CWVLo7768y7Wp
 E4rfXW/fT2E1TSwupaHM3BuyQdn3Rf4LP6E1lyQ6DBerTpnl6dyiygS1OH8MRZALydcP
 3ZCyw/Q5FKM74wOvO43PxfUQpnawJsSGZU3KtNFFhd/HYCxuRxkSXZZ4crUEBUebd9xm
 Oc91HzFcIp56s4QGbw6PXDylAd45RF6SNalrzMb0h/ShJViZZXYh48D60Sk4qApkSErQ
 G9ZqpUQU8ZXd6uipMJ5gpt7sXNCUEfJxnYcfKS6wSvULp/3srKjZ9sq09uht/EAvcEMX
 /nSQ==
X-Gm-Message-State: APjAAAVVetPV+SJHRCObjATt+SbHo9LOMFRDbnZQRkReKAk32k6lBDg+
 TFRkZfogewGBxHw0qXwP3wT0lA==
X-Google-Smtp-Source: APXvYqz7xf+uhcLiwlHa/946hKTmZusRDQE6yoga9DQM2zUtnTJu0OL63p57KFHGatmK4OdryW5beg==
X-Received: by 2002:a37:bd43:: with SMTP id n64mr3931409qkf.130.1568988211117; 
 Fri, 20 Sep 2019 07:03:31 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id w131sm1164185qka.85.2019.09.20.07.03.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 07:03:30 -0700 (PDT)
Message-ID: <1568988209.5576.199.camel@lca.pw>
Subject: "Pick the right alignment default when creating dax devices" failed
 to build on powerpc
From: Qian Cai <cai@lca.pw>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Fri, 20 Sep 2019 10:03:29 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The linux-next commit "libnvdimm/dax: Pick the right alignment default when
creating dax devices" causes powerpc failed to build with this config. Reverted
it fixed the issue.

ERROR: "hash__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko] undefined!
ERROR: "radix__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko]
undefined!
make[1]: *** [scripts/Makefile.modpost:93: __modpost] Error 1
make: *** [Makefile:1305: modules] Error 2

[1] https://patchwork.kernel.org/patch/11133445/
[2] https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
