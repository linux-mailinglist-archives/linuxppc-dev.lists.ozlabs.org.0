Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922BC6594A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 05:22:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjsXq371Xz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 15:22:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=N07qjmZ3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xFgzCHB6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=N07qjmZ3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xFgzCHB6;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjsWq37kVz3c34
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 15:21:11 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 644215C0152;
	Thu, 29 Dec 2022 23:21:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 23:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672374069; x=1672460469; bh=yn
	/S5ROEzSnOph0KuGPaeywtNTs872W1IHLPpJmU4iY=; b=N07qjmZ3Ji/7yGH5Hn
	EeQsn6g38OB6puVyAnveYv95+MlMyyoyTADCl80OkaUy2YtEF4WTfYrZp49qS8/q
	w3YWeREnapP1VV3bN7t1L+2CoeEwcuXf5OzC1CnlDwPRaxMbacZ2tRFvFzJJfutX
	2f/ogCvnsPLyB5cb+8oNz9mPLEmkrlTuWqBz0izdKsQWXJpmdvYlH1lTGJIVPeBM
	4FbhC50u4vHX2kjFE4zSqFXsp6Sx7SUYSIwtIS2Lg6QOCaiOesgAwjN1qcD7irif
	Inv2ue9MIwzKXZv1UPcAPQ0dVMCXmYFaLSAhFQ9oXnPuu9ngT+7yhcGw5BwfNLvZ
	Fv1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672374069; x=1672460469; bh=yn/S5ROEzSnOp
	h0KuGPaeywtNTs872W1IHLPpJmU4iY=; b=xFgzCHB6w5ubGeFsVdyWL5cGDdQUF
	h5/0yA/phVbZf7bjA+Fx0dUU8zg0XeDrH2oV5lt9QZ9KutKDjCjmZ7+rZxiCE1lX
	BYBoHALbo9nWqAZjGFPp0G+j+kfTvQ1LlhZO+mpc7KvFxGQAcjV9aMkjmLGbN/TZ
	luL/gHTjsWiYJ7SPrjmDcFp4vKZ6bPVATUmxO2lXPUsAtxOlcnAeSulGSD71KzvW
	wMuE7rjP/d1WfiTb3onnCWz5SvEMRg6LNu30rsMcoTMjcUQO7iXdjoFrpK+2smt0
	wjsGsGgQ6EuBPK1lfp7SNuBiCG4dwABnCy2U1rnVTuH+IlDs+qeg6nK+g==
X-ME-Sender: <xms:NWeuYysO2lKBiTsOjinYLXs7BE-CKEO_2e9YqnWPJYT_Cdzea4LJLQ>
    <xme:NWeuY3fGLNFKHyln5UstxW0vWCfhN4Zl0vIuWv-TqnG1pRqxWwRbOvF1JbnD6_u1b
    KAhlrzboXbfDNc7cw>
X-ME-Received: <xmr:NWeuY9zCc2mrcxhTJ0HgrEoHAbjIzuKL6JC76RO3Z2dsyEl4P6Uedvzy9cw6cbbUw_xldZh_NcoV2UVMnRLVrjI_S-YbQNfxqtaiHRU5uHV0PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieehgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhephf
    dvuefgtddvieeigefffeffkeeigedvgfeitdejteffveefhfdtheejffeiiedvnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:NWeuY9MLD5cNOUiqfGO4D2W3LX6iVhc_ZCvNjWkNbTwfLWztN4oTHA>
    <xmx:NWeuYy9fz_Lh0uRHLWg6Wr6O-b1h0MI72RGNUrZU8bjofynZ94ytFw>
    <xmx:NWeuY1VdCrR6f0ANu2OpgKwj5kukuJQXlayKuFV0xLjProLq9BH9KQ>
    <xmx:NWeuY3PcQPYlkR1ZPGJvL3kkOY54vuRhYAfrysZQQCNyY8aaKdZZLw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 23:21:06 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/7] powerpc/pseries: Log hcall return codes for PLPKS debug
Date: Fri, 30 Dec 2022 15:20:08 +1100
Message-Id: <20221230042014.154483-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230042014.154483-1-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, Russell Currey <ruscur@russell.cc>, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The plpks code converts hypervisor return codes into their Linux
equivalents so that users can understand them.  Having access to the
original return codes is really useful for debugging, so add a
pr_debug() so we don't lose information from the conversion.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/platforms/pseries/plpks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 9e4401aabf4f..820218eb894f 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -131,6 +131,8 @@ static int pseries_status_to_err(int rc)
 		err = -EINVAL;
 	}
 
+	pr_debug("Converted hypervisor code %d to Linux %d\n", rc, err);
+
 	return err;
 }
 
-- 
2.38.1

