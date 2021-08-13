Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D693EB4F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 14:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmMZR72Jlz3dS1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 22:00:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmMXl0CTWz3bX2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 21:59:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GmMXd5VTHz9sX5; Fri, 13 Aug 2021 21:58:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Finn Thain <fthain@linux-m68k.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, userm57@yahoo.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <731694e0885271f6ee9ffc179eb4bcee78313682.1628003562.git.christophe.leroy@csgroup.eu>
References: <731694e0885271f6ee9ffc179eb4bcee78313682.1628003562.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix napping restore in data storage
 interrupt (DSI)
Message-Id: <162885586674.2317031.2615926550981438565.b4-ty@ellerman.id.au>
Date: Fri, 13 Aug 2021 21:57:46 +1000
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

On Tue, 3 Aug 2021 15:14:27 +0000 (UTC), Christophe Leroy wrote:
> When a DSI (Data Storage Interrupt) is taken while in NAP mode,
> r11 doesn't survive the call to power_save_ppc32_restore().
> 
> So use r1 instead of r11 as they both contain the virtual stack
> pointer at that point.

Applied to powerpc/fixes.

[1/1] powerpc/32s: Fix napping restore in data storage interrupt (DSI)
      https://git.kernel.org/powerpc/c/62376365048878f770d8b7d11b89b8b3e18018f1

cheers
