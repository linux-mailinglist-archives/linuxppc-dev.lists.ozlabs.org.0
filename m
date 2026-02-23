Return-Path: <linuxppc-dev+bounces-17060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIZ3OwxcnGmzEgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:54:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B81776D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:54:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMls0N6tz2yFc;
	Tue, 24 Feb 2026 00:54:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771854856;
	cv=none; b=ZecoYwjVxmPDDAjpg/JhHN4e8J+VddTymTmmtxsNVgKdauDHjYuka041z/pU9VVtws5KOUbSdOn8LQ8zzm9IypwaVsD+Zy02m0uXpooPzgbClZPE/qRNuGEINs3dJ7wUCb8Ttl+HrlPEEa67wStFDI7/Vmoh7+maz9KlwGT5niZE2O9jBEmokzCyDxvjMU8M/R/ahPg02JJkXF1mg0kAeaxi7FNPfW1gwrSzdg/ZagUtk4rpbX/RW7Bweh5jzS8FZoo6k/D2bpQh5z3lUCQFFh2P5VNGIrgCOQ9I/YCItAKp4fDVKs8hHg16hQe/U/ZODKi2IVnvxZhKUGp4B4lpzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771854856; c=relaxed/relaxed;
	bh=TI4W58jR+3C1//PDYAuyDr0Z6iRNVdMXhQfmV3T4CNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1UanC5tQrt7qvJgArwR+0tYurYlA4l1kVbi6+ib2bIM8iElYD6GOIVlS3KV+ou8/TA3po9dxBoqsuM973HnKplD4Aj72gBOOf7n6FcdSyMAVgY/JnKt09EtxNvqI/BA2/Wdv0cZ88zPo1bibxPZIOv5GVdBPSywK06WB6lsR/I+FX9s3ch4wYzFyhmDI/9bUTcYdls1AF3fcweX7KVXsyiOtNm5BEIwZW3Nxd0wsoUvgTG7ZztMHBA6JaCQYfAE69X2n/jXGcNZY4X2s5LFgcj0+PRLEOH/xvzxduPU7aLDF3luz3ybemDCi+ZH+JQ3yUcwSXEu0vChUVgcQlBOEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jkG5vNAo; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jkG5vNAo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMlr01RXz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:54:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C2A060018;
	Mon, 23 Feb 2026 13:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A4EC19424;
	Mon, 23 Feb 2026 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771854853;
	bh=BkbVqrxwslwfCuDaT1JocKp3CNCm6IksZzE7xGY/xTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jkG5vNAooI9mXtVVkTGsqErbsf3ihx17bubrXaOQq22tESBMK+KAaN0yBwz44d13x
	 6+QUU+7VRfU4h7OQGFaHFJZRWLBnD0SkcStaAmLcanSkND5o9ypxpjpVoe+2zeQ63C
	 1SqqxtYxfF3rLYsMtMFjFxSQPypf4EBk8eemEDpq4+lsNXPjruCVgGxwUaqsrHtHKr
	 lhZgt+pZ+T4fjPiEp4I/bHP/1kNUs4Ll+UTbqANeIJP4/srbBe95/iHjwYCntGvRL/
	 gqHcS3elMXcNG1yWvyoOdQCeVESf79qfTIbJoRsZAiftw2lQoYsmJyQphs480F/1Iv
	 SEsS030xzeatA==
Message-ID: <d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
Date: Mon, 23 Feb 2026 14:54:10 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
To: Marc Zyngier <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20260218135203.2267907-1-maz@kernel.org>
 <kukzdg7cym2cwytx3zgbu5ik2cw7c2zq7irwp6q6o4jzupjzla@qgkrv7emus6f>
 <86ms0za8e0.wl-maz@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <86ms0za8e0.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17060-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 917B81776D0
X-Rspamd-Action: no action

Hi Marc,

Le 23/02/2026 à 14:37, Marc Zyngier a écrit :
> On Fri, 20 Feb 2026 15:41:03 +0000,
> Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
>>
>> On Wed, Feb 18, 2026 at 01:51:57PM +0000, Marc Zyngier wrote:
>>> Over the past few years, I have become increasingly annoyed by this
>>> sort of messages in my boot log:
>>>
>>> [    0.067861] fsl-mc MSI: ITS@0x100100040000 domain created
>>> [    0.073352] fsl-mc MSI: ITS@0x100100060000 domain created
>>> [    0.078841] fsl-mc MSI: ITS@0x100100080000 domain created
>>> [    0.084328] fsl-mc MSI: ITS@0x1001000a0000 domain created
>>> [    0.089815] fsl-mc MSI: ITS@0x1001000c0000 domain created
>>> [    0.095303] fsl-mc MSI: ITS@0x1001000e0000 domain created
>>> [    0.100792] fsl-mc MSI: ITS@0x100100100000 domain created
>>> [    0.106281] fsl-mc MSI: ITS@0x100100120000 domain created
>>>
>>> While this is useful on fsl-mc systems, this is completely irrelevant
>>> on 99.99999% of the arm64 machines, which know nothing about the
>>> Freescale stuff. Including all of my machine -- bar *one*.
>>>
>>> Global MSI domains such as the above have been obsoleted for the past
>>> two years, but nobody at NXP seems to have got the message.
>>
>> I do admit that I wasn't aware that this neeeded work. In the future,
>> please let me know of this kind of things and I will do the work.
> 
> I guess Thomas did too good a job not breaking fsl-mc when both PCI
> and platform MSIs were rewritten, hence you missing on the good stuff!
> 
>>
>>>
>>> The obvious solution is to delete some code! While my first port of
>>> call would be to just 'git rm -r drivers/bus/fsl-mc' (only kidding!),
>>> a less invasive solution is to drag that code into the present times.
>>> Which is what this series is doing by converting the whole thing to
>>> device MSI, reusing the platform MSI infrastructure instead of
>>> duplicating it.
>>>
>>> This results in the expected cleanup, and kills the last user of the
>>> non-device-MSI stuff on arm64. You're welcome.
>>
>> Thanks!
>>
>> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
>> Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> Thanks for giving it a go.

Don't know what is your merge plan. I wanted to push it to soc fsl tree 
but it doesn't apply on top of v7.0-rc1:

$ LANG= b4 shazam -l 20260218135203.2267907-1-maz@kernel.org
Grabbing thread from 
lore.kernel.org/all/20260218135203.2267907-1-maz@kernel.org/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 14 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH 1/6] fsl-mc: Remove MSI domain propagation to sub-devices
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-2-maz@kernel.org
   ✓ [PATCH 2/6] fsl_mc: Add minimal infrastructure to use platform MSI
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-3-maz@kernel.org
   ✓ [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the 
msi-parent handling
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-4-maz@kernel.org
   ✓ [PATCH 4/6] fsl_mc: Switch over to per-device platform MSI
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-5-maz@kernel.org
   ✓ [PATCH 5/6] fsl_mc: Remove legacy MSI implementation
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-6-maz@kernel.org
   ✓ [PATCH 6/6] platform-msi: Remove stale comment
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-7-maz@kernel.org
   ---
   ✓ Signed: DKIM/kernel.org
---
Total patches: 6
---
Applying: fsl-mc: Remove MSI domain propagation to sub-devices
Applying: fsl_mc: Add minimal infrastructure to use platform MSI
Applying: irqchip/gic-v3-its: Add fsl_mc device plumbing to the 
msi-parent handling
Patch failed at 0003 irqchip/gic-v3-its: Add fsl_mc device plumbing to 
the msi-parent handling
error: patch failed: drivers/irqchip/irq-gic-its-msi-parent.c:186
error: drivers/irqchip/irq-gic-its-msi-parent.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"


Let me know how you want to proceed.

Thanks
Christophe

