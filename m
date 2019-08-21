Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27397937
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:28:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6Px6yBYzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IbTSzTb4"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6Jd06KszDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:23:28 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id f17so1334022pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 05:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bPye4d8RG2c6z9hipNZjTeLXU1+VAjbq1J4TzWoDnNE=;
 b=IbTSzTb4zI4yp4a1ORxnuiTkHKpmVktnxWQlw613DJZcgq3113UcAxkOyLhGohcrJI
 CmVS2wYoRTdfjOnPzH5U73j8AnKhLy0cgxnu2bEmGz4GkMi9NxD3ywy+7fnXl15LT3jy
 DsB2cdgngLcNLAEdm1Q0mWF3vf1mXGSErGa41Sa9GWKAjNXGd2/FV7PDmXg2dJsmN+H2
 ezezTi4BiznWlVIyHwpFZQsulEQZjeFbWbGzv2V4bMisBDYI1z4XADuCTSEqMsTuiRLi
 YsbsPUzvl+GIJ35OXVr3xUYMtXcg8erQgYc54jGikbVwUYYM8PrTYeT/1CBujZWXDE01
 ixCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bPye4d8RG2c6z9hipNZjTeLXU1+VAjbq1J4TzWoDnNE=;
 b=JoOx1hfj3C3bQi6/1jYJKZVSrsI8rtBqnCb/0dfi3O05GMh8hlYn6JLARFijVqSvaS
 Z7ojwpHqQ9Sn/b/21Vcy1QoOQ+rZecw9ptmk3DvUn+u/IMrpB/GVbnNmVrt9yjJaHN+Y
 kF4Qt24Dm/4ssEfZkjgrRvbnqAXLNt3JCoHNiRuw3QnWiDqXKpSjZpktPNhmTLEcC+rp
 SVkrXoHHArzBRN85Iz5F2tYi+LjXCFhnWP8ATckhMKdVKBIgawUSPViK0bobCySSppUL
 eAyVG2XwEt85O+h6DyB97XRRDXoC+tMQWNa69eE4Vaa8I7pvzL5021DkJtSnmtN7Cco8
 czlg==
X-Gm-Message-State: APjAAAX+ix4BXDoltcX393z5iEVJNeq2sXs5Mp8T2Ec7Le7jT02dFCfg
 89tLqjbHP31WV8mwz1orrlcnHyH1
X-Google-Smtp-Source: APXvYqwKFv3PloQLu/uAs4EtcCAu0/pKCOK4KR7+Y04cWns6Qyi9k6ngxc5SoEYvuEE9STppZyZaZA==
X-Received: by 2002:aa7:93aa:: with SMTP id x10mr35962894pff.83.1566390204598; 
 Wed, 21 Aug 2019 05:23:24 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id a3sm23657819pfc.70.2019.08.21.05.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:23:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/10] powerpc/64s/exception: initial reworking of
Date: Wed, 21 Aug 2019 22:23:05 +1000
Message-Id: <20190821122315.9535-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This applies on top of the previous exception series.

Until now the focus was on making the code generation macros sane,
ironing out irregularities and needless differences in handlers,
and sharing code. Some change of generated code was required, but
minimised as much as possible.

This series begins to change generated code in a bigger way. This is
an assortment of changes, one of the big goals goals is really moving
code and especially branches and logic and conditional compilation
out of "unrelocated" interrupt entry points, with the hope of making
KASLR more effective when it is implemented.

After this is a more significant rework of the instruction sequences
with the aim of improving performance, but I will stop here for the
next merge window.

Thanks,
Nick

Nicholas Piggin (10):
  powerpc/64s/exception: Add ISIDE option
  powerpc/64s/exception: move real->virt switch into the common handler
  powerpc/64s/exception: move soft-mask test to common code
  powerpc/64s/exception: move KVM test to common code
  powerpc/64s/exception: remove confusing IEARLY option
  powerpc/64s/exception: remove the SPR saving patch code macros
  powerpc/64s/exception: trim unused arguments from KVMTEST macro
  powerpc/64s/exception: hdecrementer avoid touching the stack
  powerpc/64s/exception: re-inline some handlers
  powerpc/64s/exception: add more comments for interrupt handlers

 arch/powerpc/include/asm/exception-64s.h |    4 -
 arch/powerpc/include/asm/time.h          |    1 -
 arch/powerpc/kernel/exceptions-64s.S     | 1151 ++++++++++++++--------
 arch/powerpc/kernel/time.c               |    9 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |   11 -
 arch/powerpc/kvm/book3s_segment.S        |    7 -
 6 files changed, 716 insertions(+), 467 deletions(-)

-- 
2.22.0

