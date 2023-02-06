Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FEF68C9AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 23:39:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9h5F4L0yz3f7C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 09:39:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gbg0RnDr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gbg0RnDr;
	dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9h385z1rz3ch4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 09:37:24 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id i12so8034092qvs.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Feb 2023 14:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2oBtxwWwjCPYyU17pu3lBwV9dmGFDQEYRoN+Ty55Io=;
        b=gbg0RnDrkEtPW9M9RcaDfqIaD3j5DMKgNppT25xHFz30aj9NTwFnwpbnaOLwXXhlRZ
         QOD2yBmRv+YeFmZkMj+FhGdSwVNXqCmW7skH37un5SuKUUfepwjqwXPCYumStY2RJP1U
         khj85lSeq3MEz8a0hbKrHO77vVv+3IJVswBqBvqaNW5v7961BQ6YJt7njEEoj5xry82G
         KoE7kVMauqpDG7hVLzqhTiqX/punkjXxIZ6ogZ0RIoBCEm7LTq4xvEybh0lsQWrxezF/
         s/gYh+8nSzJWTOnx4yewLISyuXcq+Sy89H36bl0rI5S9xupPWOMaMVVGcS6dYvPPHLpa
         pk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2oBtxwWwjCPYyU17pu3lBwV9dmGFDQEYRoN+Ty55Io=;
        b=Ok1Vx8az6khCukYX3x0zZeEzoxUpJ93Scv7VWwCaA26DTqXybvf1PfCWsx2Kq/UgeZ
         lSRKPngvHg4fA03DwW3QDwq8XwA3KpB4RimJB9WWgzXwjEljIqXlQUxZj/AAZ6CnyLBw
         Jko38k5n5u0VEAAs8h9Z9h45um7eRH2uuwo548SL0LAaBnLbNBbC9RryA1LCp+fCXDDi
         9eJf72AkX/G/lo8wmBVkvgL5Xa1iyHz/dsi6vKN9dNdaQ+qAwA8lsWrWt+h2S/2Ij69J
         S6j9jiKC+IRTSpNPujZ87D0geu/TF6DMMnSec1DsFxSWQIdZUxl3EDvyUOl/u6cSNmJI
         wl+Q==
X-Gm-Message-State: AO0yUKUdL41hzYHURPS8ijWJ6l0pPhecyu0zLCRrkx0qWCuQvt6BWOcy
	/9NhSMxNecUKE+5G2o+KChE=
X-Google-Smtp-Source: AK7set/souzQpPd5P9nDBDN5p287ExonEIT5vFztObwMnaHLBbSYhQ0mLbkJiRyT+L9bqtWvcgL78g==
X-Received: by 2002:a05:6214:400e:b0:537:7566:5098 with SMTP id kd14-20020a056214400e00b0053775665098mr1547455qvb.15.1675723041926;
        Mon, 06 Feb 2023 14:37:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id b9-20020a05620a270900b0071df8b60681sm8243934qkp.94.2023.02.06.14.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 14:37:21 -0800 (PST)
Message-ID: <7a21e1fe-82ac-6285-ceaf-6450a7ee4325@gmail.com>
Date: Mon, 6 Feb 2023 14:36:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 11/22] mips/cpu: Mark play_dead() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <829d68d289ad4eeac27c5220be695cfa6ace33f4.1675461757.git.jpoimboe@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <829d68d289ad4eeac27c5220be695cfa6ace33f4.1675461757.git.jpoimboe@kernel.org>
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
> play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

