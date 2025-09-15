Return-Path: <linuxppc-dev+bounces-12205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50900B5763A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:26:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLmL6JB4z3dDt;
	Mon, 15 Sep 2025 20:26:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757931986;
	cv=none; b=m8t2miyDoFE2vRai/ZWwVL9dbsaJBrK6V4lWKWeO3IuEW52GQuTdwNa0Ss/8A165IvIKA8D39MO0sofjrUZR5nOlLymLILfcEyjncFiXqEcH4TwvCCF+N2vgZ2huSmN+3dMkp9s2Q9+Kq+dDPsfrHJ7IC+brdHZZq1bnI1yARsuHnIzydN41LbmadbW2qbnRq7LqX2jr+/L3LnDGLsaOoDXDZEpqOdQZEP51xQshklidoKO2Qacs9qnCMbulXl6HK7uREYOiDrltloZGhN3aMDqjeAYWxWiTPTZzT2Wdz2HJh/0SyL+Hd/6vAdiVE6dboq4huh3dTbOhhy+a7JfKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757931986; c=relaxed/relaxed;
	bh=CKxQ9Zbiu2HbqrpEVVMM/Eze1Sv6cl4+SveKjM+gMuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxTqHpZPR/0iRaGXsg4lnOvhWux8eDq9iiDlEcszMULBz3WJEqzSGK7i31X4WFPQZ8m9qfFdy90de+VXldfRKT2F6s3KSzsV9SaH/utAm7yRI3mypVL4vAs6ODLbPMTtSTJRx/QLExhGSNSdhx6PfvjXIZjZ2Z6BtRYoERlBYaF0tWCrdr43EIZHF/D4fKtQ8tNlvPoD744TQ7LfYGy7LYW0ui9BzFj0MNjtcHIzctZXkFEBeznlYyLOBeWgXRam1xfIBXGL++vmlA9XUN+FJqLWjo29SOqDZuJlF5LZtQTr4yXk9wmiNoT0tNvqNzj8PcgGBrLZGp2E5og9S3v07A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNyFUUmx; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNyFUUmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLmK3ckYz3dC2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:26:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C93FB60191;
	Mon, 15 Sep 2025 10:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E93C4CEF1;
	Mon, 15 Sep 2025 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757931981;
	bh=/GA8So/quCuLTr9QEGQoMQkvU9cZpTBXsq2hU/dRsAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNyFUUmxsay8Xe80G3PwmO50o8SPg6bcgSXGyjEpoPB6nPxzzYITcaAfUyr1UIaP6
	 NJXhjswDhHZr28LOg6OFFZQPHoqCsvwyZc+n/s8hq0cnxjrYG7VUGwdz1kpvCgcZ+A
	 wZjuW5Qj+3o39n1mxADRBkx/58mJHHO/TvLEGUriCQGUrNEK3FUzDGh7nVi8ABvhvS
	 ewNHqRp6wu91cadk4bPAO3pvVcsaLKJEe9/k9EZ3OBcjz0RM0bgZ21dgADQQ4WPNTf
	 lUX0QXAgnc0KoAm7b9etN61a2K3lMQGaMS5Bil50i5ju5pPGmdGDs6vsqdzlAW1rut
	 toNe1DHOAV1dQ==
Date: Mon, 15 Sep 2025 11:26:09 +0100
From: Will Deacon <will@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, kees@kernel.org, masahiroy@kernel.org,
	aliceryhl@google.com, ojeda@kernel.org,
	thomas.weissschuh@linutronix.de, xur@google.com,
	ruanjinjie@huawei.com, gshan@redhat.com, maz@kernel.org,
	suzuki.poulose@arm.com, zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com, dianders@chromium.org,
	gautam@linux.ibm.com, arnd@arndb.de, zhao.xichao@vivo.com,
	rppt@kernel.org, lihuafei1@huawei.com, coxu@redhat.com,
	jpoimboe@kernel.org, yaozhenguo1@gmail.com,
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org,
	wangjinchao600@gmail.com, yury.norov@gmail.com,
	thorsten.blum@linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] watchdog: remove HARDLOCKUP_DETECTOR_PERF
Message-ID: <aMfpwYPX6_i6ROOY@willie-the-truck>
References: <20250915035355.10846-1-cuiyunhui@bytedance.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915035355.10846-1-cuiyunhui@bytedance.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 11:53:55AM +0800, Yunhui Cui wrote:
> There are currently two hard lockup detector implementations:
> HARDLOCKUP_DETECTOR_PERF (perf-based) and HARDLOCKUP_DETECTOR_BUDDY
> (buddy-based). When enabling the hardlockup feature on new arch
> (e.g., RISC-V), ambiguity arises regarding which detector to choose.
> 
> From the community discussion (see link below [1]), the buddy approach is
> preferred. So remove the HARDLOCKUP_DETECTOR_PERF implementation.
> 
> Link: https://lore.kernel.org/all/CAD=FV=WWUiCi6bZCs_gseFpDDWNkuJMoL6XCftEo6W7q6jRCkg@mail.gmail.com/ [1]

This is a link to a thread containing two messages, so I think it's a
little premature to say whether one driver is preferred over the other.

> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/Kconfig                     |  14 --
>  arch/arm64/Kconfig               |   3 -
>  arch/arm64/kernel/Makefile       |   1 -
>  arch/arm64/kernel/watchdog_hld.c |  94 ----------

The main reason we used HARDLOCKUP_DETECTOR_PERF on arm64 is because we
can use interrupt priorities to treat the PMU overflow interrupt like
an NMI, meaning that even if CPUs get wedged with irqs disabled then
we're still able to trigger the watchdog reset.

How does HARDLOCKUP_DETECTOR_BUDDY achieve that? From my cursory glance
at the code, it just looks to be using an hrtimer.

/me looks back at the "discussion" cited in the commit message:

  | If all CPUs are hard locked up at the same time the buddy system
  | can't detect it.

Ok, so why is that limitation acceptable? It looks to me like you're
removing useful functionality.

Will

