Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4523B4E23
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr3K1hhnz3cD3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2M6gvMz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:51 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2L23Yqz9srZ; Sat, 26 Jun 2021 20:38:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5ab3a517bc883a2fc905fb2cb5ee9344f37b2cfa.1622818435.git.christophe.leroy@csgroup.eu>
References: <5ab3a517bc883a2fc905fb2cb5ee9344f37b2cfa.1622818435.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/4] powerpc/32: Interchange r10 and r12 in SYSCALL_ENTRY
 on non booke
Message-Id: <162470384189.3589875.8770118604128642309.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:21 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Jun 2021 14:54:12 +0000 (UTC), Christophe Leroy wrote:
> To better match booke version of SYSCALL_ENTRY macro, interchange
> r10 and r12 in the non booke version.

Applied to powerpc/next.

[1/4] powerpc/32: Interchange r10 and r12 in SYSCALL_ENTRY on non booke
      https://git.kernel.org/powerpc/c/10e9252f043ecda0dad7cde6ef87db5d10dff2c7
[2/4] powerpc/32: Interchange r1 and r11 in SYSCALL_ENTRY on booke
      https://git.kernel.org/powerpc/c/275dcf24e253f4f5b200bc8cca5eac32a23b08c8
[3/4] powerpc/32: Reduce code duplication of system call entry
      https://git.kernel.org/powerpc/c/4bd9e05ac7b8b1f7d0c28702cb684417501a5e39
[4/4] powerpc/32: Avoid #ifdef nested with FTR_SECTION on booke syscall entry
      https://git.kernel.org/powerpc/c/a27755d57e0b8c1109a6b1485e52a5f9d51bd4eb

cheers
