Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A4537D43A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 22:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgRGl332qz3c2N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 06:29:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VWQFRX+8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VWQFRX+8; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgRFP2B3yz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 06:28:23 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id t7so18262484qtn.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3iZdfZgY2QXpPc4x+6HP8mhgXL3pe0r70WY6iIZCGs=;
 b=VWQFRX+86/hkW/t1cHmGThe0tnSNRfVONGUL9dTnnvRvEGux8GIxdx8kvYR51HWtvS
 pPlLD9P0Sozw6ChQIF3iHiM6A4mzgmihs/XMPvgUvOkNdvtqxKwjfiL1dHe900Ak/7CT
 /8LfnM+srzIzoxuVMI7LWhFqvaBw6QQN16rKJ3DI4ZSvgqk3U192kMPDH+m/0XWd87cH
 SjagIBZlzCoicQrd2z7L7GUdjw+b6C2Nk6nA2PusVnrSHdQaAJ0XzqIOwzn2TL0RNnlX
 p7cv6n8mfn91kBhj1jJ5JytDzHWpvLomx5yCilaiQ1rhgWSswTtCe4dtyZgsMwgjNkye
 qBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3iZdfZgY2QXpPc4x+6HP8mhgXL3pe0r70WY6iIZCGs=;
 b=W2QxEmVEQg7NzEGQrIgLM8+sDiLYhxU+BP8ln5qKRF3PJe6r+w1JUtV3TAY8f7Uvni
 s23ejF6jSIYyryZdG9gdtT7dvt9BB+Pp6Rfdgd593v5i1fAGS2GLdVMBtOlpv6vG3V3J
 nmSgmud4SJZW0/KrRoVx2JfnMOQj4PhdBd/70NxTBhuBmZOkw3rIQ1icjQJBdwoYMD33
 hmQsxeWoouPATDyX8njcI+lwGLeHPiwgDsX2N0/qElU5io3ane95k5c0CsCBCoebFa+u
 OgHp2fsTw7MejF9oHfNNeA8WsQcRpUIhGNP14Mz4gz+CrQQpue+RbQcEg2E6ljwLCxQ4
 WGgg==
X-Gm-Message-State: AOAM5308P4VgZi/gO68DyrkhrGFV6yi7caJkJYT1WlKj8ZWBxk76gap/
 6Z2UVM5PfcNpfKX9POfzoVtEMigbi1+n4A==
X-Google-Smtp-Source: ABdhPJz1ayxdIvU7phZMy5s7a/2BP4+UW4Ngs/Bh5Ua8RKj+EW5BftF8HllPYBOuZx8XBIQg4rWcng==
X-Received: by 2002:ac8:5655:: with SMTP id 21mr35668370qtt.187.1620851298467; 
 Wed, 12 May 2021 13:28:18 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69])
 by smtp.gmail.com with ESMTPSA id j29sm778317qtv.6.2021.05.12.13.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:28:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4]  Unisolate LMBs DRC on removal error + cleanups
Date: Wed, 12 May 2021 17:28:05 -0300
Message-Id: <20210512202809.95363-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

changes from v1:
- patch 1: added David's r-b
- patch 2:
    * removed the DRCONF_MEM_RESERVED assumption for
    dlpar_memory_remove_by_ic()
    * reworded the commit msg
- patch 3: dropped. the differences between dlpar_memory_remove_by_ic()
  and dlpar_memory_remove_by_count() makes a helper function too complex
  to handle both cases
- (new) patch 3 and 4: minor enhancements

v1 link: https://lore.kernel.org/linuxppc-dev/20210430120917.217951-1-danielhb413@gmail.com/

Daniel Henrique Barboza (4):
  powerpc/pseries: Set UNISOLATE on dlpar_memory_remove_by_ic() error
  powerpc/pseries: check DRCONF_MEM_RESERVED in lmb_is_removable()
  powerpc/pseries: break early in dlpar_memory_remove_by_count() loops
  powerpc/pseries: minor enhancements in dlpar_memory_remove_by_ic()

 .../platforms/pseries/hotplug-memory.c        | 54 ++++++++++++++-----
 1 file changed, 40 insertions(+), 14 deletions(-)

-- 
2.31.1

