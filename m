Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF881502B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 09:37:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B1RJ5lCXzDqNV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 19:37:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n+XLLV82; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B1P72srmzDqM2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 19:35:36 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id p14so7192974pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2020 00:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3BIQNFv6Tl7lTdszkAnOzP2ClDaz+IlBWMQHzdrZYA=;
 b=n+XLLV82X1fguBZykMGJ2JZwzKzCYQ8S/qPMtqaNAYI2i81ws/LcT/adNQH6uaEurx
 QNZ4B1L4GF63NPGILsRnWoBqdhFVxrZCCLBsVkLDD2rH7j5X+3tB1H5Dj7d0+3BSW5xi
 oHWUBpfHA/ikiDZA70xBsXrbnbKqeZhVfOr+xsSLn5hEN2Uz0I+oGfM1BPWroO0tXSYh
 Y6pHIin5dxa4+ayRjebRKyt5UjWVQC9YPbgFKKLztbx6WUPFcM36prHaF374R50eaecX
 LSqlBvrngNHrH9Dne5jl7Q5oXx7J9mKQ1kbdI27bjxofhsEfEAEjF2lPO/uiKPRp8VuE
 7SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3BIQNFv6Tl7lTdszkAnOzP2ClDaz+IlBWMQHzdrZYA=;
 b=tlM44tvdWpCR0NIxg1bjplxgFWzc/CreiRPYZuHgalza7B0eB6JwIGUNHUGlsQwi7R
 c2XxYIBrSbhHJjNyqFoHE3i4ykhky2czb0RHRmczpFXsWkLjunOd6HgfeffJkI0pIjTQ
 LWcRdv/B703VtW7xh457JU31IIJzFM4UslVLgvTjxDPhBIc+oO4zeuXScK2KugWmxShQ
 8VSKFvDO38s7UP+3sx8GBu2tUxQfz4L5V5KEeobYMwX/0RaWnAwxjk9exYYDjCXEGgbo
 +2okCukM1TqACBLerb6r8lW+JEyxa4KsXNCSq9Rcn0vS/neL4jU2T6uHfC350950QwZ6
 XH+A==
X-Gm-Message-State: APjAAAVZgkui6a8LQnidzzwu5JlnZZlalY61Z6bXQU2bQTRwO6+X5aHb
 lLCAEsU7FMEui1cX63BAlrjeazeu
X-Google-Smtp-Source: APXvYqzoPXyNcFPtE3JW72Hl3O38xnCkWdIXzGM64i1EVY4WQytaM986Py7mgWKsvycscu3ATd9AIw==
X-Received: by 2002:a63:504f:: with SMTP id q15mr24099399pgl.8.1580718933031; 
 Mon, 03 Feb 2020 00:35:33 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q63sm19849132pfb.149.2020.02.03.00.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:35:32 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: EEH init cleanup
Date: Mon,  3 Feb 2020 19:35:15 +1100
Message-Id: <20200203083521.16549-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: sbobroff@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series reworks how EEH devices are initialised. This mainly affects
pseries since it moves the "early" EEH probe out of shared code and into
pseries platform code. The goal here is to make the platform
dependencies more explicit and to allow PowerNV to implement its own
pci_dev <-> eeh_dev mapping that doesn't require a PCI_DN.


