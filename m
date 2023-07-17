Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA1755EBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:48:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=aI030ZgR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4G2s5dQSz30YT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=aI030ZgR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4FqR5mjpz2yDv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 18:38:59 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4FqL0kLwzBR9sV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:38:54 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689583131; x=1692175132; bh=B10ONze3Ez4485BlhVM5rp5eqe5
	DThaXLzSMHECxmf8=; b=aI030ZgR5tRWs0hUo0A0zbulGwJoiK6upGGCvKIazN0
	wpNO4ASn4NZ1KB/T80Rkbpp6dGqZ1D4T+iZLiX33RvCcXuXUg1MOX3UAF7FstJAg
	Pc/MMPB29e7AZ63jyrVyMfXVhK/oRr1QS5jiGu10lUljP3PzgJqG7EAEop1yBK+v
	shyjxABNxbfv9kl01ysMpRlyIXq4Ww8SXqK2L28ddVLjfz1dGmbhs02YDySSCtDo
	9fCdxd0utaBeDESfNQH3YMH3Q7gIeCJCnawTCP2NfrwchyOcWdaKxDTscjX5WXzK
	i5/VuVte3wqOzFmcwxBw3lTQJ8vj5NRYcSPeUIaLAAA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8HWDBg5yO7bD for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 17 Jul 2023 16:38:51 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4FqH4kSZzBR5l8;
	Mon, 17 Jul 2023 16:38:51 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 16:38:51 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 onkarnath.1@samsung.com, gustavoars@kernel.org, nathanl@linux.ibm.com
Subject: [PATCH] powerpc: xmon: insert space before the open parenthesis '('
In-Reply-To: <tencent_21B998805C354725D838145110ED7A2DD606@qq.com>
References: <tencent_21B998805C354725D838145110ED7A2DD606@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <643e93ea4109ca0e2e77144060d3ad73@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:42:53 +1000
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

./arch/powerpc/xmon/xmon.c:1052: ERROR: space required before the open 
parenthesis '('

Signed-off-by: ztt <1549089851@qq.com>
---
  arch/powerpc/xmon/xmon.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 70c4c59a1a8f..6a1a2f0b9084 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1049,7 +1049,7 @@ cmds(struct pt_regs *excp)

      xmon_show_stack(excp->gpr[1], excp->link, excp->nip);

-    for(;;) {
+    for (;;) {
  #ifdef CONFIG_SMP
          printf("%x:", smp_processor_id());
  #endif /* CONFIG_SMP */
