Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC316CBF53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 14:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm8Qs4QQ9z3c38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 23:40:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=0A9PhD6J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=0A9PhD6J;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm8Px54fSz3cLB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 23:39:16 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id a16so10645633pjs.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1680007154; x=1682599154;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UutT42ZBflgVUT3VbqbBg0lfJ8B58grigNouyyh8hi8=;
        b=0A9PhD6Jtt1np5ZIeXIMyaEKE4xOsatY30/a1q24dk5EOBKiaxGJGLaZEPx7IdsOEW
         8ksXfStHF5UqAmhkioFTBxmAHkTqjfN1kTZmHNSakVq/f57fo3Lcw4Ob3RYep8ofzxG2
         wRg/6oVixG3s/UA4VaKmNLZjsXmWpidOOBTsCTXxbDIEsLUNz6nbE683OtGAiGeDm3Md
         UR+JVPTmcKn0l8iBh9ZrYgx/e2LAUU8ruYzosCdgIh0UJ/h/ys/0NktKeupQWxfO+9vb
         sBwY24s9WWJukU/Aup9kaqTrn6sFm6QXRM5H4OVgimfASYjldm05txqJuMY1OcYWjhkP
         MHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680007154; x=1682599154;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UutT42ZBflgVUT3VbqbBg0lfJ8B58grigNouyyh8hi8=;
        b=TyqSWDSgYPGEsNUuFbgLcnYriBXWq8lEt0YAJkR5sYFJDv2ffHg2Ejaq/Jicfss8WB
         fK/qCN4iyk1jd1L4TkyzIvFAhytrz0mB1s/19LG4ZjlenlL9DwdL4yncJy0/F/Ff4g4C
         /vswOPX8PkHHrGCJNtHPpI20VrW7/vPrBRYp7nbuQWLXn/HOw3sNCjuhYWMWpUK2yirq
         A7iPl7kMC9G8hZHVFrzM4bf5XGkUGYeCilOCcFut5lRjaMIWJ4w3yZkAxaWHMK+Y8svc
         Cz6wrskMQJytKw/pcvpc9POzNL2fvujxHlz3In1CZh0z0TB2VM+/sohUiVDBcTD1MzwD
         wVkA==
X-Gm-Message-State: AAQBX9fwLitdijAgkwS4n01cz0rY02HDFptqQifa2T3m45iMithNZ+uX
	GJq7/Rx6N2wGcoeZaEJOKTKz3posegcb8cbSC3vwWQ==
X-Google-Smtp-Source: AKy350Z8SILTB8UZWbYNHb6ayVrS1+zCM3Spi2kzWFM+ip0Jix5OY0bkfJvR2fsJ3a+ploQai3IHjw==
X-Received: by 2002:a05:6a21:32a2:b0:df:e8b2:ffb4 with SMTP id yt34-20020a056a2132a200b000dfe8b2ffb4mr7916970pzb.3.1680007153910;
        Tue, 28 Mar 2023 05:39:13 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id l62-20020a632541000000b004fb10399da2sm19918519pgl.56.2023.03.28.05.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 05:39:13 -0700 (PDT)
Message-ID: <6408fa0f-2fa9-f734-e318-fd57b8d31df8@kernel.dk>
Date: Tue, 28 Mar 2023 06:39:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <87lejhcdrh.fsf@mpe.ellerman.id.au>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87lejhcdrh.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/28/23 5:32?AM, Michael Ellerman wrote:
> Jens Axboe <axboe@kernel.dk> writes:
>> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
>> from my (arguably very short) checking is not commonly done for other
>> archs. This is fine, except when PF_IO_WORKER's have been created and
>> the task does something that causes a coredump to be generated.
> 
> Do kthread's ever core dump? I didn't think they did, but I can't find
> any logic to prevent it.

kthreads aren't associated with the original task, they just exist by
themselves. They also can't take signals. Eg they cannot core dump, just
oops :-)

This is different than io workers that do show up as threads, but they
still don't exit to userspace. That is why it ended being a problem.

> As Nick said we should probably have a non-NULL regs for PF_IO_WORKERS,
> but I'll still take this as a nice backportable fix for the immediate
> crash.
> 
> I tagged it as Fixes: pointing back at the commit that added ppr_get(),
> even though I don't know for sure the bug was triggerable back then
> (v4.8).

Thanks!

-- 
Jens Axboe

