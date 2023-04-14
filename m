Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322AF6E243E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:28:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PycjH0k4Cz3fbT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:28:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aFww6THq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccl4Ctkz3f5P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aFww6THq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pycck2TrYz4xFd;
	Fri, 14 Apr 2023 23:24:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478694;
	bh=iZGs6cwEvRT1tBZrz4yvKPMQLQbLjEfIejGL02VR8Fk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aFww6THqyGpZ7xJRtSCQcWfdY9bCDWS7q29ev5nxdf/NGFtIJAN370fydQvoyR/Ux
	 /wGTyfIqTJ0Z5Yxo5jEEurocwO3TPWWb7Q5AtkOPVJ+5NKT2+9qPgSu2y+Awq+0DkN
	 phRu2r16GuEeWr8BGwUocWAvKOp2ASkg8cW2HdySQSTQAmlAtPKvK5pshl3QuvNRr3
	 44ENLlk3XdirUlzW8E0hC9TZ5kT4Y79DdC53Fm9aVqNwRjRdXfU1wUUwYH4AqAcFF4
	 upgRWkN17g10QRbTHcs4PPLL99J7pq4jpjrKHnkxzLFFiB4tzoCx8lz11I74y7+UCE
	 NzJl1HH7XCj0A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 03/32] powerpc/configs/64s: Drop IPV6 which is default y
Date: Fri, 14 Apr 2023 23:23:46 +1000
Message-Id: <20230414132415.821564-3-mpe@ellerman.id.au>
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

Since commit de551f2eb22a ("net: Build IPv6 into kernel by default"),
IPV6 is default y.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 0a3a2fefb652..c4f3ce96d924 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -84,7 +84,6 @@ CONFIG_SYN_COOKIES=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
 CONFIG_INET_IPCOMP=m
-CONFIG_IPV6=y
 CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_ADVANCED is not set
 CONFIG_BRIDGE=m
-- 
2.39.2

