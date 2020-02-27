Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C342E170DCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 02:25:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SZjf1PxczDqs1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 12:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SZh03hNCzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 12:24:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VCVWhoqS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48SZgy2Mknz9sPK;
 Thu, 27 Feb 2020 12:23:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582766640;
 bh=ICKPxzO9BqqJCVG6Gu46DTjkkmB7acV1gCLgWsJ9g0A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VCVWhoqSjYQGm2w8skc37LmZ5O7VoEaNHMdXiLJO4cgw8EIYvcQFNW3QwBA/dyYb/
 A8yvVC1S28Io0S7y64BaTjuAC8rA485sMmeEyhEXG4m4CJlp3v8JYknpJFGeDtNdCg
 wOsDnEtdSvXhMQ/g5RLT2xhmr8ctEZ/9Lp7IN8tUsL9vBs/HdG2caCYieCHgR9ca3R
 cGsl27Gvmwb4CD4WVUHcBRGLYFDP4QTbr2T+se5Ln/PsZ5/pmWXXq/QrelUxKvb0Q6
 GqbUXq+xi5UN2YGfPhgQNQSpJJAshUqUF2FJPM614ldtCzqaOakmmRiN6vh4by0QAS
 hEALnU+yJNOdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wolfram Sang <wsa@the-dreams.de>, linuxppc-dev@lists.ozlabs.org 
Subject: Re: [PATCH] macintosh: therm_windtunnel: fix regression when
 instantiating devices
In-Reply-To: <20200225141229.5424-1-wsa@the-dreams.de>
References: <20200225141229.5424-1-wsa@the-dreams.de>
Date: Thu, 27 Feb 2020 12:23:57 +1100
Message-ID: <87imjsu8k2.fsf@mpe.ellerman.id.au>
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
Cc: Mathieu Malaterre <malat@debian.org>, Erhard Furtner <erhard_f@mailbox.org>,
 debian-powerpc@lists.debian.org, linux-i2c@vger.kernel.org,
 Wolfram Sang <wsa@the-dreams.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wolfram Sang <wsa@the-dreams.de> writes:
> Removing attach_adapter from this driver caused a regression for at
> least some machines. Those machines had the sensors described in their
> DT, too, so they didn't need manual creation of the sensor devices. The
> old code worked, though, because manual creation came first. Creation of
> DT devices then failed later and caused error logs, but the sensors
> worked nonetheless because of the manually created devices.
>
> When removing attach_adaper, manual creation now comes later and loses
> the race. The sensor devices were already registered via DT, yet with
> another binding, so the driver could not be bound to it.
>
> This fix refactors the code to remove the race and only manually creates
> devices if there are no DT nodes present. Also, the DT binding is updated
> to match both, the DT and manually created devices. Because we don't
> know which device creation will be used at runtime, the code to start
> the kthread is moved to do_probe() which will be called by both methods.
>
> Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adapter")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=201723
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>
> I suggest this stable-tag: # v4.19+

Looks right to me.

> Adding the Debian-PPC List to reach further people maybe willing to
> test.
>
> This patch does not depend on "[PATCH RESEND] macintosh: convert to
> i2c_new_scanned_device". In fact, this one here should go in first as
> 5.6 material. I will rebase and resend the i2c_new_scanned_device()
> conversion on top of this regression fix.
>
> I can also take this via I2C if easier.

I think that would be best, it's more I2C related than powerpc arch
stuff that I could review.

I don't have a machine setup to test this easily, but Erhard has been
doing a good job of testing things so I'm happy for you to take it with
his Tested-by.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
