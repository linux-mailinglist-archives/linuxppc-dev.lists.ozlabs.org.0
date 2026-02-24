Return-Path: <linuxppc-dev+bounces-17089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP1DIc5KnWmhOQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 07:53:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8721828CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 07:53:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKpMG1PRKz3cGf;
	Tue, 24 Feb 2026 17:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771915978;
	cv=none; b=AqRCfESrAGARMaHkMw8rPBUGRwHiACVZi4TTAX6BlP36rHvD+V9pg2ZfkP6QdNuRy50lysBzOy1h6zXBqHAgEHebl/Ik0xYY+0vIv8qVvUtiksLVr/Cavt69RShREId5j4QdLELUZ66rTAnkwm/LmJwUuGDA02Bma9//KbTgoA13XobvRgHfHmiYjT5MbYnbPY7yTDd5osBs/V4K3yGm5xKewuiI/fXrzQRhNGnXAb3m/G5pv0S+oLARNbnZYrC1BUqS5ySK5OiIqFsujysh3551I2hMiM7Z2qGuwMQCuUSq/xcTU1Hdmy7wnjfd7uyIriLJmqRjXqA7QEBhjeKa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771915978; c=relaxed/relaxed;
	bh=yodi5QudEP1UO/eSIBA4j6uIKhLhBFgpzekv80+iugE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LM7Pxs9bNNVeWEmeZXpoQamkAtwkCZJstm8uXBvO+qAXovFSTQ7nJ16+mrVrA+su8Ftslq3zMKeyL1vHa2qjn9M0LHAfz7lhB4EFqdiUhWwGfGasy4XeTcJqpBwINTI9zq2TDZyGavjPCG/syfYSwUq4i6wWf+vjJfLDs49AGlRZarvZyV598+0tDyup7gHma53n6jcjHsZh/9TvUqHpFexk4WlEDErd+9lk9D/Rx/s+E3obVvNhlu8QYh+pVLY8/8wPPpvyl77qC6EjvhMib224KPqHHNO53usjxF3qY1AzPJRpIXKGjQRJgeHdUewteUGnk0J4F2tFlTpFv540/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qc5YGYUS; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qc5YGYUS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKpMD5z60z3cFM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 17:52:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D6DD4443E;
	Tue, 24 Feb 2026 06:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE8BC19424;
	Tue, 24 Feb 2026 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771915973;
	bh=aCu4SGTZ0u7PvY1QpTVV6+nX9QunCxrpSU1ytfQX0wQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qc5YGYUStAEoFm4R/vACZO7CmlUB7OtzCPVDthis/63rdRkb0x36arLCbf1FceUCa
	 KVb/9qRT5em4Qff50w0RGtmUbJziREpp596TVFs3LX1gEzGtPBpsyUELFU1LVH57Bq
	 AlHYyRRD2UMKv/N5a0xaPtPQdMiK1WFk9M7q9vXqBXyAO7T3GPitiRHBSCpiqDMbse
	 Bohia8HTR4/BE9qqYPwT73K8CTFXeAopfCPME3bphaKGUMcnKnX2Gy0Y9djGry7c5f
	 Z85mGC1xF9cfUYHIwRqPTt9IsnmAVwvWA0A/7lnb9iTRVdODW4LVKM6h3HUCF4ABvD
	 orCXkQBMpU7Fw==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to
 the msi-parent handling
In-Reply-To: <86o6lfa936.wl-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <20260218135203.2267907-4-maz@kernel.org> <87seasv11z.ffs@tglx>
 <86qzqbal69.wl-maz@kernel.org> <87pl5vvchx.ffs@tglx>
 <86o6lfa936.wl-maz@kernel.org>
Date: Tue, 24 Feb 2026 07:52:49 +0100
Message-ID: <87jyw2vdj2.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.79 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17089-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3E8721828CE
X-Rspamd-Action: no action

On Mon, Feb 23 2026 at 13:22, Marc Zyngier wrote:
> On Mon, 23 Feb 2026 13:02:50 +0000,
> Thomas Gleixner <tglx@kernel.org> wrote:
>> 
>> On Mon, Feb 23 2026 at 09:01, Marc Zyngier wrote:
>> > On Sun, 22 Feb 2026 22:57:44 +0000,
>> > Thomas Gleixner <tglx@kernel.org> wrote:
>> >> This rejects as you are building against an unmerged change (I assume
>> >> it's Lorenzos GIC5 stuff). I can fix it up when applying.
>> >
>> > That was against vanilla 6.19. I'll rebase on -rc1 to satisfy myself
>> > that this is still doing the right thing after the ACPI crap fest, and
>> > repost the result.
>> 
>> Ah. The other way round :)
>> 
>> My resolution is simple and it looks about right. Please note the
>> cosmetic changes I did on the way :)
>
> Yup, looks good to me. And yes, moving the include up is the right
> thing to do.
>
> I have another small change in my current stack that also drops
> DOMAIN_BUS_FSL_MC_MSI from include/linux/irqdomain_defs.h. Could be
> folded into patch #5.

Just resend the pile.

