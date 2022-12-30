Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8196594AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 05:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njsbv18mrz3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 15:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=IoeRkN1W;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tp8/pSEs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=IoeRkN1W;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tp8/pSEs;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjsWy2Whjz3c23
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 15:21:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6E5795C0349;
	Thu, 29 Dec 2022 23:21:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 29 Dec 2022 23:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672374076; x=1672460476; bh=JN
	9NFHKSRoX2NmbrNsnkR20cy9kBqiSvPpqIXpLNJ9I=; b=IoeRkN1WglL20SiCEh
	2UQIey6viwF29x0zjR7Q9s4ltywDVuL8CFWtA7hAkUZWMFS2gpE+yypCxU3LnTxX
	fbJFTH45w6Irl0veEzPsEYD6QjMmsC4rDLLPbKsc0DPk4LE7ryT4YmYHqeQ3fqfS
	gRT6W16jUV2Pv/L+SIe8EBfEXJ7E3c5vfUotPnteOHBkU1mjInfwqXSVWfCdBgtz
	qDHyjp+lGAOlk5EkqVzPQf80ROpaJVT9dfsPKQptwFuXapvZQ4PmlC8g4tY/wbuD
	QdyS8jPi7EvCxIcVxJqBYnnAl4zFCd4M5/mMrtx8ppWb/K9I2QrVAkYHCtnh14I/
	ZyWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672374076; x=1672460476; bh=JN9NFHKSRoX2N
	mbrNsnkR20cy9kBqiSvPpqIXpLNJ9I=; b=tp8/pSEset17Jvwo3IfyyS8nEYDTn
	/rOyZWHEij7SxFlKtuw1jFWtOxWHeORgKx4+398lx53JMKTPX0qMxUm+PqJrLCGr
	Bs4BGCBmtbhIjXiS6zxFE1zEiDdMeuUNWxll5zOfun3vtZytvjFv2bFUxaEMObgH
	j7Jl+x+/9qtiRLp68yoxjxmVKLQH3HQO+uFJnMjqUwAq/XR0NjGgKYAkev+4YHFe
	mL5gZ+dKVf3jmbboCRTmIFIpp5Ixqu5byKKJcvOwifzV41dhaEwfqawlayPPEuUK
	nrxhn+YTpZkB8oe4v5iUcx5LIMjAx1w5cOfq9XAYqFd1sNQn4QC4c3GiQ==
X-ME-Sender: <xms:PGeuY-P0RrmIx9IQz4zXeG4hQlt12WBR8OA0DCjv3usibIlKqEh0VA>
    <xme:PGeuY89SdIYPtDDpkK52wf-IEBlA708Zpu3SfDfzJXcGmvB-ebFPnBGdhkf8IiHOc
    lbAKpBKltfUq1xK1A>
X-ME-Received: <xmr:PGeuY1SUIZI34eRtyXlcGDotWl7enNbLNIZTTlMrP3-yVhsAyj5HumFvYAjryVmTjLl4Da43mZ6d-XIOJ7irqlfi5Hham8fQwcw28W1rAbamMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieehgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhephf
    dvuefgtddvieeigefffeffkeeigedvgfeitdejteffveefhfdtheejffeiiedvnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:PGeuY-sL4z096z7Db4_wOL_-WhwCPbTWD5aDKmK0Jy_HttNCGtnafA>
    <xmx:PGeuY2f5SFnaS6yFaOli_MlTl3svbRVDy7-tkKw3QS1guY4kIs22MQ>
    <xmx:PGeuYy1X_1H7PYhevvBHf81Qy78YLM6qNoR2LQTNnBvIR6mGEKdj5w>
    <xmx:PGeuY8suZCQ3sZG9TXJc-xvcbVXmolHZN-3fbzo2xDZmCNxwoVJ1lQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 23:21:13 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/7] powerpc/secvar: Use sysfs_emit() instead of sprintf()
Date: Fri, 30 Dec 2022 15:20:10 +1100
Message-Id: <20221230042014.154483-4-ruscur@russell.cc>
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

The secvar format string and object size sysfs files are both ASCII
text, and should use sysfs_emit().  No functional change.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v2: new

 arch/powerpc/kernel/secvar-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 1ee4640a2641..02e9fee1552e 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -35,7 +35,7 @@ static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
 	if (rc)
 		goto out;
 
-	rc = sprintf(buf, "%s\n", format);
+	rc = sysfs_emit(buf, "%s\n", format);
 
 out:
 	of_node_put(node);
@@ -57,7 +57,7 @@ static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
 		return rc;
 	}
 
-	return sprintf(buf, "%llu\n", dsize);
+	return sysfs_emit(buf, "%llu\n", dsize);
 }
 
 static ssize_t data_read(struct file *filep, struct kobject *kobj,
-- 
2.38.1

