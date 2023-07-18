Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B0757697
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 10:33:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=o2Dm7gdi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4sf71dRXz3bmQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 18:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=o2Dm7gdi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4sdG4pSpz2yq1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 18:32:18 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4sd92DJQzBR9sm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:32:13 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689669133; x=1692261134; bh=EqLROmlyi0yh+aRK+N3VVUL43pP
	ivKLh2Na2E4mvWUc=; b=o2Dm7gdiJsFRR2dNtzBEiGo+lTrrPCK3QbVQuYvZC/w
	Mo5eM7R1OWJClmqd9qpCHg4VDZIvhIuYHPvatKmrYd31UrL6MOEoZXJ90n+0k36m
	3WWZfSWvK7jUateSUxs2bFdL0sJhPXurQitvLhVfUkvNrIw17eaXxScNYP7VVK0E
	U6cH9YlMtinH9ilHIEXsqvQCidcuXY7wrOxNiTrG4Wu7DUEvD6jDoJXE3ytKr1Jp
	HwiB7fE79Hy5X1/OiWcMx6+lejIeDD4m20oXZQ/H7zP7/MY5V8mtrC8ED/3mONTZ
	sLACyHReW1uoPy1NIW1BB+w84nvMQ26cs2e/MOMICJA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id m8FzV79HWqpg for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 16:32:13 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4sd90W54zBR7bp;
	Tue, 18 Jul 2023 16:32:13 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 16:32:13 +0800
From: hanyu001@208suo.com
To: geoff@infradead.org
Subject: [PATCH] powerpc: platforms: ps3: insert space before the open
 parenthesis '('
In-Reply-To: <tencent_0D690D6B9BCEE104E6AA932AE7C69B89B809@qq.com>
References: <tencent_0D690D6B9BCEE104E6AA932AE7C69B89B809@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <61a4541834be2d507744af7d969bb475@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes checkpatch error:

powerpc/platforms/ps3/os-area.c:782:ERROR: space required before the 
open parenthesis '('

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/ps3/os-area.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/os-area.c 
b/arch/powerpc/platforms/ps3/os-area.c
index b384cd2d6b99..237a76d1c92f 100644
--- a/arch/powerpc/platforms/ps3/os-area.c
+++ b/arch/powerpc/platforms/ps3/os-area.c
@@ -779,7 +779,7 @@ void __init ps3_os_area_init(void)
          os_area_get_property(node, &property_av_multi_out);
      }

-    if(!saved_params.rtc_diff)
+    if (!saved_params.rtc_diff)
          saved_params.rtc_diff = SECONDS_FROM_1970_TO_2000;

      if (node) {
