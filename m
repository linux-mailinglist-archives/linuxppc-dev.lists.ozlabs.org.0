Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27658D356
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 07:47:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M22CQ2jsWz3bc5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 15:47:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=Q+EsuHn+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AsnIzQ5W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=Q+EsuHn+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AsnIzQ5W;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M22Bh1XYZz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 15:46:51 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 7958C320070D;
	Tue,  9 Aug 2022 01:46:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 09 Aug 2022 01:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660024005; x=1660110405; bh=OHrf2naIHgHrBiy9zKszz6ED1
	entwenO6Sen8acphM4=; b=Q+EsuHn+3kZtMY+w5ZISp4Jc7Z9475kMwMmguDKyl
	d528QgljuwabAF0mhREEv/zJHetXnb3RwJcjt9/NMENsf+2wjFopkc/n/KnRIZF/
	35GZ/t4Z9hn9a6TWhnsHARy6NohJsZcQGo4gxGBHSNZ/rwKzLCIFrbhE+ReZpzfN
	jc6LXv7dHbzGpmdoT4Pji5Uqj8KzTYe0cMAEJZvjrpf97ZG5E6/su+Hewtpj//+Z
	i5qFq+ZaEiablePixFO812l8CPh2kDmoJrPNOumnOTq13i8iS+9lQiE1BqgcXbYS
	K9UVkzn7KEw3Wh04gtI0Qn5ttCHbzKEwcbhxQzYZhnfcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660024005; x=1660110405; bh=OHrf2naIHgHrBiy9zKszz6ED1entwenO6Se
	n8acphM4=; b=AsnIzQ5WBtT0ulF+VB63P4f+CxknGapxDG4Zpgzc1z8nPKdBri7
	pH/v3kSVdE32uX1NCuNYi6acj1DLavDMglpQL1k9ZdgzBQjvqEpSa5CPVZ2wkJi0
	vrjfOl9Tt1hxgLYEkqeFBPsz5Z0O2z+ihfpj+wlC5zjE5Q8VOfhK6USHkIsOQ2Dz
	6RSmrCFqggnnBpbAJWXgCtcO1pWd6ZbQiW6y7yd7gSxfOCoflqLqRc1WUg8yJM5C
	0U4ozioDslwH8Xt5x1ex/7+4yg3ODf3nBgsJI35jLar+cDtCLQiGH8W1/yH9NCGY
	xagUG/i32i9cLZXKluttYASMYWU/sdGRy7A==
X-ME-Sender: <xms:xfTxYu0-1fLaIXSJsfavVKnKHXSuR1pmoKu7Li746GpjxObmvyL6NA>
    <xme:xfTxYhHVxsuuM9ztADF-rZPqB67_RY_rV_GqS9QRShUW1NL0MoaNwi51a_XtQNdhm
    N6M0Mj22ycpZgjHXA>
X-ME-Received: <xmr:xfTxYm5WIoisDMovxRlYEWTpzB49_qSNnC9Te88l1ksPeyqnUmoeWDqiu8CYtXzpzATAl4r2ZRUWSb76nZn31vFkaPEHnWs3D5QTffkQ6M62Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepff
    dvfefgudfgfedvgeffudekteeiheelfefggeegjedtveduleehkeeiieefvdejnecuffho
    mhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:xfTxYv0MkSYDdix58JJouOrJ8yvBh85Q6iSKHlZIJCR0k3HGUqWqgg>
    <xmx:xfTxYhGa7VjltqFtu6pDrFAbtscs2HZ_Q3ceR-P7HQxfv3H1hbl9xQ>
    <xmx:xfTxYo97KJxT-rMmvNtHN5BbjEmBbuBKGj3ZtV07Iku60BvKLx9UzQ>
    <xmx:xfTxYhAkSdjj4Z2t2x5UwEaWr45lMABh5-pgRI-1r27iqBZV07dOQQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Aug 2022 01:46:43 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org,
	aik@ozlabs.ru
Subject: [PATCH] powerpc/kexec: Fix build failure from uninitialised variable
Date: Tue,  9 Aug 2022 15:45:30 +1000
Message-Id: <20220809054530.907974-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.1
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
Cc: nathan@kernel.org, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang 14 won't build because ret is uninitialised and can be returned if
both prop and fdtprop are NULL.

Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
Not sure what should be returned here, EINVAL seemed reasonable for a
passed property not existing.

Also, damn it Alexey, I mentioned this in my review:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220616075901.835871-1-aik@ozlabs.ru/

Consider yourself lucky I'm no longer your dictator (if you don't already)

 arch/powerpc/kexec/file_load_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 683462e4556b..8fa2995e6fc7 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1043,7 +1043,7 @@ static int copy_property(void *fdt, int node_offset, const struct device_node *d
 			 const char *propname)
 {
 	const void *prop, *fdtprop;
-	int len = 0, fdtlen = 0, ret;
+	int len = 0, fdtlen = 0, ret = -EINVAL;
 
 	prop = of_get_property(dn, propname, &len);
 	fdtprop = fdt_getprop(fdt, node_offset, propname, &fdtlen);
-- 
2.37.1

