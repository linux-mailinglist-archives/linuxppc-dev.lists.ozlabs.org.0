Return-Path: <linuxppc-dev+bounces-359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873995B84F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 16:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqQTG3k0Vz2yfl;
	Fri, 23 Aug 2024 00:25:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724336706;
	cv=none; b=ogyzYPZn+5nwlPCLnRBqUpNf2/t6M/ppGW+e0PxGTv71m5chcO7+InoDcCd+wnIMv/EjTVg+oh/xW/DluOlSO6335Irnv0xfFq8bh81qtIOtmPN0wx5DZ/hEfM+tSx/ucRmmuosCFKwvddEU6tSG4B19avtF16BRJglifVOQ/xkC6EavhwPYTRt/6ShTYMkd40ur7tkWMyxfd8f4EfnBjh+or2EA1W2EqLrwBan1ZgS3f0ym6LXyfbY4q5We/dPJK+Z5qR3fhg9CR3ZzbCHI2mzOZsoVGlGKW8d3wmBWN9w2Qzqlvt8SpIQ/MHiTorAALRYWvXxNV9ZwRoqxjc0Qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724336706; c=relaxed/relaxed;
	bh=56r+TrXudT9voBBc524N6XW0f7CJAVNtX/eNMyF7MFo=;
	h=Received:Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-SA-Exim-Scanned; b=GmfLQxlehzx2MT6dj9PcVG5EkLsb7Hflsv6ruPy2DDaIaZKJ9JynYc9foPd3w+8ywHaWMwpdelBIAb+kPm1WhynKbyJjQQ9qsykEtnjHz1Zqx5/MbadAf+EzSYYZN4qkTPL5TOA+jtto/iZRmHpVI3xirvUVQ4FrVTSrx/7N0dY2SEgW8qRmi/CcdkGBBkTYLtKjBU8yYgdkPkCG2JAS4ORyQwbTztQJk7BMsrsd8lLUXPUTUtqsBMVFGK7hktMErHYi9TukF7o0nkrf557S0mPtNz9s+Iz4tIopfGUENPM5II+qsSp0/pAfYngQWA64H8datJEGhbtTWVfjyA0mtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzydcEVw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzydcEVw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqQTG0sskz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 00:25:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E66B6122F;
	Thu, 22 Aug 2024 14:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C97C32782;
	Thu, 22 Aug 2024 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724336702;
	bh=//vs0/j3dL5aitkeEHYmbgKTgUS1rli4/RnXiCWDaiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzydcEVwqkNhOKyJ5orBT6Sxiv1o3CueKVoCZOlKhB05hbfqLL4sRKMuFCWl3Pw6u
	 RRseBCTvZyCyCoLYr0nNUMCuPOOIVvq5vPvNsK+Sq4f9+d1ZOsnRLFCwa/7/Svz+7U
	 UnNdivfK/+izhZv/9R4l2xx7bS71Lmmcj0fMTebbQaShjAZYSIeCBaUWBYmh0HwFMH
	 h0axtuuZBYajoYjtLRupBGNS0Cz7je99YbSxJY/5mRCFAyAQefFTDdwQgGNA25wZEk
	 z2NtC8y+9AZo4jIXZD72NHp9laSWfTbJqAhMdUge6Qe1Srqq43pkpMpq2NO5+/NSVR
	 Morx7oLq2+asg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sh8kF-005yRg-MG;
	Thu, 22 Aug 2024 15:24:59 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: (subset) [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty logging
Date: Thu, 22 Aug 2024 15:24:54 +0100
Message-Id: <172433664068.3702537.15170661496841359831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726235234.228822-3-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, oliver.upton@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, seanjc@google.com, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, dmatlack@google.com, stevensd@chromium.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Fri, 26 Jul 2024 16:51:11 -0700, Sean Christopherson wrote:
> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> writing guest memory without marking the gfn as dirty in the memslot could
> result in userspace failing to migrate the updated page.  Ideally (maybe?),
> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> and presumably the only use case for copy MTE tags _to_ the guest is when
> restoring state on the target.
> 
> [...]

Applied to next, thanks!

[02/84] KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty logging
        commit: e0b7de4fd18c47ebd47ec0dd1af6503d4071b943

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



