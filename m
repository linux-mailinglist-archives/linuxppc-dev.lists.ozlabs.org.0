Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C043149E7F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:48:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl63M4NnFz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:48:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=WWLc8SyC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=WWLc8SyC; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl62p4nQ1z30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 03:47:46 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9DC9D22239;
 Thu, 27 Jan 2022 17:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643301699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sO/AhngIul0mvC410oF69TOhLnEgY1UA6QAhHQWufqM=;
 b=WWLc8SyCimIFCUDX/NQtjs/Pz9p9HabtdgmUf2M55TY4l4grQSM7aR00U+ZK12sEyRj6d3
 uRIw5PSJWAyJvrI1+rsUWW1T3JlXYHPGFPZYRqKJX+Lp5l6gVCMh8PRf8WkvEHZQeQ2fFq
 Wro6JWr+sKTP85TKYXdXIX+81J76hso=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] soc: fsl: guts: cleanups and serial_number support
Date: Thu, 27 Jan 2022 17:41:18 +0100
Message-Id: <20220127164125.3651285-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Michael Walle <michael@walle.cc>, Arnd Bergmann <arnd@arndb.de>,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series converts the guts driver from a platform driver to just an
core_initcall. The driver itself cannot (or rather should never) be
unloaded because others depends on detecting the current SoC revision
to apply chip errata. Other SoC drivers do it the same way. Overall I
got rid of all the global static variables.

The last patch finally adds unique id support to the guts driver. But
because the binding for the security fuse processor is still pending,
it is marked as RFC.

Michael Walle (7):
  soc: fsl: guts: machine variable might be unset
  soc: fsl: guts: remove module_exit() and fsl_guts_remove()
  soc: fsl: guts: embed fsl_guts_get_svr() in probe()
  soc: fsl: guts: allocate soc_dev_attr on the heap
  soc: fsl: guts: use of_root instead of own reference
  soc: fsl: guts: drop platform driver
  soc: fsl: guts: add serial_number support

 drivers/soc/fsl/guts.c | 215 ++++++++++++++++++++++-------------------
 1 file changed, 114 insertions(+), 101 deletions(-)

-- 
2.30.2

