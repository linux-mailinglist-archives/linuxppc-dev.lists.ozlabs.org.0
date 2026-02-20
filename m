Return-Path: <linuxppc-dev+bounces-16970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U5qsAcPel2ne9gIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:10:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB3164802
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:10:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHGxm0GlZz30N8;
	Fri, 20 Feb 2026 15:10:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771560635;
	cv=none; b=Z51Z1mlpfhneKBoO5raBvuFbhoxwtLHndOgvlGFvO1wQU9du0LROYOgXBkdFopfFzQ14MJ21qGjMXNnagpZ+fUfF7VvaD5dY42dAVLrvUNYLugHBkN3sQdRcURGoXjcvU3s9/1B7KSpbpq9fUWKE2ZCyCCNTyrYKajLzB0v+PVCL1A0Eld5cxjadfb9D2xdJaFOQu9UeinbVdbEGYrhaj9yN10n6Zbv5k5/srSIDMMJUUFVbBLIAB365ZFIx0QIIerZrOp84QOPWg6Hp1595AIBTfBA6nosMZ8FtasscKVxzVPDQSLnMk0coxfdP3kVUTzkM5CBcq2imp7gcvQqaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771560635; c=relaxed/relaxed;
	bh=+lIbcH5Y6ppMkjZWCcGOjPUA1wqNzOGW2WNhb6YeioQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PW9wVX57kNv6RZP9JOCAJb2wQfksVf8QgJdkJh4AYnWha/kSkeNf7IXaZairXXnV8Q2b3rB1U3MyeD3WB+NkvVKLzctt7aVLC+lDWPhDPO1G8ByNPfo/F7Dyu9z7rL9J17FANGyEfsX1KWtJKli5SmCin4Renxtj5hotRwEj4sk7KuZ2CDJXu79EdsbZlrQFkiNj9hEDhiQQZIKCbh/Gm/4oME5vewoVd1XQ5esayykeOnbrYju2g0VtdPu9ZqMXw8i9hA6oCwMfocdxHc+xpu9mBDK7UfAk0VqNMU7RkyVsHR7LFDYFiaECJOuTwDIh788YlGaGWvNAIyJ8rdgszQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bAm4gV2c; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bAm4gV2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHGxl22Jvz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 15:10:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D92A961856;
	Fri, 20 Feb 2026 04:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05E8C2BC9E;
	Fri, 20 Feb 2026 04:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560632;
	bh=72mBwftCl+P66JkWk2D3tPM6F5W5fqiLlxhFDPCaeZk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bAm4gV2cKvjN5GuYeDqOqnWaOQJnwWiubm5cPxzG0b1Sls51+3jb0M5jPJ1+SGZTp
	 BNMGuKF+rHUZyZkSemcZ7VP/pg7JHj2ZcfuVFKpEER40qLLDnHc+EVOwAimnPx17DQ
	 /jDJhzaTZP/JOxp36YKfDTewflsvr8lV3YbUHfUAOw4uyWsvqfoKgWsWEaQXJWPeS0
	 7yQWORIx1F33RSW37fCo4RiS84fyL5mrOB1bDmofqalUb0Xx4bXIumnN+Z2lzvlWAZ
	 8a+Io+IXkFA3DZOs/NEEJxN4KV44owP83FsMWAyt+2OmNLolEZfWlAR2gjA0OmJimN
	 kkoQWYIwgr7TQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD913809A88;
	Fri, 20 Feb 2026 04:10:42 +0000 (UTC)
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
Subject: Re: [PATCH v4 0/4] PCI/MSI: Generalize no_64bit_msi into
 msi_addr_mask
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156064078.189817.10457864568127488431.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:40 +0000
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
In-Reply-To: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bhelgaas@google.com, perex@perex.cz,
 tiwai@suse.com, brett.creeley@amd.com, gaohan@iscas.ac.cn, tglx@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, sophgo@lists.linux.dev, tiwai@suse.de
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16970-lists,linuxppc-dev=lfdr.de,linux-riscv];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com,iscas.ac.cn,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,suse.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:wangruikang@iscas.ac.cn,m:linux-riscv@lists.infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:brett.creeley@amd.com,m:gaohan@iscas.ac.cn,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sophgo@lists.linux.dev,m:tiwai@suse.de,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C4EB3164802
X-Rspamd-Action: no action

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Thu, 29 Jan 2026 09:56:05 +0800 you wrote:
> The Sophgo SG2042 is a cursed machine in more ways than one.
> 
> The one way relevant to this patch series is that its PCIe controller
> has neither INTx nor a low-address MSI doorbell wired up. Instead, the
> only usable MSI doorbell is a SoC one at 0x7030010300, which is above
> the 32-bit limit.
> 
> [...]

Here is the summary with links:
  - [v4,1/4] PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
    https://git.kernel.org/riscv/c/386ced19e9a3
  - [v4,2/4] PCI/MSI: Check msi_addr_mask in msi_verify_entries()
    https://git.kernel.org/riscv/c/52f0d862f595
  - [v4,3/4] drm/radeon: Raise msi_addr_mask to dma_bits
    https://git.kernel.org/riscv/c/617562bbe12d
  - [v4,4/4] ALSA: hda/intel: Raise msi_addr_mask to dma_bits
    https://git.kernel.org/riscv/c/cb9b6f9d2be6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



