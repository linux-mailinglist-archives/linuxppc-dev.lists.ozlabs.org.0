Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC0695C22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 09:07:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGDMS2TKyz3cFT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:07:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oq8fELe1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oq8fELe1;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGDLV4dgYz3bbS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:06:26 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id hg24-20020a05600c539800b003e1f5f2a29cso585299wmb.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CexkYCgiU8jqIy3gLQMuVr94YSYODTF1ZIZpmznHWI0=;
        b=oq8fELe1ypAvc08FOz5CbHNTQBld5o23Jvdy+nLY0zG/DnFqza+VDZVuxwBfk8xIVm
         ImZ0fQYX3iD2kpEI2wrrJJ+EOv/ECI1pGCu4gDD9IhpbKAyXQe2Gg+36UgHDi0uWRsxw
         QKFTlhrsHNwTjUGRfM18bUeuqZqenYwJ9+lXPP+TIJmtJqj3qO11s6scjudecRVlXd8G
         yx+52LcS4QzLrkx17Mf0iokjziy/G8h1s4OnVBPi13160Z/MlgxAwmyWSoN4FxAoR886
         R7GzWQlscuhv0+syQCFg7BJqUBMsODphxlVZ4n5BE8SY37bZ4PSRi5tZBcsQ8dac5j5Y
         pIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CexkYCgiU8jqIy3gLQMuVr94YSYODTF1ZIZpmznHWI0=;
        b=Lw1Yua0JwWvs4D76Zhzl+1NlxpD2/xb3puX7qFyFjPBbNkWjoCGUxCpqW6iyP/j4sz
         PJwU5FryupUmPZGrATC/smUfeS+KYLGenDtWwW5c1ap+MLfTW/t1sMjxr1rQSz3as//x
         uydqJUjFkY4w1y9qtzhfAMVX+fC4DoiMY2F4BEZweZlts/BPu/Z0Zd/oM6g2mS9DiDtk
         y0Kq9y5PG2bronvuPzieFB8BDaJZ3LugigurIoFS7HaRj/+4bpKYjj+NK+d2UPnP1Z8o
         GNMC65tgd+KQadIdAON1bU5o56EQyRCZvvSHEyg6MBAYrUYIVv2sIx9uyhlQrrky7Si5
         xO4w==
X-Gm-Message-State: AO0yUKVQDXOyjJ7YqLKlP/yf7pfzgorEH8A7SU74burNOar0X9VwBePu
	ZU9MoRzuOeNXigFk1kV3JgHSjA==
X-Google-Smtp-Source: AK7set/UWPyupxpQUXAnyOBo4TUryVO/JI+oWwYyspwHedd26Hv1CWYJdsr5ZpbLTAOsriaer/Ifsg==
X-Received: by 2002:a05:600c:a698:b0:3db:bc5:b2ae with SMTP id ip24-20020a05600ca69800b003db0bc5b2aemr1053106wmb.41.1676361983644;
        Tue, 14 Feb 2023 00:06:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id he7-20020a05600c540700b003e1f6e18c95sm773496wmb.21.2023.02.14.00.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:06:23 -0800 (PST)
Message-ID: <fa2028d1-501f-523e-7b83-2e72d374812c@linaro.org>
Date: Tue, 14 Feb 2023 09:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 08/24] loongarch/cpu: Mark play_dead() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <4da55acfdec8a9132c4e21ffb7edb1f846841193.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4da55acfdec8a9132c4e21ffb7edb1f846841193.1676358308.git.jpoimboe@kernel.org>
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
>   arch/loongarch/include/asm/smp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


