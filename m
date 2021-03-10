Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1BA334B9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 23:32:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwmzX2DMMz3d6f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 09:32:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=oNx1F/ZX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=oNx1F/ZX; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwmz63tv2z2xZ4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 09:32:01 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id l7so13155267pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 14:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hFim9dkS8C3QxvTFiRW3MvtmWdJpYNlf+TdshQOA3p8=;
 b=oNx1F/ZXBU5DoNZi0gi9oZs+OUtq0c5CiwIvx2Xtgg8JIFKhJIWoHXNV0rxwVWOqGp
 xgF5c6B7APykTL9Jevyb/W2pkPzn9YoA3iptUjmraTsuT3CbEJtyzPA8zCg8qrXnofaf
 3aPCAiWoL6makbA9cZ/wcQgklPSblzmO2HoOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hFim9dkS8C3QxvTFiRW3MvtmWdJpYNlf+TdshQOA3p8=;
 b=g8RRGpslwX03webkltapbDPyCB2AoDZ6Kec7m0euvRE2fAVfltQR+IVM7n9ifjZ16u
 owtPOuq0cvmnLPcHB1xkfIxnvOPorTr10DROd/4rgkJdaxeEbypbOIg84R72mop0mYle
 Rke4E/FtFJiTvIG7i7r78ukYyJlCe0eUtEJ3abpZkla5SqdcM6CpLx0bQfm2rInnxPU8
 uG6DwpzOyIep4+LwIIOOfne+0MEZf4Q1oAeI66rY8ly8bM5QbiE6FILuxIv+D0P2GjWB
 0k2Qyqwuhm6DMPFuWcUc5CvlFxs6UulkgHdYIPh7pdUkFR2JWqNQoDeU+qWZpsovdJ6w
 gdFA==
X-Gm-Message-State: AOAM532Yb0tC/HAPm92ZG5+QWAgGAphELWj3pT1M8XxaJOff+vsK/daF
 U0G1YyN3DK9ZeJdVTHF+3bCm5g==
X-Google-Smtp-Source: ABdhPJzh7LdOpcpB5ryAVE/3HXNh9RhypK5KTZN9NrdH90NdTRRG1v0rMGaSsKbFryjsERtgjSaNLg==
X-Received: by 2002:a63:db57:: with SMTP id x23mr4596264pgi.432.1615415517703; 
 Wed, 10 Mar 2021 14:31:57 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-0e28-c46d-f4e0-67e7.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:e28:c46d:f4e0:67e7])
 by smtp.gmail.com with ESMTPSA id s22sm448845pgv.94.2021.03.10.14.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 14:31:57 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 03/15] powerpc/align: Convert emulate_spe() to
 user_access_begin
In-Reply-To: <0ad4629c2d222019e82fcdfccc70d372beb4adf9.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
 <0ad4629c2d222019e82fcdfccc70d372beb4adf9.1615398265.git.christophe.leroy@csgroup.eu>
Date: Thu, 11 Mar 2021 09:31:54 +1100
Message-ID: <8735x2d4it.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> This patch converts emulate_spe() to using user_access_being
s/being/begin/ :)
> logic.
>
> Since commit 662bbcb2747c ("mm, sched: Allow uaccess in atomic with
> pagefault_disable()"), might_fault() doesn't fire when called from
> sections where pagefaults are disabled, which must be the case
> when using _inatomic variants of __get_user and __put_user. So
> the might_fault() in user_access_begin() is not a problem.
(likewise with the might_fault() in __get_user_nocheck, called from
unsafe_get_user())

> There was a verification of user_mode() together with the access_ok(),
> but the function returns in case !user_mode() immediately after
> the access_ok() verification, so removing that test has no effect.

I agree that removing the test is safe.

> -	/* Verify the address of the operand */
> -	if (unlikely(user_mode(regs) &&
> -		     !access_ok(addr, nb)))
> -		return -EFAULT;
> -

I found the reasoning a bit confusing: I think it's safe to remove
because:

 - we have the usermode check immediately following it:

>  	/* userland only */
>  	if (unlikely(!user_mode(regs)))
>  		return 0;

 - and then we have the access_ok() check as part of
   user_read_access_begin later on in the function:

> +		if (!user_read_access_begin(addr, nb))
> +			return -EFAULT;
> +


>  		switch (nb) {
>  		case 8:
> -			ret |= __get_user_inatomic(temp.v[0], p++);
> -			ret |= __get_user_inatomic(temp.v[1], p++);
> -			ret |= __get_user_inatomic(temp.v[2], p++);
> -			ret |= __get_user_inatomic(temp.v[3], p++);
> +			unsafe_get_user(temp.v[0], p++, Efault_read);
> +			unsafe_get_user(temp.v[1], p++, Efault_read);
> +			unsafe_get_user(temp.v[2], p++, Efault_read);
> +			unsafe_get_user(temp.v[3], p++, Efault_read);

This will bail early rather than trying every possible read. I think
that's OK. I can't think of a situation where we could fail to read the
first byte and then successfully read later bytes, for example. Also I
can't think of a sane way userspace could depend on that behaviour. So I
agree with this change (and the change to the write path).

>  			fallthrough;
>  		case 4:
> -			ret |= __get_user_inatomic(temp.v[4], p++);
> -			ret |= __get_user_inatomic(temp.v[5], p++);
> +			unsafe_get_user(temp.v[4], p++, Efault_read);
> +			unsafe_get_user(temp.v[5], p++, Efault_read);
>  			fallthrough;
>  		case 2:
> -			ret |= __get_user_inatomic(temp.v[6], p++);
> -			ret |= __get_user_inatomic(temp.v[7], p++);
> -			if (unlikely(ret))
> -				return -EFAULT;
> +			unsafe_get_user(temp.v[6], p++, Efault_read);
> +			unsafe_get_user(temp.v[7], p++, Efault_read);
>  		}
> +		user_read_access_end();
>  
>  		switch (instr) {
>  		case EVLDD:
> @@ -255,31 +250,41 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
>  
>  	/* Store result to memory or update registers */
>  	if (flags & ST) {
> -		ret = 0;
>  		p = addr;
> +
> +		if (!user_read_access_begin(addr, nb))

That should be a user_write_access_begin.

> +			return -EFAULT;
> +


>  
>  	return 1;
> +
> +Efault_read:

Checkpatch complains that this is CamelCase, which seems like a
checkpatch problem. Efault_{read,write} seem like good labels to me.

(You don't need to change anything, I just like to check the checkpatch
results when reviewing a patch.)

> +	user_read_access_end();
> +	return -EFAULT;
> +
> +Efault_write:
> +	user_write_access_end();
> +	return -EFAULT;
>  }
>  #endif /* CONFIG_SPE */
>

With the user_write_access_begin change:
  Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
