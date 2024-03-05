Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4418872667
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 19:15:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TIDrRuHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq3dL4Zq2z3vkq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 05:15:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TIDrRuHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.188; helo=out-188.mta1.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq3cZ5wl1z2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 05:14:36 +1100 (AEDT)
Message-ID: <6764b9c5-b61a-4f20-a41a-125d5015a3e6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709662455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4mCLjnlt6q90qUCq4m5luMROvGFxl/z1bFGYicutzgw=;
	b=TIDrRuHAB3Fwdib4sKxYLlkNs/TwItDMIceZL4vZyE4Carkes4zEYbdAlyJQ4dcCUxPpyF
	6rbx5Zlju5IHwZLJLPCTrfuGz8914F21k9UnY4jBL9g2kqJvjQCD3ROpdK7tcPjKdbpgRy
	reYNOMlidxSNyyW8Jc7aInmHfsV4vK8=
Date: Tue, 5 Mar 2024 13:14:09 -0500
MIME-Version: 1.0
Subject: Re: [RESEND2 PATCH net v4 2/2] soc: fsl: qbman: Use raw spinlock for
 cgr_lock
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20240222170749.2607485-1-sean.anderson@linux.dev>
 <20240222170749.2607485-2-sean.anderson@linux.dev>
 <53b401d7-934c-4937-ab83-6732af47668d@csgroup.eu>
 <34da1e7b-029e-410b-8735-a10d6d267e2b@linux.dev>
In-Reply-To: <34da1e7b-029e-410b-8735-a10d6d267e2b@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2/23/24 11:02, Sean Anderson wrote:
> On 2/23/24 00:38, Christophe Leroy wrote:
>> Le 22/02/2024 à 18:07, Sean Anderson a écrit :
>>> [Vous ne recevez pas souvent de courriers de sean.anderson@linux.dev. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>> 
>>> cgr_lock may be locked with interrupts already disabled by
>>> smp_call_function_single. As such, we must use a raw spinlock to avoid
>>> problems on PREEMPT_RT kernels. Although this bug has existed for a
>>> while, it was not apparent until commit ef2a8d5478b9 ("net: dpaa: Adjust
>>> queue depth on rate change") which invokes smp_call_function_single via
>>> qman_update_cgr_safe every time a link goes up or down.
>> 
>> Why a raw spinlock to avoid problems on PREEMPT_RT, can you elaborate ?
> 
> smp_call_function always runs its callback in hard IRQ context, even on
> PREEMPT_RT, where spinlocks can sleep. So we need to use raw spinlocks
> to ensure we aren't waiting on a sleeping task. See the first bug report
> for more discussion.
> 
> In the longer term it would be better to switch to some other
> abstraction.

Does this make sense to you?

--Sean

