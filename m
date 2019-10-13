Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AAD5467
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 06:45:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rTdR5zGvzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 15:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="CrcL2S8D"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rTX12vVvzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 15:40:33 +1100 (AEDT)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4786206B7;
 Sun, 13 Oct 2019 04:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570941629;
 bh=ZVhkIrmxXnrRsJcnZxoqY4+X6GfigGDjV27s6D0emN0=;
 h=From:To:Cc:Subject:Date:From;
 b=CrcL2S8DNCDtIoFVClM52IGRgZRSm7iZphRBFlwM7T3Sn7veeq/8mGY/dm006V4Td
 paA0dxVOuQzwYpQ4prFUP08KzqKo5CqOKhn73/hEaZOrSVV7B36EkiOvFI5F2k2Y5i
 jOqTQDqQV0XUwdfokljNPhz3bUEERRlTw0AOg1dw=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 0/4] crypto: nx - convert to skcipher API
Date: Sat, 12 Oct 2019 21:39:14 -0700
Message-Id: <20191013043918.337113-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
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
Cc: =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series converts the PowerPC Nest (NX) implementations of AES modes
from the deprecated "blkcipher" API to the "skcipher" API.  This is
needed in order for the blkcipher API to be removed.

This patchset is compile-tested only, as I don't have this hardware.
If anyone has this hardware, please test this patchset with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.

Eric Biggers (4):
  crypto: nx - don't abuse blkcipher_desc to pass iv around
  crypto: nx - convert AES-ECB to skcipher API
  crypto: nx - convert AES-CBC to skcipher API
  crypto: nx - convert AES-CTR to skcipher API

 drivers/crypto/nx/nx-aes-cbc.c | 81 ++++++++++++++-----------------
 drivers/crypto/nx/nx-aes-ccm.c | 40 ++++++----------
 drivers/crypto/nx/nx-aes-ctr.c | 87 +++++++++++++++-------------------
 drivers/crypto/nx/nx-aes-ecb.c | 76 +++++++++++++----------------
 drivers/crypto/nx/nx-aes-gcm.c | 24 ++++------
 drivers/crypto/nx/nx.c         | 64 ++++++++++++++-----------
 drivers/crypto/nx/nx.h         | 19 ++++----
 7 files changed, 176 insertions(+), 215 deletions(-)

-- 
2.23.0

