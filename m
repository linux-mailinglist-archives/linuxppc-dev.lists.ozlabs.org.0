Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447F6573B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 08:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhk2d6t3Bz3cdP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 18:40:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=L64sfh8y;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=A+lFhYv1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=L64sfh8y;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=A+lFhYv1;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhjxQ3fkkz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 18:35:53 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 6D5DA320090E;
	Wed, 28 Dec 2022 02:30:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 28 Dec 2022 02:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672212624; x=1672299024; bh=yn
	/S5ROEzSnOph0KuGPaeywtNTs872W1IHLPpJmU4iY=; b=L64sfh8yUDUAW0dE0k
	T7RuEKTunT8wEC70MkP9XpVQHTFwOtb9gcWg6OG6kHlUWzbDtyoHPkY8rYdAdZR2
	lSVwHfgLxGiAOpT+bS/swz7iVvpjI9vPXixdBDeHpm60mqGNX4Z7tu/R6had50bv
	YfGgYSGxjrOnRIffOrBbhKrabA2mTEajuIYUGvhK35coq3K9NHkip5QllqJXgAdm
	cQGjD2hdD+3TtZY0ylIZ+hzySMi5+BZ20uybU0y9OlAmnhwoMRhhkhn1y4rlPDAK
	KKINlPpXBlYKmJL+rbTdhuadWoBGGduBNx67H8R71wyBzNgW/Oj4GbqlD4YX/Tza
	eEBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672212624; x=1672299024; bh=yn/S5ROEzSnOp
	h0KuGPaeywtNTs872W1IHLPpJmU4iY=; b=A+lFhYv1cVQqKoGr0XyWw/bCHvMKQ
	immRLXwo9cc9CIUG5Zn8cIQ/dMCt8UkgaWDLYlFBYabpuawh3IiTc+8Ja0NWIH7d
	e4WIp9YrwrEn0x6uE7bOUUNfqTOurfsX36PGl5wQkbV1tVJtCISkdmcWLgRcVmyD
	oTqBt2lqgpYm03xM6iT/0SyIbPBIcPZhagl2DXB5ogFxS3kC948ctyGAdVDGYKE3
	M7+ADKN9WQ4/6+tgJ1OjlohnnJ6j/elBHhKwn8LJA0iyNKSA7Uvr5xkSiRVvsyAn
	oWeppeS23e0YSnS7orF+dMP9Cfyu9rv/nkG0WjzFWLG8dyVBKYG4DLTBg==
X-ME-Sender: <xms:kPCrY11TsgJfLjuF6bQGrtXn3RxEFL23MhyZhKFUyfRNzKpYwN83Wg>
    <xme:kPCrY8EohSSFK4VlcQdZzl-r6sbclnBd-oz6H2kWXYcc4MlQQq-gplu7-SYDDsso9
    d1lNlswZvICsPKLQw>
X-ME-Received: <xmr:kPCrY14YnBbhU2XQYm16ZFBNSsTs187L9VZUor78Iak2-HAIUAyueUZ9hdirtngJOBbUYg6J_W70BaH5OsJiVr3lm9nNSrT2M6sUnfgXij-MBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    fhvdeugfdtvdeiieegffefffekieegvdfgiedtjeetffevfefhtdehjeffieeivdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:kPCrYy1A5h3LdL9iLj5j0OLj8632us4FXbdSNZr7Nk3lRfikSqSXyg>
    <xmx:kPCrY4GFcQRwjfWS-FO9Ztjj5PnGeMJ_vvUViMTOfPSUaPPpMUOuRA>
    <xmx:kPCrYz9aGlRUTCtN9Ed_hTQdD20J9pK5B4o8q0Be55iwhgRyHhOVqQ>
    <xmx:kPCrYz1l_hk8o2KorjXxrTm3MmlELmuh-Fv302IzeXLe90SwanGYTg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 02:30:22 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/pseries: Log hcall return codes for PLPKS debug
Date: Wed, 28 Dec 2022 18:29:38 +1100
Message-Id: <20221228072943.429266-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228072943.429266-1-ruscur@russell.cc>
References: <20221228072943.429266-1-ruscur@russell.cc>
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

