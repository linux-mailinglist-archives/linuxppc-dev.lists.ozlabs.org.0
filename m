Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBEDDBBFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 06:40:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vYJ11Xj3zDqkq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:40:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="bAJAZ7ts"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vYFy31wwzDrDf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 15:39:02 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id w3so2630141pgt.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 21:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BZNeQBeDGAyLMoRdSAbVO0kzqdA4HOw3dFZcIwAbSRY=;
 b=bAJAZ7tswXf0oXbHqjYQDAMHA3fSiDLD+u26iHQS3x7Py/AcVrPNdS1oryA/TMrWe1
 C9PD+y8lawPz88eAyR5kk9Ml2o0a2TFQNKQxu5nv0Wko1NLrNPGhbDP2SiubBiHlhq0v
 1/91vfMvcO6zUodpEcXtTf8sait3hj8kvN3nmEjjbwNbCByc65QH7tQoCwZ/LtTheEIu
 JSQoVll7PmAV+02dufnMm9xRZK1sROHW51Meb3G071rNEmxfzM4+2ywSAAVe158ND1G1
 S0cq0spmyRYEcz+YmtAujZEgme/2JwqP/4M5ouQeOV35ynsE5W8NRjmV3HAGu0kn5htQ
 A4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BZNeQBeDGAyLMoRdSAbVO0kzqdA4HOw3dFZcIwAbSRY=;
 b=ibGjqvpRZO872+kBLerCvJYCoXlttZLNfGkJL/PNyVPrk2fy++lCCKUD7iRj7b25lo
 ipBwDk2K53UdH/f7cpDHpSNn0VJiazf33V/kAoCK+CiODoRPx173EEfljaqc2CFQk1ok
 zodsrFgr+JKqSVqoSFA5KC9FsY5fpZ/JOAczVjp1xiDRkoRz+x8ACXxdngaLkMnSL54S
 F5P/LYv3PeuSXw4j1yx+mvu9ctcH7nMScTNz+cVAMwh6hh9q8WDAdBbIw/WfXUFwkfld
 fJmCbE/Z+y1BfemcWo1G2Gzcmyg4z8jlUQ8PlWnhSTxlEpHDZaMHAkJAnEgjZ+Mu9a9/
 8s5w==
X-Gm-Message-State: APjAAAVdeFU+isG3WHVjhvrOo488i56aS6iVAzN574uvFaabpjvzWNnI
 vRuYGHG4ZjPWgXzNqzOEu0lhEg==
X-Google-Smtp-Source: APXvYqydfwa25JKZYYeWbwxFsqUZQ8NzYboAYSS65MWiR5DAcXqWJJZyILycxPAp3epGgyJMNw3bqA==
X-Received: by 2002:a63:1b59:: with SMTP id b25mr8029273pgm.267.1571373538882; 
 Thu, 17 Oct 2019 21:38:58 -0700 (PDT)
Received: from localhost ([122.172.151.112])
 by smtp.gmail.com with ESMTPSA id f185sm5139382pfb.183.2019.10.17.21.38.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 21:38:57 -0700 (PDT)
Date: Fri, 18 Oct 2019 10:08:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] cpufreq: powernv: fix stack bloat and NR_CPUS limitation
Message-ID: <20191018043856.srvgft6jhqw62bx3@vireshk-i7>
References: <20191018000431.1675281-1-jhubbard@nvidia.com>
 <20191018042715.f76bawmoyk66isap@vireshk-i7>
 <c3f16019-5724-a181-8068-8dda60fb67fa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3f16019-5724-a181-8068-8dda60fb67fa@nvidia.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17-10-19, 21:34, John Hubbard wrote:
> On 10/17/19 9:27 PM, Viresh Kumar wrote:
> > On 17-10-19, 17:04, John Hubbard wrote:
> >> The following build warning occurred on powerpc 64-bit builds:
> >>
> >> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
> >> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > 
> > How come we are catching this warning after 4 years ?
> > 
> 
> Newer compilers. And btw, I don't spend a lot of time in powerpc
> code, so I just recently ran this, and I guess everyone has been on less
> new compilers so far, it seems.
> 
> I used a gcc 8.1 cross compiler in this case:

Hmm, okay.

I hope you haven't missed my actual review comments on your patch,
just wanted to make sure we don't end up waiting for each other
indefinitely here :)

-- 
viresh
