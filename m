Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D90DB319699
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 00:29:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcCWp4xv0zDwq4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 10:29:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcCTy5zQbzDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 10:27:50 +1100 (AEDT)
Received: by mail-ot1-f53.google.com with SMTP id q4so6840360otm.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 15:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NMJ7yLd9O23CBO6jbidyP4gLEKA1R1vMVgKZt27Rrho=;
 b=tcLwmLIQVZeOnx5IV9oO2pxOyzm2oERbXP6v/AB3x/0lGMG3VZUwoMF1k8KAqGK5Cx
 +XXBib24LtyNjmaS894mgudadv4zR8ZaL3LDo405Q8Cxnjd4G/Ytg+ykSv5tZSpfK9J3
 2VVoBpqBm6I02dhAs7Xa9WEQk4E8CdntmWOzbFl3MZ9/POq18KycozI8KLrouZTaK+jo
 6Ragt/Eruz7ASBdw5KiwbRKSIV8YLC2Oli0p1iLF3H1dAN9oIF4vhU7vMKpYBxU1RDQH
 ajLyV1/52IU3/inWv1Ac89ThmeDyW4yLmjlXSjFWfwbnXPFUBZvjnzhTWJfVPTSscVga
 RMdg==
X-Gm-Message-State: AOAM5313G1/hSRKxV46MWuZS+74DiKrM6eE5eT+LWhYuLLribPghyVoL
 RD9JedXskPf+tQpnUkh00w==
X-Google-Smtp-Source: ABdhPJxCLDZrG4wjSzEe3ksZoou3d9Y2oSOGUfFU4jjPmhV2WnoDeeXu5PQ90Om+6OiCd4FYz8Tnog==
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr250282otl.369.1613086068486;
 Thu, 11 Feb 2021 15:27:48 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id s18sm1283922oih.53.2021.02.11.15.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 15:27:47 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] of: of_device.h cleanups
Date: Thu, 11 Feb 2021 17:27:43 -0600
Message-Id: <20210211232745.1498137-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Felipe Balbi <balbi@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>,
 Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Gilles Muller <Gilles.Muller@inria.fr>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 cocci@systeme.lip6.fr, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a couple of cleanups for of_device.h. They fell out from my
attempt at decoupling of_device.h and of_platform.h which is a mess
and I haven't finished, but there's no reason to wait on these.

Rob

Rob Herring (2):
  of: Remove of_dev_{get,put}()
  driver core: platform: Drop of_device_node_put() wrapper

 arch/powerpc/platforms/pseries/ibmebus.c |  4 ++--
 drivers/base/platform.c                  |  2 +-
 drivers/net/ethernet/ibm/emac/core.c     | 15 ++++++++-------
 drivers/of/device.c                      | 21 ---------------------
 drivers/of/platform.c                    |  4 ++--
 drivers/of/unittest.c                    |  2 +-
 drivers/usb/dwc3/dwc3-st.c               |  2 +-
 include/linux/of_device.h                | 10 ----------
 scripts/coccinelle/free/put_device.cocci |  1 -
 9 files changed, 15 insertions(+), 46 deletions(-)

-- 
2.27.0

