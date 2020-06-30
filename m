Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAF20EB77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 04:28:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wpFM73GSzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 12:28:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wpCp53WhzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 12:27:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=HAPr1ft0; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49wpCp1LFCz9sRk; Tue, 30 Jun 2020 12:27:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1593484038; bh=NFM6COCoADkJtON3c24Vv6dFmjtqhT4V6y1+lHPgb0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HAPr1ft04WysSZiADOMjCalamrA2adoBIwdiJ0pp2KzZhZVSmLmTsuGjLjCxYggFr
 q8DiWs7T4bJs329eLGZx7d4U281mnCNHKeyrctNhSGtBnj0cJJj3Wz/N+aRJgkhIRu
 JBgeZ5EjOYIewS9wFaYJPP3pfL/Hf3OlIUuppXCgR/9evzKx+xtCIXquNUwyrChwok
 GH4YJkNpGXJG8FwvzktyPgLLPWFLDU/I3eNGgS0/Hy69HTMtLrxCq+wrcr4PiLe3AF
 GGr0iHUJyQSKRDXJtsbxCJW04BzXYtzeyv0Hdw3MeOCelCh9ZQ3eEpNYjWT7ic5gaB
 xPvLycUUxw1Vw==
Date: Tue, 30 Jun 2020 12:27:13 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/pseries: Add KVM guest doorbell restrictions
Message-ID: <20200630022713.GA618342@thinks.paulus.ozlabs.org>
References: <20200627150428.2525192-1-npiggin@gmail.com>
 <20200627150428.2525192-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627150428.2525192-4-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Anton Blanchard <anton@linux.ibm.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 28, 2020 at 01:04:28AM +1000, Nicholas Piggin wrote:
> KVM guests have certain restrictions and performance quirks when
> using doorbells. This patch tests for KVM environment in doorbell
> setup, and optimises IPI performance:
> 
>  - PowerVM guests may now use doorbells even if they are secure.
> 
>  - KVM guests no longer use doorbells if XIVE is available.

It seems, from the fact that you completely remove
kvm_para_available(), that you perhaps haven't tried building with
CONFIG_KVM_GUEST=y.  Somewhat confusingly, that option is not used or
needed when building for a PAPR guest (i.e. the "pseries" platform)
but is used on non-IBM platforms using the "epapr" hypervisor
interface.

If you did intend to remove support for the epapr hypervisor interface
then that should have been talked about in the commit message (and
would I expect be controversial).

So NAK on the kvm_para_available() removal.

Paul.
