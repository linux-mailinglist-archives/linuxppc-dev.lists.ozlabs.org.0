Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E33757679
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 10:24:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=vIcEbUcO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4sSP2bSdz30g9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 18:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=vIcEbUcO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4sRX5kSTz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 18:23:51 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4sRN1MqrzBJBfd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:23:44 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689668624; x=1692260625; bh=knM9vNIC6wtRw5GXn30pAFyZgpa
	AyMvsMM3ZIxyfDlo=; b=vIcEbUcOoQ22wXcMwYeUzctJaoVHCfT9cR4gNumNP0B
	+eG4hawQsALpfVSJYublkZgq6ElLMYaVrpd7sIC+MDgdIAFMcd8Q1Nlp+4MglSRL
	IC7AK8Hmf+bXhb29SVm+tHuaQxk+mh/g8FzYr5zT3c3ygF9vO57JeB7gYWkXaLC7
	H2KL2zRuD5V2zIH277d7ldZZq+erOfhzv3RNR7pbcKBJrHAzw/qIYR2+SUCeU1JG
	0bGOiCdbgR/lnro/p1Esjt9UNjG3y+2TtNmHRgQ5Jk3we31J2jC9fcjzLg4lFOt1
	u+Qav2wAdHJZDJP2JRgSbo+cDIjs1Bpu14M9EYXomRw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id p6lXcQCHjR2q for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 16:23:44 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4sRM6wgBzBJBf8;
	Tue, 18 Jul 2023 16:23:43 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 16:23:43 +0800
From: hanyu001@208suo.com
To: geoff@infradead.org
Subject: =?UTF-8?Q?=5BPATCH=5D_powerpc=3A_platforms=3A=C2=A0insert_space_?=
 =?UTF-8?Q?before_the_open_parenthesis_=27=28=27?=
In-Reply-To: <tencent_3F18E701022BD5039554E35C440CB48FB508@qq.com>
References: <tencent_3F18E701022BD5039554E35C440CB48FB508@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <6562b8964af1e6de9d8c70190d529a64@208suo.com>
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

arch/powerpc/platforms/ps3/setup.c:107:ERROR:space required before the 
open parenthesis '('

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/ps3/setup.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/setup.c 
b/arch/powerpc/platforms/ps3/setup.c
index 5144f11359f7..3a22a26912db 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -104,7 +104,7 @@ static void ps3_panic(char *str)
      printk("\n");
      panic_flush_kmsg_end();

-    while(1)
+    while (1)
          lv1_pause(1);
  }
