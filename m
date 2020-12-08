Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6092D26C2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 10:01:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqvL20jqCzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 20:01:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=centrum.lixper.it (client-ip=2a01:4f8:221:3c81::2;
 helo=centrum.lixper.it;
 envelope-from=srs0=s1cn=fm=sguazz.it=giuseppe@centrum.lixper.it;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=sguazz.it
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sguazz.it header.i=@sguazz.it header.a=rsa-sha256
 header.s=centrum header.b=I1RSCRZS; dkim-atps=neutral
X-Greylist: delayed 1684 seconds by postgrey-1.36 at bilbo;
 Tue, 08 Dec 2020 19:59:30 AEDT
Received: from centrum.lixper.it (centrum.lixper.it
 [IPv6:2a01:4f8:221:3c81::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqvJ25JwPzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 19:59:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sguazz.it;
 s=centrum; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=y2w05WLUaDoLIJEGFosg2qYKD3kDFIU2iQVDte6m0a0=; 
 b=I1RSCRZSLLHT0s8V9eSBIvJYbmBxtWQImegAo8x+ZlXV0WA9l0B5Q/7WG/+zs7eMuQdlqage6FwBAtatE2woQpdfUbj5PPGKISK+MbaSieDBkGFhQcq92UBfJ56BeqzhhzNhr+qKGhbkQwATWwtfnj7JKNKFS/YKpHRSNa/FLD0=;
Received: by centrum.lixper.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <giuseppe@sguazz.it>)
 id 1kmYOe-0000Rp-JM; Tue, 08 Dec 2020 09:30:58 +0100
Message-ID: <45348197b657d9051a7dcdf711a110388ab41900.camel@sguazz.it>
Subject: Re: [PATCH v2] powerpc/powermac: Fix low_sleep_handler with
 CONFIG_VMAP_STACK
From: Giuseppe Sacco <giuseppe@sguazz.it>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Tue, 08 Dec 2020 09:30:50 +0100
In-Reply-To: <e3e0d8042a3ba75cb4a9546c19c408b5b5b28994.1607404931.git.christophe.leroy@csgroup.eu>
References: <e3e0d8042a3ba75cb4a9546c19c408b5b5b28994.1607404931.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GeoIP: IT
X-SRS: Sender address rewritten from <giuseppe@sguazz.it> to
 <SRS0=S1CN=FM=sguazz.it=giuseppe@centrum.lixper.it> by centrum.lixper.it.
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

Hello Christophe,

Il giorno mar, 08/12/2020 alle 05.24 +0000, Christophe Leroy ha
scritto:
> low_sleep_handler() can't restore the context from standard
> stack because the stack can hardly be accessed with MMU OFF.
> 
> Store everything in a global storage area instead of storing
> a pointer to the stack in that global storage area.
> 
> To avoid a complete churn of the function, still use r1 as
> the pointer to the storage area during restore.
> 
> Reported-by: Giuseppe Sacco <giuseppe@sguazz.it>
> Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> This is only build tested. Giuseppe can you test it ? Thanks.
> 
> v2: Changed an erroneous 'addis' to 'addi' ; Using bss instead of
> data section
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/platforms/Kconfig.cputype  |   2 +-
>  arch/powerpc/platforms/powermac/sleep.S | 132 +++++++++++-----------
> --
>  2 files changed, 60 insertions(+), 74 deletions(-)
[...]

I just tested the v2 patch against latest kernel. Please note that
yesterday patch was on a kernel named 5.10.0-rc6+, while today's patch
is on a kernel named 5.10.0-rc7+. Even with the latest kernel updates,
the patch apply correctly and machine boots normally, fixing the
problem.

$ uname -a
Linux titanium4 5.10.0-rc7+ #3 Tue Dec 8 09:11:20 CET 2020 ppc GNU/Linux
$ grep VMAP /boot/config-5.10.0-rc7+
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y

Thank you again.

Bye,
Giuseppe


