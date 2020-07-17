Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92A223289
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 06:43:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7JRP6myszDr2d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 14:43:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=daniel.lezcano@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QYlBGm2n; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7JPS73ytzDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:41:58 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id o2so15304393wmh.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 21:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e92SkAAyZTPdbiUDDLKt4ub11HxoW06Bz+od+u+J3rk=;
 b=QYlBGm2n1WOvNPFxDMHEX5j3VsP2tSLKuUYmhOWujHtdQn5gIwgmcCpynAyj+paJ5k
 HS1/1SPIVem4wy3VkGTEPOW8DGuheluydFgtiyZDpIWhr+PdnmiQbPqqTTS3QlJ+3muH
 ZO1CKwOIpTgPpIx8TGCnwMoI4eBFZs0xMosVkPbNbmH9AjiByt5MFwzxBHCnx6278DbL
 euO66DN5RSmAwpLYAw+jMWNU7EmoOzK+c91EunAxlmzMqKz2bqKRj2A+Ttaw+jFDiGLY
 KVNAarLaNzSLjLKga2mu4SOCk+pSJ16UzdxoPw83Nd/b/pVMMSlyC/yudQq1oGZlrHws
 DeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e92SkAAyZTPdbiUDDLKt4ub11HxoW06Bz+od+u+J3rk=;
 b=tRoYRVIngM/y6IGpT4ZyBoa40fjS4Izy4HuC3kTztU9KAIH8C5NT6zNSE6nQT0P1R9
 VPiBctsZCzYJXWgn9z90bCftqj4tc/lWl6qCXDdxE+yvgZHA4TrJLEmSWDvBD1isQyTG
 436LjjCbKr0TryDt9sdVX+D7If0cdmFbYuYFuH+81NF24ta030wcqtn6NumUFEXd3dZW
 rff2tJ/rss5BxKzniIwff+fs6CmsW32ZYPze1Cd01WhiO/X3+tnQnZOnOoz0pWy4UHOI
 CcyH/uHojs522iHkazehQo9uk9CJyyj+GdEPA2HLBzatH/n+uSt5y7cnW+K4fOIfMBio
 7g8g==
X-Gm-Message-State: AOAM531Pu/3H7piWsnr0ZmrQ4+NZ+lzDJewVFmu+b1d+HuV5PVj16K/g
 2OlDB8nrQkmCti60FWnysIhs9OT/LpU=
X-Google-Smtp-Source: ABdhPJyhdG/qFhVvJwxDNm3W2ApPczeqwAnc0F2Kwz7lRaHf6kvkVNG/Vb56gm/e4WPhAmTujcfNoQ==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr7425817wmi.49.1594960914036;
 Thu, 16 Jul 2020 21:41:54 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9880:a643:3e69:6393?
 ([2a01:e34:ed2f:f020:9880:a643:3e69:6393])
 by smtp.googlemail.com with ESMTPSA id z8sm12071528wmg.39.2020.07.16.21.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 21:41:53 -0700 (PDT)
Subject: Re: [PATCH -next] cpuidle/pseries: Make symbol 'pseries_idle_driver'
 static
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Hulk Robot <hulkci@huawei.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200714142424.66648-1-weiyongjun1@huawei.com>
 <159490401706.3805857.7133480973769495238.b4-ty@ellerman.id.au>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <90efd96c-ebd5-3fa2-12fa-d76cf82e1cc2@linaro.org>
Date: Fri, 17 Jul 2020 06:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159490401706.3805857.7133480973769495238.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/07/2020 14:56, Michael Ellerman wrote:
> On Tue, 14 Jul 2020 22:24:24 +0800, Wei Yongjun wrote:
>> The sparse tool complains as follows:
>>
>> drivers/cpuidle/cpuidle-pseries.c:25:23: warning:
>>  symbol 'pseries_idle_driver' was not declared. Should it be static?
>>
>> 'pseries_idle_driver' is not used outside of this file, so marks
>> it static.
> 
> Applied to powerpc/next.
> 
> [1/1] cpuidle/pseries: Make symbol 'pseries_idle_driver' static
>       https://git.kernel.org/powerpc/c/92fe8483b1660feaa602d8be6ca7efe95ae4789b

Rafael already picked the patch.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
