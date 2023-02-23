Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AADD6A0316
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 08:02:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMkVL2P0wz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:02:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3a0VaGCf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3a0VaGCf;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMkTM5F1Gz3c72
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 18:01:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IxmQQoiv4zd0sXAXrZdHnjwV4WUcXZ4Ow9C4raydYTA=; b=3a0VaGCfdEWsxlHBFoLewcx7rM
	y3ytzZMgT68GyP4S54Hz4unOjQZgCo3oB83XVbMwbI7bgL+XrOF7510wj7TCpcvQLXWVzlKZ58+v7
	3KJidHDLifH+OnZ2Eu1fZlsrSwwLMcs9+C1ImY3OdeWYZUghAN8p0FHPM8w+6u8T316UuqSOu7Bye
	B7F3nDckF0UocPVnMkez9fkHuwK0zVmbrLPgCQvzrQjWbC0eZnf8j0o7QVrCMTz8vaZVdYQquFC3g
	T2FrAJZ5J8RH7DCUzxjutE/zE9EUhtnpxJhpF+sPxbeKAjxY3EzQfXHnn+jr64t7Zz1AOc+M2NbMr
	a5t1pmZw==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5bS-00FMG2-Tb; Thu, 23 Feb 2023 07:01:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] clk: mpc512x: fix resource printk format warning
Date: Wed, 22 Feb 2023 23:01:13 -0800
Message-Id: <20230223070116.660-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223070116.660-1-rdunlap@infradead.org>
References: <20230223070116.660-1-rdunlap@infradead.org>
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
Cc: Gerhard Sittig <gsi@denx.de>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use "%pa" format specifier for resource_size_t to avoid a compiler
printk format warning.

../arch/powerpc/platforms/512x/clock-commonclk.c: In function 'mpc5121_clk_provide_backwards_compat':
../arch/powerpc/platforms/512x/clock-commonclk.c:989:44: error: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]
  989 |         snprintf(devname, sizeof(devname), "%08x.%s", res.start, np->name); \
      |                                            ^~~~~~~~~  ~~~~~~~~~
      |                                                          |
      |                                                          resource_size_t {aka long long unsigned int}

Prevents 24 such warnings.

Fixes: 01f25c371658 ("clk: mpc512x: add backwards compat to the CCF code")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Gerhard Sittig <gsi@denx.de>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/512x/clock-commonclk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -986,7 +986,7 @@ static void __init mpc5121_clk_provide_m
 
 #define NODE_PREP do { \
 	of_address_to_resource(np, 0, &res); \
-	snprintf(devname, sizeof(devname), "%08x.%s", res.start, np->name); \
+	snprintf(devname, sizeof(devname), "%pa.%s", &res.start, np->name); \
 } while (0)
 
 #define NODE_CHK(clkname, clkitem, regnode, regflag) do { \
