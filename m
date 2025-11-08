Return-Path: <linuxppc-dev+bounces-13966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13263C4344F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 20:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3mkQ3vgqz3c1T;
	Sun,  9 Nov 2025 06:50:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762631438;
	cv=none; b=M+/qJz3W/Mpho1MhbtYx43kI2aqQV8lWRL71KhbBPf9dJ/F6RnneuOj3QW/xbbQwmMBXcjkc9eBCamoP3EqwiVC5HIGK0ZnXYmjSUqJyEGK2vX5JNRd5OLHpNf2RBrjZCU9kcJyyZtwY261FhMeAo3PB9JLK15CNw56bZ6MJO9otCW8z7qP6BUKX8cqA5W7zzH828wNatXgnq8/dPFmrKsOBkJ/PSVuFAIR2JD1u+AaG4YH09PFwudmyZxrud7spAtqFwTYMnBjLPrtDRoxJOTD91iA2Pi/hjAwFn5dbVEFNqL48Xtar5u2NOsGhA73Db/pK0dwuLPdsyeba/K5llA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762631438; c=relaxed/relaxed;
	bh=oiSGBMudxYMBpAR2aKoGThpZLnm9dt+ALy7MlWvzbiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ndp8RKXeBbCM2sKekivdeFaEq56hInagICcsfGL/5Svhfju3n/swYO6+5XLTGdPm4CFz5XPFFOAEr+RPug1cbNP4Nl780zHawJT4AESnekgt5e94h+a6AmiGhJonkHFBOMr6VLOW/dXP2gVYjETgQHxGNeEFvWDhMLQUmgqx6yIRH4dVUlvrsyql4E53R5jrL61i0tZnTIAAT/RZXAMftNjI+A9rzWJiOhU0yZeVk4KszooV16zSmpQfrwXjHIjLaeBg0PtAjwStdxdng56g17jN6eE0eEfqREBZtQvjYxdxh32POAeB699+SyCC5lsdjdFPi/D6aZD/1DU7HeCanQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3mkP4PFjz3btS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 06:50:36 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d3mZx13jyz9sSV;
	Sat,  8 Nov 2025 20:44:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLmBdmBkcqXZ; Sat,  8 Nov 2025 20:44:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d3mZw6qjrz9sSS;
	Sat,  8 Nov 2025 20:44:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C245E8B765;
	Sat,  8 Nov 2025 20:44:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id txhM0SZEkJy5; Sat,  8 Nov 2025 20:44:08 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D5DF8B764;
	Sat,  8 Nov 2025 20:44:08 +0100 (CET)
Message-ID: <64df8b4e-6cd4-49e4-a0f9-c8f9c017b06c@csgroup.eu>
Date: Sat, 8 Nov 2025 20:44:08 +0100
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
Subject: Re: [PATCH] soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>
References: <20251107152950.293899-1-marco.crivellari@suse.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251107152950.293899-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 07/11/2025 à 16:29, Marco Crivellari a écrit :
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
> 
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they’re needed and
> reducing noise when CPUs are isolated.
> 
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU.
> 
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

IIUC this patch is part of a wide work on workqueues. I assume the will 
go via the workqueue tree. Let me know if you want me to take it via soc 
fsl.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> ---
>   drivers/soc/fsl/qbman/qman.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 9be240999f87..6b392b3ad4b1 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -1073,7 +1073,7 @@ EXPORT_SYMBOL(qman_portal_set_iperiod);
>   
>   int qman_wq_alloc(void)
>   {
> -	qm_portal_wq = alloc_workqueue("qman_portal_wq", 0, 1);
> +	qm_portal_wq = alloc_workqueue("qman_portal_wq", WQ_PERCPU, 1);
>   	if (!qm_portal_wq)
>   		return -ENOMEM;
>   	return 0;


