Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C51FF1A875E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 19:22:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491skN3QwDzDqtN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 03:22:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Zanjp6OZ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491rzk261hzDqv4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 02:49:06 +1000 (AEST)
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
 [95.90.212.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27B7F21D91;
 Tue, 14 Apr 2020 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586882943;
 bh=6+PaLUkdrL9YIpHZRkQExO+4pmTux8rSySZ5aPWfrTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zanjp6OZ363vGzxNlgSK+Vdfy6f62aA8seSR/sOA4Fc8h6zUfetzNp7OVTPVjjqWd
 0fmAqr/mW5yE0POTEfqpT8xqzxBRqUSs9S39mLq7n7KQuigDRwbj84UIaBLs85puD0
 lEz+YqbEF3V6xEjEpQ+X/sMtfiaGrZfaq9QAYwJw=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jOOk9-0068mt-CE; Tue, 14 Apr 2020 18:49:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 25/33] docs: powerpc: cxl.rst: mark two section titles as
 such
Date: Tue, 14 Apr 2020 18:48:51 +0200
Message-Id: <190d67397cd63e419de8d85b92e8018d48e8c345.1586881715.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586881715.git.mchehab+huawei@kernel.org>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The User API chapter contains two sub-chapters. Mark them as
such.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/powerpc/cxl.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/powerpc/cxl.rst b/Documentation/powerpc/cxl.rst
index 920546d81326..d2d77057610e 100644
--- a/Documentation/powerpc/cxl.rst
+++ b/Documentation/powerpc/cxl.rst
@@ -133,6 +133,7 @@ User API
 ========
 
 1. AFU character devices
+^^^^^^^^^^^^^^^^^^^^^^^^
 
     For AFUs operating in AFU directed mode, two character device
     files will be created. /dev/cxl/afu0.0m will correspond to a
@@ -395,6 +396,7 @@ read
 
 
 2. Card character device (powerVM guest only)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
     In a powerVM guest, an extra character device is created for the
     card. The device is only used to write (flash) a new image on the
-- 
2.25.2

