Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E09209DED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 13:55:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sz423H5TzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 21:55:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=n3FRfqC1; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sz1N4wM2zDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 21:53:26 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id t194so5614067wmt.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 04:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L4pFCzHJgLhT16AIpG64Yl9/rDj1/+gYvG4jvCw9F50=;
 b=n3FRfqC1licA7sUvOVNsmYWGO4K/7vUEPRhyqo4fBRqJTuRXkEEQHh7uwPCnN+FcSf
 ENydElYHJy9PUQYU9sfu1loBq5H0SIftbO5Sht4ahrm0xfMnJWRT8ci/38Brp/clygPK
 L+kiUfWAo1teGmyfYs8LGk4Be7IorgzrIWkIJkU3+o97MGk2rpkBjG0TTaRxtyGh3tTs
 EeCP+GkZCM3t1EJHFzQFkTYrnf8HsuUcHNDQc4lZ7iWF+4scXEzFr1ns/1MxaOcUwWTj
 JPmiymJ2xlffeNK125ctWiPcqf8r9RQ46JpCxIewZ2tZTAghyq1qmdPz+xuCXqYbiZRg
 gZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L4pFCzHJgLhT16AIpG64Yl9/rDj1/+gYvG4jvCw9F50=;
 b=L064KKwGk3zTDnZwsp/vc0dzr8yFwdvpm0krjO+EQ7f7/5zVGAjN8wWElW1A3UICdP
 vIA59AXxUMHQrvXHXx+ky4aVze+Ba/TPlSedYt3jkpI/Sz9qXEaXipW7bL6Zcc+1LAvE
 qbQc1rm89P6ZAPKQt3ZcNccaoZZYLCMzb/OlqlTWWNakBJAvWm+0MkgqQuT8MJnFLT55
 gqWr6YQwNQ6PM67Y64BlANhBcQpF2KohwZj7uFlRqb9mUnK78kSh5gN59E3ez5B5Ed5h
 vry9lTyR5w+qR6BctEGlRpGLG/IscckY77Cwx1FMDvOQh/gCaelBAZ5sfO+V+4wj83ha
 QWYg==
X-Gm-Message-State: AOAM531Fk56TaMVkDOsaDkKgzBimZqYipQLIKKVkNt8qBkd6JCN30vqw
 B7UpiK2m4j34cb5y9KE38K0A+w==
X-Google-Smtp-Source: ABdhPJzB3iG4QLOlxIPODy0q2tWS2+hoPSsNM/MppS52ewBi9bFqIsOWO5K4QEbJ3JGH6DNum7H2Og==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr3196690wmt.154.1593086002391; 
 Thu, 25 Jun 2020 04:53:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id 104sm32104033wrl.25.2020.06.25.04.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 04:53:21 -0700 (PDT)
Date: Thu, 25 Jun 2020 12:53:18 +0100
From: Quentin Perret <qperret@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200625115318.GA219598@google.com>
References: <20200623142138.209513-1-qperret@google.com>
 <20200623142138.209513-3-qperret@google.com>
 <20200625113602.z2xrwebd2gngbww3@vireshk-i7>
 <CAJZ5v0g=+2OFKVk2ZnmK-33knUwqcaOOQ+q9ZWnmeoBD9KOX9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0g=+2OFKVk2ZnmK-33knUwqcaOOQ+q9ZWnmeoBD9KOX9g@mail.gmail.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, adharmap@codeaurora.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 25 Jun 2020 at 13:44:34 (+0200), Rafael J. Wysocki wrote:
> On Thu, Jun 25, 2020 at 1:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > This change is not right IMO. This part handles the set-policy case,
> > where there are no governors. Right now this code, for some reasons
> > unknown to me, forcefully uses the default governor set to indicate
> > the policy, which is not a great idea in my opinion TBH. This doesn't
> > and shouldn't care about governor modules and should only be looking
> > at strings instead of governor pointer.
> 
> Sounds right.
> 
> > Rafael, I even think we should remove this code completely and just
> > rely on what the driver has sent to us. Using the selected governor
> > for set policy drivers is very confusing and also we shouldn't be
> > forced to compiling any governor for the set-policy case.
> 
> Well, AFAICS the idea was to use the default governor as a kind of
> default policy proxy, but I agree that strings should be sufficient
> for that.

I agree with all the above. I'd much rather not rely on the default
governor name to populate the default policy, too, so +1 from me.

Thanks,
Quentin
