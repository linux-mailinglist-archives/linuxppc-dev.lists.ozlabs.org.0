Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41295321EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 06:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6gw84xMhz3bly
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 14:20:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qBxvcXQA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6gvX3jBnz2xnR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 14:19:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qBxvcXQA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6gvX01MJz4xD3;
 Tue, 24 May 2022 14:19:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653365976;
 bh=IG+my2a+y/9jvLL/9VsbZtWIgtmAdHBhuMYNOzUOmL4=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=qBxvcXQA8e71l6NbCIzcttmoSpTEcawf2BEwkEIMZTULx4M2D6doMRWsU1shzIUnd
 W/hzNXopFEnmDKPWEkirQUuAYzMtnIRSjpYmd6Zp+0tQMN+Wgw/n2qidMO8H1zsGqL
 hfZwbkTVIQ/kxd88UeMDppcpAo1JE/4CSQ6eDm1sllmBl7qHbldtfcmcZPwAojQ76C
 rsLP/Pixz3NuAjhPqX+9Ys4ekOYDr+toZ8crpW3xtJmB1zkgnYgxYVCx4m4LAOIX7P
 indSTWYqn/7dWdEG3BPrK8kWFLRViG58BBZb4Z5ZOIxEv5iqdeznEXqITk+skX9MdF
 CDKaZjSZnX0sQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Brian W Hart <hartb@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Fix all occurences of "the the"
In-Reply-To: <87r14omqxl.fsf@mpe.ellerman.id.au>
References: <20220518142629.513007-1-mpe@ellerman.id.au>
 <YoZHQOWiMNRTvaXP@li-1555b84c-276a-11b2-a85c-f09ab184f67f.ibm.com>
 <87r14omqxl.fsf@mpe.ellerman.id.au>
Date: Tue, 24 May 2022 14:19:34 +1000
Message-ID: <87a6b7mujt.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Brian W Hart <hartb@linux.vnet.ibm.com> writes:
>> On Thu, May 19, 2022 at 12:26:29AM +1000, Michael Ellerman wrote:
>>> Rather than waiting for the bots to fix these one-by-one, fix all
>>> occurences of "the the" throughout arch/powerpc.
> ...
>>> diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
>>> index ef4c2b15f9dd..5d237da43b64 100644
>>> --- a/arch/powerpc/platforms/chrp/setup.c
>>> +++ b/arch/powerpc/platforms/chrp/setup.c
>>> @@ -253,7 +253,7 @@ static void __noreturn briq_restart(char *cmd)
>>>   * Per default, input/output-device points to the keyboard/screen
>>>   * If no card is installed, the built-in serial port is used as a fallback.
>>>   * But unfortunately, the firmware does not connect /chosen/{stdin,stdout}
>>> - * the the built-in serial node. Instead, a /failsafe node is created.
>>> + * the built-in serial node. Instead, a /failsafe node is created.
>>>   */
>>>  static __init void chrp_init(void)
>>>  {
>>
>> Maybe this one should be "to the"?
>
> You're right. Darn it, I've already applied the patch.
>
> Given how old this code is it will probably not last many more years, so
> I'll just leave it as-is. Hopefully no one writes a bot that looks for
> missing "to"s.

I did fix it in the end, because I needed to rebase to fix something else.

cheers
