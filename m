Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D5C75A7B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 09:22:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=E/YINLxV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R640J5Tqgz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 17:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=E/YINLxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R63zS28L6z2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 17:22:11 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R63zG3CbdzBRDsR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 15:22:02 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689837722; x=1692429723; bh=v7iw69mxg3QBIitceoQwmpcV5rP
	7d16JIacjEOzr9gM=; b=E/YINLxVeTo+Zy6P/B4BJv2wN1pCgt1xmH4R0ajLPun
	Y62vhHxpIF4zKsogrnOn+uhVUjnPn1NZW5jrqVGQNXVDjHqyUDFCuKyJ/Ul1Ig7k
	ts+8qjFy3mBcknjvJmpAznaG/sm7q65RhHTVAjFkZNpBrXoh4GgPc3TjFpQAZtR2
	n/pgbJ6WPUJcCmALC64gKSgD16+f1AB967Rua1ILkqCGhs9SN0AyTmRkM3ONOVtV
	e3k/+GzEsaNO2X3fqk1bwRxYsmPHqXo8Ykd+s3kUFLMhcELVBvL0NsS99nKj7MSb
	GI4PHmRICtW0xc0XQ8DNhEoLxFDKhjEqH17FcDEEIng==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iZ4ksnW0Cgqo for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 20 Jul 2023 15:22:02 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R63zG0M6jzBRDs1;
	Thu, 20 Jul 2023 15:22:01 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 15:22:01 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, windhl@126.com, robh@kernel.org
Subject: [PATCH] embedded6xx: holly: use seq_puts instead of seq_printf
In-Reply-To: <tencent_E0E757021CD56C9510E3C044A6B421B59E08@qq.com>
References: <tencent_E0E757021CD56C9510E3C044A6B421B59E08@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <2d238f3ebbd359d18eae523925d0c8bf@208suo.com>
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

Fix checkpatch WARNINGS:

/platforms/embedded6xx/holly.c:199: WARNING: Prefer seq_puts to 
seq_printf
/platforms/embedded6xx/holly.c:200: WARNING: Prefer seq_puts to 
seq_printf

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/embedded6xx/holly.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/holly.c 
b/arch/powerpc/platforms/embedded6xx/holly.c
index 02ff260ae1ee..11820d0d22c4 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -196,8 +196,8 @@ static void __init holly_init_IRQ(void)

  static void holly_show_cpuinfo(struct seq_file *m)
  {
-    seq_printf(m, "vendor\t\t: IBM\n");
-    seq_printf(m, "machine\t\t: PPC750 GX/CL\n");
+    seq_puts(m, "vendor\t\t: IBM\n");
+    seq_puts(m, "machine\t\t: PPC750 GX/CL\n");
  }

  static void __noreturn holly_restart(char *cmd)
