Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 278EA3F052B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTjG11t5z3clW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4GqTgp0h9Jz3cLf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:58 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgn150Yz9sX5; Wed, 18 Aug 2021 23:45:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20210720134209.256133-1-clg@kaod.org>
References: <20210720134209.256133-1-clg@kaod.org>
Subject: Re: [PATCH 0/2] KVM: PPC: Book3S HV: XIVE: Improve guest entries and
 exits
Message-Id: <162929391725.3619265.6275894105335009777.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:37 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Jul 2021 15:42:07 +0200, Cédric Le Goater wrote:
> The XIVE interrupt controller on P10 can automatically save and
> restore the state of the interrupt registers under the internal NVP
> structure representing the VCPU. This saves a costly store/load in
> guest entries and exits.
> 
> Thanks,
> 
> [...]

Applied to powerpc/next.

[1/2] KVM: PPC: Book3S HV: XIVE: Add a 'flags' field
      https://git.kernel.org/powerpc/c/b68c6646cce5ee8caefa6333ee743f960222dcea
[2/2] KVM: PPC: Book3S HV: XIVE: Add support for automatic save-restore
      https://git.kernel.org/powerpc/c/f5af0a978776b710f16dc99a85496b1e760bf9e0

cheers
