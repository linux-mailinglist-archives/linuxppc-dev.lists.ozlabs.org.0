Return-Path: <linuxppc-dev+bounces-17149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDliCOuhnmlPWgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 08:16:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A1193292
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 08:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLQrQ2fL8z3dL8;
	Wed, 25 Feb 2026 18:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772003814;
	cv=none; b=eEtQeFZ6OO76mZSuJxzC/bFqpiscKWVpO1TuzAjU9DOq3tk4XQ1+yAEun70M00ros8eeUqIqGJHqLw5H1Xm2+0YirMDXh7aA8gco3eJ2hb7Qrjqd9A5XMKF565P+yVDscPUzwCvGHu2WZzTn3otxEZ10FurHhtgyFetT4RNiU1fBfVqYduHjDNbnR92a28GAMGzv14Cvad3njUCt2gDAuhUfJU3fj+becvYcamjZ+iJC2c/TPYSSPDLpXra4UrEb77hAizSSlnwG493WLPgPJq5Gn0wekMepbYiWKmCjuiC0RCOpN5UFskVIGVXSMViS6n1dGF9QXhYkcchiGymGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772003814; c=relaxed/relaxed;
	bh=/6cw0Akl2Q2J+TmRORRg0/zCSbR/V64Kmi8Q7m/9ttk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vpl0UAI2JI+dGwJb+oDoXWrJSX2waax+O3bz5aPSD1XWA4BiDU1NBA8MdhmvR/U039fOyQmxn79CTIhD4mwFi4EGB++4SNP2QCVWGpejBt76lEz/ytdY2s3n0cVDechlVWTIy7tuVi6RC1NQeXCYUpOJJjE5rcYLF6wrpQKIamH+k3yJt8PwH5Y4MmR01YSekxdwp2O6i58A1C2k9l7GjgRvXyu7nwX+ec99xRXHugsqCSTuijDoet5kume3ljO9uSTG8Muj9CuOaLwPzDIWutwvW2giJX2nhNKzjYUSi1XkgJbik3nlULUtRVClnz5bFvaS05Xz1abjGfbMfARylw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HhGHbd6J; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HhGHbd6J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLQrP3j1zz3d8d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 18:16:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC1E060051;
	Wed, 25 Feb 2026 07:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC70C116D0;
	Wed, 25 Feb 2026 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772003810;
	bh=0VoyvgVLV83OpwaPy00QzkStcLMj9l0dy7bXC5TxxWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HhGHbd6JJH07IUaYX046Ao6B9dcliOfhUr1xO4B9pi4R9bqN/800FOrs8kWtviVaW
	 EJSoKix0cJj7MQfzNR0CLmBs8XAQ66BNJga4ZmUrRV6bKiK+NyfbvowfNf5zZpnnOV
	 k6olCvKiYPjiWNDrXDa4ZYkeg+E6Fz3cBr1aflSx1LwWFmAxdbDU7qs36hf65VJxwQ
	 ylR+vpwFMTeKAZpsgVktRwO3sAEd6pT8GX9lo0su6IuyFQhgA5yH+q2KsnjjHzrBtK
	 CLr9P/MWNTm654jQZA31gBpE9XHiW80KLRwPO5eFbXQXv2dLs7MFudwdRhmz+Hs1KE
	 XKWxpZ08z2PLw==
Message-ID: <1c9b879a-7907-4849-a416-5df3db5617d6@kernel.org>
Date: Wed, 25 Feb 2026 08:16:46 +0100
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
Subject: Re: [Linux PPC] Disable PREEMPT
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <e425cd24-e19a-3860-aad2-11e91af8323f@xenosoft.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <e425cd24-e19a-3860-aad2-11e91af8323f@xenosoft.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17149-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:peterz@infradead.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4C0A1193292
X-Rspamd-Action: no action

+Peter

Hi Christian,

Le 25/02/2026 à 06:54, Christian Zigotzky a écrit :
> Hello,
> 
> We were previously able to disable PREEMPT in the kernel configuration, 
> but the latest kernels now enable it by default and it is no longer 
> possible to disable it.
> 
> Is it possible to let us decide whether to activate PREEMPT or not?

Can you give more details on why you want to be able to deactivate PREEMPT ?

Read https://github.com/torvalds/linux/commit/7dadeaa6e851e


> 
> Currently we use the following revert patch for our non-preempt kernels.
> 
> --- a/kernel/Kconfig.preempt    2026-02-14 10:06:32.000000000 +0000
> +++ b/kernel/Kconfig.preempt    2026-02-08 21:03:27.000000000 +0000
> @@ -16,13 +16,11 @@ config ARCH_HAS_PREEMPT_LAZY
> 
>   choice
>       prompt "Preemption Model"
> -    default PREEMPT_LAZY if ARCH_HAS_PREEMPT_LAZY
>       default PREEMPT_NONE
> 
>   config PREEMPT_NONE
>       bool "No Forced Preemption (Server)"
>       depends on !PREEMPT_RT
> -    depends on ARCH_NO_PREEMPT
>       select PREEMPT_NONE_BUILD if !PREEMPT_DYNAMIC
>       help
>         This is the traditional Linux preemption model, geared towards
> @@ -37,7 +35,6 @@ config PREEMPT_NONE
> 
>   config PREEMPT_VOLUNTARY
>       bool "Voluntary Kernel Preemption (Desktop)"
> -    depends on !ARCH_HAS_PREEMPT_LAZY
>       depends on !ARCH_NO_PREEMPT
>       depends on !PREEMPT_RT
>       select PREEMPT_VOLUNTARY_BUILD if !PREEMPT_DYNAMIC
> 
> ---
> 
> Thanks in advance,
> 
> Christian
> 


