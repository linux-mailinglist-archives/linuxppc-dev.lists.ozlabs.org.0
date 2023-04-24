Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEAE6ED78B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 00:08:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4zls0B06z3f7V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 08:08:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TqvT2wba;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4zkx6JcLz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 08:07:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TqvT2wba;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q4zkn6JTQz4wgv;
	Tue, 25 Apr 2023 08:07:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682374034;
	bh=GddNnol6YaHH8rm7F5s2DGk04beKSm23ST/yGyZyL6U=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=TqvT2wbacCDaYEYDw8Cw/06md42z0Ft42g8d2loJiP6oKtJKR9B+BO1tQxknL7O0+
	 xHMtwZupuQ1w7gUsv6IisIF//qd4Y4hZI3kxUd9KfgQF6w/5OjIsXwq8drwcUuMjRe
	 66BZuzYAZ4SM6llfYKshjKJIh5rj20HbevDL5xX/TMB2Y/p8E55gHi+8asUYMixzmc
	 prF8+buWbfVI03axdZdlUUXRvcLURz0GNFS+gWqMFkU98HoirT44IbzLB1J8mKuAv2
	 sdSfKjqJBV24hDiOmhzC7R7Rdo6k+zl1XFqJqEgVRK6uzp4kMSHTKyoAFNG2ukHahK
	 c0ermrBykUYsA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, rcu <rcu@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, lance@osuosl.org, "Paul E. McKenney"
 <paulmck@kernel.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
In-Reply-To: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
Date: Tue, 25 Apr 2023 08:07:10 +1000
Message-ID: <87cz3tylwx.fsf@mail.concordia>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> Dear PowerPC and RCU developers:
> During the RCU torture test on mainline (on the VM of Opensource Lab
> of Oregon State University), SRCU-P failed with __stack_chk_fail:
...
> by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
> but if there is a context-switch before c000000000226edc, a false
> positive will be reported.
>
> [1] http://154.220.3.115/logs/0422/configformainline.txt

Says:

CONFIG_CC_VERSION_TEXT="powerpc64le-linux-gnu-gcc-10 (Ubuntu 10.4.0-4ubuntu1~22.04) 10.4.0"

Do you see the same issue with a newer GCC?

There's 12.2.0 here:
  https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/12.2.0/
  https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le/12.2.0/

Or if you can build in a Fedora 38 system or container, it has GCC 13.

cheers
