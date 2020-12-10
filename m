Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0C52D5E8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:50:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsGzT52wHzDr0d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:49:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBYG1ZvdzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBYD2TGlz9shm; Thu, 10 Dec 2020 22:30:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
In-Reply-To: <20201130034406.288047-1-ravi.bangoria@linux.ibm.com>
References: <20201130034406.288047-1-ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] powerpc/xmon: Fix build failure for 8xx
Message-Id: <160756605988.1313423.18384916308376299517.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:23 +1100 (AEDT)
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
Cc: christophe.leroy@c-s.fr, mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Nov 2020 09:14:06 +0530, Ravi Bangoria wrote:
> With CONFIG_PPC_8xx and CONFIG_XMON set, kernel build fails with
> 
>   arch/powerpc/xmon/xmon.c:1379:12: error: 'find_free_data_bpt' defined
>   but not used [-Werror=unused-function]
> 
> Fix it by enclosing find_free_data_bpt() inside #ifndef CONFIG_PPC_8xx.

Applied to powerpc/next.

[1/1] powerpc/xmon: Fix build failure for 8xx
      https://git.kernel.org/powerpc/c/f3e90408019b353fd1fcd338091fb8d3c4a1c1a5

cheers
