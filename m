Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C5E6E2490
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:48:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd7c5zcWz3g4r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:48:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NDqR5wLr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccz6MGRz3fV0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NDqR5wLr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccz5FLVz4xTy;
	Fri, 14 Apr 2023 23:25:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478707;
	bh=SvondBc4fweIRw4GieZIm/ia5LKzOmju0g0gDU+iCPk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NDqR5wLrBBspqJE6rspcXZDjKGiwDMrR7s76JNY4Nx5dTNqf5N0P/jwsFgKtD8Sgk
	 cLqDHgVKh0xV38jkEWXFMdK1JSmqg4EWtUA58A3huwuau8fk3gEbGJMF3kQjbrcavd
	 xsSHckY6oWoNkiTT2vSP0cWixdtd/1BUKMR1mggRqxrPK3jzN5hHzxlaaK8opveGtp
	 yzFGpLOzQpQRYgISS65B5vhC0FBJjGL8k9atqK0cNcPJzdyaHqJzzkF+SmgRUPJ8AE
	 WHYZtl0fU3t0HR+gCcHa2gKKgDf86ygJPk4i1ofaQ3uR3Qu5N5GOSy8Bie+Ichuy8Y
	 IcSszD425b0bQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 29/32] powerpc/configs: Add IBMVETH=y and IBMVNIC=y to guest configs
Date: Fri, 14 Apr 2023 23:24:12 +1000
Message-Id: <20230414132415.821564-29-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These drivers are sometimes required to have functional networking in a
guest, so build them in when building ppc64[le]_guest_defconfig.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/guest.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/guest.config b/arch/powerpc/configs/guest.config
index 209f58515d88..fece83487215 100644
--- a/arch/powerpc/configs/guest.config
+++ b/arch/powerpc/configs/guest.config
@@ -10,3 +10,5 @@ CONFIG_EPAPR_PARAVIRT=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VHOST_NET=y
 CONFIG_VHOST=y
+CONFIG_IBMVETH=y
+CONFIG_IBMVNIC=y
-- 
2.39.2

