Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF987940135
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:38:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BLOeGHy6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXtYY6KRhz3cY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 08:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BLOeGHy6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXtX83B57z3c03
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 08:37:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DC8BCE0A59;
	Mon, 29 Jul 2024 22:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4F7C32786;
	Mon, 29 Jul 2024 22:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722292627;
	bh=WG9SD2wD3Kn82vDHoqLK7EYev24Fn6Ab/6ah9v+cdGc=;
	h=From:Subject:Date:To:Cc:From;
	b=BLOeGHy6Qsk4NB+9ktUpm8yTDgnNkL01CcaI4hnIJPTW5aF70ygunHUzeAYf1SBlh
	 SSotHm1jV2mPUA0DWkHs3hYxmv/ymGojD3FCXbttIb3gATjluEqj+b33v8UV5Jweyx
	 R9LV0HF0vS3PYvQEYyp+ldVYqQiUrfuvu+cLWfQyUmsXZUeKwbsIm/5OctQ7Su4a8w
	 ybPKu2GAGObGzoJx7ikKwTuaFBN3lA7EfCWT+RD5TqqTjag1ZCE3vPmgOwRoCkU6We
	 SUHXCJav+DupQaSbXseWW4Q70fMcGRVUiMc3+QzGlLSvyFJNK809sHF8hcoa6nVoqI
	 y3lz6KLx4kMLg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/2] cxl: DT property accessor cleanups
Date: Mon, 29 Jul 2024 16:36:42 -0600
Message-Id: <20240729-dt-cxl-cleanup-v1-0-a75eea80d231@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHoZqGYC/x3MQQqAIBBA0avErBtIKcquEi1ExxoQE60QorsnL
 d/i/wcyJaYMc/NAopszH6FCtA2YXYeNkG01yE723SgV2hNN8Wg86XBFJO0mMQ1aKWegRjGR4/I
 Pl/V9PwwXuI9gAAAA
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.15-dev
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This short series replaces the custom DT property accessors in the CXL 
driver with the common ones. The one difference is dumping the 
properties read out is removed. If that feature is really needed, then 
it should be implemented in the DT core for everyone. 

This is part of a larger effort to remove DT functions leaking DT data 
(e.g. of_get_property()).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (2):
      cxl: Drop printing of DT properties
      cxl: Use of_property_ accessor functions

 drivers/misc/cxl/of.c  | 207 ++++++-------------------------------------------
 drivers/misc/cxl/pci.c |  32 ++++----
 2 files changed, 36 insertions(+), 203 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240729-dt-cxl-cleanup-eaf8185a99fc

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>

