Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E785F2DAB99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:05:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFm55JX6zDqCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:05:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFP74lKMzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:48:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP73mT6z9sS8; Tue, 15 Dec 2020 21:48:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, giuseppe@sguazz.it,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <e3e0d8042a3ba75cb4a9546c19c408b5b5b28994.1607404931.git.christophe.leroy@csgroup.eu>
References: <e3e0d8042a3ba75cb4a9546c19c408b5b5b28994.1607404931.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/powermac: Fix low_sleep_handler with
 CONFIG_VMAP_STACK
Message-Id: <160802920697.504444.16573519537431837820.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:48:59 +1100 (AEDT)
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

On Tue, 8 Dec 2020 05:24:19 +0000 (UTC), Christophe Leroy wrote:
> low_sleep_handler() can't restore the context from standard
> stack because the stack can hardly be accessed with MMU OFF.
> 
> Store everything in a global storage area instead of storing
> a pointer to the stack in that global storage area.
> 
> To avoid a complete churn of the function, still use r1 as
> the pointer to the storage area during restore.

Applied to powerpc/next.

[1/1] powerpc/powermac: Fix low_sleep_handler with CONFIG_VMAP_STACK
      https://git.kernel.org/powerpc/c/db972a3787d12b1ce9ba7a31ec376d8a79e04c47

cheers
