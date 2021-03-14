Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0AF33A403
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:02:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dyw8Q51Wgz3dWt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:02:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dyw7844Ntz3cHQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:01:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw721Qwgz9sW5; Sun, 14 Mar 2021 21:01:18 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christoph Plattner <christoph.plattner@thalesgroup.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu>
References: <4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/603: Fix protection of user pages mapped with
 PROT_NONE
Message-Id: <161571587047.138988.3119931595106306211.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:18 +1100 (AEDT)
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

On Mon, 1 Feb 2021 06:29:50 +0000 (UTC), Christophe Leroy wrote:
> On book3s/32, page protection is defined by the PP bits in the PTE
> which provide the following protection depending on the access
> keys defined in the matching segment register:
> - PP 00 means RW with key 0 and N/A with key 1.
> - PP 01 means RW with key 0 and RO with key 1.
> - PP 10 means RW with both key 0 and key 1.
> - PP 11 means RO with both key 0 and key 1.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/603: Fix protection of user pages mapped with PROT_NONE
      https://git.kernel.org/powerpc/c/c119565a15a628efdfa51352f9f6c5186e506a1c

cheers
