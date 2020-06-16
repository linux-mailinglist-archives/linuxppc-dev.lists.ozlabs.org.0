Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00A1FAD37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 11:58:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mNts5bqmzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 19:58:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MXJamBMd; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mNrz2RMLzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 19:56:51 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id x14so20092025wrp.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s+6tHvkpbMkOKCKAPCqQd0J6Ws3tiYCoTHS327bpUj0=;
 b=MXJamBMdHLtKkvZ1tesqApy0O8/Vj8QXsYt3avAmdmVJ5Ft2SASQEgbNWG3SdYYtdE
 +Ch8m2P48jOuSbe0ixEyumpyKsHKISYBwVMK4W64o8qjCzehFcaXk877uUtMjg6SZHId
 fs64b3Vpv4DcToMy3qpjHzpnChwCU5VdMcbl4NaTPq9++KmQDVtVZcOv3moUKizNQqM1
 S1/OlFY5IbI4oDqjMBrzF6xsMAU0o/pRw+pjq7iEu+Y7a1pD1WX43JOlc6wzD1s+if7G
 QDFuexgobbViQrxQ06pMwumO6fI2NiMJqiSZdkeQQxKpqY1X38hbNAvRJJYycugw1jJh
 qYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s+6tHvkpbMkOKCKAPCqQd0J6Ws3tiYCoTHS327bpUj0=;
 b=M6QFWhujdWCgXJrjzPF9eS8OWiD2DmYSq9cdh/cFVIqgK0o0+WMXrj8ez+YVgeAjKA
 Ky33gbkgQQfD0iD37+06rW6tzV5KZmatJxEwM5Drv8G7wyy55Z62ll/d0XlrSKTGD4FO
 iQmiYqj7+GQHEsl7U1U6OaVO9EQMycBjqiaqZFFfVpla53lWFtSUxiXBKdX0DBknmv/I
 Ft0s/ZIGr7Joc5kHpD3AfWUaVpHtSpv6na7Hwh9b2/bw8o3K3Zd1BxtNroyFvbnWtG5J
 6ZQexl2pxk97gHODugIlifCwxrJ4lzBEjiI1pk8uoNPK4FIfxN+E/+mJ9e82J7gvUVyR
 VDgA==
X-Gm-Message-State: AOAM53164c1AZkvXtl4q21cYUuusdDaZp5bUnv7kXoNJNaiV/aJ7nU8t
 Y5g/2dUzlI+abtcN8EXWYxgYiw==
X-Google-Smtp-Source: ABdhPJxqQsR3S5oPKf/oMoJLYKGnFwkzbNCBIFyx1JnikthcMcO/VLtWqWYDBGtu4xDItX3y6livhQ==
X-Received: by 2002:adf:b697:: with SMTP id j23mr2331934wre.201.1592301408232; 
 Tue, 16 Jun 2020 02:56:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id c16sm3150742wml.45.2020.06.16.02.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 02:56:47 -0700 (PDT)
Date: Tue, 16 Jun 2020 10:56:44 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200616095644.GA150003@google.com>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-3-qperret@google.com>
 <20200616043143.obk5k3rv737j5dnd@vireshk-i7>
 <20200616083107.GA122049@google.com>
 <20200616092759.rjnk3lef4tedfust@vireshk-i7>
 <20200616094802.GA139416@google.com>
 <20200616095438.v7wywhfq5ealvyih@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616095438.v7wywhfq5ealvyih@vireshk-i7>
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

On Tuesday 16 Jun 2020 at 15:24:38 (+0530), Viresh Kumar wrote:
> On 16-06-20, 10:48, Quentin Perret wrote:
> > ---8<---
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 0f05caedc320..a9219404e07f 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -2340,6 +2340,11 @@ int cpufreq_register_governor(struct cpufreq_governor *governor)
> >  		list_add(&governor->governor_list, &cpufreq_governor_list);
> >  	}
> >  
> > +	if (!strncasecmp(cpufreq_param_governor, governor->name, CPUFREQ_NAME_LEN))
> > +		default_governor = governor;
> > +	else if (!default_governor && cpufreq_default_governor() == governor)
> > +		default_governor = cpufreq_default_governor();
> 
> Instead of the else part here, maybe just do this from
> cpufreq_core_init() only once, and so we will always have
> default_governor set.

Sounds good.

Thanks!
Quentin
