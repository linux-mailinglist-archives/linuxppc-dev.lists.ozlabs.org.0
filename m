Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679D84C0D4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 00:22:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ur6PL279;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTzmS2jFnz3cSv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 10:22:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ur6PL279;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTzlc5nWQz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 10:21:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88258CE179B;
	Tue,  6 Feb 2024 23:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69075C433F1;
	Tue,  6 Feb 2024 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707261689;
	bh=ithrnW7mrAUwgzefWAlkisiO97xAaMWaVn7JYX2tYuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ur6PL279EzOqkACouJUT1+NEejB6pR2/B+UmPX4aDMUq0B4xftyGUNy1qtB/ApPJR
	 +s/NKRjyqDDkteKaEqKfLDes9+B7Jtyam6MLKm7HU3nyMNmXId5kZZmHOKqf/6hwUD
	 qXXlRAnRKZvFjrxcQRB2Jj62sX6RkEacqKVJ861BgLomPDLXTyTGCRt2ttST0JxnOk
	 VbGXS7Eu14TyShXSGKXQ1m9l3nCOaGejscWqBIyOvOMQgAmiHuKVzK2uulDjedYQx4
	 G+367LOoCM7u2epKasAl1X6/XXmMgsiY2ZMzWqispNj0tbjfBjBRfttWCMYsoVzz6d
	 G7krIZuvpjvWQ==
Date: Wed, 7 Feb 2024 00:21:27 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH 3/5] s390/vtime: remove unused
 __ARCH_HAS_VTIME_TASK_SWITCH leftover
Message-ID: <ZcK-992HhIrSHOK6@localhost.localdomain>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
 <b3623605ba5c1d386d8f59e17c930ca2c3cca07c.1706470223.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3623605ba5c1d386d8f59e17c930ca2c3cca07c.1706470223.git.agordeev@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Sun, Jan 28, 2024 at 08:58:52PM +0100, Alexander Gordeev a écrit :
> __ARCH_HAS_VTIME_TASK_SWITCH macro is not used anymore.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>


> ---
>  arch/s390/include/asm/vtime.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/s390/include/asm/vtime.h b/arch/s390/include/asm/vtime.h
> index fe17e448c0c5..561c91c1a87c 100644
> --- a/arch/s390/include/asm/vtime.h
> +++ b/arch/s390/include/asm/vtime.h
> @@ -2,8 +2,6 @@
>  #ifndef _S390_VTIME_H
>  #define _S390_VTIME_H
>  
> -#define __ARCH_HAS_VTIME_TASK_SWITCH
> -
>  static inline void update_timer_sys(void)
>  {
>  	S390_lowcore.system_timer += S390_lowcore.last_update_timer - S390_lowcore.exit_timer;
> -- 
> 2.40.1
> 
