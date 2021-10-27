Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C504843C9CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 14:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfSrl43mdz2ypX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 23:37:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux-powerpc-org.20210112.gappssmtp.com header.i=@linux-powerpc-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=7cNaNMcq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux-powerpc.org (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=kda@linux-powerpc.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linux-powerpc-org.20210112.gappssmtp.com
 header.i=@linux-powerpc-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7cNaNMcq; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfSr12mn7z2xSH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 23:37:03 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id z20so9788764edc.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=A04H0Pimc5BNToHsv+Vq4ctk94TFH1r8efNYCAJX67c=;
 b=7cNaNMcqDq+fZf8LKx7RYklmH6PMOp4kUEh4hehCOdzkCqn90PDTbPsE4QrB4jrSGu
 czuhIdbzw7Dhc+EkFhmzvRSzB/NFhYQtbCh4kbDB1IHeMEaXkUX5jbyjTVdrAoKVhpeu
 d1pB8jlGDemXLDFpfxDijS1U+GY4yRhSA2VRHPp++PpfNGpXed54alOVrFDeuRHUBiJA
 cD9F432ORrAjzzcLhkOsqPzdkfIY263nYhf7GMBlb/wGvirdLmCyPLl0fU6uK3C66QFH
 8C4gS09HsjQLTV0Wp4bVa5873oku3fhBYObqMUMnfXtUzUCvkS1yOwHK8oaW4WDJa4ut
 o6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=A04H0Pimc5BNToHsv+Vq4ctk94TFH1r8efNYCAJX67c=;
 b=DqjrFJQurBR/oeTEc07Sx8HC8IY9ZkcAnV5Fg1mIOF27iMahf4g0HHrQkzT+7TkvBD
 6GOSDGcBRrZVnCqdaHNwmbX994c0/B7DPy42TrMvetm4VAbfJ7vXkaHgy2GtEM0fYupP
 ZgcNZItFmQx/gmfqTIdmPusQNe+L0jkaUvoMaaiWWSGY6HJtUhFskU4acIbeW/hXi4Q6
 l8zElLShIfiHFTNEVHmr7dENxAMOarpyHatHv4KaAGyH3po6W0c6ToCkO/b0ohJtzbLQ
 44JjFbiyDxlSYoeCbNmNiA4UgZCvVxdsgS/b5PRVW05/KulHRuYWZxPm6K5oONAmVGph
 kckA==
X-Gm-Message-State: AOAM531hFElNJK2vFF2Rc3cah2bKOUrSQj5HlXg7sz2vnNsXXVi66BpC
 zLvqo/K9T86A+7cNjdyx3UGKyfy9BtUx63iYdrNw0z8Xo3q6lw==
X-Google-Smtp-Source: ABdhPJxBGoiSrGtpKh8pwPP2XnriZkYqiJaBmuJa8qI9PekSDPM3ajOCnhMIhdOSUNLRPjqFgWUJUMJ+q/NSsj81v2A=
X-Received: by 2002:a17:906:16c9:: with SMTP id
 t9mr11240347ejd.104.1635338217499; 
 Wed, 27 Oct 2021 05:36:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:7acd:0:0:0:0:0 with HTTP; Wed, 27 Oct 2021 05:36:56
 -0700 (PDT)
X-Originating-IP: [5.35.48.193]
In-Reply-To: <87bl3bb7bg.fsf@mpe.ellerman.id.au>
References: <20211026133108.7113-1-kda@linux-powerpc.org>
 <87bl3bb7bg.fsf@mpe.ellerman.id.au>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Wed, 27 Oct 2021 15:36:56 +0300
Message-ID: <CAOJe8K09bJJ8Qdvx6GZ25ou3UUYJCdEjuz8QB+YGgb=oLOmExw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/xmon: fix task state output
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/21, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Denis Kirjanov <kda@linux-powerpc.org> writes:
>> p_state is unsigned since the commit 2f064a59a11f
>>
>> The patch also uses TASK_RUNNING instead of null.
>>
>> Fixes: 2f064a59a11f ("sched: Change task_struct::state")
>> Signed-off-by: Denis Kirjanov <kda@linux-powerpc.org>
>> ---
>>  arch/powerpc/xmon/xmon.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index dd8241c009e5..8b28ff9d98d1 100644
>> --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -3264,8 +3264,7 @@ static void show_task(struct task_struct *volatile
>> tsk)
>>  	 * appropriate for calling from xmon. This could be moved
>>  	 * to a common, generic, routine used by both.
>>  	 */
>> -	state = (p_state == 0) ? 'R' :
>> -		(p_state < 0) ? 'U' :
>
> I guess 'U' meant 'unknown'? I always thought it meant uninterruptible,
> but obviously that is 'D'.

Right.

>
>> +	state = (p_state == TASK_RUNNING) ? 'R' :
>>  		(p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
>>  		(p_state & TASK_STOPPED) ? 'T' :
>>  		(p_state & TASK_TRACED) ? 'C' :
>
> I think a better cleanup would be to use task_is_running(),
> task_is_traced(), task_is_stopped(). That way we're insulated somewhat
> from any future changes.

In this case we end up with some states wrapped with a macro but
others are still explicitly checked using p_state variable.


>
> That would add additional READ_ONCE()s of the state, but I don't think
> we care, the task should not be running if the system is in xmon.
>
> cheers
>
