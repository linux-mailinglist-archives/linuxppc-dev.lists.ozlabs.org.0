Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87268C99E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 23:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9h3C4C6cz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 09:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JRNn2PN7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JRNn2PN7;
	dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9h2D2dV9z3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 09:36:35 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id m12so14797786qth.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Feb 2023 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DY9UghIbQImNpjY3G2+UNsb+fzCnSZLDGPSaq6J2Oe0=;
        b=JRNn2PN7IQA8wrp++7waMCjV2w3MVSBHQy2yaFY5E1eD/qAR5eFFrTUqd7HHZZgOOh
         BKtoIdcfXcvfEkOkPxAPoMpSqz/4LLVV5QTg6sU/i6Ss894Zt1lunVB1YipN7YIy8x0+
         QHb2wW9sDuw07wqO8wKDOF74KYPEloiw8B7aDMqTs/WEYWrqrWe8u2TVT6mCHQjo3ppz
         BtPI49HLyU8i9EE65/3VpD4dZ9wc31UuOfGfWqaEw5Yo34lcugLN63L7bFLGCgoYQWwI
         4GTPN3tXbT1k6DU4Gcw03RgD0rJtIc2M2RiwxziJmhZNdqrRvanB+Br5nnhGtkocLLSf
         9qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DY9UghIbQImNpjY3G2+UNsb+fzCnSZLDGPSaq6J2Oe0=;
        b=a2PotAyEk+GfDuEg8yfr0UseurDmxSsYeq9XZbmGW+EeFNb+LFULBJrhy9OdDPZuIo
         yZHu83ubmstrtHG4QV8Ts1T5ErADSmwo78xoi/QwLL7ocoZQ5DI6YCRbCI2jPF7ZIz2x
         wZsVnhO2fybnrgonC6mmg/1UyBeWPASdtazQToy3xiHIyfHZIsFR+i8ubWCivV2CqZ5c
         U4RIOZvo3CMygZiQvtvbZs0TdQpvrIwqPOgBhB2AQXofU54DTHEpRoWr4qkI2cts50sB
         CEu8UgLXc39HWabL6QzOO8NIVqnddXjQzkq8GJn3cioRDy2sI9No6iI3JVb87Y7AulRU
         Gwlw==
X-Gm-Message-State: AO0yUKWD9TKUlUv/UTSH4cmfTOZNR1RB5HnBYmN6FXE8VbdekoB4Qjha
	IPymMBumif/2f2T7xxJ4O/I=
X-Google-Smtp-Source: AK7set9k2xF1YO2aQZ8CAhnjLiRZSUooGquww3S7+RRW4y3x8DAu2vUxYsVCmwjFnjGnk8wBa2p/ww==
X-Received: by 2002:a05:622a:19a5:b0:3b6:9736:2e9b with SMTP id u37-20020a05622a19a500b003b697362e9bmr1444580qtc.26.1675722991277;
        Mon, 06 Feb 2023 14:36:31 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d11-20020ac8614b000000b003b856b73e8bsm8147231qtm.16.2023.02.06.14.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 14:36:30 -0800 (PST)
Message-ID: <efaa5dfa-cf00-d68f-2b7c-911b70b4cb5e@gmail.com>
Date: Mon, 6 Feb 2023 14:36:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 09/22] mips/cpu: Expose play_dead()'s prototype definition
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <a532966831383927f5f4fbec0a1e13304588685a.1675461757.git.jpoimboe@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <a532966831383927f5f4fbec0a1e13304588685a.1675461757.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-mips@vger.kernel.org, linux-alph
 a@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/3/23 14:05, Josh Poimboeuf wrote:
> Include <asm/smp.h> to make sure play_dead() matches its prototype going
> forward.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

