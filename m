Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CDB807B9C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:43:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IhTQWFdf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlsrD6yt1z3cYG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:43:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IhTQWFdf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlsqR037cz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 09:42:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3F4F61ED4;
	Wed,  6 Dec 2023 22:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733F9C433C7;
	Wed,  6 Dec 2023 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701902558;
	bh=AslNTUin8A7oCwTbelMTlAy+9pa9TfyKW5/4wcsAbRw=;
	h=From:To:Cc:Subject:Date:From;
	b=IhTQWFdf1AXHLSIWjF8+LMVdOY/5SERFx7VHdptcjqC5f3sD9K8qN+kR3vE7GcFgG
	 gEBVlOIO7gMo4k7JDoUCuW8I9sOv0gLMn01oGMlG1VPeKc+pg0t7UwDaRewoWRqZyC
	 O3kx/NF9hOlB254Ym2oAJvxF6ET38tC2rVnGFWMBbMzBtx8NfLUJBZSBAbf+DRq9qm
	 mzE9fi6SsMhhlmsLgGJ0dznNA8Ar+5yTYo8hgdG4mSZDQ3Ee1qACRaOmyggBByEu3d
	 86VrMNRTNBp4kfuavMKXyzcuGrocPZVocOyVXu/0r+rwTU+wDy1buiwv6DhcOlk2ko
	 CPbeQ6AVLgrww==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 0/3] PCI/AER: Clean up logging
Date: Wed,  6 Dec 2023 16:42:28 -0600
Message-Id: <20231206224231.732765-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Robert Richter <rrichter@amd.com>, Terry Bowman <terry.bowman@amd.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Clean up some minor AER logging issues:

  - Log as "Correctable errors", not "Corrected errors"

  - Decode the Requester ID when we couldn't find detail error info

Bjorn Helgaas (3):
  PCI/AER: Use 'Correctable' and 'Uncorrectable' spec terms for errors
  PCI/AER: Decode Requester ID when no error info found
  PCI/AER: Use explicit register sizes for struct members

 drivers/pci/pcie/aer.c | 19 ++++++++++++-------
 include/linux/aer.h    |  8 ++++----
 2 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.34.1

