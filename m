Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C273A7AEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:39:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G43Dm4K1Jz3bw7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 19:39:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=leurNynn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=leurNynn; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G43DF6qqgz306T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 19:38:51 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id e7so8172978plj.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PT5mbjvdx2HxMX/QdjqkC+HPc3LQLFGZl35taHu0Gv0=;
 b=leurNynn2Ym4I8eJRJ8ITDpkro8kCcJq03WoPQ7wedZzmqq/q4Bgtzldh+QJP5+NRs
 IySJ7mKMg0PSRjsWAPfNSItAP5YR+pDswnmNEompGnwnF714Y+6Sq75MTOfIdVJpHnAt
 v5Kiv7OmsAoCwT4S+1ndkR/QCBeiMgjjacp/8VhEDGo2SfqqZ3mXvS641seqnR3P6o9Y
 tTFr48E4PIkYHhukbyIWLSlKx+ftW17V8GljwXA7TsVmE/R72OVk5U1j+1lihpIase9E
 Q+3IVaGFlKv9DxtUtepfcRJKqP0zpvpu7f7Sy3PAySgch7ON25unQGbQEA+6M2eGrJxF
 c8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PT5mbjvdx2HxMX/QdjqkC+HPc3LQLFGZl35taHu0Gv0=;
 b=ZpMw2NxD8im4l7X2rsi7LeXDD5SnAGi4NkE4h+7rhhQVp/HrtqBncej4TWiXgBLlGI
 ujkuZs98C12G2DDC1Rj1mIforCDJLL7KAelEyH997RCvuq8Fp6fapkPvem6LZt853Nv+
 bGFf24OcasAn+seGvZO0stWKSmunN+f8EvvOrms6ulkeN7DwYpLRUXzGmaTyee6GEtpv
 8kzZWTg2fRO0r1Bl/yKY7wpbB232geNJA1r0zV/GU3yYsaGoUgGrGMTqZCBlxG5WN2ZK
 QCphRSI4dby6bCiFPrjZaHu0ana8RrcX9TVOmpzoSar4Lqmx6EzHgY8CeKuv6GcODq4h
 7hVw==
X-Gm-Message-State: AOAM532s3SW1/+U8CZLZGBP8pDEbLC5d/tmohbVJb6WdNQ/lk5Z1Twl9
 7VD5iZ5XN3rOIEn2Wk/sQ9i+mg==
X-Google-Smtp-Source: ABdhPJxsFlohdS7mjeYLdOkiOwIUqH2UlCDQUGYFvf/ey5fNMpdpRyveDyIrp2+g9YX7cEqRW23lTg==
X-Received: by 2002:a17:90b:803:: with SMTP id
 bk3mr4019450pjb.224.1623749923181; 
 Tue, 15 Jun 2021 02:38:43 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id r135sm15639130pfc.184.2021.06.15.02.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 02:38:42 -0700 (PDT)
Date: Tue, 15 Jun 2021 15:08:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Qian Cai <quic_qiancai@quicinc.com>
Subject: Re: [PATCH 0/5] cpufreq: cppc: Fix suspend/resume specific races
 with FIE code
Message-ID: <20210615093840.a5bca3a6bgmkorwi@vireshk-i7>
References: <cover.1623313323.git.viresh.kumar@linaro.org>
 <eaaaf171-5937-e0f2-8447-c1b20b474c62@quicinc.com>
 <20210615075056.dfkbiftuoihtrfpo@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615075056.dfkbiftuoihtrfpo@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: linuxppc-dev@lists.ozlabs.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Dirk Brandewie <dirk.j.brandewie@intel.com>, linux-pm@vger.kernel.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Rafael Wysocki <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Ionela Voinescu <ionela.voinescu@arm.com>,
 Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15-06-21, 13:20, Viresh Kumar wrote:
> I can see one place where race can happen, i.e. between
> topology_clear_scale_freq_source() and topology_scale_freq_tick(). It
> is possible that sfd->set_freq_scale() may get called for a previously
> set handler as there is no protection there.
> 
> I will see how to fix that. But I am not sure if the issue reported
> above comes from there.

I have tried to fix this race and pushed the relevant patch to my
branch. Please pick the latest branch and hopefully everything will
just work.

-- 
viresh
