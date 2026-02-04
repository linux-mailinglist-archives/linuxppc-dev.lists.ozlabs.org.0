Return-Path: <linuxppc-dev+bounces-16563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBmPG+CPgmkMWQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 01:16:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8125BDFF72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 01:16:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5LW065LBz2yFm;
	Wed, 04 Feb 2026 11:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770164188;
	cv=none; b=GU+Iq0G02sxX5F0QTNZK48TDAKOqOpq61WlqX51rjDXe33aoHOIJ/rho8hkwJlEfdjCv9QnoZEgfkti3cqB5DMqwOHF/sZyjNtPvco7ET7HUmg6SAs/ZSVK75HK3S7IvI9FaTdp3dLpLlPRjGXWFba1duCOzwi2ztNfalXhqI4p1HASg76bgyJh8VMJ0uMHKgvgMd1KOkzZsgOFVE1RVU9y/Tib+mI6XVGPTS6wBWWYw0tikmhmz5D38d7lzh6dPp+KdmAmsOFryTDUbzhtAzSyBaRo1PRHg1ZvrCTwYNmAuOHkn5MbY4ck5PF+zNVGYQ6DoWOLEf/8HjV+41+dp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770164188; c=relaxed/relaxed;
	bh=p0H2jOeYOiJWZo8ZOwPODjh9sLKY1KfNTp8+M/GopXw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WlHzCpk/ZhmMu3HIGv5qrVsS8+YIg+7Olx4buW12lsPL+iAIqwctIMlV62Z1uTjpB/fWy/lqF3kEj6LGIKCgQfc1FB6qCFMWFJBDeNptIgO7K6zb0PVnR/Qn0qFVHE3T7Ior7mAc+g3XXI1q2lkG5fvCPKrPIUBpnXrdimVlsI6F2DRwdzVkrKwubKPBACo3R1LBeIY26uNudRvfe9z5JRH2D0SEJTu+6i9ISaEpPAgXD20jXsoP0ndF8h/JGQ1DOv4Y48KUJbnJDFHPG09/qrDmWpmXA1h7bQHsWtWfgSaNSu+mbhvhjNh2vecq8umBT/mVan4hSxjA6OACKUwwhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=im/Shf9V; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=im/Shf9V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5LW012Vfz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 11:16:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14170442B9;
	Wed,  4 Feb 2026 00:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFE0C116D0;
	Wed,  4 Feb 2026 00:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770164184;
	bh=K80kjauj3gB7Jo17QjyW9fAJg5bQlHqWL+gHT3QaFro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=im/Shf9VnRED7e3BqjPU7hhTcrS51pSwo3vFZMKdMyEGkCCwShiX/ao9QZJgFak7H
	 DktQyuLhHypAfvQegTSwPDBexF1MvC3EUx92ZHwnLYxTUtdoHzfs+ZPK0yafYujAh7
	 OS8k1D38dK2XlihAsNaYQAj9kWB1txpfXCPs0KkrDWL5L2gd+9N32bU0a3815IP2XV
	 bdd2RRBENSuiaS37s8tHvUOwis5pT1RqLN0Z0GqSGwC9/pBILXek+K+PP9PXzuC5cb
	 /qopjQBBWJfwZpGTjP94qEiCG47OB9MOHmHVwhbolUOlTeHapsdUSz1YVy6uxFt+3l
	 /E37sJhwCuWCg==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <chleroy@kernel.org>
In-Reply-To: <20251123.131330.407910684435629198.rene@exactco.de>
References: <20251123.131330.407910684435629198.rene@exactco.de>
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
Message-Id: <177016418333.1146354.10778952252153726089.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 17:16:23 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16563-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:rene@exactco.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8125BDFF72
X-Rspamd-Action: no action

On Sun, 23 Nov 2025 13:13:30 +0100, René Rebe wrote:
> Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> save/restore symbols, that the linker generates on demand into the
> .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> too. They are needed for the amdgpu in-kernel floating point support.
> 
> MODPOST Module.symvers
> ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> WARNING: modpost: suppressed 56 unresolved symbol warnings because there were too many)
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] modpost: Amend ppc64 save/restfpr symnames for -Os build
      https://git.kernel.org/kbuild/c/3cd9763ce4ad9

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


