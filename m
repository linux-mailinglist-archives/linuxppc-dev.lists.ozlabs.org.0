Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C26AF7C5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 22:37:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWTL75kQDz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 08:37:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256 header.s=201811 header.b=a6aam4Vc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWTKF6JxYz3bg8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 08:36:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256 header.s=201811 header.b=a6aam4Vc;
	dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWTKD6xm3z4wgq;
	Wed,  8 Mar 2023 08:36:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuling.org;
	s=201811; t=1678224977;
	bh=VwAG701VJhfBAeGwArR2E8H95o1UcDJPGxpr7UYbSOA=;
	h=From:To:Cc:Subject:Date:From;
	b=a6aam4VcgtDrJ9ubiAKbB3tPqfOSROh78SJpnUnmgjyWxC/shDO1o7cHJ3xiAewPQ
	 8Bo4v08tGEIWb7/d4Wto11F/UtQJixhNPUuWi3CHvfLdODFuz6ASNhO9ZLH4xC8bOr
	 NZHaw2IIHIatzv6qwYWv6qirVnUXFqgFPUCtsJjND1G+g6G6DYSHjcea50VdQ0Hdk2
	 M0INX1k2fUXZj0N54PFFbF2ZiIZt1PGpkFUzU4CgTcjcObD6Qm6olX9IMLGfCv5sWE
	 df9e3bQMgAut4y2STHky4UcQuP9K9hFjMTkXHXkjMRGO7vL2cQfGxdhqgnZXvsXLiG
	 fF0ePCoSIsrTw==
Received: by neuling.org (Postfix, from userid 1000)
	id CB24C2C1BAB; Wed,  8 Mar 2023 08:36:16 +1100 (AEDT)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] selftests/powerpc: Increase timeout for vsx_signal test
Date: Wed,  8 Mar 2023 08:36:14 +1100
Message-Id: <20230307213614.2652059-1-mikey@neuling.org>
X-Mailer: git-send-email 2.39.2
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org, cyrilbur@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On the max config P10 machine (1920 threads and 64TB) this test fails
with a timeout:

    Sending signals to all threads 10 times...!! killing vmx_signal
    !! child died by signal 15
    failure: vmx_signal

The default timeout is 120sec so increase this 3x to 360sec. With this
change the test passes on these large machines.

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 tools/testing/selftests/powerpc/math/vmx_signal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/math/vmx_signal.c b/tools/testing/selftests/powerpc/math/vmx_signal.c
index b340a5c4e79d..c307dff19c12 100644
--- a/tools/testing/selftests/powerpc/math/vmx_signal.c
+++ b/tools/testing/selftests/powerpc/math/vmx_signal.c
@@ -151,5 +151,6 @@ int test_signal_vmx(void)
 
 int main(int argc, char *argv[])
 {
+	test_harness_set_timeout(360);
 	return test_harness(test_signal_vmx, "vmx_signal");
 }
-- 
2.39.2

