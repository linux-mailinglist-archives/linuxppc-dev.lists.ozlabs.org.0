Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6F3ADB04
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 19:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6hrm4NDxz3c56
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 03:01:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zWzKICEl;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yGz+IcnI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=zWzKICEl; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=yGz+IcnI; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6hrG0t3Qz303J
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 03:00:46 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1624122031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B0WuIzDMWF99bBZuLNCq2ygkfH35IcPVOSY6Jg7e+OI=;
 b=zWzKICElodmiWYNyww0vsbIf5K1JIwRn9+v/TR+PlrsUkchd2PKtD5ng6LpeFgbgsTCKw4
 GBwmGVSPosDKlhUUBZWSNx6e7wz2eqzwKRj1CuthEf+l1vTDYf3U+Y7Xu9kTG+70DBDmlK
 Bk6Dco+InfRE+z5QGnIXhU31JJXAS+rcpcEninckSnnpG0svX6TEdlrLdqMEQTZMVfly3x
 9TxzUOm6mtr/EJi67HqlweKY04sNhwUhk8rFZHANb9cX23E1VUNpFGkNaiwqoMfPsIyG8B
 kcgTJwMUfiPDmBVazSTYhENptpnSjrZ1yRGnj0brteKWvQfemy8H9dbCFDc8/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1624122031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B0WuIzDMWF99bBZuLNCq2ygkfH35IcPVOSY6Jg7e+OI=;
 b=yGz+IcnIfKBafxps3sdFRFstTzITkh1lKwhIXMPHyEs4gwR741lmdzOnbFnqgotz0a8XG7
 K3OHwMhzVPurVVAg==
To: Ondrej Mosnacek <omosnace@redhat.com>,
 linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>
Subject: Re: [PATCH v3] lockdown,
 selinux: fix wrong subject in some SELinux lockdown checks
In-Reply-To: <20210616085118.1141101-1-omosnace@redhat.com>
References: <20210616085118.1141101-1-omosnace@redhat.com>
Date: Sat, 19 Jun 2021 19:00:30 +0200
Message-ID: <8735tdiyc1.ffs@nanos.tec.linutronix.de>
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
Cc: linux-efi@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>,
 Paul Moore <paul@paul-moore.com>, x86@kernel.org, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-fsdevel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16 2021 at 10:51, Ondrej Mosnacek wrote:
> diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
> index bda73cb7a044..c43a13241ae8 100644
> --- a/arch/x86/mm/testmmiotrace.c
> +++ b/arch/x86/mm/testmmiotrace.c
> @@ -116,7 +116,7 @@ static void do_test_bulk_ioremapping(void)
>  static int __init init(void)
>  {
>  	unsigned long size = (read_far) ? (8 << 20) : (16 << 10);
> -	int ret = security_locked_down(LOCKDOWN_MMIOTRACE);
> +	int ret = security_locked_down(current_cred(), LOCKDOWN_MMIOTRACE);

I have no real objection to those patches, but it strikes me odd that
out of the 62 changed places 58 have 'current_cred()' and 4 have NULL as
argument.

I can't see why this would ever end up with anything else than
current_cred() or NULL and NULL being the 'special' case. So why not
having security_locked_down_no_cred() and make current_cred() implicit
for security_locked_down() which avoids most of the churn and just makes
the special cases special. I might be missing something though.

Thanks,

        tglx
