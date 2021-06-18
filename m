Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21E23AC214
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:24:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m6Z2V6vz3cCd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4C2zgdz3bxV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:51 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4B2zG3z9sjB; Fri, 18 Jun 2021 14:22:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <37f41d74faa0c66f90b373e243e8b1ee37a1f6fa.1623219019.git.christophe.leroy@csgroup.eu>
References: <37f41d74faa0c66f90b373e243e8b1ee37a1f6fa.1623219019.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Move update_power8_hid0() into its only user
Message-Id: <162398829750.1363949.3980800168826008828.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:37 +1000
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

On Wed, 9 Jun 2021 06:10:29 +0000 (UTC), Christophe Leroy wrote:
> update_power8_hid0() is used only by powernv platform subcore.c
> 
> Move it there.

Applied to powerpc/next.

[1/1] powerpc: Move update_power8_hid0() into its only user
      https://git.kernel.org/powerpc/c/ab3aab292cb2f417f63b8f4887c1dd01c2a831cd

cheers
