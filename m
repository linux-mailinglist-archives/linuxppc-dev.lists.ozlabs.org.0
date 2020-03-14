Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCE185446
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 04:39:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48fSx46fQyzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 14:39:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U8GtRzui; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48fSvP63SjzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Mar 2020 14:38:07 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id ay11so5246321plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 20:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=ZNUVQBdecvt5COEcoIrcomryAYodxervF1IhwAWuYNI=;
 b=U8GtRzuiRrB30Vs6+2N7gcNJLro8jXQ1/qSE4IP8KtesA/le6vpZ7iKTPSSrJn6MAK
 xNSQA6dIV/bc4Qc3qOev2soDsex0gkfBiBDSs58LngBgtXQIamOTLH9x0kd+rHzK6wKU
 O//UxXQd/yVQFeHsIxNZHc+RinNuQHW1u3GslQ5HiAHPXSHh0ry8oC2yCbwvstTK2A9x
 Q096/0cO3fAsPAI5Mi954xBoAiTvLsKYvG42V4fAWxGG+DXxq0Wn5uinhyxbggJBhY5b
 PvVuVxwx+d+RWzksY7BYSqewm3TQXNMKuQbhPK3r4LWAAMBHsB+ETpoxGPaq99pXeCCO
 z8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=ZNUVQBdecvt5COEcoIrcomryAYodxervF1IhwAWuYNI=;
 b=pNo0MNRrx9O6PV/Gc++QpSC6/28wB7qo4txfWT6oBWKN5CSjF2lDQ69Hf7/FvjSz4G
 gx6tEILs55IGOZKrFogGAyHD6Dnfbd1L7it/Ph/gZSaZUOlIgEmKBcDpjmoBA0hV7l25
 pCynD54+6lo+Gs+Z2z+ncq2R9pGFbcWMipEAwVO7AXDoLLq5Km9pv7M+10gYFG/VXBwC
 1SCJxOLv4c9og3vRokyLveAKlQTZhs32ZHl84PLjJRUDdH110ZYeDSS9gUODTWap8RUF
 muDiVdINlw1rj1JMElMHW0uHNWZfUSQ0H9FmgZKuKzjmUvoN4dbltzs4fMcSN2VPeGSQ
 ac/A==
X-Gm-Message-State: ANhLgQ0ovscnqW1S555AA74OGo4C0W/bCpTdLzE0SArCKrIN2o2sR+3F
 Ac5jEDgw6yvG4SJh8XbgMHk=
X-Google-Smtp-Source: ADFU+vt5/H0AnFJwDMLEM03AgTdCqm0Bd8EJoF2XPratD08Zg8UuZuQ7nCX0zDh6qLPa92Alyja/hg==
X-Received: by 2002:a17:902:a518:: with SMTP id
 s24mr16532704plq.157.1584157083999; 
 Fri, 13 Mar 2020 20:38:03 -0700 (PDT)
Received: from localhost ([193.114.108.19])
 by smtp.gmail.com with ESMTPSA id 129sm34913634pfw.84.2020.03.13.20.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 20:38:03 -0700 (PDT)
Date: Sat, 14 Mar 2020 13:37:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200306073000.9491-1-dja@axtens.net>
 <1583543617.bp71axgtlo.astroid@bobo.none>
 <87tv2wigj7.fsf@mpe.ellerman.id.au> <87lfo7q0cb.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87lfo7q0cb.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584156888.f924kplz26.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens's on March 11, 2020 9:03 am:
>>>> So:
>>>>  - change the test when setting up a PACA to consider the actual value=
 of
>>>>    the MSR rather than the CPU feature.
>>>>=20
>>>>  - move the PACA setup to before the cpu feature parsing.
>>>
>>> Hmm. Problem is that equally we want PACA to be sane before we call too
>>> far into the rest of the kernel ("generic dt parsing code").
>>
>> But currently we call into that code with no paca at all. Or rather,
>> with r13 pointing somewhere random that will be interpreted as being a
>> paca.
>>
>> This took a while for Daniel to debug because depending on how you boot
>> r13 contains a different junk value. That junk value may not point to
>> memory at all, or if it does the memory it points to may or may not send
>> you down the wrong path, depending on which exact bit you're looking at
>> in some random location.
>>
>> So this is really not about kcov from my POV, that's just how we
>> discovered it.
>=20
> Ah, yes. I agree with mpe, and reading back over my commit message I
> think I did a pretty poor job of explaining it. How about this for a
> commit message:

Sorry yeah I'm not quite sure what I was thinking there, because
you actually are moving the paca setup earlier. Hmm. Anyway it seems
okay to me. I would suggest putting a comment in the mfmsr() & MSR_HV
test so it doesn't get used elsewhere. Maybe include CPU_FTR_HVMODE
in the comment so grep shows it up.

Thanks,
Nick
=
