Return-Path: <linuxppc-dev+bounces-5594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A862A1D564
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 12:36:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhRFC3cbrz2yft;
	Mon, 27 Jan 2025 22:35:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737977759;
	cv=none; b=W/VKij4UBgDFb6pV0SIKBUynHcCTmq+MuJPkKv8mte8pLBDqpVJE4upbqXhGP0Z6vNlrXzKYizGKqEk2BTmLYzv6n5syqtD4gFPdF2u0rnGZduWS1OeMgAaRJkd7wihBVkDJzOs4wcMViDRCol/F1bsYr4IaGoypVn2NnTSkcTDPJ7QHMlCX9yKLGqzlaL0JxTO28H/x72wun2Vfj8wlX6etmB6SoCG2KDpOHqAV98Ws31PZrebPdla9lgTs475OHH279kxmD23/3LujiCL2B5eA9wNm9WlLtQprnaDDeeM+Op+xby8rinqXfkQIZWSyf4dm+qm/q53coO21rlDchw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737977759; c=relaxed/relaxed;
	bh=8zb5dDSWfAPbQtfcZhMyII0+GP9Q7wdaQN5r+kGdVO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6GaFMe9t4EhrQrapbmdumqriUeTbdtf3AvableTV8sdGb1vJG7sF5dmR5+BnKRmpqsaE+DGePjAGFBzIg5nui73JJbecKwt1Ek5HbK6F6TaDMgC7F4/mLBg0bR1h4DT0jQE/E5C/jRf+yp0OBv3GFaqNRaBdaVHociDyCo5067U33BBhwfv6WME2l6C6z2ds5WsXsB7pwI/PGOybjLrsUuGmPK7ocFO28ckrPaTf7ps2c3SYnaoU6jFfmVkfSJoGlSuLwCswwW0LjBbiXDeS/3Xr4kr3yfEs7dyyJVg/5q1zUaomVTg/0p8GeVzk5oMsSnRyAfKOZTogc2TbzzWjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HpbGU2ye; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HpbGU2ye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhRFB0jXgz2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 22:35:56 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab651f1dd36so862415366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737977753; x=1738582553; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zb5dDSWfAPbQtfcZhMyII0+GP9Q7wdaQN5r+kGdVO8=;
        b=HpbGU2yegczg72SWPQx27w7YRCfQTEmjzh97+H178j4RNNWPejtkwy4XCem5IrE7/G
         f5lpwm8pNc1ZRS+oU5mkNGpIKapEZypK1gm2ZnzPtB7Ox0HMyUVL/TTyAugYbu/2ogut
         8sICNlyZk76j2pety7opGl+V0MUqfeU58cb9rKPRRApWm9NbU1TOKG+7u3oWwM8uhhDr
         PyjvChbU20lrxiSqJZGRsM7XRQ175irMDeB3BJeIHMYyLcrF10I3Wap5eMPUFLscCQIq
         nGJpKoHa4laRfEQCWXr8sZxjUNsv6dC7e0worsYjo7E1qxIuR4Mv2/sbHzqOAtZ//SwQ
         xiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737977753; x=1738582553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zb5dDSWfAPbQtfcZhMyII0+GP9Q7wdaQN5r+kGdVO8=;
        b=QqIWi0r6r+YYLadurUfAEG39PMMydO31AUf1jrVeUEqzIgm9w1XRJeVk3yI/5mihYg
         Fbzxp2oMLmiQJBqlwH4dd2hEw8BwSjQr2d8Rl/sh9c8Mcyqom4ueFwdOlw0UCgTV/4NA
         rUPaKpx/9e2UCALFFx0nLBKYd3neShtGwMRAzZ1tuKq/amCsLa3OCMW09LTpxToqL8W6
         2iu4JFDBwBjTN5JE30/HlrD9PJ5i9S0JVAkgc5jR/kzPvY8eJ0X/gNqb8DLx6HCuP6jB
         KxiS1vAtQd0wFtCUfISVF2L0a1ARWqDXczCtyF18YxuTn1aGoqBCT0zEMXjO/qpf5HbV
         PprQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgFuPkRMP1YF3FItEKaqgipF5FlyFWstzzG0N2o1obSZitKqDaeh4MxNSD5SpBBRwFnJwTxkPBQooiBTM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxmi7jyIQxOSKvN42PbPbkzZh6C2jQDCq5auHiUuyGntGEQ6Sk+
	oi6jiymLGX+Qes3Fw19M66pqatNmyTNPN8wU48WdeI40m63qCK4jZ95ZFTW4JW4=
X-Gm-Gg: ASbGncv23t4HUUkUX7yADa+ThUaXNCtx0dlY8JogkdGlE/Yowse6Mqq5Lgx1+0YGSJx
	nTiL/yR3d5FuNqMH3Gbm7qhd4uaxYmnyD6TGIg+kI4sLd+pu0bc38xJgY8bbscVwuwbsRG8Ygmx
	FvuQHKas3l30akns6YhFZZRT9D1zHkSrmk1NE1VsnwdJbKwfLctgQaj2qyAwm4K5KOr3LbfJy6z
	eQheiGfc3KduRnoncN38I9B7ATYfLrTrld3Ob+eRG97D9KuZiDMHuXG6MfwhytMo+Th50EmR6ac
	M51Bqrw=
X-Google-Smtp-Source: AGHT+IES/sxEF+BZSWJQAk5rNdbZSsrSF6vi3KXJQiYSQuO9FLRRC5atvuAKwpmQ4GGZa33a2aw0kQ==
X-Received: by 2002:a17:907:60cc:b0:aab:c35e:509b with SMTP id a640c23a62f3a-ab38b4bb44bmr3667711566b.55.1737977752859;
        Mon, 27 Jan 2025 03:35:52 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbd46sm574262766b.135.2025.01.27.03.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 03:35:52 -0800 (PST)
Date: Mon, 27 Jan 2025 12:35:50 +0100
From: Petr Mladek <pmladek@suse.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: jikos@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
	shuah@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
Message-ID: <Z5dvluAy6miSNyw4@pathway.suse.cz>
References: <20250119163238.749847-1-maddy@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119163238.749847-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun 2025-01-19 22:02:38, Madhavan Srinivasan wrote:
> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER,
> which adds the caller id as part of the dmesg. With recent
> util-linux's update 467a5b3192f16 ('dmesg: add caller_id support')
> the standard "dmesg" has been enhanced to print PRINTK_CALLER fields.
> 
> Due to this, even though the expected vs observed are same,
> end testcase results are failed.
> 
>  -% insmod test_modules/test_klp_livepatch.ko
>  -livepatch: enabling patch 'test_klp_livepatch'
>  -livepatch: 'test_klp_livepatch': initializing patching transition
>  -livepatch: 'test_klp_livepatch': starting patching transition
>  -livepatch: 'test_klp_livepatch': completing patching transition
>  -livepatch: 'test_klp_livepatch': patching complete
>  -% echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  -livepatch: 'test_klp_livepatch': initializing unpatching transition
>  -livepatch: 'test_klp_livepatch': starting unpatching transition
>  -livepatch: 'test_klp_livepatch': completing unpatching transition
>  -livepatch: 'test_klp_livepatch': unpatching complete
>  -% rmmod test_klp_livepatch
>  +[   T3659] % insmod test_modules/test_klp_livepatch.ko
>  +[   T3682] livepatch: enabling patch 'test_klp_livepatch'
>  +[   T3682] livepatch: 'test_klp_livepatch': initializing patching transition
>  +[   T3682] livepatch: 'test_klp_livepatch': starting patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': completing patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': patching complete
>  +[   T3659] % echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  +[   T3659] livepatch: 'test_klp_livepatch': initializing unpatching transition
>  +[   T3659] livepatch: 'test_klp_livepatch': starting unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': completing unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': unpatching complete
>  +[   T3659] % rmmod test_klp_livepatch
> 
>   ERROR: livepatch kselftest(s) failed
>  not ok 1 selftests: livepatch: test-livepatch.sh # exit=1
> 
> Currently the check_result() handles the "[time]" removal from
> the dmesg. Enhance the check to also handle removal of "[Thread Id]"
> or "[CPU Id]".
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

JFYI, the patch has been committed into livepatch.git,
branch for-6.14/selftests-dmesg.

I am going to create a pull request for Linus' master by
the end of the week or next week.

Best Regards,
Petr

