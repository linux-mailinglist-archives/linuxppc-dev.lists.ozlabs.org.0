Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BA3195D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 23:28:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcB9l3pMNzDwfm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 09:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcB652jYLzDwqF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 09:25:32 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id c16so6726144otp.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 14:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NMJ7yLd9O23CBO6jbidyP4gLEKA1R1vMVgKZt27Rrho=;
 b=U+KaIMs5w7hZDwTRgnJtDYGHLUoqo5WGIvhWgKMyEGvPv+JrDb3QmlyvFtc9heHkxL
 niudDmh09k7bUKp1BNL7/O94HQLYkyTsiR6i3iK45Kr6FImhvYPaPaZWTFqxSMjME7I/
 tFn8/lwXmJ7E9BE9kdVdp10cEYmgLiXTyVtsYwCRNFfA2zPjT8Py9zm+4y37t64wnaTz
 LIjrzcgmGU40eKp/g6K6Xu0NFoeyLBQIABOK7R46pNtp9A6s0Hq/S/KPjL+6mTol4tjE
 d5B4bVFpN8Gh8F84GNsEaJ4VF0xSiOKUJquBBf/S7Wa37Rwl7ya/Q0bXsxD3Ex5RZlRE
 n3rw==
X-Gm-Message-State: AOAM5302IHZBlMko37OeG00AI81DNKl/uMNAWvCnQ94AOkrFK+SWEqmB
 UBxPFNqivtp4MTWNT+j2mA==
X-Google-Smtp-Source: ABdhPJzRltYMbqkEA5TZcjaBpmfP3dX2bR/krAIyVqt0+CVFo//SIzQQtuDqD4ScQJUbSJBsjy5raQ==
X-Received: by 2002:a9d:1d04:: with SMTP id m4mr151368otm.354.1613082329194;
 Thu, 11 Feb 2021 14:25:29 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id j25sm978030otn.55.2021.02.11.14.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:25:28 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH 0/2] of: of_device.h cleanups
Date: Thu, 11 Feb 2021 16:25:24 -0600
Message-Id: <20210211222526.1318236-1-robh@kernel.org>
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

