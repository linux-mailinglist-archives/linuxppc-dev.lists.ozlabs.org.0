Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B9A1ABA9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 09:59:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492s755JvyzDrQs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 17:58:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GuXPXekg; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492s172rmMzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:53:47 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id kb16so354343pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 00:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=dUFIerRziQ9hK9uxxbOwfR4QtyqVRP1DvtgmdpUisHA=;
 b=GuXPXekg8ytd8ZGnlf+jP5ZIkhernIeVrq70gpQVtXC++oWhjedcaP8jI+3BXgfrPM
 PIwnrnFtGWFLPAU0itjRSldgXU9SNCSMvouRHjK1sS2xHs+29r7nAzoMbDF+9HFldvPu
 aEPXKlaM3txxTscu44vxhBXvFOnmFPM0FynBHHsv0zRNeNHlgc+LL48g2sp1pXONyAAr
 CvDojGIbRKe5niZVrkwiK9VUt6hAZ5KOdWhjOzC/qzbzXIWj2oPt1yM9BLAL9XRLZa1o
 s5dKAiW7i1j0/R4fujz/LPbvnDwZS9cuLNXdLxxJTRR2vxOsejcqMCmmTDeCMElStBNO
 7lXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dUFIerRziQ9hK9uxxbOwfR4QtyqVRP1DvtgmdpUisHA=;
 b=NPmlqP0JnRUKu2YYKsTarQnxIEACdL9ch6akP942OixDlySBhHBcLzPXZktr3PJ9HG
 PnMfG5aMXUkFzSzIR3Tsb/LUf8J5HfEMRtCAx9qbmSckLOcaPauhZE4797xZlsx50/ix
 1o+M1HkFhwo2monqxrgMedrn8UmLQzi0xy3KT0uLuVY3fVK/EVX+eQ5J/rjFi2X+Qnlb
 3wpQJwOgMQ9iewXj1Ifz3Y3Qsq34isMZSzsyECkn9REO0wUsXdGgu5sFfcspeHW8gkkq
 koXQs91ma+pK5Pkw7H+vmOaRzwTiCP4IDSI+656/dz9fAe8lcgvZTi2D/7v1uAmnbjQG
 KAvw==
X-Gm-Message-State: AGi0PuaOx7bL3AvWfNWextaLZfcykOXa7cca0tfi7CpiR0biTbDr3WYE
 Bfv/ZiYxojMRQHXFLawOJBk=
X-Google-Smtp-Source: APiQypJoEIIxKF6uR53iceESDIvJGlh7a52I8MJ/coXBXDPhxkbp/kZ6jFV+ODlsb/9BaYM+or1E+A==
X-Received: by 2002:a17:90a:d3d1:: with SMTP id
 d17mr3546955pjw.191.1587023623081; 
 Thu, 16 Apr 2020 00:53:43 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id j5sm1744030pjb.36.2020.04.16.00.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:53:42 -0700 (PDT)
Date: Thu, 16 Apr 2020 17:53:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [EXTERNAL] [PATCH] target/ppc: Fix mtmsr(d) L=1 variant that
 loses interrupts
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
References: <20200414111131.465560-1-npiggin@gmail.com>
 <74e47708-fcc0-d3db-5f6b-2a513722fef9@kaod.org>
In-Reply-To: <74e47708-fcc0-d3db-5f6b-2a513722fef9@kaod.org>
MIME-Version: 1.0
Message-Id: <1587022632.z6w1kmmsze.astroid@bobo.none>
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
Cc: qemu-stable@nongnu.org, qemu-ppc@nongnu.org,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from C=C3=A9dric Le Goater's message of April 15, 2020 4:49 pm:
> On 4/14/20 1:11 PM, Nicholas Piggin wrote:
>>=20
>> The confusion arises from L=3D0 being "context synchronizing" whereas L=
=3D1
>> is "execution synchronizing", which is a weaker semantic. However this
>> is not a relaxation of the requirement that these exceptions cause
>> interrupts when MSR[EE]=3D1 (e.g., when mtmsr executes to completion as
>> TCG is doing here), rather it specifies how a pipelined processor can
>> have multiple instructions in flight where one may influence how another
>> behaves.
>=20
> I was expecting more changes but this looks fine.=20

It _seems_ to just be these, from what I could see, but could quite=20
easily be other issues I missed.

There is at least one other "funny" thing with this synchronization,=20
which is the TLB flushing. I don't think it has a bug, but comments
are a bit suspect. tlbie/l doesn't have anything to do with context
/ execution synchronization, so it's a bit interesting to check them
in isync and rfi etc.

ptesync is required because the page table walkers are not necessarily=20
coherent with the main CPU's memory pipeline, so you store a new value=20
to a PTE then do a tlbiel, you can't have the MMU reload the TLB with=20
the old PTE because the store was sitting in the store queue that=20
doesn't forward to the table walker. This condition can persist after
the store instruction itself has completed so no amount of this
context synchronization would help.

It does kind of make sense to check the tlb flush in rfi, so you catch=20
stray ones that didn't have the right ptesync/tlbsync, but it would=20
almost be a condition you could catch and add a warn for. isync doesn't
make a lot of sense though, as far as I can see.

Thanks,
Nick

> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Sorry I always get your email wrong, phantom address book entry.

