Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BF755F24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 11:23:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=mPfQmvJl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Gpr14zlz2ygG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 19:23:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=mPfQmvJl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Gny29btz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 19:22:44 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4Gnr1f4mzBR9sn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:22:40 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689585760; x=1692177761; bh=r52AuiwO6w9aLbUyDgtZmjP53bO
	eVyomaOlCYxlVI/Y=; b=mPfQmvJlN+mG8PuHh8PlBTIyzFOMTs1uwcjZa5gL/zG
	eWLr0I8DCraXLeEJ/K63JbcTVmoo38kXzYMlHu66368mOt3jWjeM9Qo2K1mGqEUZ
	y5iwcbBSXeVCXrod5E72UvqU/o1+nCzbAx4pwqET574WFYm7+fBIbtQ7aV8a4N/W
	jBkwv3UL8UPIfdWo4yYM4kWTHSbU2WwqDMbZRvURziNo30oHPva0L3X00GwN+C7Q
	qi9zZp2S6hH53WZ/FUa6mCEqups/tqpxVeKHpE0ZUKIGElwbwyoO13oKP9ui3yAM
	/yQGOKV/nLpX5m4+NTYGr1cuCAwarVM0FN39LAamb+Q==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6VnyXMkPs6vh for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 17 Jul 2023 17:22:40 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4Gnq5Gv4zBHXhJ;
	Mon, 17 Jul 2023 17:22:39 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 17:22:39 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 maninder1.s@samsung.com, nathanl@linux.ibm.com, gustavoars@kernel.org
Subject: [PATCH] powerpc: xmon: Remove space after '(' and before ')'
In-Reply-To: <tencent_C47ED53495F8E338441AB48CB53AE7AF0208@qq.com>
References: <tencent_C47ED53495F8E338441AB48CB53AE7AF0208@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <f9ba0bd1bc611c999fdd68b53b0d913d@208suo.com>
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

The patch fixes the following errors detected by checkpatch:

./arch/powerpc/xmon/xmon.c:2426: ERROR: space prohibited after that open 
parenthesis '('
./arch/powerpc/xmon/xmon.c:2426: ERROR: space prohibited before that 
close parenthesis ')'
./arch/powerpc/xmon/xmon.c:2426: ERROR: space required before the open 
parenthesis '('

Signed-off-by: ztt <1549089851@qq.com>
---
  arch/powerpc/xmon/xmon.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 013b63eb4cd9..c10d9ff02af1 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1057,7 +1057,7 @@ cmds(struct pt_regs *excp)
          flush_input();
          termch = 0;
          cmd = skipbl();
-        if(cmd == '\n' ) {
+        if (cmd == '\n') {
              if (last_cmd == NULL)
                  continue;
              take_input(last_cmd);
@@ -2423,7 +2423,7 @@ memex(void)
      }
      last_cmd = "m\n";
      while ((cmd = skipbl()) != '\n') {
-        switch( cmd ){
+        switch (cmd) {
          case 'b':    size = 1;    break;
          case 'w':    size = 2;    break;
          case 'l':    size = 4;    break;
