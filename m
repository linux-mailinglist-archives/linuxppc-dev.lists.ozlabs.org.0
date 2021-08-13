Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6493EAF18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 06:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm94c4YRYz3cPs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 14:07:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IdHtSUe9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IdHtSUe9; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm93x5g0wz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 14:06:51 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id e19so10183337pla.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=aZMV7xGg6neTcrhuS2g8VMZBQv0q4yjk3+aUWZCahPY=;
 b=IdHtSUe98WVD0LhtCYHuvdl4u9hY8IFElNg7fPItKHdlrfgTVU6MVh4FcjtnTfz3mC
 lGTiwvXP9qvb+kRjG6cPPX8sIEdhFQNPhCn55ldS3OyQAAO3dHNk0EyiQgAo6bE+l7E2
 ZNIVZtK2pPanYtvXgYqlaGlAzPXNe/oPL/cSyco+Ogr3kfzTYf7vJqd98ZTU6I0e92B+
 3rAUMSRfjL1xLbXS4Cr0tRtG7AF9JLTD6+Hv+s/RZCsnq8tUlUby8p9pYpmpH+5+dZv/
 UO2WvCi0QksWJk77Co2jiDJtspeLkDhEsFvIGsw3aaictpa5mLSKJMphJNfg/Pzwq+j8
 9Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=aZMV7xGg6neTcrhuS2g8VMZBQv0q4yjk3+aUWZCahPY=;
 b=EdVXiNH3j4rXdYEmVV7YHD5C68UoNbCyn4PgoCr9AcGhbNlPouuWDT1BM/W58E6Ovq
 6JVy+kJTbgnwXJGGVjHkeKHksYvCItqe11at853lkuYq9ds+LfgOIYy6E91QC2p4hFc/
 A9v6z2In8qZpY2lOZK+84FK7PoZB7t9VKrSynUkhJ9fClLESfCdqqVhVIffok5jq1rVb
 KxJVEXPR2Pv7EpLNKUouh5EjZ+yK5fvJUXCwqDjX393+gC8GnnDrDIL9c7muYnGTtOs6
 xKdDINQUiJPDA+a62zOtLB0FIOfX8SxXt+9AkDhiyJ/NI4GZ5NtrPhmHKVLQXocP8sCi
 JE6Q==
X-Gm-Message-State: AOAM531uP+i1ca8QzFf0crihSrQ/xFibLbsyJQc63HYKltbBsvy98vm+
 7NWtKyz1qFI4HrV/CIgkjmY=
X-Google-Smtp-Source: ABdhPJz8HvQRdrNoNnBk1WHF6zQMxOvzW3PRigZYSLQgzkjedHc8vxzZU7RRzxIoADU2D4qRq5AuKQ==
X-Received: by 2002:a05:6a00:23c5:b029:3e0:7350:efd6 with SMTP id
 g5-20020a056a0023c5b02903e07350efd6mr536118pfc.40.1628827606321; 
 Thu, 12 Aug 2021 21:06:46 -0700 (PDT)
Received: from localhost (60-242-208-220.static.tpgi.com.au. [60.242.208.220])
 by smtp.gmail.com with ESMTPSA id
 19sm302111pfw.203.2021.08.12.21.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 21:06:46 -0700 (PDT)
Date: Fri, 13 Aug 2021 14:06:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v0 5/5] pseries: Asynchronous page fault support
To: Bharata B Rao <bharata@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20210805072439.501481-1-bharata@linux.ibm.com>
 <20210805072439.501481-6-bharata@linux.ibm.com>
In-Reply-To: <20210805072439.501481-6-bharata@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1628825941.uhcogyrzjc.astroid@bobo.none>
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
Cc: aneesh.kumar@linux.ibm.com, kvm@vger.kernel.org, bharata.rao@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Bharata B Rao's message of August 5, 2021 5:24 pm:
> Add asynchronous page fault support for pseries guests.
>=20
> 1. Setup the guest to handle async-pf
>    - Issue H_REG_SNS hcall to register the SNS region.
>    - Setup the subvention interrupt irq.
>    - Enable async-pf by updating the byte_b9 of VPA for each
>      CPU.
> 2. Check if the page fault is an expropriation notification
>    (SRR1_PROGTRAP set in SRR1) and if so put the task on
>    wait queue based on the expropriation correlation number
>    read from the VPA.
> 3. Handle subvention interrupt to wake any waiting tasks.
>    The wait and wakeup mechanism from x86 async-pf implementation
>    is being reused here.

I don't know too much about the background of this.

How much benefit does this give? What situations? Does PowerVM implement=20
it? Do other architectures KVM have something similar?

The SRR1 setting for the DSI is in PAPR? In that case it should be okay,
it might be good to add a small comment in exceptions-64s.S.

[...]

> @@ -395,6 +395,11 @@ static int ___do_page_fault(struct pt_regs *regs, un=
signed long address,
>  	vm_fault_t fault, major =3D 0;
>  	bool kprobe_fault =3D kprobe_page_fault(regs, 11);
> =20
> +#ifdef CONFIG_PPC_PSERIES
> +	if (handle_async_page_fault(regs, address))
> +		return 0;
> +#endif
> +
>  	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
>  		return 0;

[...]

> +int handle_async_page_fault(struct pt_regs *regs, unsigned long addr)
> +{
> +	struct async_pf_sleep_node n;
> +	DECLARE_SWAITQUEUE(wait);
> +	unsigned long exp_corr_nr;
> +
> +	/* Is this Expropriation notification? */
> +	if (!(mfspr(SPRN_SRR1) & SRR1_PROGTRAP))
> +		return 0;

Yep this should be an inline that is guarded by a static key, and then=20
probably have an inline check for SRR1_PROGTRAP. You shouldn't need to
mfspr here, but just use regs->msr.

> +
> +	if (unlikely(!user_mode(regs)))
> +		panic("Host injected async PF in kernel mode\n");

Hmm. Is there anything in the PAPR interface that specifies that the
OS can only deal with problem state access faults here? Or is that
inherent in the expropriation feature?

Thanks,
Nick
