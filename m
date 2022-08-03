Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390DF58927B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 20:55:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lygz11GLCz3bmK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 04:55:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lygyf0JZsz2xGd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Aug 2022 04:54:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LygyX2pT5z9sZj;
	Wed,  3 Aug 2022 20:54:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMGNEnU9bWvF; Wed,  3 Aug 2022 20:54:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LygyX1fC9z9sZh;
	Wed,  3 Aug 2022 20:54:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E40148B77D;
	Wed,  3 Aug 2022 20:54:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XfWxTrCksslc; Wed,  3 Aug 2022 20:54:43 +0200 (CEST)
Received: from [192.168.234.154] (unknown [192.168.234.154])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A5C318B76D;
	Wed,  3 Aug 2022 20:54:43 +0200 (CEST)
Message-ID: <b35f275e-2e80-6f2d-92cc-d951916b5c63@csgroup.eu>
Date: Wed, 3 Aug 2022 20:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: fr-FR
To: Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: clang kernel PPC32 build failure, undefined reference to `__umoddi3'
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks like since recently some clang builds fails for missing reference 
to `__umoddi3`.

See exemple at:
- https://github.com/ruscur/linux-ci/actions/runs/2789193140
- 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/eca9251f1e1f82c4c46ec6380ddb28356ab3fdfe.1659527244.git.christophe.leroy@csgroup.eu/

 From fs/mpage.o:

00000170 <do_mpage_readpage>:
...
      69c:	38 60 00 00 	li      r3,0
      6a0:	38 a0 00 00 	li      r5,0
      6a4:	38 c0 00 05 	li      r6,5
      6a8:	7d c4 73 78 	mr      r4,r14
      6ac:	92 e1 00 10 	stw     r23,16(r1)
      6b0:	3a a0 00 00 	li      r21,0
      6b4:	93 81 00 18 	stw     r28,24(r1)
      6b8:	3b 80 00 05 	li      r28,5
      6bc:	92 01 00 14 	stw     r16,20(r1)
      6c0:	92 21 00 1c 	stw     r17,28(r1)
      6c4:	48 00 00 01 	bl      6c4 <do_mpage_readpage+0x554>
			6c4: R_PPC_REL24	__umoddi3



I don't understand why calling __umoddi3 when the arguments are 
obviously 32 bits are r3 and r5 are zero.

Christophe
