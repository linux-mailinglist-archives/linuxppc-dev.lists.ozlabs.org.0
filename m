Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4F1FAB5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 10:35:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mM2v6qCWzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 18:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bZJl1RxZ; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mLyc3yG6zDqnk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 18:31:36 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id x6so19759541wrm.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jaN1YSp7LZkDAge8c4wsn3ghBgplCfBlNLVxBmZ75EA=;
 b=bZJl1RxZOxEthuticY8IolQiYgEQBVGKn4aC6+AwgR14q/IV72DFH1ixxpypBQ9DHr
 MySjbGs7Ra7yacgcSOqQzy9oqsZugfQGXU9d6n9UNFDZQUYw05RZm1hqS8iMNrXsyaCj
 x4Wjxadc9rcacTs5YpXKDcN6e/5TB/g9eeDZ//Z4s1pW/+Ou8F5Jb/fD1ziH/X/S2Gf1
 56K5vLBFqy1faXQ5KaM4tOUiaatYrWMu6yY3AtyWzmHpgyeMdOzX/j17OX00Q6gJRLjv
 jLN3n30hspv5cF4MdbghhvdF/6dXH/vDUlVIELLlX99JnrUX4kvxWXi/yirFuojgz2bD
 EWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jaN1YSp7LZkDAge8c4wsn3ghBgplCfBlNLVxBmZ75EA=;
 b=oOQfINeB4jmvHw5iL5JkOpg0kdC7DxgzRgx7tgyvKMqs8hA5jtzPLkyXBy5qOkPPrc
 doCIkMOOqT+ur6Lb6dcmYcggfKqQ/tXZGJGxD2Wc8ofHsiuc6wzEMKtqs5LlEK4iPLAL
 2wTMdgx0WzV3Xz/+73Q+z0Y+KqXBFheXYiN2PFy40CIxxzpjEq7lc01W13N4IBuqwzxK
 0qGILU3+6ihZ28g2g1Xb2FJxIO6WppH7FY52R/og+t0zfuXKCDBsSeHvo3Kp3rMJrIib
 pUESyb/pF1WRhC9MJ/FAzIQI6YCq9kHyALyB/ScmSG7x60EQnkkX3X8VTES7r8UfbXOv
 hLBQ==
X-Gm-Message-State: AOAM533EeFaMQPNyhPlSf7nWbdCcshYfvE5DYsBD6wXLZgns46/2k40c
 GceNg6Rai4Q0D1cIn2vrdELGhA==
X-Google-Smtp-Source: ABdhPJynT54R2+ECAa7/ZqX4VA4v9ObDCNGSoNKSEGPY2JLMe1/yTyG/HcLhOuklMUkTMP2w8XNcRg==
X-Received: by 2002:adf:9163:: with SMTP id j90mr1770497wrj.65.1592296292489; 
 Tue, 16 Jun 2020 01:31:32 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id u4sm2957273wmb.48.2020.06.16.01.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 01:31:31 -0700 (PDT)
Date: Tue, 16 Jun 2020 09:31:28 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: Register governors at core_initcall
Message-ID: <20200616083128.GB122049@google.com>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-2-qperret@google.com>
 <20200616042831.3kazrpvvjhbahoaj@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616042831.3kazrpvvjhbahoaj@vireshk-i7>
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
 adharmap@codeaurora.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, mingo@redhat.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 16 Jun 2020 at 09:58:31 (+0530), Viresh Kumar wrote:
> On 15-06-20, 17:55, Quentin Perret wrote:
> > Currently, most CPUFreq governors are registered at core_initcall time
> > when used as default, and module_init otherwise. In preparation for
> > letting users specify the default governor on the kernel command line,
> > change all of them to use core_initcall unconditionally, as is already
> > the case for schedutil and performance. This will enable us to assume
> > builtin governors have been registered before the builtin CPUFreq
> > drivers probe.
> > 
> > And since all governors now have similar init/exit patterns, introduce
> > two new macros cpufreq_governor_{init,exit}() to factorize the code.
> > 
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> > Note: I couldn't boot-test the change to spudemand, by lack of hardware.
> > But I can confirm cell_defconfig compiles just fine.
> > ---
> >  .../platforms/cell/cpufreq_spudemand.c        | 26 ++-----------------
> >  drivers/cpufreq/cpufreq_conservative.c        | 22 ++++------------
> >  drivers/cpufreq/cpufreq_ondemand.c            | 24 +++++------------
> >  drivers/cpufreq/cpufreq_performance.c         | 14 ++--------
> >  drivers/cpufreq/cpufreq_powersave.c           | 18 +++----------
> >  drivers/cpufreq/cpufreq_userspace.c           | 18 +++----------
> >  include/linux/cpufreq.h                       | 14 ++++++++++
> >  kernel/sched/cpufreq_schedutil.c              |  6 +----
> >  8 files changed, 36 insertions(+), 106 deletions(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks!
Quentin
