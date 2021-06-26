Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A13B4E38
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:44:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr9C0X8jz3ffN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:44:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2g00ftz3c1k
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:39:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4GBr2d5fyLz9sW8; Sat, 26 Jun 2021 20:39:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2d5Q38z9sfG; Sat, 26 Jun 2021 20:39:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@ozlabs.org>
In-Reply-To: <YJD7L9yeoxvxqeYi@thinks.paulus.ozlabs.org>
References: <YJD7L9yeoxvxqeYi@thinks.paulus.ozlabs.org>
Subject: Re: [PATCH] powerpc/pmu: Make the generic compat PMU use the
 architected events
Message-Id: <162470384661.3589875.4646994766759327163.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:26 +1000
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
Cc: Michael Ellerman <michael@ellerman.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 May 2021 17:43:43 +1000, Paul Mackerras wrote:
> This changes generic-compat-pmu.c so that it only uses architected
> events defined in Power ISA v3.0B, rather than event encodings which,
> while common to all the IBM Power Systems implementations, are
> nevertheless implementation-specific rather than architected.  The
> intention is that any CPU implementation designed to conform to Power
> ISA v3.0B or later can use generic-compat-pmu.c.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pmu: Make the generic compat PMU use the architected events
      https://git.kernel.org/powerpc/c/d40a82be2f79d16cc18c28c14d267da240659949

cheers
