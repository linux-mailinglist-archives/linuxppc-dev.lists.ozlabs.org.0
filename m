Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D402FDFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 16:38:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F9D74vNmzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 00:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=shuah@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="zBalS9N1"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45F92Z2G4YzDqP7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 00:29:42 +1000 (AEST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 647DB25AE7;
 Thu, 30 May 2019 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559226580;
 bh=MOK0Q0CBcC4ffnKxK65gGpI4OI3xMaujvGqobppRdSc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=zBalS9N1SjTiPLA9KUgcgJ7w4KPB18QNfTkKU0fhz/j2S6111JM6bXUyocTtDqwqa
 8hOyFFM5I5Gg6bzFZcmYtuXdvb9g1/cGVpywc57BC/EZ11XJagh4v6BuOr3brfZbFn
 +dMA/kqAZSEb6t6yd66D41ogmshMWJ+SWQFRvuDs=
Subject: Re: [PATCH v5 2/3] s390: Fix vDSO clock_getres()
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20190528120446.48911-1-vincenzo.frascino@arm.com>
 <20190528120446.48911-3-vincenzo.frascino@arm.com>
From: shuah <shuah@kernel.org>
Message-ID: <dbcf69ff-1fe7-3a2e-5940-11fed052d45e@kernel.org>
Date: Thu, 30 May 2019 08:29:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528120446.48911-3-vincenzo.frascino@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Arnd Bergmann <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, shuah <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/28/19 6:04 AM, Vincenzo Frascino wrote:
> clock_getres in the vDSO library has to preserve the same behaviour
> of posix_get_hrtimer_res().
> 
> In particular, posix_get_hrtimer_res() does:
>      sec = 0;
>      ns = hrtimer_resolution;
> and hrtimer_resolution depends on the enablement of the high
> resolution timers that can happen either at compile or at run time.
> 
> Fix the s390 vdso implementation of clock_getres keeping a copy of
> hrtimer_resolution in vdso data and using that directly.
> 
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Acked-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
> ---
> 
> Note: This patch is independent from the others in this series, hence it
> can be merged singularly by the s390 maintainers.
> 

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
