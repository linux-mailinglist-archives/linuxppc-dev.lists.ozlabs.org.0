Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD287590B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 10:54:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=ex2FhJbf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5V4f5whHz30YW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 18:54:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=ex2FhJbf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5V3p4YtJz2ykb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 18:53:58 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R5V3c73BvzBKy88
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 16:53:48 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689756828; x=1692348829; bh=5jTBrlBpaXbneCRhhoxAJ0k+U/g
	EFkX4S81v1MjnjK4=; b=ex2FhJbf5Hw3Oj9o6uRCUkaSy75G9r1LB/pvVQ5sOzY
	TA0+boIJVrg34Folj3+IKVtdzjjpy56FRUsHlxfuG9JtDan+WA5XAbWOd0OqM26o
	nZiafsz7rDAJOMzRUsbN26A4puWVbYXSixXSFTsLOaBogIOuxeORjoqICmwBrqxW
	Fd5SZ6foYtrctMCMrWJYtVzAoiJHFMKLzSa4M6dyhNDKp6wfYmZ6t4Bg7Jlb9q95
	FAW0IlITX9NuF95T9J/feTNkgvYGDE8J79izhENVyMmW504M4x6qm32i8GKSQlMf
	J5EAIw13DlQKOOXuEwTd9Cc5NcIwm/A+kNNkyj3f44g==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GEIxroG2vpl2 for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 19 Jul 2023 16:53:48 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R5V3c4S7WzBHYMG;
	Wed, 19 Jul 2023 16:53:48 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 19 Jul 2023 16:53:48 +0800
From: hanyu001@208suo.com
To: benh@kernel.crashing.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, robh@kernel.org
Subject: [PATCH] platforms: powermac: "foo* bar" replace with "foo *bar"
In-Reply-To: <tencent_F5ACD262BC92A89156BA56E9FC5300BE1A05@qq.com>
References: <tencent_F5ACD262BC92A89156BA56E9FC5300BE1A05@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <ead1920f07ad9b7e0a0c7667ba3ee93a@208suo.com>
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

Fix below checkpatch error:

/platforms/powermac/pfunc_core.c: ERROR: "foo* bar" should be "foo *bar"

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/powermac/pfunc_core.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/pfunc_core.c 
b/arch/powerpc/platforms/powermac/pfunc_core.c
index 07555c1bb484..7d01352a69f5 100644
--- a/arch/powerpc/platforms/powermac/pfunc_core.c
+++ b/arch/powerpc/platforms/powermac/pfunc_core.c
@@ -105,7 +105,7 @@ static u32 pmf_next32(struct pmf_cmd *cmd)
      return value;
  }

-static const void* pmf_next_blob(struct pmf_cmd *cmd, int count)
+static const void *pmf_next_blob(struct pmf_cmd *cmd, int count)
  {
      const void *value;
      if ((cmd->cmdend - cmd->cmdptr) < count) {
