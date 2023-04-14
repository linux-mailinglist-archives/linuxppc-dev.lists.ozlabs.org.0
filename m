Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F36AC6E2484
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd3v6Lj8z3gLD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:44:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FEoMQ0LS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccy2GRMz3fS6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FEoMQ0LS;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccy1W4Nz4xFm;
	Fri, 14 Apr 2023 23:25:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478706;
	bh=OsfkAWnM4D4Kkonj7ONnJfMtbqs4J2V7+rm1HjFypC0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FEoMQ0LSWJvMcis65+OFZJrIOooAx+AJuhvwSF++K3X55Ax/fCyJXGaJAqNRX9QT4
	 dvdh/zx/b3j9U5wOjZh/TGJrcjLYnh8P4IU6G5m1kVfkLvSo17dzWs7CpkyM4Xz2VD
	 8W6y83pVQ2qQda2eMfXqroB7N6I4WLKer8ukhBIrP2l9rvyKaK6dm/7ism2VlZoS3b
	 IG1he+6XXJtWUD7sSrdLtDh2c8BknV3slEeljGu6QjF1aN3UkydHnMdJ18+1Idq69k
	 1AU5HCMI1q3Bf9cjav8ljaxx0GYhECDy5PfLstEHN0wCio5eGYl5Bp3yNhk4Wuf6Cx
	 UISBLJN2KYhpQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 26/32] powerpc/configs/64s: Enable VLAN support
Date: Fri, 14 Apr 2023 23:24:09 +1000
Message-Id: <20230414132415.821564-26-mpe@ellerman.id.au>
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

Most other configs, and distros enable it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index b88155ddab65..833847b775ec 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -111,6 +111,7 @@ CONFIG_INET_IPCOMP=m
 CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_ADVANCED is not set
 CONFIG_BRIDGE=m
+CONFIG_VLAN_8021Q=m
 CONFIG_NET_SCHED=y
 CONFIG_NET_CLS_BPF=m
 CONFIG_NET_CLS_ACT=y
-- 
2.39.2

