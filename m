Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AE512A5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 06:19:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpj7J1CvRz3bdZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 14:19:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NRXXQ05R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NRXXQ05R; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpj6h1M88z2xss
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 14:18:49 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id n18so3293779plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 21:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=h0nl7cdomWGUlq7NkFHw6pdku52CBgP4rVYIlGxxYOQ=;
 b=NRXXQ05RFOb1J6aJ1XeCp0KaG8yZ9LTvv5GWNJiOrS/JmgFM9ATPutE0YdVP3cpdBq
 kacQ0fMkiuv6KZy1SjhGu+khLP8xEYS1IvZpVyDwAp8xA1nZhyv+GJsxcJHbVhJIrchi
 iZ2gyc1wVGv9PmfYK4a8XOSpCTll/UVA/Vcg1/22z2gIL4yH7oCH/qfPBgtOKXUZRN+A
 orGGaT1vnNnc4X5HkjQ6kHIkH7qqO8i3PrbTHLZ1P+S3QWSBDb1H8ScqyvqzFn835sKg
 FPsWJuGQFhI9a6eJdXI48hYA74vrX8eUru1eDc9EX4TWxFCE9XCzOHy6FTAoj71sGOO3
 FJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=h0nl7cdomWGUlq7NkFHw6pdku52CBgP4rVYIlGxxYOQ=;
 b=Y+jrcExcMqQLF1scu0NS0XYPb0eu4ygaOyN5tomFGoH4hKVHMEVHx/4+xjU74qVJAt
 0TCjFiAIjQPtZDJv24NY9HErWV6PddZypLtrHBS8Le5Gz2+RLnQkiwDo7CS4Vd0Xed0n
 GvCb2WxudBS03mfyqrj0sDaQJ8An2DTp1jbE1NXdsCfTdynq6u+vLYyIcVdrVdCYnmnm
 tjxrXZnpwky6tagvlfxYm/9nsmxFP46l0vubjN2r/M549YLaFAjbHjC/jlGTgcIKBfem
 yhdxUJ0QCex19z5bz+QVbmgZsTVQ6j8CbY+iabe4jRS9M/SRhILeRNMP74/OiqtNCqRf
 3yYw==
X-Gm-Message-State: AOAM532+f3zUs7wJMQT7misZkmvSZmtsOjvrzcDnOkPsFP1sfJbfKnmK
 PMso5pV66MEvJzcsRWgV27k=
X-Google-Smtp-Source: ABdhPJxDv05/OF1zjVelAO6mr8MDT0LTxaEUECQIKSgE4D3mPvnEWcDprNFTPwqQwzBGlEI9TIAv6w==
X-Received: by 2002:a17:902:8c81:b0:156:7fee:643b with SMTP id
 t1-20020a1709028c8100b001567fee643bmr31922784plo.59.1651119524820; 
 Wed, 27 Apr 2022 21:18:44 -0700 (PDT)
Received: from localhost (193-116-105-54.tpgi.com.au. [193.116.105.54])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004f0f9696578sm22998146pfl.141.2022.04.27.21.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 21:18:44 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:18:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/time: Always set decrementer in timer_interrupt()
To: Michael Ellerman <mpe@ellerman.id.au>, Michal =?iso-8859-1?q?Such=E1nek?=
 <msuchanek@suse.de>
References: <20220420141657.771442-1-mpe@ellerman.id.au>
 <20220420142821.GR163591@kunlun.suse.cz>
 <1650506701.dv7x3vxlhb.astroid@bobo.none>
In-Reply-To: <1650506701.dv7x3vxlhb.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1651119254.5iw3tsme9w.astroid@bobo.none>
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
Cc: miguel.ojeda.sandonis@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 21, 2022 12:07 pm:
> Excerpts from Michal Such=C3=A1nek's message of April 21, 2022 12:28 am:
>> Hello,
>>=20
>> On Thu, Apr 21, 2022 at 12:16:57AM +1000, Michael Ellerman wrote:
>>> This is a partial revert of commit 0faf20a1ad16 ("powerpc/64s/interrupt=
:
>>> Don't enable MSR[EE] in irq handlers unless perf is in use").
>>>=20
>>> Prior to that commit, we always set the decrementer in
>>> timer_interrupt(), to clear the timer interrupt. Otherwise we could end
>>> up continuously taking timer interrupts.
>>>=20
>>> When high res timers are enabled there is no problem seen with leaving
>>> the decrementer untouched in timer_interrupt(), because it will be
>>> programmed via hrtimer_interrupt() -> tick_program_event() ->
>>> clockevents_program_event() -> decrementer_set_next_event().
>>>=20
>>> However with CONFIG_HIGH_RES_TIMERS=3Dn or booting with highres=3Doff, =
we
>>=20
>> How difficult is it to detect this condition?
>>=20
>> Maybe detecting this could be just added?
>=20
> Possibly not too difficult but I'd like to see if we can get this to work
> in core timer code -
>=20
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-April/242212.html
>=20
> I'll resend as a patch and see what flamage I get...

tglx merged it into his tree, so we could try again after its
upstream.

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dtim=
ers/core&id=3D62c1256d544747b38e77ca9b5bfe3a26f9592576

I'm kind of worried the patch will explode some strange clock event=20
device in an obscure way so we may wait for a release or two first.

Thanks,
Nick
