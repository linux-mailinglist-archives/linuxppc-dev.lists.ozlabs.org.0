Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525C6CCB57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmLZJ2JtXz3f4r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 07:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmLYF4mVqz3cLh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 07:16:17 +1100 (AEDT)
Received: by mail-ot1-f54.google.com with SMTP id l39-20020a9d1b2a000000b006a121324abdso5479005otl.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 13:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680034572;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJY6pOPdDa4oqX5OXa+Badi5ySmgsIj2CbDDOIk/1F8=;
        b=aCwsff8kxypM4VB3qVWS+PG4WvvIpEtYPM90Je0nHuuG1NcAyAXwGVR8Mos5wx94g1
         jDn5nG7QVYnaen/oNa/GSfJM38SWddBWLBpcl1RALs0njv6qQ/yZy90eX0UCTGLG+F9I
         hWxwfZHSELp9fdy1e/M6Lsl+K99DQGH0X9cyOPlHVf705TMl3dXXQO+VvxGsljOqSWjI
         bSw2ovPPFUQ7hNNjc52KPNaJen/cfBteFXeSp8awwcV28TlYde6tbYzQcmpjnxMek65l
         sGLzQntGeLtRRDx18+YIWHik/CN5H+jDLhCJfvmkZtREb2wvwnr+GZDmyE8QFRm/0Hr9
         TlTA==
X-Gm-Message-State: AO0yUKX89kw1yxvKQjUQviIvU9SybisHyf1Ael6ThDZ3nuW6FMacD98R
	XA4ImYaCC9Xsc2/aMHwXBzOdRlX0+g==
X-Google-Smtp-Source: AK7set9GAgC93luzWNZuofJauP57z3vXyLI4sRAP80NLLCHRI4Txb9cd8obWGvd6gSVOAMPakodRgQ==
X-Received: by 2002:a9d:6d82:0:b0:69f:8da7:5463 with SMTP id x2-20020a9d6d82000000b0069f8da75463mr8887322otp.31.1680034571938;
        Tue, 28 Mar 2023 13:16:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l26-20020a0568301d7a00b0069fa776d3c2sm6931170oti.18.2023.03.28.13.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 13:16:11 -0700 (PDT)
Received: (nullmailer pid 3993665 invoked by uid 1000);
	Tue, 28 Mar 2023 20:16:10 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/5] of: More address parsing helpers
Date: Tue, 28 Mar 2023 15:15:55 -0500
Message-Id: <20230328-dt-address-helpers-v1-0-e2456c3e77ab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxKI2QC/x2N0QrCMAwAf2Xk2UDXTRB/RXxI28wGSh2JDmHs3
 w17vIPjdjBWYYP7sIPyJibv7jBeBsiV+otRijPEEKcwxRuWD1IpymZYua2shnEJIV/zyIlm8DC
 RMSalnqun/duay1V5kd95ejyP4w80lXgveQAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is part of some clean-ups to reduce the open coded parsing 
of "reg" and "ranges" in the kernel. As those are standard properties, 
the common DT code should be able to handle parsing them. However, there 
are a few gaps in the API for what some drivers need which this series 
addresses (pun intended).

I intend to add these helpers for v6.4 and then convert the users in 
v6.5 to avoid any dependency issues. This series and the WIP conversions 
are on this branch[1].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/address-helpers

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (5):
      of: unittest: Add bus address range parsing tests
      of/address: Add of_range_to_resource() helper
      of/address: Add support for 3 address cell bus
      of/address: Add of_range_count() helper
      of/address: Add of_property_read_reg() helper

 drivers/of/address.c                        |  76 +++++++++++++-
 drivers/of/unittest-data/tests-address.dtsi |   9 +-
 drivers/of/unittest.c                       | 150 ++++++++++++++++++++++++++++
 include/linux/of_address.h                  |  31 ++++++
 4 files changed, 262 insertions(+), 4 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230328-dt-address-helpers-2f00c5c1eba4

Best regards,
-- 
Rob Herring <robh@kernel.org>

