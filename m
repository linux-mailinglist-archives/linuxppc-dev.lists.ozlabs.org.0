Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A4904CBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 09:26:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T6OIPsFO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzcXl6XBtz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 17:26:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T6OIPsFO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b9; helo=out-185.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 503 seconds by postgrey-1.37 at boromir; Wed, 12 Jun 2024 17:25:35 AEST
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [IPv6:2001:41d0:203:375::b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzcWz5hKvz3cTw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 17:25:35 +1000 (AEST)
X-Envelope-To: npiggin@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718176600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HHB/lYVyp77gev3X+Spg1bAYCcC3JHUd82+j9ExIkfI=;
	b=T6OIPsFOXMYRNCAJuz6xX2hI+M4U0kJnhGxH3oUL4xlpquC0ysCPZ702s0XnDA5vf2IYte
	mSGh6DBq5eOnxD8ylbk7sPjqxCu7wFQLKyFkHjVhxFICVkY+IbFj7fpDGgfligKPXitLSy
	J3HlfKfp4vO5VbEuL+IuBoFGsv+3Xvk=
X-Envelope-To: thuth@redhat.com
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: mhartmay@linux.ibm.com
X-Envelope-To: kvmarm@lists.linux.dev
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: kvm-riscv@lists.infradead.org
X-Envelope-To: linux-s390@vger.kernel.org
Date: Wed, 12 Jun 2024 09:16:36 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
Message-ID: <20240612-39939298ecbc2ba78479a2f2@orel>
References: <20240612044234.212156-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612044234.212156-1-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2024 at 02:42:32PM GMT, Nicholas Piggin wrote:
> arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
> in dependency chains that cause them to be made as intermediate files,
> which get removed when make finishes. This results in unnecessary
> partial rebuilds. If make is run again, this time the .aux.o targets
> are not intermediate, possibly due to being made via different
> dependencies.
> 
> Adding .aux.o files to .PRECIOUS prevents them being removed and solves
> the rebuild problem.
> 
> s390x does not have the problem because .SECONDARY prevents dependancies
> from being built as intermediate. However the same change is made for
> s390x, for consistency.
> 
> Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/Makefile.common     | 2 +-
>  powerpc/Makefile.common | 2 +-
>  riscv/Makefile          | 2 +-
>  s390x/Makefile          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>
