Return-Path: <linuxppc-dev+bounces-3355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085539D0362
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:04:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqDg5LY4z2yD5;
	Sun, 17 Nov 2024 23:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731845059;
	cv=none; b=OSztysuQuvlF+/yoOycMh9fzG2uyMXYtSAtQTrXFkL+GDSRGzLjFrOSyKjPYqSA62o3yzgzsrUDpoFt8fwy3jjFvMywrz5gw4eD8xkrXiuBizbm+IXy/YmXqFMNEOyOmYnqFtrZU/DE0qcy539NMOC0EFy9gVQVq9jZQRxsu/buzHz5yzybbGdoxh5QZob+3/+6ecMCyS7ccI2eO6VXQBLt6JzQkKvUcXPVGDdg9ooMmOiH48SWqhfE360stXbljEoKk1d5TzOVOmZ169Lns5YYpWKuQCMvhT0Va4pQN7CSoWS7wIkF9YXCYwxHbSno+rNMAhXlamBMmlRqCbQw3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731845059; c=relaxed/relaxed;
	bh=ZjP95IJGwmeLHgHQzxXL+JxzJejZMHgkGif9iRHizLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oAm6BrnB9axbSwxQj2YBxvEJImSrCcDUUOdI1XbrgsnEljXWmWuJwnDD4diAM7T8WLxILB5+HZ10pdXmn8a4T2IAXP05bB+93d6Zj1HDTxXOffKCeosDD2wVWZ50nPs8yN92AOQZh1sMiYHAKqFDbFHMxRtzPVwxfJwUGRYaB7L3RyLemaNC/8HXiBmCaiQBB8YesXZFHdbCm8LPfAPYFn3R0SpkVoAHU7m3SeHr/MEu/lXmFEkOvTI8xPhRQC8pSEzCKEC5UoMuEDNJJzNkOumqppEHP12eL16ZL/zcI3PGyw82q//RM21VcxAoVe2OJwCCRDE29GtBm9z3SKYfbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NB4RgANg; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NB4RgANg;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqDf3hgLz2xs0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:04:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731845055;
	bh=ZjP95IJGwmeLHgHQzxXL+JxzJejZMHgkGif9iRHizLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NB4RgANg1E582fTLRZTFf1d/OmbfljMvX5BWOnX2VH6LC6sVQbfbOdqLFSzJOzCd9
	 RSrUQYQZFdnEVLERVCpwUrbdk12XQtkk/XQMrg4OtYUWu4R9RfbfznBygC1qohu3Qh
	 SnPchaAiYjGFjPMM2i9y5MhKEXsFRfIcTBSW9biurEb5KNhhl8Gb0MFUl2jfWFWSs8
	 a2AK3HyD73H5N8SgmH7dUi8EHOBlh68g0d5aXyWGSxG3dQAAx1NgChyhnzPzTVQjwn
	 Nu7RVpkEkGHmQu8pTHH/iO+eUdGnLK5QZQxXtbDqX7mQiEHF+NVkm0hi0kjdqgOD70
	 l/AJFlE20QlOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqDb1yprz4xcw;
	Sun, 17 Nov 2024 23:04:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Vaibhav Jain <vaibhav@linux.ibm.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20241028101622.741573-1-amachhiw@linux.ibm.com>
References: <20241028101622.741573-1-amachhiw@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Add Power11 capability support for Nested PAPR guests
Message-Id: <173184457525.887714.6106755723297073390.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 22:56:15 +1100
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

On Mon, 28 Oct 2024 15:46:22 +0530, Amit Machhiwal wrote:
> The Power11 architected and raw mode support in Linux was merged via [1]
> and the corresponding support in QEMU is pending in [2], which is
> currently in its V6.
> 
> Currently, booting a KVM guest inside a pseries LPAR (Logical Partition)
> on a kernel without [1] results the guest boot in a Power10
> compatibility mode (i.e., with logical PVR of Power10). However, booting
> a KVM guest on a kernel with [1] causes the following boot crash.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: Add Power11 capability support for Nested PAPR guests
      https://git.kernel.org/powerpc/c/96e266e3bcd6ed03f0be62c2fcf92bf1e3dc8a6a

cheers

