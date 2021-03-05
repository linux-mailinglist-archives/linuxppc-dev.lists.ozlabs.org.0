Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763632E0DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 05:51:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsFgl0FqLz3dBb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 15:51:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Xo/K8eOm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Xo/K8eOm; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsFgK4fmyz30KL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 15:51:07 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id s7so768528plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 20:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=cHJA7XXCkOA4RpRrDF/FKM/MmiWjavpSM2NvYG4D2wQ=;
 b=Xo/K8eOmuSXEX1HyZoNj7cXac1Emjbumjpe9gAquyuxsVXJ2Whi9gtRLWPg4gvifQn
 0V0G8rgX0kPR9j8EvPd/9g5n4vdNr24AN99H1GUsi0BWzOYyT/kTx5/q2JJywGY7jmdC
 wnuwqCK5JTAUlry1fzBzApKrau701fhKxTL7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=cHJA7XXCkOA4RpRrDF/FKM/MmiWjavpSM2NvYG4D2wQ=;
 b=fZTY4vNz+FTM/qPhG7i1J+3Esc0KEiIRsOeQvUUPQAdk7RSMR5r+EgctdpQk+K3jMC
 Snx6XNdKNkljEYKiOGvJ6mEKaXaDsetHStuAZUGveB5u3/28uPg1YKdmfUEf1a9a+EYW
 KerJvFB4tuA1dFwlf8eITr5DnpKhFlMzTjKqTGlDCOssfmRCLcOPRXlXpNPAuxfMuzDK
 OxmU9E6FAn/WtkVtEfMx5aQ7OmmK/fy00VclUKfZXRSIcS0hM2mnPQZEQ+65Qd0ChXnw
 cfeO8Tu9iD8bdATWbW+9I4IlW+htQZOt2xKvR3vK2vhlgrbT8rDGk64FfozDFJB++fdI
 42Jg==
X-Gm-Message-State: AOAM532ZaYOicYTqv1kwDv/CCa8Renkbcwl+XXwOVF+f8xOHwuzGqSKm
 +UEfOwxBwadcNMe71Ze91MCjWw==
X-Google-Smtp-Source: ABdhPJzUYGpICJTnnsHgEKR9D838ntdPons8hBy3Dwiz2M3cJDcCF9au2GZdK60Bf4RJP+UKuYwHlw==
X-Received: by 2002:a17:90a:4a93:: with SMTP id
 f19mr8228810pjh.41.1614919863016; 
 Thu, 04 Mar 2021 20:51:03 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id p8sm914342pff.79.2021.03.04.20.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 20:51:02 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 05/37] KVM: PPC: Book3S HV: Ensure MSR[ME] is always
 set in guest MSR
In-Reply-To: <1614383549.rxe6rxw7w8.astroid@bobo.none>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-6-npiggin@gmail.com>
 <87zgzr8is2.fsf@linkitivity.dja.id.au>
 <1614383549.rxe6rxw7w8.astroid@bobo.none>
Date: Fri, 05 Mar 2021 15:50:59 +1100
Message-ID: <87tupq8aq4.fsf@linkitivity.dja.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> This 'if' is technically redundant but you mention a future patch warning
>> on !(msr & MSR_ME) so I'm holding off on any judgement about the 'if' until
>> I get to that patch :)
>
> That's true. The warning is actually further down when we're setting up 
> the msr to run in guest mode. At this point the MSR I think comes from
> qemu (and arguably the guest setup code shouldn't need to know about HV
> specific MSR bits) so a warning here wouldn't be appropriate.
>
> I could remove the if, although the compiler might already do that.

Yes, I think the compiler is almost certainly going to remove that.

I'd probably not include the 'if' statement even though it probably gets
removed by the compiler but I think that's more a matter of taste than
anything else.

Kind regards,
Daniel

>
>> 
>> The patch seems sane to me, I agree that we don't want guests running with
>> MSR_ME=0 and kvmppc_set_msr_hv already ensures that the transactional state is
>> sane so this is another sanity-enforcement in the same sort of vein.
>> 
>> All up:
>> Reviewed-by: Daniel Axtens <dja@axtens.net>
>
> Thanks,
> Nick
