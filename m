Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D371A9064
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 03:26:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4924SS4G3rzDqyg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 11:26:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=e/aTMxG1; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 4924Q9257SzDqlg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 11:24:15 +1000 (AEST)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 7D83A2DC0076;
 Wed, 15 Apr 2020 11:24:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1586913853;
 bh=Hnd7CQBwYdqkx5oYVKaymU8hhOOFePaDt87jkGY4AgM=;
 h=From:To:Cc:Subject:Date:From;
 b=e/aTMxG16640hUtwW8+PpPvW7EE6J01kTTaJl04jmrfmN3xmCtWqme3HJw1zRp8UN
 H6iNe33tsGT4abDuTHwRDhYRwPA6lX9XeAhUcbXvWnOo8T+1iWODcNBB/OSo5w8WxX
 KPEiJM0ZvjUKEur8M5EHfCqBeT4ggmHAFKdKvL4c+3rT8XAuSWscEZ8RYJnnuVMDzq
 +DcamskxAbifpj+84XCRY3zXuu6s+JMBdLR28xyTc78wXtqIAz2X178/lLl43iUUNj
 8ajooBi8dibJN5rDrjvBGop8+Bg12urt983xCjYERGgJ7K3SHnZsw55N6sLLuKLGbl
 XRPPq0tcNnbYUGTNVecj7u3RojGUhUYL82ssVLCpDCplOIflcVltHaiuqb2cdbBYSy
 zpmSogc2yA3bhHSIwF+xSG/OeGlBI0vl5cql0aFiA9v5NlQf0Lgg3OWWnRtlYDKDh1
 du5CL00DdjjqEc2LULNhxTzkoRjtolPhVx+ZAuJ465gK+r/g9aX741LRzYurcAtx+v
 Yb1CVAKZxjNI4aXcP6o0Mn4yQrMHhumaO7oIz/W3c7gnssbgXTNMAEjTl9ugY7lpoX
 YVpsREqhxmryJvhEHLlAw/7Ws7yuJTEelHguJXyStdGUZK39hpBhYPzBnBaEMXNDO5
 nSBpIavMxPioNCma7zc+vc3o=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 03F1O2Ru036615;
 Wed, 15 Apr 2020 11:24:04 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH 0/2] powerpc: OpenCAPI Cleanup
Date: Wed, 15 Apr 2020 11:23:41 +1000
Message-Id: <20200415012343.919255-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Wed, 15 Apr 2020 11:24:08 +1000 (AEST)
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These patches address checkpatch & kernel doc warnings
in the OpenCAPI infrastructure.

Alastair D'Silva (2):
  ocxl: Remove unnecessary externs
  ocxl: Address kernel doc errors & warnings

 arch/powerpc/include/asm/pnv-ocxl.h |  40 ++++++-----
 drivers/misc/ocxl/config.c          |  24 +++----
 drivers/misc/ocxl/ocxl_internal.h   |   9 +--
 include/misc/ocxl.h                 | 102 +++++++++++-----------------
 4 files changed, 77 insertions(+), 98 deletions(-)

-- 
2.25.1

