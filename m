Return-Path: <linuxppc-dev+bounces-16288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEkrD+/rdmldYwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 05:22:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1083D7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 05:22:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dzwNT3T25z2yGM;
	Mon, 26 Jan 2026 15:22:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769401321;
	cv=none; b=GKHLyTpn7ONtQGO7Z6ZaE671tNXuBVzH1sMQKvkBLGz54NJz3zjc2X4iwjwaOmzFt3xyn9XUqCrBVkWe1N+aScZ5/BvxY5V++Jn1FBPTAAiwvv3wYM1dhzWbxGPqDrli54kRWt0xJVmokSgg2JAI7iyPJRF6JMHqiIlFLr6/Wyg/nZyWD8em10RNqCH4wONswe5eflO8dVS/AV/HK97vIkmzmGnXs6/7q6/ZUNFQkvAOFWiw6qX+UOOQGQIu3Oax722poCtuBSeit/Bnsk16pn+YbV+S3CASQf/qkvDVe7T2pINpy/nsA8r0Pxv6a2zaeTseTbv6oQNz8f4YA8MwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769401321; c=relaxed/relaxed;
	bh=sLUqjxXZv7lWAxSUjPYCz/KXL/xFyVEfhNPKReA43tI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kv8r+VST496oEej73nbZ3Ljar+99aOw6Xvt28OZLGo3eqrZEysiYrAV0Ze8IrhYUScsDvSZhCq2Vds85s9hHbNRNKtc+a9ZFw5y/iZt1hYYNcbZU5+ZqmrW47BifNpIt1QO5pCyDjaNow7q2UnPNcYNwPFbYjUgO59zs4cNfoAacII9yMJ1pUoJkKwqy7eZwBi1RUMHa8oDsKaYq3juFiFpsNzv9DKOrBXXqRVJklEQCLXOdh7OHaclKyCHz+9xDLsmKh97t0OjR1OqWtFIVHuo7E6/ESJDV258/0RQ1kkzXAFvguzpslqIGls238rk43NJYTP6KR3QnSpiGYdVtuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mx3khty3; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mx3khty3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dzwNS27kgz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jan 2026 15:22:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38FED44180;
	Mon, 26 Jan 2026 04:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163A3C116C6;
	Mon, 26 Jan 2026 04:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401318;
	bh=u2mZjtT2ef63nBRxN806PtRnf8Sp48BSpzrnucxNvLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mx3khty3+dTGClMOSsm4TCGURDjhMxIJ6Hr1bO+Hbm7pIDDMRiqqUI60/PSBokAlS
	 XDKfB/qj+L3xyJ2qvyINgs0wD1pWn95s+Rkn2LpKpDZVb3Qm6E11lRb6+gmxfXX2fp
	 Y0puJp0SfTExJAn/+KhCOy5Bb/Cb4Wib65mAZItqOyzuEp0PMSk2hQ9F8YHBPAhLUl
	 4OkRVSJbQNM9okPoSdnbRH4h5yxkAZi8MRJuUoppDD2ti/3VZX6AQcX0/6q4RJB+hX
	 BoyEqXvgV5dn4f1qXwsNoEWqJw9JT7awjVq+tpfrUMGLV8dNWUCboeRZP7SRPsDOMP
	 iCanGpQICOKlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11B303809A22;
	Mon, 26 Jan 2026 04:21:54 +0000 (UTC)
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are
 unsupported
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176940131284.4057692.12950572087692218599.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:21:52 +0000
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
In-Reply-To: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, bp@alien8.de, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, mingo@redhat.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 muchun.song@linux.dev, osalvador@suse.de, tglx@linutronix.de,
 gor@linux.ibm.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org, david@kernel.org,
 ritesh.list@gmail.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16288-lists,linuxppc-dev=lfdr.de,linux-riscv];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,linux-foundation.org,alien8.de,csgroup.eu,linux.ibm.com,redhat.com,ellerman.id.au,linux.dev,suse.de,linutronix.de,kvack.org,lists.ozlabs.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:bp@alien8.de,m:christophe.leroy@csgroup.eu,m:hca@linux.ibm.com,m:mingo@redhat.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:muchun.song@linux.dev,m:osalvador@suse.de,m:tglx@linutronix.de,m:gor@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:david@kernel.org,m:ritesh.list@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: ACA1083D7F
X-Rspamd-Action: no action

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 24 Dec 2025 17:25:24 +0530 you wrote:
> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
> 
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
> 
> [...]

Here is the summary with links:
  - [v7] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
    https://git.kernel.org/riscv/c/b02019169284

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



