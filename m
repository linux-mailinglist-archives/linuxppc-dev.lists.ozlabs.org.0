Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA334A0AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 05:50:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F68gP1364z3bvH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 15:50:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=PYhjRCwh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=PYhjRCwh; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F68fz03smz2yxy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 15:50:32 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so3672155pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 21:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=doRNGBmntoEt/PlYOTFeUHiq3lxYF7WmCHXEbxgxplc=;
 b=PYhjRCwhYOYFwxnGcPf6k4f8kIBP3W1dsdySyPWBEodIFqO2jn6stlVjCBye46d8zo
 Cw1nIH47FC1jmapmPDR/2VqJHuZOK7otY6Pi+GV7K0tjjmfIi6H5Ozmk+a48LRa6cqTT
 8Kq+CFBgl7wIIIcGJV+AhJwrkDrlmUbOZOcmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=doRNGBmntoEt/PlYOTFeUHiq3lxYF7WmCHXEbxgxplc=;
 b=Byw7DJQneDi/52ErNfK0HpoGWoAur4GVS2QrKSR40vY79grEH1p0x/vd0OmVteba+t
 5gymH3MvheKK+DiXD82VzL6fqxjjKPlJ1dnSQ4PzEQOnMEDl7+5odVeC8uOWnW1iKXxC
 HHwdX47UD33YhJHMIvIKOPG83MZqQT0DlLcjYMP2ZLjfZyvMpTl4j34VmNRL5GQvF6BG
 zK1oySGLb3HwGQem3YfwZ0f6ultlL2ruym9krA/Qtj4sW6uUB17scUoKxoBYYEA1Zc+Q
 A/puO83HlRhKfSrSRe3sm/sLhviad9AWn2M2ih3K/ggn1ODrGLDRcI3JzzHZE2UZuxN+
 hibQ==
X-Gm-Message-State: AOAM5338wtqxWw+N/QnJQblwd6pjCpUU3pQ92xorX34NXHGFm5YSdo4n
 +aZchWRIS8CZ+x0LeBObYcL5YA==
X-Google-Smtp-Source: ABdhPJxG+9GcTlXyCus5/cjAO0dCGJpxpz5BNInn21i8CJC3rmBGaJXJbxB5E3UvkNLeJzseuoMzmA==
X-Received: by 2002:a17:902:a610:b029:e6:5eda:c39e with SMTP id
 u16-20020a170902a610b02900e65edac39emr13600572plq.11.1616734228886; 
 Thu, 25 Mar 2021 21:50:28 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id y8sm7988457pfp.140.2021.03.25.21.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 21:50:28 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: powerpc: unmark non-kernel-doc comments
In-Reply-To: <20210325200820.16594-1-rdunlap@infradead.org>
References: <20210325200820.16594-1-rdunlap@infradead.org>
Date: Fri, 26 Mar 2021 15:50:25 +1100
Message-ID: <87a6qq8qni.fsf@linkitivity.dja.id.au>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:

> Drop the 'beginning of kernel-doc' notation markers (/**)
> in places that are not in kernel-doc format.

This looks good to me. Arguably we don't need the comments at all, but
it doesn't seem to hurt to keep them.

checkpatch is OK with the entire file, so there's nothing else we'd
really want to clean up while you're doing cleanups.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  tools/testing/selftests/powerpc/tm/tm-trap.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- linux-next-20210323.orig/tools/testing/selftests/powerpc/tm/tm-trap.c
> +++ linux-next-20210323/tools/testing/selftests/powerpc/tm/tm-trap.c
> @@ -66,7 +66,7 @@ void trap_signal_handler(int signo, sigi
>  	/* Get thread endianness: extract bit LE from MSR */
>  	thread_endianness = MSR_LE & ucp->uc_mcontext.gp_regs[PT_MSR];
>  
> -	/***
> +	/*
>  	 * Little-Endian Machine
>  	 */
>  
> @@ -126,7 +126,7 @@ void trap_signal_handler(int signo, sigi
>  		}
>  	}
>  
> -	/***
> +	/*
>  	 * Big-Endian Machine
>  	 */
>  
