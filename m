Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278187D0FA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 14:27:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QclXltIl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBkNp5N6Hz3vYD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 23:27:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QclXltIl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBkMz2FvLz3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 23:26:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697804783;
	bh=6eucA1hIcjauTZoFNKAzAXAXKE9v2Ut89sCYmHempMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QclXltIlXyGGi657p/iDwBH81QR1Iq3hd2y3RECoPS8AqMPR/RErtt2w4IjXNvdFS
	 BuxNLODSXwr1SZo6QBze4u8LRO5Tcrv7BrbNKQz75YSps06WZpI+zPZg3snlCCjrwD
	 jgJM0T/JxnY6UaA0HoIUdP7y/2ufp274BKAWuRePgsiyyG8g/qX2pmJCSQz20w10kA
	 Vapu+fMZNMj0nDmOe4WbCdoPUSKWMeWXwi00he23ZyAekbdflKg71CYYMe/zQA7gfz
	 YTX72jW07FtzNr5FUqOTLKtcYjkAL829RoSjltinVy+CJfz/VBKbdLd9JBPDwQrT4X
	 TR6mZiWRU048g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBkMy1x9Dz4wd5;
	Fri, 20 Oct 2023 23:26:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc: Enable generic cpu idle-loop
In-Reply-To: <20230821045928.1350893-1-vaibhav@linux.ibm.com>
References: <20230821045928.1350893-1-vaibhav@linux.ibm.com>
Date: Fri, 20 Oct 2023 23:26:21 +1100
Message-ID: <871qdp5vki.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Randy Dunlap <rdunlap@infradead.org>, "Steven
 Rostedt \(Google\)" <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vaibhav,

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> This minor patch enables config option GENERIC_IDLE_POLL_SETUP for arch
> powerpc. This should add support for kernel param 'nohlt'.
>
> Powerpc kernel also supports another kernel boot-time param called
> 'powersave' which can also be used to disable all cpu idle-states and
> forces CPU to an idle-loop similar to what cpu_idle_poll() does. Hence this
> patch  also updates the handling of 'powersave=off' kernel param to enable
> generic cpu idle-loop if its enabled.
>
> Signed-off-by: Vaibhav Jain<vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> Since v1:
> https://lore.kernel.org/all/20230818050739.827851-1-vaibhav@linux.ibm.com
> * Updated powersave_off() to enable generic cpu idle-loop if
> 'powersave=off' kernel arg is given. [Mpe]
> * Update patch description

I had already merged the v1 when I saw this, and ...

> diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
> index b1c0418b25c8..7367a0698459 100644
> --- a/arch/powerpc/kernel/idle.c
> +++ b/arch/powerpc/kernel/idle.c
> @@ -35,6 +36,8 @@ EXPORT_SYMBOL(cpuidle_disable);
>  
>  static int __init powersave_off(char *arg)
>  {
> +	/* Use generic idle loop if thats available */
> +	cpu_idle_poll_ctrl(true);
>  	ppc_md.power_save = NULL;
>  	cpuidle_disable = IDLE_POWERSAVE_OFF;
>  	return 1;

The hope here would be that we could remove the need for cpuidle_disable.

cheers
