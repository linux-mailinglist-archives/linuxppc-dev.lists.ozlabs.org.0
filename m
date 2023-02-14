Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C7695C31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 09:08:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGDNT0dhgz3cMR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:08:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TIQ23jpn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TIQ23jpn;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGDMK1kwnz3cDc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:07:09 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id h16so14688896wrz.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ciz48yn0bC9pSOawr6J2EVonTfRljnaqRRwbx5UW/W0=;
        b=TIQ23jpnzQarzd1RIe9VRIRAG/Spi2nIIoQJ/TneQakxj6QFyv7ubfVNIbXnkNccLI
         9YHADgP0ZcuahSTpp0itHxB0vnxid9R3STW2gWzzjJJRY3KVMZwyjGmKniKDMGXJnD/6
         hDCyLOAQegB/dwr9q127CSBA2/hqxOG01KsSqmOE86OrEQspfFq+Z3AKGUE1cclZrXkJ
         f+EqgIFwlzxpbPLrsLQTru1Q/+CAIVzIK+aLJtFBqFOqcw6/nRciSXI/ohQrTMnNTXcW
         9hI2Cm3He0kpAaFodIU30P6FToJ/AvzSfa+UmY2I7DpLnZCKW3ePhquo9Mo0AfQ0lt9E
         DdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ciz48yn0bC9pSOawr6J2EVonTfRljnaqRRwbx5UW/W0=;
        b=Ii3X7YPfU14FlGrK5Vm8eONcFlhi+HsCJi2uq9IKBeM4cWJEqJDmEJB9brdXEY307S
         IXCTSijn/QZM8WcF4gXZd/uzzFouQEVa7C74Cv8NzYH59Ls+iddhpw7ezbJS2juOMzMf
         jKou4bixUlqRUWrYp+4YWWQixeYkjIAvwUfoEENwfdpKh92rDJiMtlVhPuXHBtZuGurs
         qAJMB2DWo50eIL6+TA729lYrvVGKYrfc6h5VzO8ynhAlxVgkl9n3iWWJfJAHnUGiTPEd
         jnRNSSApSaSDdkGhGVGE6u3PCThFPOfMxul2gLNzM9v0QIel+LsnHlVFV+/ZWfsGEruv
         gKuA==
X-Gm-Message-State: AO0yUKVVtL37E6sdGCNlxy5U1LeFGNe8mjxEhUUd85CBFPcwuDPSYkyC
	DBew4hlMznOH2MSG+hflztWiCg==
X-Google-Smtp-Source: AK7set/qu7AARZd3PE61K+4RewTMhIGOBtMo65cTnHm+ATiqbV6nbjgYgV5TQbegZ2uwdy9X7E8sUQ==
X-Received: by 2002:adf:e54e:0:b0:2bf:c09a:c60e with SMTP id z14-20020adfe54e000000b002bfc09ac60emr1274577wrm.2.1676362026121;
        Tue, 14 Feb 2023 00:07:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b002c3f50228afsm12138404wrt.3.2023.02.14.00.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:07:05 -0800 (PST)
Message-ID: <6c4fc38a-ba24-fff8-7bdd-b633a79200db@linaro.org>
Date: Tue, 14 Feb 2023 09:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/24] ia64/cpu: Mark play_dead() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <7575bb38417bd8bcb5be980443f99cab29319342.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7575bb38417bd8bcb5be980443f99cab29319342.1676358308.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 14/2/23 08:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/ia64/kernel/process.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

