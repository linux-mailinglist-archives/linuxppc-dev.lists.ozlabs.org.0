Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6531E437A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 15:22:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XBMN0l6tzDqQH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:22:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GKbuSOFw; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=OKXbYDqK; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XBBl1MYMzDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 23:14:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590585289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp4IU27b7aXZqohMpJFZPawUcolyfH/CQm0FvETLmFY=;
 b=GKbuSOFwA4M4+1MFHVWM8sWZB6cZGYKaKIMmGO6M5EKsyVOPMt6E4jEQCMyFgU85YMfjvR
 bClmprTRRYPDWnpafwpn07eHkMe433eIvy/b+7uyQOS9ViC/GLtM6ZLsTZgTIOrb51oJvE
 3gbPfKlCJxnuTdMqO1KG7hFPqZywHi0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590585290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp4IU27b7aXZqohMpJFZPawUcolyfH/CQm0FvETLmFY=;
 b=OKXbYDqK8qEhgHGMi+5lqrNOYySLaMwMfc4AIy4Qf9Ina6VoCdZKBRHiQfT89NnwaHqMpW
 d5hDOcs1HunTkFgcEvRclkDumJvHYJ2/9N9MbUmRsBuJymvNRcllPOvGm2z0hpM6XIwjtR
 74ntJf2BUSQ9Aly1BE5cXLKW2lpMtY4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Qganu8ThMLaYO0Xec8ljDg-1; Wed, 27 May 2020 09:14:45 -0400
X-MC-Unique: Qganu8ThMLaYO0Xec8ljDg-1
Received: by mail-wr1-f69.google.com with SMTP id y7so11216976wrd.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 06:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xp4IU27b7aXZqohMpJFZPawUcolyfH/CQm0FvETLmFY=;
 b=mugBg5+9O1aAbYKBzj2QnQ9JJNZVZJyNEBIeWz+jh3cboMe00NdR4Cy+L2qXi6Rdzu
 DdFbuLRHsiHKCphzPnxDVnusfFmsVXOpQucKvOzmRbD3peuX3rgwBO2cZahCwZst4q8b
 Rvz5O00qc1a1FDZp7966wiRVHnEVpsxw/QJMge7in81nvpz+gRZN7jZ7XJiWK66Fe4wB
 1r2PLEmztI68XTL4OPdWU7v4xH5GACX6DX/XlykMRjz4KROmIrzOunvrO8N/PwLnzcvx
 B05q5nuOXkP3C+Tv+k8WwHc5a9uhk//UIlTy+SLT6NE1wvrIO2WIfLV64zE40yqEpcTr
 Cxyw==
X-Gm-Message-State: AOAM530xbyqD3Ii7hg9fBW/ybjH+zRtlBxIiLr05Qa3fSXxERhN3xAQw
 UiBhrNAq99ODEyaQA9noGSalf1U4AGocwQyuP00v+0bm2iRagfCFop64weKD9Zqw4scGiFEV2Nx
 TwSDQG+34O1atBUGOieqFi/6J7g==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr4189519wmb.3.1590585284190;
 Wed, 27 May 2020 06:14:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXDD9pd6xDx85wKJ6DSUd0+jHdsTLXsbOgS1BfL3siVJ+UTokB2SEyRQkeYWpyFjB2Klsulg==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr4189496wmb.3.1590585283890;
 Wed, 27 May 2020 06:14:43 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.225])
 by smtp.gmail.com with ESMTPSA id r4sm2825862wro.32.2020.05.27.06.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 06:14:43 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To: Jakub Kicinski <kuba@kernel.org>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
Date: Wed, 27 May 2020 15:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Lunn <andrew@lunn.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>
>> The file system is mounted on /sys/kernel/stats and would be already used
>> by kvm. Statsfs was initially introduced by Paolo Bonzini [1].
> 
> What's the direct motivation for this work? Moving KVM stats out of
> debugfs?

There's many reasons: one of these is not using debugfs for statistics, 
but also (and mainly) to try and have a single tool that automatically 
takes care and displays them, instead of leaving each subsystem "on its 
own".

Sure, everyone gathers and processes stats in different ways, and the 
aim of this tool is to hopefully be extensible enough to cover all needs.
> In my experience stats belong in the API used for creating/enumerating
> objects, statsfs sounds like going in the exact opposite direction -
> creating a parallel structure / hierarchy for exposing stats.

  I know
> nothing about KVM but are you sure all the info that has to be exposed
> will be stats?I don't understand, what do you mean here?

> 
> In case of networking we have the basic stats in sysfs, under the
> netdevice's kobject. But since we're not using sysfs much any more
> for config, new stats are added in netlink APIs. Again - same APIs
> used for enumeration and config.

I don't really know a lot about the networking subsystem, and as it was 
pointed out in another email on patch 7 by Andrew, networking needs to 
atomically gather and display statistics in order to make them 
consistent, and currently this is not supported by stats_fs but could be 
added in future.

In addition, right now it won't work properly if the networking 
namespaces are enabled. That is another issue to take into 
consideration. That's also why I marked patch 7 as "not for merge"

Regarding the config, as I said the idea is to gather multiple 
subsystems' statistics, therefore there wouldn't be a single 
configuration method like in netlink.
For example in kvm there are file descriptors for configuration, and 
creating them requires no privilege, contrary to the network interfaces.

Thank you,
Emanuele

