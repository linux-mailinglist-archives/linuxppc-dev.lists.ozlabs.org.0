Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 355981D5E7A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 06:10:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PBdN0TQ3zDr4r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 14:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mFvRiZhe; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PBbj6MDczDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 14:08:47 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id z9so2152485qvi.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 21:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=JLYon1khC+eLSB3T5yIWcEJuhbgDHgHLlnuv7ZU3dhk=;
 b=mFvRiZhecmwLYm5l9KNIE/vtdE8qUAe9hp2hsnr2PX9xg9BOgVi4qtzyUgtAC5+xN9
 gzr9aPXrekEB6e1OGUlx0Sds6YjHkFWX9tTCtlE2BFfYrt3Hl3N3bLhrSYASAIpmbEPS
 aPxhNJJiyXLxA7+TY4O2EUxcHUdyXOmJ70TelgHJBgOo2hDMetmXztNpjYJoChkP8MeE
 jZwWyDI/egW5yRF1RlbiDyyGLdWwkMAmK38Awt3Q3WTuWq+0vm7iBUc3dE+Dlv6ESLkp
 Ufh91CZ3Dmatr57/8Ng1tQsEXuBq4vACYlwt1/+wfabYrY9SMSsN6Md4NrP12KhaMbhE
 jymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=JLYon1khC+eLSB3T5yIWcEJuhbgDHgHLlnuv7ZU3dhk=;
 b=fwxLFlvBRtB9ieOgxkPiPOJEwaAdNrE/vREL5RixEeMs7U3pnT/GRL/MZ26wSRB4sY
 KsxEiTS40RNgiXcYzpFPon3XC7vfKa8MBpxD4s290faIcN/ud7NOKSyNTxnT+L0g1VTe
 afPN8rkzFPnB11KbFKgcYHz831aOSpaxCtjKXcboEb4MCnGrNIUta3LXAYQYPXiCkIlG
 X8HNHv8oqtshhHnPZuLoZYqwFpI7kI3oQYGVaUUd4l5/ZLPurFHuheqmUUstdvqi9FpY
 WRD46J6ggoNceWgwmU/MTRsNa4bMTeArTrFs+3o8egIefxEcMN06xL5z32xKmazqTCXn
 ThCQ==
X-Gm-Message-State: AOAM530P7eODNEZYG0xAcZmaw5nxitQ3fUPLoEZGqEM3+8wAd1pTliDO
 pY4Hr4FporI57fQXCsPMZjM=
X-Google-Smtp-Source: ABdhPJwV0bAzte0qxgz4LPU+Qi0Jji9W/CS3UUB2E/LXBbuOssBt4QMYPAiKrw/w64nGdh9PtV8R/w==
X-Received: by 2002:a05:6214:42a:: with SMTP id
 a10mr6285253qvy.78.1589602123418; 
 Fri, 15 May 2020 21:08:43 -0700 (PDT)
Received: from LeoBras (179-125-143-209.dynamic.desktop.com.br.
 [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id f198sm3185622qke.46.2020.05.15.21.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 21:08:42 -0700 (PDT)
Message-ID: <97dcf4d840871ae3ce87e3f3c2efbdb709d66db5.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] powerpc/rtas: Implement reentrant rtas call
From: Leonardo Bras <leobras.c@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, Allison Randal
 <allison@lohutok.net>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nadav
 Amit <namit@vmware.com>, Nathan Lynch <nathanl@linux.ibm.com>, Paul
 Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Sat, 16 May 2020 01:08:24 -0300
In-Reply-To: <1589525800.2asfsw2zlu.astroid@bobo.none>
References: <20200514235138.150722-1-leobras.c@gmail.com>
 <20200514235138.150722-3-leobras.c@gmail.com>
 <1589525800.2asfsw2zlu.astroid@bobo.none>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello Nick,

On Fri, 2020-05-15 at 17:30 +1000, Nicholas Piggin wrote:
> Excerpts from Leonardo Bras's message of May 15, 2020 9:51 am:
> > Implement rtas_call_reentrant() for reentrant rtas-calls:
> > "ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive".
> > 
> > On LoPAPR Version 1.1 (March 24, 2016), from 7.3.10.1 to 7.3.10.4,
> > items 2 and 3 say:
> > 
> > 2 - For the PowerPC External Interrupt option: The * call must be
> > reentrant to the number of processors on the platform.
> > 3 - For the PowerPC External Interrupt option: The * argument call
> > buffer for each simultaneous call must be physically unique.
> > 
> > So, these rtas-calls can be called in a lockless way, if using
> > a different buffer for each cpu doing such rtas call.
> 
> What about rtas_call_unlocked? Do the callers need to take the rtas 
> lock?
> 
> Machine checks must call ibm,nmi-interlock too, which we really don't 
> want to take a lock for either. Hopefully that's in a class of its own
> and we can essentially ignore with respect to other rtas calls.
> 
> The spec is pretty vague too :(
> 
> "The ibm,get-xive call must be reentrant to the number of processors on 
> the platform."
> 
> This suggests ibm,get-xive can be called concurrently by multiple
> processors. It doesn't say anything about being re-entrant against any 
> of the other re-entrant calls. Maybe that could be reasonably assumed,
> but I don't know if it's reasonable to assume it can be called 
> concurrently with a *non-reentrant* call, is it?

This was discussed on a previous version of the patchset:

https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.com/

He checked with partition firmware development and these calls can be
used concurrently with arbitrary other RTAS calls.

> 
> > For this, it was suggested to add the buffer (struct rtas_args)
> > in the PACA struct, so each cpu can have it's own buffer.
> 
> You can't do this, paca is not limited to RTAS_INSTANTIATE_MAX.
> Which is good, because I didn't want you to add another 88 bytes to the 
> paca :) Can you make it a pointer and allocate it separately? Check
> the slb_shadow allocation, you could use a similar pattern.

Sure, I will send the next version with this change.

> 
> The other option would be to have just one more rtas args, and have the 
> crashing CPU always that. That would skirt the re-entrancy issue -- the
> concurrency is only ever a last resort. Would be a bit tricker though.

It seems a good idea, but I would like to try the previous alternative
first.

> Thanks,
> Nick

Thank you Nick! 

