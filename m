Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E730EF3A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:07:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWXkH2j2fzDwvh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 20:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OC3+gauD; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWXhQ0p77zDwsC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 20:05:41 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id lw17so4768041pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=HoYXKbq7iFG0NmliHyDmYYl7Vf7a7yCWCs1Obx97Xe4=;
 b=OC3+gauDZ1StP5DXAT+/EXh//KGSlw9TQmYbtCNbx4/7WSvg/SuLePDJWbpsdN4MfR
 bYaBoy6myxGfBgdfGtnpsRbjiCzhIpAl3CPOi2Lf5DnQgAxjloc9oM+qsYq0epMN92eB
 6T77cOMIZfdGBRMBfgX9a2iXc9pVBZvdp7oHhDyqTyUmlkTWnyDrP/3rayg1rh6Zh/b1
 4WyT6Gtsmsy98cTF7Vn/QcrJbWGbkCaym/ohREawyBRB+Ih0l5ZPdyG7UKPSW1K2Xif6
 d6oGquQ5/h1dpFHMlNrUAAjtdJ6JtmLVXiJHH5tTfMm1Sv+4dp5MCAXOpj9wzlWlTPU4
 GFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=HoYXKbq7iFG0NmliHyDmYYl7Vf7a7yCWCs1Obx97Xe4=;
 b=IGCtrTJep3mrIeC/1hje4SQagxclQqAIYIlLmImcA3zCTTUGiKdx72220CHqu2UXlp
 sg1XE0hfttx/v527i59MQOTN6X236XyO1I4KzaEuIsd0GgpoonIbPDhGAKL+ngteScHY
 j0i/pqjs6nY/VsntGzd2CMzb/JIIwfaF81yPcOhZE8YEg3g6wvP4z4YGiUXlLy06kODP
 jIZNmRpiLDhWTVpelTEdP7QgFFENDcRpUCa/ZGoVDo7D8pOSrQS7j4xd8z0O5XAHn4Yv
 djfNQlZnCTtL2akGs9dYNcr5ffdUz/4QQuz6pfc1wcYnpzk9g3W2gJxcWAI7wpoXcszX
 wieA==
X-Gm-Message-State: AOAM5336JxOtxOzh7G5Jr8Ssa+heLDYTw/WhUT+G0fqn1+1D3ymCdG8b
 +bVJ3KuqcdvV2bB93JD1MG9gAnhbuAs=
X-Google-Smtp-Source: ABdhPJx82e2HSVJ7qxCgx/XX8pwSMf+ldJO8b/RtfguUbOksTfRoQfG759UEng3Ll0Py8QS7SpTrNw==
X-Received: by 2002:a17:90a:b887:: with SMTP id
 o7mr7577708pjr.234.1612429537452; 
 Thu, 04 Feb 2021 01:05:37 -0800 (PST)
Received: from localhost ([1.132.251.255])
 by smtp.gmail.com with ESMTPSA id d133sm4823040pfd.6.2021.02.04.01.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 01:05:36 -0800 (PST)
Date: Thu, 04 Feb 2021 19:05:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc64/idle: Fix SP offsets when saving GPRs
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <C90JVYFOGWU0.1C2DRATSDH0FM@geist>
In-Reply-To: <C90JVYFOGWU0.1C2DRATSDH0FM@geist>
MIME-Version: 1.0
Message-Id: <1612429032.j2hz14yfcw.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christopher M. Riedl's message of February 4, 2021 4:59 pm:
> On Sat Jan 30, 2021 at 7:44 AM CST, Nicholas Piggin wrote:
>> Excerpts from Michael Ellerman's message of January 30, 2021 9:32 pm:
>> > "Christopher M. Riedl" <cmr@codefail.de> writes:
>> >> The idle entry/exit code saves/restores GPRs in the stack "red zone"
>> >> (Protected Zone according to PowerPC64 ELF ABI v2). However, the offs=
et
>> >> used for the first GPR is incorrect and overwrites the back chain - t=
he
>> >> Protected Zone actually starts below the current SP. In practice this=
 is
>> >> probably not an issue, but it's still incorrect so fix it.
>> >=20
>> > Nice catch.
>> >=20
>> > Corrupting the back chain means you can't backtrace from there, which
>> > could be confusing for debugging one day.
>>
>> Yeah, we seem to have got away without noticing because the CPU will
>> wake up and return out of here before it tries to unwind the stack,
>> but if you tried to walk it by hand if the CPU got stuck in idle or
>> something, then we'd get confused.
>>
>> > It does make me wonder why we don't just create a stack frame and use
>> > the normal macros? It would use a bit more stack space, but we shouldn=
't
>> > be short of stack space when going idle.
>> >=20
>> > Nick, was there a particular reason for using the red zone?
>>
>> I don't recall a particular reason, I think a normal stack frame is
>> probably a good idea.
>=20
> I'll send a version using STACKFRAMESIZE - I assume that's the "normal"
> stack frame :)
>=20

I think STACKFRAMESIZE is STACK_FRAME_OVERHEAD + NVGPRs. LR and CR can=20
be saved in the caller's frame so that should be okay.

> I admit I am a bit confused when I saw the similar but much smaller
> STACK_FRAME_OVERHEAD which is also used in _some_ cases to save/restore
> a few registers.

Yeah if you don't need to save all nvgprs you can use caller's frame=20
plus a few bytes in the minimum frame as volatile storage.

STACK_FRAME_OVERHEAD should be 32 on LE, but I think the problem is a=20
lot of asm uses it and hasn't necessarily been audited to make sure it's=20
not assuming it's bigger. You could actually use STACK_FRAME_MIN_SIZE
for new code, maybe we add a STACK_FRAME_MIN_NVGPR_SIZE to match and
use that.

Thanks,
Nick
