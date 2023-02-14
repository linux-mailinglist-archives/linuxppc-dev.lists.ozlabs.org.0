Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC9695B8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGD9N4CWQz3cML
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FL1ODDD/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FL1ODDD/;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGD8V1d9Yz3c34
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:57:45 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id k3so7065086wrv.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 23:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/y3DoebXU2aSRTyTPgatGNryU5LQnPO9lrblNWAcqag=;
        b=FL1ODDD/dH0Fe6e9PftNHR2p1QM5RdtNbSNzqlK8pNihYv6DfVt9L8P4pf7gFWx8t9
         y7Myyo7fNfEgvIVHxiwayOczBTVyPShNBJ+OyPBbO2TGT73uZHOhE3xZtTrnwGF0MT+v
         t8HDjwcNYJ3GyE9n9IqdapPU+YITuv62k93vOPRVKNP4lguYU+6Ab9dRsm/1X2dXcAVB
         5VOmuk01NjVUhEIq+/0xsdIu4HhgQwnS4aeU6D7zwtcEsT7QviV6e0w82yhAQ3D1LK0D
         EflN9bEH39Ng0giNeci5B2LCie2rjDM+BdrF7iU+PFyH9SNv22kw1gwN55V2cUJYlnUa
         Ft5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/y3DoebXU2aSRTyTPgatGNryU5LQnPO9lrblNWAcqag=;
        b=yLR6RfQ82iTMYZEExhs3zlHIKhoZl8NHLFks3pbWC0f8k1gG9Y1eYSvastH6eQG9bj
         cp2Xwc4g1VZlK4Kmg2By9ug1jCI20ga2aObJB6/E9wqoMJXaXpHxwwaDx6PjxIG1UTLR
         sqb8bf25KTtE5Hwr9ObhVNfB6VDaYW+IeRYz0bIE7Ka3wuLo2VPsJ3lxb7xg9PRn+vB/
         yre+3OKGoASfOYCXWeusgYdC1LK29C5LeiWWuXYcYiIfRla7ApXhslxLhVpW+WA9zuF+
         fo4E4TQKamDDPusU2n3g2MS/loRHVftonNQ1Iuwy/MaXwWtJCODOW3Ru4jiY/H07Dizi
         xhUw==
X-Gm-Message-State: AO0yUKWw2eqE+NqtSqB5bL0qUAkXNmgep+iVRr/lnebjLzxhZrPa6CLj
	l+tcrisG+GVE0iPxiS4LyTow4w==
X-Google-Smtp-Source: AK7set/s62h/fO0i39nDWEPXBi6NKjg0gNVQNim1tERqh4PVsEAEgwi+kKdJTAleWFN9GVgtgNq8RA==
X-Received: by 2002:a05:6000:8b:b0:2bd:f5bd:5482 with SMTP id m11-20020a056000008b00b002bdf5bd5482mr1139258wrx.28.1676361462875;
        Mon, 13 Feb 2023 23:57:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002be505ab59asm12483785wrp.97.2023.02.13.23.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:57:42 -0800 (PST)
Message-ID: <2575e5f7-b11a-020f-06ef-ba42301d7415@linaro.org>
Date: Tue, 14 Feb 2023 08:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 13/24] sh/cpu: Make sure play_dead() doesn't return
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
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

On 14/2/23 08:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Make that more explicit with a BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/sh/include/asm/smp-ops.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sh/include/asm/smp-ops.h b/arch/sh/include/asm/smp-ops.h
> index e27702130eb6..63866b1595a0 100644
> --- a/arch/sh/include/asm/smp-ops.h
> +++ b/arch/sh/include/asm/smp-ops.h
> @@ -27,6 +27,7 @@ static inline void plat_smp_setup(void)
>   static inline void play_dead(void)
>   {
>   	mp_ops->play_dead();
> +	BUG();
>   }

Shouldn't we decorate plat_smp_ops::play_dead() as noreturn first?
