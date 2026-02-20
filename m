Return-Path: <linuxppc-dev+bounces-16973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z6NSHd7el2ni9gIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:11:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E76164843
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:11:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHGxw2N88z3bZm;
	Fri, 20 Feb 2026 15:10:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771560644;
	cv=none; b=gWBr/BDNs0ckY4k+WtC/EW5jII6najkYoYGKFFjrNOq/LoD43UYrPNvWaVUD9d46UATb1pafHm7wrgb8gP2NZYONtxGwIhOehvftPA17qyxK2WR1fTd189cUxhY7AJkzycSWk7Qhsg9XD7VBm+npPtwHCLMnPnpR8Tc4gj77SN6E+wblohu/f6LUtpY1Jyq88Ejt9fOiu/bMaC3S3MbsMemORlDjARWNPgyPBztg5hIQZjSqSUCgA1qtReqR3U9pFpxVeRygHQ8lqinjcbbMb3RTjwC1UUY6fOT1X5NxpSPI65Yp00X9gGrLpOZpPVCrbAwFcxgUrqOzDDHBuo8u5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771560644; c=relaxed/relaxed;
	bh=t1i6GfbQSWWiz3DIIdRXLB6UoHfhO8cTiXogFCF4Vmc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=c4wmox35H7xa8oImwPYr6GTdhNbX5NYeAASCTrXkS5FudrU0hc1Q1nKoUbsE2IHs7ETS7s7yeMM+uzHREsr3fOMT66FhXAcDszoC026kVfy4mZn73S6E8URdxsZh7LTX/HALLCu7WSogXLNdsfv8+pZuRJ+KRIRsXgBs73qbH+4xdbqfnK1cCIs/U11j1PESFApXt0ocXx/a3n5skI1vuLuW9X0PeWwZk6Q7/lJS8KVVqW7EQSJYTlrXVQSsllnhI+pySxHmJiG3eBorSn4xPMYbgosWNCcO3TTnUKJkUEdJ6Hbssv/OmQpe5+t9+AqJVQKGeu8HzV7CjKIPk/0YnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oMaFyqG2; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oMaFyqG2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHGxv32CQz3c2R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 15:10:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5787661881;
	Fri, 20 Feb 2026 04:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D73AC19421;
	Fri, 20 Feb 2026 04:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560641;
	bh=fHDGQg8Y8I31uG+H3itYMHO1lNQuNdbaHv3s+w2VA9E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oMaFyqG2bTps/8USOYgV6sHoWWaZWkyD8fr7yLmY5l7usrVYWzQZzpzEhFrj5oIso
	 JsHHbdcmGWZfgObZBMrrGYnYu32BPlMnnVgwwSDA1ys0qiJ1qOLadxN3JSuLSdLeIV
	 tnZk2pdJNKsAWT931GvGXNP4fol0h+61TmknQ8GSGiCMQCV6UL7UDupsNR66mU84jY
	 Uf0+Fkd9Pj07dGm9AzWla0qfC5/ONLfwGajcUnLXdYT+BVuNcuJZmO6sBygjchoA7g
	 hhSIJI8pnZDmIXMjKC9Jz5/fJyymINQf46MMxuBF/t5nZ792GREhqQxlQeEORgXYm7
	 E3Z2SpOIzWr4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0853809A88;
	Fri, 20 Feb 2026 04:10:50 +0000 (UTC)
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
Subject: Re: [PATCH v5 00/21] paravirt: cleanup and reorg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156064929.189817.13253801870624912064.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:49 +0000
References: <20260105110520.21356-1-jgross@suse.com>
In-Reply-To: <20260105110520.21356-1-jgross@suse.com>
To: =?utf-8?b?SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, luto@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, peterz@infradead.org, will@kernel.org,
 boqun.feng@gmail.com, longman@redhat.com, jikos@kernel.org,
 jpoimboe@kernel.org, pawan.kumar.gupta@linux.intel.com,
 boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux@armlinux.org.uk,
 catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com,
 vkuznets@redhat.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 daniel.lezcano@linaro.org, oleg@redhat.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,lists.linux.dev,lists.ozlabs.org,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,microsoft.com,infradead.org,gmail.com,oracle.com,lists.xenproject.org,broadcom.com,armlinux.org.uk,arm.com,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linaro.org,goodmis.org,google.com,suse.de,epam.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16973-lists,linuxppc-dev=lfdr.de,linux-riscv];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:=?utf-8?b?SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:luto@kernel.org,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:peterz@infradead.org,m:will@kernel.org,m:boqun.feng@gmail.com,m:longman@redhat.com,m:jikos@kernel.org,m:jpoimboe@kernel.org,m:pawan.kumar.gupta@linux.intel.com,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:chenhuacai@kernel.org,m:kernel@xen
 0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:daniel.lezcano@linaro.org,m:oleg@redhat.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[58];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,alien8.de:email]
X-Rspamd-Queue-Id: 99E76164843
X-Rspamd-Action: no action

Hello:

This series was applied to riscv/linux.git (fixes)
by Borislav Petkov (AMD) <bp@alien8.de>:

On Mon,  5 Jan 2026 12:04:59 +0100 you wrote:
> Some cleanups and reorg of paravirt code and headers:
> 
> - The first 2 patches should be not controversial at all, as they
>   remove just some no longer needed #include and struct forward
>   declarations.
> 
> - The 3rd patch is removing CONFIG_PARAVIRT_DEBUG, which IMO has
>   no real value, as it just changes a crash to a BUG() (the stack
>   trace will basically be the same). As the maintainer of the main
>   paravirt user (Xen) I have never seen this crash/BUG() to happen.
> 
> [...]

Here is the summary with links:
  - [v5,05/21] paravirt: Remove asm/paravirt_api_clock.h
    https://git.kernel.org/riscv/c/68b10fd40d49
  - [v5,06/21] sched: Move clock related paravirt code to kernel/sched
    https://git.kernel.org/riscv/c/e6b2aa6d4004
  - [v5,10/21] riscv/paravirt: Use common code for paravirt_steal_clock()
    https://git.kernel.org/riscv/c/ee9ffcf99f07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



