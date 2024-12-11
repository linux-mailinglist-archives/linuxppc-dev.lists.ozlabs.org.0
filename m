Return-Path: <linuxppc-dev+bounces-4004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7249ED9CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 23:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7r355bXyz3041;
	Thu, 12 Dec 2024 09:33:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733956385;
	cv=none; b=CYDvImYZMADTks0rsevKQz3rrvH71oMq/hhnXgrJxLHy9md4/jj/n5Kkh683Me4e/q7RNYnShhiIderzi94s/T6juVI7SgQ/qFHSFnjxR1i1a85KC55+L/sDOwLs+xnMkub6azqhTICAy/pj8JRwnCcSwjPKXgjHDSYWqqalv5Zlogx3Do0symRcMEAvLe9gYBgMas1PONuPSfglFtoqnhClMF6lqppoOsKXvkQX18dcnVJ3eC9F7PzdkeJSXTrm7U2XVqc1F0oz+mkWgJ7TL2A4QxIdlLp2IIvpl7D4sOVpdpEfoCloN+cPqkvCWp7rJTDpsw1IJ596AdVFnmfkxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733956385; c=relaxed/relaxed;
	bh=wlgFLZ47hG/y4Rhe4mnhOq6ghFkX9AQ6jE3MadmcnSg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n1myDhZJ7heWksIv851f299otEfVRLncLanKRkpGCf/nC7AMikH6pu3zxAYub+Kw3vVGhKJK0Wexes3nKeNZfgPfQzzvDmUZxRoLQoJXimUH1EqpXMFn6NqZk4Oy8+uB8KHMhHNklkgw2INgL+/sOaO9fTwnsgmarUaHxPQpGUSPwUwXqXzRNpAOmUIAyv9vDt6NfhwxWO9wnz/ekKgWFfj7qbxaxynv/ERfsC2czAOWnop/NDfv7ONwhTAOtYYcJUuue1uA+ibXeERoJ4jUB7tphUp2EqpQEm23sSbDIOVJb09YLjfTbuBeQ+HsE4xP3W235NI6km2PeMCcRIRqIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nWKDnM8z; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nWKDnM8z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7r345TlWz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 09:33:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4C0CA41B16;
	Wed, 11 Dec 2024 22:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92BFC4CED2;
	Wed, 11 Dec 2024 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956381;
	bh=22J+gOpjU9cUBjJTCfbYoXOQOQ02vFL/kmDAmitv0Oc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nWKDnM8zbcIF2djxC8fiOIOI3aUWr7TPAJCWU7ymE3mh5w2HYnJyAIXKcD5Z/72Ik
	 RXR4O9F/aU40PoBXvJ7XQXthLV2s4bsqOgfr50SDKFPRdnN9Us4sRkg4wVPA1v1sWs
	 kmuwkRDqP/9t5kMphxqk619d2ax7wRCqOpRNHKzjgvwJVCBNZYsBwGByJZh6bRNViD
	 yrqc1wHdhtHkBz1Bsd0sAtAVRFHXuN3A8nyxlLFqzm4TGzLspNaCqc2nuGjGhk5Ngr
	 pRCorRCtj+x28DI2Z1vxcZ2g3p4dEWd2sTvDRfb/s5xPU/4+C8mw0GfDgU2OE3HHnZ
	 3Ww2yKRibpabg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACB2380A965;
	Wed, 11 Dec 2024 22:33:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] ftrace: Make ftrace_regs abstract and consolidate code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395639774.1729195.5975449690225774291.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:17 +0000
References: <20241008230527.674939311@goodmis.org>
In-Reply-To: <20241008230527.674939311@goodmis.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mark.rutland@arm.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
 mingo@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Tue, 08 Oct 2024 19:05:27 -0400 you wrote:
> This is based on:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/
>      ftrace/for-next
> 
> ftrace_regs was created to hold registers that store information to save
> function parameters, return value and stack. Since it is a subset of
> pt_regs, it should only be used by its accessor functions. But because
> pt_regs can easily be taken from ftrace_regs (on most archs), it is
> tempting to use it directly. But when running on other architectures, it
> may fail to build or worse, build but crash the kernel!
> 
> [...]

Here is the summary with links:
  - [v2,1/2] ftrace: Make ftrace_regs abstract from direct use
    https://git.kernel.org/riscv/c/7888af4166d4
  - [v2,2/2] ftrace: Consolidate ftrace_regs accessor functions for archs using pt_regs
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



