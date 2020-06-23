Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7A204DE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:27:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rgsk0vyBzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 19:27:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MbtT92jR; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rgqw4Pn4zDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 19:25:45 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id u26so1803701wmn.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q25Robvc8p0VCT45Ku6+CqjX7ikyGj3nKC2Rkm2Sa7U=;
 b=MbtT92jRqhblgP01XYQ289lWx/8/mAZpF2odAygIsMJx7tzVhKf77HPio8ytt2Nlrj
 mz5Hd4SfeetgCbA7EMe00zMQnfEt1VnV895LdA33HSMDUUOhUIvqmY8Baws3UdibTvA6
 Htnjr127Ypdcinq7hAOrpTvgfRiWXrgmo+DATS8V0nsXZRbjyjq0R3I2H/NzzFQ3Qp+g
 tkJgvtIm44r4BqDzPXQwuKHCHw7uGgia3CYyzKlkG6g0jbtx3gIplFyjg/or6P3+F7ng
 yY2DOK4V1zSG0QoAcANXRGjw3nZSAqiNLi/B+R2QuoBPixfWCoBJRUVb3fF0h0BhgInm
 Sn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q25Robvc8p0VCT45Ku6+CqjX7ikyGj3nKC2Rkm2Sa7U=;
 b=WlVzJ3pxue90GR7d7naaVjhvEODALAv3J87Pq32WVuhNSxihRruM5tCAXj3Wc2CPNv
 eKiAbSPeO6s0noGVNZR5sALIL+RWpgmCbiECsAKC8AO7Uy4ZxpHf19IrqV5IPyqjiyJ9
 f1b8sIq746sOMdIOMqbM7I58xupghu/qJE3oT5bZnVi5ukkC0qwenUr3E4gMO7wdGwxD
 FvqsQfAq5nSsCy1BI71X3KAJYauSwgqll9QpnpStulNHx1Cc4tEfLQ/dRytSZztql0M9
 UrNhnMLfbU7RQY+avQSLWtZKoB1DkIEEhf/4n1DnjAXsN273YB9A50FP9VHlCg1DmVIX
 5kxA==
X-Gm-Message-State: AOAM530LAKErh3HybpUMjk/udcCx3k8LCBEWeaKv228g5Nx3yiTGBqfa
 d5d4xxAhPQ6ysnp1bCEFL84GSg==
X-Google-Smtp-Source: ABdhPJyl/Wvp1EmPvPKbYZpgmTNv8myFw0amWQE5G3nU/EjHi1cPOLHWOuSUY3bGl4PIoPk41iA8jw==
X-Received: by 2002:a1c:9896:: with SMTP id a144mr22578733wme.75.1592904340254; 
 Tue, 23 Jun 2020 02:25:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id u20sm2789618wmc.44.2020.06.23.02.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 02:25:39 -0700 (PDT)
Date: Tue, 23 Jun 2020 10:25:36 +0100
From: Quentin Perret <qperret@google.com>
To: kernel test robot <rong.a.chen@intel.com>
Subject: Re: [cpufreq] d83f959b5e:
 kmsg.cpufreq:cpufreq_online:Failed_to_initialize_policy_for_cpu:#(-#)
Message-ID: <20200623092536.GA52234@google.com>
References: <20200615165554.228063-3-qperret@google.com>
 <20200622005457.GI5535@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622005457.GI5535@shao2-debian>
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, rafael@kernel.org, peterz@infradead.org,
 viresh.kumar@linaro.org, adharmap@codeaurora.org, linux-pm@vger.kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, lkp@lists.01.org,
 mingo@redhat.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Thanks for the report.

On Monday 22 Jun 2020 at 08:54:57 (+0800), kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: d83f959b5e7a6378a4afbff23de2a2d064d95749 ("[PATCH 2/2] cpufreq: Specify default governor on command line")
> url: https://github.com/0day-ci/linux/commits/Quentin-Perret/cpufreq-Specify-the-default-governor-on-command-line/20200616-005920
> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next
> 
> in testcase: kernel-selftests
> with following parameters:
> 
> 	group: kselftests-x86
> 	ucode: 0xdc
> 
> test-description: The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> 
> 
> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 16G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> 
> 
> 
> [    8.715369] intel_pstate: Intel P-state driver initializing
> [    8.721146] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 0 (-61)
> [    8.728900] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 1 (-61)
> [    8.736615] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 2 (-61)
> [    8.744400] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 3 (-61)
> [    8.752222] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 4 (-61)
> [    8.760010] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 5 (-61)
> [    8.768077] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 6 (-61)
> [    8.775891] cpufreq: cpufreq_online: Failed to initialize policy for cpu: 7 (-61)

That, I think, is because of the issue I reported here:

    https://lore.kernel.org/lkml/20200615174141.GA235811@google.com/

The v2 (to be posted shortly) will address this.

Thanks,
Quentin
