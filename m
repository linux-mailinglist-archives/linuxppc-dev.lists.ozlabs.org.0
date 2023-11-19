Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 764877F065E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 14:23:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wTl7R+FS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYBCq2wZbz3d8n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 00:23:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wTl7R+FS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYBBt47grz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 00:22:29 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-41cda37f697so9099491cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700400146; x=1701004946; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Jnvh0uSqYJOA1ffl5+OCnqgORnNMLUa+bbdwsPJB8s=;
        b=wTl7R+FS+jIdVnGC6CJe9iwqMlhJLSCugyLOb7yWWkrLsHjTuKwzlIS0eAw9NIKUyD
         CVskYkCaBDMVUSxuiBwXJe8y2KiN7NcpYrMSMscNswQNS/LSFJHPyRxhteyLeAtjeRpH
         ciS7jaV6kF+u8OgFsHjbHeRp1i5lb24pHIPs89Kl2OVzOUr/itoM+V5xOgScPmKhFpBv
         4yBvCV5gz8R41MjuijXal33UJi2EDHEomQtqgGhZMIgDQ9EAowE5/4tuWlGLWhbTa8mT
         ZgwM00J1Hh5cTpWxnppR8Zbq+XGt19uADKxFJi+u1EfGiBw1cWhNxOVnG9HinB4qA3PT
         zu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700400146; x=1701004946;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jnvh0uSqYJOA1ffl5+OCnqgORnNMLUa+bbdwsPJB8s=;
        b=LTHOHTqnkGQAXhwmNcYkLYLaPrarFLSZHt4eHppnocb7n/srOApzF+3zxn/9d729Qk
         lwgKDAIttJvxYM68bW/XzDEHJoJfbfmXfBhhKcvguLGKeOA3beRwxGfSm9+zMv1I8qL9
         VKDdTzFCSkW00bjtXEK9p+eBSI/H6TG41K4u5BLwtnvmffo+Lf2LV9r6Zbzd0+yW2D5F
         ynpOgerNfDtaRLXQYWIiDaCBnpeyJpmhsl27UmwT/YiAvB3vZN2eNdXMzJgjqGhwoFa5
         /+OfKwF15mfU75a5uMe3y/VbX1gw8M2sbQFg6nvOUExjSnLydLT5NOCFZmbtijYzlyjG
         1tBQ==
X-Gm-Message-State: AOJu0Yy09t+6KXXlGz+RDal9KDKDeFx5MhoEK8F32k9NjqLrnfivoWZo
	c2/p+Y0z/M17a3Ze5iUskBnBRwxvL0//hfJM1pX7hA==
X-Google-Smtp-Source: AGHT+IGqpRKFev/H7sZu2yvuRrfS/qugUAQdcwysXY76mok/kgcwo5VNtQhAUKhXkSeHKyoj1apkOA==
X-Received: by 2002:a05:6a00:4215:b0:68f:c8b3:3077 with SMTP id cd21-20020a056a00421500b0068fc8b33077mr3375219pfb.1.1700399692289;
        Sun, 19 Nov 2023 05:14:52 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id m12-20020a056a00080c00b006cb6fa32590sm1468349pfk.148.2023.11.19.05.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 05:14:51 -0800 (PST)
Message-ID: <42b9fdd7-2939-4ffc-8e18-4996948b19f7@kernel.dk>
Date: Sun, 19 Nov 2023 06:14:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec register
 save
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>,
 regressions <regressions@lists.linux.dev>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>,
 christophe leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
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

On 11/18/23 4:45 PM, Timothy Pearson wrote:
> During floating point and vector save to thread data fr0/vs0 are clobbered
> by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> and application data corruption / crash under the following rare condition:
> 
>  * A userspace thread is executing with VSX/FP mode enabled
>  * The userspace thread is making active use of fr0 and/or vs0
>  * An IPI is taken in kernel mode, forcing the userspace thread to reschedule
>  * The userspace thread is interrupted by the IPI before accessing data it
>    previously stored in fr0/vs0
>  * The thread being switched in by the IPI has a pending signal
> 
> If these exact criteria are met, then the following sequence happens:
> 
>  * The existing thread FP storage is still valid before the IPI, due to a
>    prior call to save_fpu() or store_fp_state().  Note that the current
>    fr0/vs0 registers have been clobbered, so the FP/VSX state in registers
>    is now invalid pending a call to restore_fp()/restore_altivec().
>  * IPI -- FP/VSX register state remains invalid
>  * interrupt_exit_user_prepare_main() calls do_notify_resume(),
>    due to the pending signal
>  * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), which
>    merrily reads and saves the invalid FP/VSX state to thread local storage.
>  * interrupt_exit_user_prepare_main() calls restore_math(), writing the invalid
>    FP/VSX state back to registers.
>  * Execution is released to userspace, and the application crashes or corrupts
>    data.

What an epic bug hunt! Hats off to you for seeing it through and getting
to the bottom of it. Particularly difficult as the commit that made it
easier to trigger was in no way related to where the actual bug was.

I ran this on the vm I have access to, and it survived 2x500 iterations.
Happy to call that good:

Tested-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

