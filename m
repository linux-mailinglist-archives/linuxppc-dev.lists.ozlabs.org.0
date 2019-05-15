Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1E1F471
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 14:32:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453v8H3bJ0zDqVb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 22:32:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453sCC4myWzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 21:04:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="P8wxVAw0"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 453sCC1SJwz8v76
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 21:04:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 453sCC03WKz9sPL; Wed, 15 May 2019 21:04:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="P8wxVAw0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 453sCB3h3Zz9sPH
 for <linuxppc-dev@ozlabs.org>; Wed, 15 May 2019 21:04:54 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F32C62173C;
 Wed, 15 May 2019 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557918292;
 bh=bqd2UTfZDqHEAn4E2azFb9BzEh78NhSGRxbkZcxUiYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P8wxVAw053NKLvj3Go4ppo9aozHlEFT18CaB9ydHNvxf2OwsVTA/Vg7VGLk6Auvc4
 DMcy1/G007W8tFP60KK2jNq1l1nZahzEWdyzwUuI0N5z4UBaODZ7cAl0OXvFcJkW/w
 CCkBIguFUhJNCh8zA+5CQ17tFJh5k1Utm+pvBoCA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.4 079/266] powerpc/fsl: Enable runtime patching if
 nospectre_v2 boot arg is used
Date: Wed, 15 May 2019 12:53:06 +0200
Message-Id: <20190515090725.113850383@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190515090722.696531131@linuxfoundation.org>
References: <20190515090722.696531131@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 May 2019 22:29:34 +1000
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
Cc: Diana Craciun <diana.craciun@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Diana Craciun <diana.craciun@nxp.com>

commit 3bc8ea8603ae4c1e09aca8de229ad38b8091fcb3 upstream.

If the user choses not to use the mitigations, replace
the code sequence with nops.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/kernel/setup_32.c |    1 +
 arch/powerpc/kernel/setup_64.c |    1 +
 2 files changed, 2 insertions(+)

--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -323,6 +323,7 @@ void __init setup_arch(char **cmdline_p)
 	if ( ppc_md.progress ) ppc_md.progress("arch: exit", 0x3eab);
 
 	setup_barrier_nospec();
+	setup_spectre_v2();
 
 	paging_init();
 
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -737,6 +737,7 @@ void __init setup_arch(char **cmdline_p)
 		ppc_md.setup_arch();
 
 	setup_barrier_nospec();
+	setup_spectre_v2();
 
 	paging_init();
 


