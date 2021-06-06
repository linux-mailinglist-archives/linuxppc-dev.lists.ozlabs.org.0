Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C739CECD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb482Tspz3bs7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:12:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb37584Fz2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:03 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb366722z9sW8; Sun,  6 Jun 2021 22:12:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <13f7532f21df3196e8c78b4f82a9c8d5487aca35.1620292185.git.christophe.leroy@csgroup.eu>
References: <13f7532f21df3196e8c78b4f82a9c8d5487aca35.1620292185.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Remove m8260_gorom()
Message-Id: <162298131443.2353459.17230531273790320173.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:34 +1000
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

On Thu, 6 May 2021 09:10:01 +0000 (UTC), Christophe Leroy wrote:
> Last user of m8260_gorom() was removed by
> Commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc")
> removed last user of m8260_gorom().
> 
> In fact m8260_gorom() was ported to arch/powerpc/ but the
> platform using it died with arch/ppc/
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32s: Remove m8260_gorom()
      https://git.kernel.org/powerpc/c/3a5988b884a33cb3e4ab427b08a020ce32f3b3ba

cheers
