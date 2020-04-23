Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D31B547A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 07:56:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49764v43wFzDr4t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 15:56:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rashmica.g@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VGd0rReY; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49762v08X8zDqCb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 15:55:00 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id v63so2401812pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 22:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=5TkCgsJ6jGYJafIpG2czpVFF76TmWseZ48BWUtuSmqc=;
 b=VGd0rReYf7YXX4LMXxFLSmiByBOgjXzFPhMO+MABrQfdH5LdnhywQlPjRT56oimUmd
 sWxCI9sRfNGFoPi7ClOKNm035cyeX+UCUKpAi+AeQSgoDGjYTQgblFSjrZX1gxTk0pBD
 mUslxJ93jQDTpt7VwlQsQf7jujvjOsYwph4JxUevFi8ecEjKZlUJey9sMNo3fVuVGMkD
 uZ+We7M3yQLuXDbleBQ7z9oSg9qMnptiQ+wscmRJS7qNyUFiTbpxqx6Hx0c+gmGYZyxY
 tWooDHnVQD32S0TJZ2aVRFZ5TDECICBSjdNHUJFRS9MJn6ElaJn9Mlt6tsQ9rsnwt4Bm
 si3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=5TkCgsJ6jGYJafIpG2czpVFF76TmWseZ48BWUtuSmqc=;
 b=PF4dkFsazUFxLgdLLEUGcQsKmqsI71m1Zdts0xu8wtjDHfXQWVfzdy+tVglaauBvC+
 bROe89fk1r3hTS+TcO5LuY9lPz9mbbkJa+5hpP02DM0l0bznvGA9Zzyx45XyeeKmb8jI
 ZRqiTbeGy3L8cRFFtYBrQXie7V4iQk4D3fHYYby4N5lChNa88pJw3Jku/5lz2jpxEtK5
 ysPS/VXmIDcAs0mK3/guKOV5LZbE7HVtImY08TYaB1QocjlRNYYY3zKg9CQySnPY4lNI
 CSKHfd/ad+LogSN7qQ5qt99NLBGGdrJPgC4J7nU/ARGNzZenGT8EO6QcZc7xTjCVB5o7
 xTrQ==
X-Gm-Message-State: AGi0Puaxal2qdHCwhtvojhprRrm90s0SwevG1CAtqp2qxmByQl9nY8mO
 xoAStr8iTc2vXbboTuE7dso=
X-Google-Smtp-Source: APiQypLhOq5ZGABYCrOC+3kaiFE/kppLPXlIDuh7AKzQT2NMwbmcBfmio7gWps4qOkBPIblc2apGRA==
X-Received: by 2002:a62:6443:: with SMTP id y64mr2174963pfb.13.1587621296803; 
 Wed, 22 Apr 2020 22:54:56 -0700 (PDT)
Received: from rashmica (150.24.220.111.sta.wbroadband.net.au.
 [111.220.24.150])
 by smtp.googlemail.com with ESMTPSA id z25sm1398808pfa.213.2020.04.22.22.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 22:54:56 -0700 (PDT)
Message-ID: <0ad1e32c27a7e4d14e992eee03587f3cd0fd76eb.camel@gmail.com>
Subject: Re: [PATCH 3/3] selftests/powerpc: ensure PMC reads are set and
 ordered on count_pmc
From: Rashmica Gupta <rashmica.g@gmail.com>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org
Date: Thu, 23 Apr 2020 15:54:51 +1000
In-Reply-To: <20200408223543.21168-4-desnesn@linux.ibm.com>
References: <20200408223543.21168-1-desnesn@linux.ibm.com>
 <20200408223543.21168-4-desnesn@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
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
Cc: shuah@kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-08 at 19:35 -0300, Desnes A. Nunes do Rosario wrote:
> Function count_pmc() needs a memory barrier to ensure that PMC reads
> are
> fully consistent. The lack of it can occasionally fail pmc56_overflow
> test,
> since depending on the workload on the system, PMC5 & 6 can have past
> val-
> ues from the time the counters are frozen and turned back on. These
> past
> values will be accounted as overflows and make the test fail.
> 
> =========
> test: pmc56_overflow
> ...
> ebb_state:
> ...
> > > pmc[5] count = 0xfd4cbc8c
> > > pmc[6] count = 0xddd8b3b6
> HW state:
> MMCR0 0x0000000084000000 FC PMAE
> MMCR2 0x0000000000000000
> EBBHR 0x0000000010003f68
> BESCR 0x8000000000000000 GE
> ...
> PMC5  0x0000000000000000
> PMC6  0x0000000000000000
> SIAR  0x0000000010003398
> ...
>   [3]: register SPRN_PMC2  = 0x0000000080000003
>   [4]: register SPRN_PMC5  = 0x0000000000000000
>   [5]: register SPRN_PMC6  = 0x0000000000000000
>   [6]: register SPRN_PMC2  = 0x0000000080000003
> > > [7]: register SPRN_PMC5  = 0x000000008f21266d
> > > [8]: register SPRN_PMC6  = 0x000000000da80f8d
>   [9]: register SPRN_PMC2  = 0x0000000080000003
> > > [10]: register SPRN_PMC5  = 0x000000006e2b961f
> > > [11]: register SPRN_PMC6  = 0x00000000d030a429
>   [12]: register SPRN_PMC2  = 0x0000000080000003
>   [13]: register SPRN_PMC5  = 0x0000000000000000
>   [14]: register SPRN_PMC6  = 0x0000000000000000
> ...
> PMC5/6 overflow 2
> [FAIL] Test FAILED on line 87
> failure: pmc56_overflow
> =========
> 
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>

Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>

> ---
>  tools/testing/selftests/powerpc/pmu/ebb/ebb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> index bf6f25dfcf7b..6199f3cea0f9 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> @@ -258,6 +258,10 @@ int count_pmc(int pmc, uint32_t sample_period)
>  	start_value = pmc_sample_period(sample_period);
>  
>  	val = read_pmc(pmc);
> +
> +	/* Ensure pmc value is consistent between freezes */
> +	mb();
> +
>  	if (val < start_value)
>  		ebb_state.stats.negative++;
>  	else

