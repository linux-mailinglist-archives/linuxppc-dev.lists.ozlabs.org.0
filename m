Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1163A90DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4XxJ6PkLz3c9Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:57:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CXo9noL0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CXo9noL0; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Xws2lhMz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:57:16 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id t9so971932pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 21:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v8hbVhD6RJ1rCqy3ceV7Ta+sxe8bF6UYG1xbjeCTyLE=;
 b=CXo9noL0vjRA3eeSlrkRI4PbOiCjOgKwZSSX7sptD1zNOPIDuOns5q7fTqxi8EXrvz
 CwQn8gk0w7d9LOIVVzZFz1S/3FWWvYUDRj3ioS5YpD5PqVQfZXKjBNtBT7QjeOT1fhaW
 0u1eLGHz1ULmMf8SjwAdaQrWF58qTQSTwj+wocPYBf5/7bi8DCrBI7janw5BuXb9Ogfe
 0OnY7pcvtPgVoKDiN9K9t+fkNm/0aO2gb0L+o3nXxUQz0nL1ejLIgJ7J2dsIvylBherd
 XC8Wb95OFk7HGH0cY0/gmpmjv368PedwsBTOz6IVkxkt797CuekKMKKmItugq66s2COS
 wdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v8hbVhD6RJ1rCqy3ceV7Ta+sxe8bF6UYG1xbjeCTyLE=;
 b=PrU2nFSwMOhyWghnaLiain5VBFVhowo+koQfufyVDla2cXNM5mJnS0Gf5MW+drfWXR
 Od3fFh0ViIKhk81HysJHCGJtWfrFu3JDJxYY4B58FXIF5gJZmHkZsdMI4fjRyLho3cTL
 V+HV9WzoEOIVomOu5SQ6zoE7augaJucBBD/gQ1MnkoYRjifeFvo46ALQop1JTWpc9PzK
 0tE7HILnBRwcTmY/lG8RLgXv2xa6tsvjObi+LdVzUOLNcBfiMEiDyg0VSEgvgWSz+oEX
 H+cX8r+QSK9YrDuILxGWcVw3Nv68bZBun0m92EVDep5thrhrq5vSiQaY/IoLYODbdxn4
 CUQw==
X-Gm-Message-State: AOAM532CZYlRmUkug7K2MgaYlR56mBmShMPj4tNrjfCkT/1p4dZ+Rd1Q
 zAqylCN2WvmsP/QwdCbx2urd4Q==
X-Google-Smtp-Source: ABdhPJy6cJ+XpDDStFqxCkawcrPEQQtViQgXyRYzGNQoRG7cyDxZksnDqZhoXVXH0sv3RUuihDLqxw==
X-Received: by 2002:a63:fa51:: with SMTP id g17mr3156940pgk.340.1623819432365; 
 Tue, 15 Jun 2021 21:57:12 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id t143sm870957pgb.93.2021.06.15.21.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 21:57:11 -0700 (PDT)
Date: Wed, 16 Jun 2021 10:27:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Qian Cai <quic_qiancai@quicinc.com>
Subject: Re: [PATCH 0/5] cpufreq: cppc: Fix suspend/resume specific races
 with FIE code
Message-ID: <20210616045709.nudm3ndbipp5nfnv@vireshk-i7>
References: <cover.1623313323.git.viresh.kumar@linaro.org>
 <eaaaf171-5937-e0f2-8447-c1b20b474c62@quicinc.com>
 <20210615075056.dfkbiftuoihtrfpo@vireshk-i7>
 <19527d26-526e-6c6f-431d-7b78ed92bb34@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19527d26-526e-6c6f-431d-7b78ed92bb34@quicinc.com>
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

On 15-06-21, 08:17, Qian Cai wrote:
> On 6/15/2021 3:50 AM, Viresh Kumar wrote:
> > This is a strange place to get the issue from. And this is a new
> > issue.
> 
> Well, it was still the same exercises with CPU online/offline.
> 
> > 
> >> [  488.151939][  T670]  kthread+0x3ac/0x460
> >> [  488.155854][  T670]  ret_from_fork+0x10/0x18
> >> [  488.160120][  T670] Code: 911e8000 aa1303e1 910a0000 941b595b (d4210000)
> >> [  488.166901][  T670] ---[ end trace e637e2d38b2cc087 ]---
> >> [  488.172206][  T670] Kernel panic - not syncing: Oops - BUG: Fatal exception
> >> [  488.179182][  T670] SMP: stopping secondary CPUs
> >> [  489.209347][  T670] SMP: failed to stop secondary CPUs 0-1,10-11,16-17,31
> >> [  489.216128][  T][  T670] Memoryn ]---
> > 
> > Can you give details on what exactly did you try to do, to get this ?
> > Normal boot or something more ?
> 
> Basically, it has the cpufreq driver as CPPC and the governor as
> schedutil. Running a few workloads to get CPU scaling up and down.
> Later, try to offline all CPUs until the last one and then online
> all CPUs.

Hmm, okay.

So I basically have very similar setup with 8 cores (1-policy
per-cpu), the only difference is I don't end up reading the
performance counters, everything else remains same. So I should see
issues now just like you, in case there are any.

Since the insmod/rmmod setup is a bit different, this is what I tried
today for around an hour with CONFIG_DEBUG_LIST and RCU debugging
options.

while true; do
    for i in `seq 1 7`;
    do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
    done;

    for i in `seq 1 7`;
    do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
    done;
done

I don't see any crashes, oops or warnings with latest stuff.

> I am hesitate to try this at the moment because this all feel like
> shooting in the dark.

I understand your point and you aren't completely wrong here. It
wasn't completely in dark but since I am unable to reproduce the issue
at my end, I asked for help.

FWIW, I think one of the possible cause of corruption of kthread thing
could have been because of the race in the topology related code. I
already fixed that in my tree yesterday.

> Ideally, you will be able to get access to one
> of those arm64 servers (Huawei, Ampere, TX2, FJ etc) eventually and
> really try the same exercises yourself with those debugging options
> like list debugging and KASAN on. That way you could fix things way
> efficiently.

Yeah, I thought of this work being over and I am not a user of it
normally. I had to enable it for ARM servers and I took help of my
colleagues (Vincent Guittot and Ionela) for testing the same.

I have also asked Vincent to give it a try again.

> I could share you the .config once you are there. Last
> but not least, once you get better narrow down of the issues, I'd
> hope to see someone else familiar with the code there to get review
> of those patches first (feel free to Cc me once you are ready to
> post) before I'll rerun the whole things again. That way we don't
> waste time on each other backing and forth chasing the shadow.

I did send the stuff up for review and this last thing (you reported)
was a different race altogether, so asked for testing without reviews.

Anyway, I am quite sure my tests have covered such issues now. I will
send out patches again soon.

Thanks Qian.

-- 
viresh
