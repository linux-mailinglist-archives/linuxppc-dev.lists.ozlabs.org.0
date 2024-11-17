Return-Path: <linuxppc-dev+bounces-3365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B47779D038C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:25:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqhq4nL3z308M;
	Sun, 17 Nov 2024 23:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846315;
	cv=none; b=bxXmlmXh0rNrWJ9hr3cbsPgIV0yUp2xAwyxoFZfwRZx6xLurD3pQ0qiEhqOIg251Nl0qOySGYF0Gw2ow/m+4+I8c/4ty/JzdlbZxtu+5Wkns0MUTdFjceMN0r7Vt7qiEdPvJrbkXIp4xof01byAvYGI8UFaiTWTfPXjpjuTbRSEEMOd0Rapx9vOvY0rINUGrbE2ix+PSIMsMN/+6Dd/Bxlw7ey4D7sCZsjRZOUvnBb8fASBqm8zTJAC0hu3FiM+VZZe8Ps53EDAdiG7+SP0lqsNUrp7NKVA1+uFlwjr12utKNeGXwTwOHQ2bMi+Enr7v2nVWPe9vJ2Q0WFAxgwSL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846315; c=relaxed/relaxed;
	bh=Whwznt8AGTFflVnnQEX7dgo8jQXeAZc+kZEuI8J0BII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hd4w2hIZX+YIYDiURxpr3YrNh+eIuM2OhMyVDtEL5wF0RvkqoZWevVJcb3U+/179NrW1FMqhwatk4ozoEXQbnAx6svm9anFOcQ4YVhht7Esmt2m9mo8PHSofgLsPzm325ZSXC9WR38PQQUqwyjmHPLE9fYJo0bePdD8IhYFRzsRJO0oILy6I+zTBCjmfKgwsVfAXPDxVfd9MmtTPWYVeOuWIwFP+n6Zt1fbftzzAWmZpxqNPme2TA6XxnanGAVjDVtpF8n5gPTaWpMUKmtIU7bqVEdqHljPqG9su9ArzE4jvm143tYjr7tDOxKFQmOBmXYBIN5zwseAUbPjYd2VaWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LB3+6679; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LB3+6679;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhp4fTKz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846311;
	bh=Whwznt8AGTFflVnnQEX7dgo8jQXeAZc+kZEuI8J0BII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LB3+6679yJHY/ctV5rALLE25zQb2KH3hvYCgRGl/4YAML6eUQr7czEwhMGCFbOroG
	 fJM1YmmKRHjjWzHk8y/AGZEdZvN3Vh+i86Ir3PTrnx4AhhExwy2bcyi9uuhNlP8N5J
	 Lk+KC0loly16CrZU1w+WDH3S6ox+C/cRjTHlByC4SJSTzM0boT/K3Ss2pqWdMyKB8y
	 4SZqPdJQcLgL/5uuejezacbh9/xKO5Y1Y/HMC1aQMZLU2tzu3NxzoyN6pgdD5YicEK
	 rjnPyoB0uWaKadxR74mq3RL7Y2sAUKGvDBFGjX+gPAlojiRaZ/adzOewwSExbiKFwz
	 V8nXUCUWu5z3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhl3PCYz4xdw;
	Sun, 17 Nov 2024 23:25:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, vaibhav@linux.ibm.com, Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241108094839.33084-1-gautam@linux.ibm.com>
References: <20241108094839.33084-1-gautam@linux.ibm.com>
Subject: Re: [PATCH v2] arch/powerpc/pseries: Fix KVM guest detection for disabling hardlockup detector
Message-Id: <173184539747.890800.11538594220662178668.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 08 Nov 2024 15:18:37 +0530, Gautam Menghani wrote:
> As per the kernel documentation[1], hardlockup detector should be
> disabled in KVM guests as it may give false positives. On PPC, hardlockup
> detector is enabled inside KVM guests because disable_hardlockup_detector()
> is marked as early_initcall and it relies on kvm_guest static key
> (is_kvm_guest()) which is initialized later during boot by
> check_kvm_guest(), which is a core_initcall. check_kvm_guest() is also
> called in pSeries_smp_probe(), which is called before initcalls, but it is
> skipped if KVM guest does not have doorbell support or if the guest is
> launched with SMT=1.
> 
> [...]

Applied to powerpc/next.

[1/1] arch/powerpc/pseries: Fix KVM guest detection for disabling hardlockup detector
      https://git.kernel.org/powerpc/c/44e5d21e6d3fd2a1fed7f0327cf72e99397e2eaf

cheers

