Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02F354BC4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 06:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDvs76cfPz30Bm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 14:37:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=E6H8JPGe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=E6H8JPGe; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDvrm1zpfz2xYv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 14:37:27 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4FDvrk4nhlz9sWQ; Tue,  6 Apr 2021 14:37:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617683846; bh=VZuzCILOIRol37URhiobWfkupK9ny+NNPs7jOctkUWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6H8JPGeVXPRjLNkwWre49EODd8kqB8Y1GbQLw8uoJubll2G0oKHugO6gjR420zuZ
 A8lFrrhfVlaBTW17mjapYpSucVuRgUzQAjIlSNr5+/aniZDfZ1rV+emkzVmkvgMqgs
 cwBVUKbJj42ewMvfEscpRhRi6ZyhE8rGuptvXD83VTtZgkMHTkG15f7r2PuMf/Bezt
 r2sYZec50+KkIwdCAjfvZ0UTC3fEgnfSM7kWndzzPedy0I0BLHchmBirANX2xkFfvE
 P2C0NoRyqgx0wd6KctnL8f03bFQ4wtu5fv6gPPykZxf7F547aVos3vol0Hb+Uvir1p
 cdENlc3Ky/hCQ==
Date: Tue, 6 Apr 2021 14:37:22 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 16/48] KVM: PPC: Book3S 64: Move interrupt early
 register setup to KVM
Message-ID: <YGvlguoc6IjjwybE@thinks.paulus.ozlabs.org>
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-17-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405011948.675354-17-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 05, 2021 at 11:19:16AM +1000, Nicholas Piggin wrote:
> Like the earlier patch for hcalls, KVM interrupt entry requires a
> different calling convention than the Linux interrupt handlers
> set up. Move the code that converts from one to the other into KVM.

I don't see where you do anything to enable the new KVM entry code to
access the PACA_EXSLB area when handling DSegI and ISegI interrupts.
Have I missed something, or are you not testing PR KVM at all?

Paul.
