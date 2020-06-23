Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873B205A24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 20:06:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rvNy3tj9zDqVk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 04:06:42 +1000 (AEST)
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
 header.s=20161025 header.b=DNY2SIEq; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rvLj3r0nzDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 04:04:45 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id z13so9745583wrw.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 11:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KMyNyMJgXdnDE8dwyWtDRLMYZCApSGZoNnTanpCNMz4=;
 b=DNY2SIEqqg213W0g0T1faTmSZ6dBln1UGUK/rijjLxojRCce8hOkLkT+7v4hj73zxJ
 sb2tRMmbp/i2e+0YWsaATQ8zHIWcg2fKZ6Nkj98z5IqY4QNWEDB2mXz69DefkTZn8xx0
 FeWJgsHgkrrDXtkKrEGdm43P3iVhP6zUmtFMxIZDY9weu3Y+eiW5W/nLqhNHdLUhhGoD
 gnT8dPQAcBuRixz5P/BDF6r+WZwVkxThIhMJ0C6qrV5qKzK0IdyZA8eI3ePdYLTX85ag
 0VMr8Sd92U4n19cJ329Sa1NO3O8kWQbPK1I2kMJWRv6SdeT1aDYNTxs0NrmQoa9c0SiY
 dQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KMyNyMJgXdnDE8dwyWtDRLMYZCApSGZoNnTanpCNMz4=;
 b=EuEJpWZ+mKpNCR+CMnbhM4oyv6FgBvXt8/GsOfp7nWCxadG3Sb2T/Akw+BZWngDLju
 yJlJk88cQMxkjkocg932gA3sLgtYoI3TUxHLU5d+aZefIYpqtdVqPo+ocxQ6BP51zgTW
 8jk94p8jyCkwpWdVw0faiSN3pXvM/G815rqE5FCe3LzQ5o8VEZMvudf8fpV5p0GcvnpN
 1QmJF50Sz5oPlnQw3sSCiYjnlvTG5/+T0mykYWj38MR3YInsD9D9OJcqfHtNNgEXlPuD
 B85MZ7NibeYo8YWYaVmIeAis1WZIEm2+DWws4PxEdp0AqPWCQR1WUtPVdV0SdTpKm3/k
 9pnA==
X-Gm-Message-State: AOAM532nPlNjlE3wXOcjPs0ukpUiu59LXOzGZOOTExx4WuNuqSij8B5h
 KMH/27wIIYE1qh1DxQUFCOkUug==
X-Google-Smtp-Source: ABdhPJzf8QrpXcRaMKR0n1A2i2w8BDw+Gir+VgL42qsH/jZ2RAO6SqlzOQkuQuN1npWj+Lpo2pMlsg==
X-Received: by 2002:a5d:5310:: with SMTP id e16mr23887574wrv.289.1592935481174; 
 Tue, 23 Jun 2020 11:04:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id i17sm17528076wrc.34.2020.06.23.11.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 11:04:40 -0700 (PDT)
Date: Tue, 23 Jun 2020 19:04:37 +0100
From: Quentin Perret <qperret@google.com>
To: Doug Smythies <dsmythies@telus.net>
Subject: Re: [PATCH v2 0/2] cpufreq: Specify the default governor on command
 line
Message-ID: <20200623180437.GA248517@google.com>
References: <20200623142138.209513-1-qperret@google.com>
 <002201d64987$5dc93b90$195bb2b0$@net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002201d64987$5dc93b90$195bb2b0$@net>
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
 arnd@arndb.de, linux-pm@vger.kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, rafael@kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Doug,

On Tuesday 23 Jun 2020 at 10:54:33 (-0700), Doug Smythies wrote:
> Hi Quentin,
> 
> Because I am lazy and sometimes do not want to recompile
> the distro source, I have a need/desire for this.

Good to know I'm not the only one ;-)

> Tested these two grub command lines:
> 
> GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 consoleblank=300 intel_pstate=disable cpufreq.default_governor=schedutil cpuidle_sysfs_switch cpuidle.governor=teo"
> 
> And
> 
> #GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 consoleblank=450 intel_pstate=passive cpufreq.default_governor=schedutil cpuidle_sysfs_switch cpuidle.governor=teo"
> 
> And all worked as expected. I use Ubuntu as my distro, and also had to disable a startup script that switches to "ondemand", or similar, after 1 minute.

Good, thanks for giving it a try.

> As a side note (separate subject, but is one reason I tried it):
> My i5-9600K based computer seems to hit a power limit during boot approximately 3 seconds after kernel selection on grub.
> This had no effect on that issue (even when selecting powersave governor).

Interesting ... Could you confirm that compiling with powersave as
default doesn't fix the issue either?

Other question, when does the intel_pstate driver start on your device?
Before or after that 3 seconds boot time?

Thanks,
Quentin
