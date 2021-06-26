Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA03B4E25
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr434nqdz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2P3TG3z309S
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2M6XqQz9ssP; Sat, 26 Jun 2021 20:38:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 npiggin@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <d48bf0184a1de185eb0ed3282247f8a294710674.1624632537.git.christophe.leroy@csgroup.eu>
References: <d48bf0184a1de185eb0ed3282247f8a294710674.1624632537.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/interrupt: Use names in check_return_regs_valid()
Message-Id: <162470384873.3589875.14660623720559661053.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:28 +1000
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

On Fri, 25 Jun 2021 14:49:09 +0000 (UTC), Christophe Leroy wrote:
> trap->regs == 0x3000 is trap_is_scv()
> 
> trap 0x500 is INTERRUPT_EXTERNAL

Applied to powerpc/next.

[1/1] powerpc/interrupt: Use names in check_return_regs_valid()
      https://git.kernel.org/powerpc/c/b064037ea4104120418ccbf39951a6d529a9d6d5

cheers
