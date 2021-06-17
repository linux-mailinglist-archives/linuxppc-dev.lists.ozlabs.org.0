Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF613AA9C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 06:07:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G57mS0mvxz308d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 14:07:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YuiYXX47;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YuiYXX47; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G57lz2QKfz301j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 14:06:38 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G57ls4Z81z9sTD; Thu, 17 Jun 2021 14:06:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G57lq70kpz9sT6;
 Thu, 17 Jun 2021 14:06:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623902793;
 bh=nWi65WD8JK9a2wgNfrvVIYRZN4+XlJuLxibPXc9F37E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YuiYXX473XfEhOFV0PzeGsyRNyV5jg8CY4x7T/ILGe7pzQ+MKkPfDVwKGvs7byVMz
 fBmZB84jK/fTj+B0F5IIcHFL7y3uBEfxi1KP5TYKcUa1e3vpMx94c+GKkcqdwEuIzo
 CBDt6aJ3CwldMPrwurnAaf3vckk0etPwTtMLZKLUHA3U5i2IecFiEtF0gpqk3oISN6
 bFfUt4UmVv220ZGa4R0rEljPMyDfRehKFWm+x0ylB/va32sy0B0YdcGCOKFtcJGkIi
 OABqQoPc3kp27NNgbz3b8dhEQxAOEY/V6AYfaiYATts13J5bNrliMJruBkVBs4+kYu
 iK3mXq58z8yqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@ozlabs.org>,
 Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 11/11] powerpc/microwatt: Disable interrupts in boot
 wrapper main program
In-Reply-To: <1623893913.zpw6v9dt4c.astroid@bobo.none>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMfgt4ndMrtYwWYY@thinks.paulus.ozlabs.org>
 <20210616233739.GN5077@gate.crashing.org>
 <1623893913.zpw6v9dt4c.astroid@bobo.none>
Date: Thu, 17 Jun 2021 14:06:26 +1000
Message-ID: <874kdxrv7h.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Segher Boessenkool's message of June 17, 2021 9:37 am:
>> On Tue, Jun 15, 2021 at 09:05:27AM +1000, Paul Mackerras wrote:
>>> This ensures that we don't get a decrementer interrupt arriving before
>>> we have set up a handler for it.
>> 
>> Maybe add a comment saying this is setting MSR[EE]=0 for that?  Or do
>> other bits here matter as well?
>
> Hmm, it actually clears MSR[RI] as well.
>
> __hard_irq_disable() is what we want here, unless the MSR[RI] clearing 
> is required as well, in which case there is __hard_EE_RI_disable().

But neither of those exist in the boot wrapper (yet).

cheers
