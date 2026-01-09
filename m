Return-Path: <linuxppc-dev+bounces-15449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512ED07BB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 09:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnZH53tLlz2xRv;
	Fri, 09 Jan 2026 19:11:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767946289;
	cv=none; b=eMbqupfXWdpSSIYI3ISKiWjT8HhhTGHgnx8pT8FOw3u6F4rjtmHvPtSGZsUMi/B67FyYAaI1e6ofICNIfFxMxwgjbb0+34zaQPjFGEEDsU3AkrMKpHuMtZF9oma0vqlFnrqg2wY/AFAk2qop2JTfmq/RMgfdq4YO89AYi4RFJNKUBXPKVzM9mzgVh01KkrPOLwQltUkRYVAMl98amBdtBzxM1VkLLLchonLPhk00VRiQ4sh3P7nk0wPEM0pwd8qK56SKMhHUHC+zv5u2SxVrdi0eY5PXUHyEZEoNzU/yVqY9bN0YseP/xFgZfU6t7QlSwCu6czJbhbyF3VM+0oN6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767946289; c=relaxed/relaxed;
	bh=3RKJ8Gv8NKIMzHjlt2jgSqyUkuW3mI1YDsyH7cc8bzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMnuDvED6hdQDsmowBtDEoaqKoi3UsuDI0R50Oqz2VV2jiYrgmcVgNh2O+Tj8VucwgEtSj/fuN2mpZbt8JoxMRP8dJF1nfgcYgz7Lf16uCcWudYU0cPqWR1wjAVEC+M0SRNZJDf5t01TErw8GZfAa53wi0Dcfp0OCn7fBTyeqmXCFON0h4nYm7hzZxoUsF3lnKFZhLQ1BUVfhkpIf/AsAhr4AGBgjU99IqMq2Rsg+FjNjvxW7sKfw4C0FkC/EJbhLn8IHvIl+oQBbXAZtHbwew3maiNdN1DYLgglASD7msibFob/jhKAlPGaBHwPo8fuczq9fUmPIWiJZ0/KwxbcZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S6J+quoK; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S6J+quoK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnZH44Xnsz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 19:11:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23E5B41A2F;
	Fri,  9 Jan 2026 08:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E844C4CEF1;
	Fri,  9 Jan 2026 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767946286;
	bh=Xq3UOD0XwNT7ffDnXN6V65L94VH6ol+iib+k2l0DCkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S6J+quoKf3GioEh8V6vQ7YVqM24FHWk8a4zHlYhdpMQL0IHN/Oewnesl/ww2WC9cJ
	 YQQnJRPrGCVXesJDqtrG4wn0AjCuM++ydSKX2OntJ+78tPWu7vLTQ8rP5stV9mR6oE
	 iifxjqx11Xpt2ruk8UfRsl96WGQy9mrXkU8lnM2uMg+DVZWfoKObMzr88JWmigD8pm
	 VpwE84rzfgOF+K4bgz2wvj8+ZXT89GdCWanrRroG5Ote5Jji/JdNgYKgIkzU0p4t8o
	 aUzxhi7tg6czRFpKFBa4IrCtv0qyPLiwwNfnXBfA+/E7JPmtQSuihlMDWAtycDdKv1
	 EE7oQpnR1CKvA==
Message-ID: <a42acab4-274b-4e5e-804b-bb07a26058c7@kernel.org>
Date: Fri, 9 Jan 2026 09:11:19 +0100
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
Subject: Re: [PATCH 0/1] powerpc: Fix kuap warnings
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mhiramat@kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Cc: riteshh@linux.ibm.com, linux-kernel@vger.kernel.org,
 hbathini@linux.ibm.com
References: <20260109064917.777587-1-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260109064917.777587-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/01/2026 à 07:49, Shrikanth Hegde a écrit :
> Recently stumbled upon these kuap warnings. This happens with
> preempt=full/lazy kernel with function tracing enabled. What irked
> me was kernel compilation was getting failed when i had tracing
> enabled. It doesn't fail everytime. While running stress-ng memory class
> it threw same warnings. So that helped to narrow it down.
>   
> So one possible way is to disable tracing for these enter/exit
> vmx_usercopy. That seems to fix the bug/warnings. But that will make
> them as non trace-able. If there is a better way to fix these warning while
> keeping them as trace-able, please let me know.
> 
> Anyone with insights on amr, vmx and tracing, please advise.

The main principle with KUAP is to not call subfunctions once userspace 
access enabled. There are a few exceptions like __copy_tofrom_user() 
that are allowed in order to optimise large copies. However this needs 
to be handled very carefully, and in principle we don't expect 
__copy_tofrom_user() to call other functions.

So it might require wider rework but we should narrow as much as 
possible the period during which access to userspace is opened, with 
something like:

raw_coy_to_user_power7()
{
	enter_vmx_usercopy();
	allow_write_to_user(to, n);
	ret = __copy_tofrom_user_power7();
	prevent_write_to_user(to, n);
	exit_vmx_usercopy();
	return ret;
}

raw_copy_to_user()
{
	if (cpu_has_feature(CPU_FTR_VMX_COPY))
		raw_copy_to_user_power7();

	allow_write_to_user(to, n);
	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
	prevent_write_to_user(to, n);
	return ret;
}

