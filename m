Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC768148186
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 12:20:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483xXG0mGBzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 22:20:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=UiiEOmI5; 
 dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483xRH6KG7zDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 22:16:25 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id a13so2023698ljm.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 03:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPh74pEP+nQ76ELzYt+TrcyRCi7yaoOoadSkrfPnPw0=;
 b=UiiEOmI5crrZFnXah+iBEOCV1kFA6HM7uH0AeaaVeCmEY0JQFlbkI5t8sr83qk61jO
 ENI1Xm1UUUGXlAoQn+AgsSPXkmL1Hx34lQhSF7FiDCi+8GlB7JdN5aVzcdCM/RbQbz0T
 gr+P+irrrT+iCw23HnU+FbiaxS5z0yDBgxLkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPh74pEP+nQ76ELzYt+TrcyRCi7yaoOoadSkrfPnPw0=;
 b=SopIF1bMm4mk6BKxQ7vk6eNKY0WsZBRGTfO2RCk57oa3u54WKkZ0NSwbOS6rh87u0M
 otSYr+e8BXokMxaisA4DkWQ9dNKgHc9mkzijbWpG+yIuicqs9CrZgMeeMMJ7znWskp5E
 I4sXhakMmaNgVQ/KSKBMj6e3vDgU6FRZDOTEeT67NEEu2N61RQY6+lslM1k6JgQefHC8
 1jP+M2FrWiYwvO51VHQJdOeixv3Ku4+n1r5rnaKiMjjoSbEuwmtveAWA8VfCImTjFf3/
 WxFhSWdKvgJT5lV6dXy6kdJJP0Qdi5QoYaIHWa5WDRzL2Prk4fFYBrysMqBOubJx81ST
 z/rw==
X-Gm-Message-State: APjAAAUJ4fAR2OBZYoLAQ/9k8pYGP/1Fg0XiMx/cNT+7wp6TtRMGSLVd
 KKpk5KAZ4OlZZcK4TwuhRpNmNMuZ98S5Cd7k
X-Google-Smtp-Source: APXvYqwhcWeDSkhp2yrEeOy7QBdhQdx7TS6ALPFnsE1YmPPh0m3SZYBK+yeJxbdM4du+1HhZ1HMVbQ==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr1853505ljc.271.1579864580100; 
 Fri, 24 Jan 2020 03:16:20 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id t1sm2947207lji.98.2020.01.24.03.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 03:16:19 -0800 (PST)
Subject: Re: vmlinux ELF header sometimes corrupt
To: Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
 <875zh1i0wj.fsf@mpe.ellerman.id.au>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <b5f6ab1c-337e-c5e4-6449-0cf73413e1be@rasmusvillemoes.dk>
Date: Fri, 24 Jan 2020 12:16:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <875zh1i0wj.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/01/2020 11.50, Michael Ellerman wrote:
> Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:
>> I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
>> very hard to debug problem that maybe someone else has encountered. This
>> doesn't happen always, perhaps 1 in 8 times or something like that.
>>
>> The issue is that when the build gets to do "${CROSS}objcopy -O binary
>> ... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
>> that fails with
>>
>>   powerpc-oe-linux-objcopy:vmlinux: file format not recognized
>>
>>
>> Any ideas?
> 
> Not really sorry. Haven't seen or heard of that before.
> 
> Are you doing a parallel make? If so does -j 1 fix it?

Hard to say, I'll have to try that a number of times to see if it can be
reproduced with that setting.

> If it seems like sortextable is at fault then strace'ing it would be my
> next step.

I don't think sortextable is at fault, that was just my first "I know
that at least pokes around in the ELF file". I do "cp vmlinux
vmlinux.before_sort" and "cp vmlinux vmlinux.after_sort", and both of
those copies are proper ELF files - and the .after_sort is identical to
the corrupt vmlinux apart from vmlinux ending up with its ELF header wiped.

So it's something that happens during some later build step (Yocto has a
lot of steps), perhaps "make modules" or "make modules_install" or
something ends up somehow deciding "hey, vmlinux isn't quite uptodate,
let's nuke it". I'm not even sure it's a Kbuild problem, but I've seen
the same thing happen using another meta-build system called oe-lite,
which is why I'm not primarily suspecting the Yocto logic.

Rasmus
