Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 644761D0617
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 06:37:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MMNg0m0hzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 14:37:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m7kYNQo4; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MMM42HNczDqB3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 14:36:30 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r14so7457423pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 21:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2A2BUe5JINIQtBy3JK/lJQriURGohduNoyDL50A04h8=;
 b=m7kYNQo4ygmDCPVbZMwAHrpO/rY4PFXXVwJ3BSZLi4ZgQAEblpbeFdtLDjGRTM3cau
 mSTuPluaRhsFW+Y3IXDs9XR5NC7wmDrD+XpeIUWf7jhGtYJmScqdAJxqUw/oQE5u3LF7
 gbsW0yr4EnnGYuNFzOxZ3vYLvqdcAScK8fh5XBlQWzd5j/RXjSrtYEDnEXCHWnEqkZY+
 0DaKEjGSxt/ECD6kzknzQXK2ol7mtNnhdjuxxW/eVUqWpAnfYmzor+SBcayNHahO+VUA
 NDeaCfYlk904RSQs8RrGaKXelg44CeDIgVDnXbYOrzHXo7FvfGKBqkpYJDpalKSoXrFl
 Uc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2A2BUe5JINIQtBy3JK/lJQriURGohduNoyDL50A04h8=;
 b=FgZQG3jaFkBUezbQh8xQ7oBFEZxUOyqWN5PF8Zy0QCPa2RosppZM1+fXlnIO77G9zN
 dojfOEdfImHnagufqRj7Dcl/f/8T1hChMO8HqVfWzjaS/o80XjlUQvN+lESYmZqU5mGj
 wD//lcZpSw9njZjmeUn8IusnT7hIPudxyhJTThCKkwqybFzQx9T9VmoCzYz5f7tok4Yp
 Pbgt0XsYFs2nR3i/SybO1fO4cau/Cdq1US3HKjD9qonnY1q47wRGr+9fmCLdNEiXzXqj
 AlTChMdLzPO+f132vV1yfkAAlgtzjXHkQwKhvMwfOf8vPdHP/zg5oIllRVv/JX1xLKcy
 vYvg==
X-Gm-Message-State: AGi0PuY+3ViZwn6GreM4ABd7rSAwWhB6K2vXfKSq1egQ3rr+A0BXymcT
 SbvP1Y3OhDsHNJUp2ba+uJg=
X-Google-Smtp-Source: APiQypIbw+/ucdBGA3C+rdA25/MRn1nA+fnLyG5Xw7JW2bfFKGtGaprjgC/tJhlJ5zv4XPUo1h1jHw==
X-Received: by 2002:a63:da10:: with SMTP id c16mr22829320pgh.208.1589344587146; 
 Tue, 12 May 2020 21:36:27 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id x185sm13349333pfx.155.2020.05.12.21.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 21:36:26 -0700 (PDT)
Date: Wed, 13 May 2020 14:36:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/crash: Use NMI context for printk when
 starting to crash
To: Alexios Zavras <alexios.zavras@intel.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Enrico Weigelt
 <info@metux.net>, Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner
 <tglx@linutronix.de>
References: <20200512214533.93878-1-leobras.c@gmail.com>
In-Reply-To: <20200512214533.93878-1-leobras.c@gmail.com>
MIME-Version: 1.0
Message-Id: <1589344247.2akwhmzwhg.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Leonardo Bras's message of May 13, 2020 7:45 am:
> Currently, if printk lock (logbuf_lock) is held by other thread during
> crash, there is a chance of deadlocking the crash on next printk, and
> blocking a possibly desired kdump.
>=20
> At the start of default_machine_crash_shutdown, make printk enter
> NMI context, as it will use per-cpu buffers to store the message,
> and avoid locking logbuf_lock.

printk_nmi_enter is used in one other place outside nmi_enter.

Is there a different/better way to handle this? What do other=20
architectures do?

Other subsystems get put into an nmi-mode when we call nmi_enter
(lockdep, ftrace, rcu etc). It seems like those would be useful for=20
similar reasons, so at least explaining why that is not used in a=20
comment would be good.

Aside from that, I welcome any effort to make our crashes more reliable
so thanks for working on this stuff.

Thanks,
Nick

>=20
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>=20
> ---
> Changes since v1:
> - Added in-code comment explaining the need of context change
> - Function moved to the start of default_machine_crash_shutdown,
>   to avoid locking any printk on crashing routine.
> - Title was 'Use NMI context for printk after crashing other CPUs'
>=20
> ---
>  arch/powerpc/kexec/crash.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index d488311efab1..c9a889880214 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -311,6 +311,9 @@ void default_machine_crash_shutdown(struct pt_regs *r=
egs)
>  	unsigned int i;
>  	int (*old_handler)(struct pt_regs *regs);
> =20
> +	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
> +	printk_nmi_enter();
> +
>  	/*
>  	 * This function is only called after the system
>  	 * has panicked or is otherwise in a critical state.
> --=20
> 2.25.4
>=20
>=20
