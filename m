Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8E2DAB81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 11:56:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFYT4Rg9zDqSn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 21:56:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFP432FDzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:48:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP35MqDz9sTL; Tue, 15 Dec 2020 21:48:55 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <b2f71f39eca543f1e4ec06596f09a8b12235c701.1607076683.git.christophe.leroy@csgroup.eu>
References: <b2f71f39eca543f1e4ec06596f09a8b12235c701.1607076683.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Fix early debug when SMC1 is relocated
Message-Id: <160802920774.504444.8233931629187109687.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:48:55 +1100 (AEDT)
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

On Fri, 4 Dec 2020 10:11:34 +0000 (UTC), Christophe Leroy wrote:
> When SMC1 is relocated and early debug is selected, the
> board hangs is ppc_md.setup_arch(). This is because ones
> the microcode has been loaded and SMC1 relocated, early
> debug writes in the weed.
> 
> To allow smooth continuation, the SMC1 parameter RAM set up
> by the bootloader have to be copied into the new location.

Applied to powerpc/next.

[1/1] powerpc/8xx: Fix early debug when SMC1 is relocated
      https://git.kernel.org/powerpc/c/1e78f723d6a52966bfe3804209dbf404fdc9d3bb

cheers
