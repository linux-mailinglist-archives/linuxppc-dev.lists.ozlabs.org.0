Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D93B4E26
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:40:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr4P4kljz3dD9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2P5rZgz3byD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2N4R2rz9svs; Sat, 26 Jun 2021 20:38:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, wangkefeng.wang@huawei.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <9fa9ba6807c17f93f35a582c199c646c4a8bfd9c.1622800638.git.christophe.leroy@csgroup.eu>
References: <9fa9ba6807c17f93f35a582c199c646c4a8bfd9c.1622800638.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove klimit
Message-Id: <162470384534.3589875.7856522821307710306.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:25 +1000
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

On Fri, 4 Jun 2021 09:57:36 +0000 (UTC), Christophe Leroy wrote:
> klimit is a global variable initialised at build time with the
> value of _end.
> 
> This variable is never modified, so _end symbol can be used directly.
> 
> Remove klimit.

Applied to powerpc/next.

[1/1] powerpc: Remove klimit
      https://git.kernel.org/powerpc/c/56afad885228902d090558a0b1cf75e9809e831d

cheers
