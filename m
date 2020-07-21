Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC219228306
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 17:02:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB1zW2jZbzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=daniel.lezcano@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SnBgx4Gz; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB1tK5hZFzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 00:58:01 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id a6so2382446wmm.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=P69TuXHvKNdQBsX1NlqieN+/6fhlcIyh2dYab6XhtNw=;
 b=SnBgx4Gzfcfd974HbTiO6hEVYFWvZ58XMHaSjnkdia94BS6Kfyy1kSjtt3SLY1jUwv
 nm5CGZ2YELLVOYdBig3YU9pqubCGvfIDE8T8yGs2i9lZ8ybJJJ/2U0TBNvbiM5Nm5efU
 Az0OUSooBItyLMK6Fiez5Ddx3TmQCjL5cU9trk1HvY05OqnsAgO6fXfwLIHzBa1rJXvV
 bAWNI7etXswlx2uGkFWCmkk29lxfKaFMwIYCOWBThBiCp3vZb2yWMP9esJ0sMpRrD5tl
 TWV7N1u34O7ubcmuhTr7L+oZlbdBCC4dA24VCxg2SD0elWD72u1wvTJvYpnZG7vumr4C
 rpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P69TuXHvKNdQBsX1NlqieN+/6fhlcIyh2dYab6XhtNw=;
 b=qb0D8t5PHWAHXCTPNnNlrJzoB00fHBRqlRuxyMx6RkBv17KbNVK30Q87DqoqK8ziuZ
 J6cnEpNu+3i3WQfceAU4wxlWo5kezH92AtcIW4qLQPjMyDvBoDE19xeBlTfePHAgzrVg
 EwzYDZfalyHsNzCfQYW2F/QO6RwPyMoN3KxLADCHqs8EH+A9I9+8XDA3HsO5ztGP14RN
 aI72aBinb3q59dxzx+tG3aUz3sYgkKs7JsUQnRouJxNCs8KwFk6H1Lfssj0VezCAzJiJ
 eFa0YVGDJ+vdvh6nlHTpGn0M60s0gkfNUa7y00AFbrvv4MIdPKgIUAP8L2jtH+B163WQ
 +6Ug==
X-Gm-Message-State: AOAM5330YfDGOm9Bw1QQmhDdb/az2SpqDGbyu5KVNGr5RudNLARfYSRL
 /qOil72UU+lfBvtDggDlcMRXow==
X-Google-Smtp-Source: ABdhPJwmyYPpJ7IlGzdg37/DHGP0G/PgZIfG3gVw3ye2a3qGLs9fU5dW3PkSOTTiGnteyAU6Eht4DQ==
X-Received: by 2002:a05:600c:2f88:: with SMTP id
 t8mr4396008wmn.186.1595343477981; 
 Tue, 21 Jul 2020 07:57:57 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c144:5385:c824:85ce?
 ([2a01:e34:ed2f:f020:c144:5385:c824:85ce])
 by smtp.googlemail.com with ESMTPSA id d18sm40382259wrj.8.2020.07.21.07.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 07:57:57 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] Selftest for cpuidle latency measurement
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>, rjw@rjwysocki.net,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 srivatsa@csail.mit.edu, shuah@kernel.org, npiggin@gmail.com,
 ego@linux.vnet.ibm.com, svaidy@linux.ibm.com, pratik.r.sampat@gmail.com,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20200721124300.65615-1-psampat@linux.ibm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <17e884b8-09d8-98a8-3890-bf506d2cdfca@linaro.org>
Date: Tue, 21 Jul 2020 16:57:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721124300.65615-1-psampat@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/07/2020 14:42, Pratik Rajesh Sampat wrote:
> v2: https://lkml.org/lkml/2020/7/17/369
> Changelog v2-->v3
> Based on comments from Gautham R. Shenoy adding the following in the
> selftest,
> 1. Grepping modules to determine if already loaded
> 2. Wrapper to enable/disable states
> 3. Preventing any operation/test on offlined CPUs 
> ---
> 
> The patch series introduces a mechanism to measure wakeup latency for
> IPI and timer based interrupts
> The motivation behind this series is to find significant deviations
> behind advertised latency and resisdency values

Why do you want to measure for the timer and the IPI ? Whatever the
source of the wakeup, the exit latency remains the same, no ?

Is all this kernel-ish code really needed ?

What about using a highres periodic timer and make it expires every eg.
50ms x 2400, so it is 120 secondes and measure the deviation. Repeat the
operation for each idle states.

And in order to make it as much accurate as possible, set the program
affinity on a CPU and isolate this one by preventing other processes to
be scheduled on and migrate the interrupts on the other CPUs.

That will be all userspace code, no?





-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
