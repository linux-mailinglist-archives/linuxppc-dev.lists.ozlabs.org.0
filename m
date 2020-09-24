Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DE6277B70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 00:04:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4By8G93p9hzDqkX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 08:04:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bristot@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Kr4u0+wK; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Io+aEmAx; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4By50Q0st7zDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 05:37:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600976218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twNrygaxLsVZPNKYCHY3ZfHX7UvhS+LdDIfmkCz5FTg=;
 b=Kr4u0+wKDT4eE4Ovfk8dVq+zwEnG3+m9nBXV98aP7EduhHCHW16A+CAkoAsez2npbw8dyM
 F42oliu8ePZ+iErn6O4Kku3QUN9ZIpqaI29BaqqCM/MwyQAJ1jE7qUu8VTcTnyor0Tjv1G
 AGafI+2TkSoImau4U/fywK786XFkk6M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600976219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twNrygaxLsVZPNKYCHY3ZfHX7UvhS+LdDIfmkCz5FTg=;
 b=Io+aEmAxSkCo4U8cov3aB7d3vrkWccwI79+NZCErN6wc82FtqJiA5vHbHNBzDm2fNPOP2i
 dXFr46rBj/FwAOWuf7EUdFRX81poWP7qNkS1zs+XqXcskRgXY1kWNTQKr0DjTIUi1mNXVm
 nv27B2GmrbWHLTdZj6YcsyCT2mwsvLU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-Js2kx6UTPB2ApzNQqLcZQg-1; Thu, 24 Sep 2020 15:36:56 -0400
X-MC-Unique: Js2kx6UTPB2ApzNQqLcZQg-1
Received: by mail-wm1-f72.google.com with SMTP id m25so153082wmi.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 12:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twNrygaxLsVZPNKYCHY3ZfHX7UvhS+LdDIfmkCz5FTg=;
 b=ftg8IzFSTXycQOXCY0GzlGqtgAk9bVjpEt/6LHLNQv9EpUNLN09HTsooiPhwUxQXG7
 INsv6SRIFqw1Y9uSlwSPx4cUBkXWH9ceBvoO2yKdgA73J2jHYd8LMk13t4FAN+1E3vyh
 1pZg8EhUsNx9sriQe0EPyMhN+zqF26TXZItAmKt6RsMS7dhOiOd4gwwnLRSPiSjve4UP
 1psXrXagfzwppqAtlLI8bKjOQBqBUq1/ufoZaiC0n2cT2y/RRE834wsYySXKVDAOgjUA
 MMc7uS9RdZzgMTUVkVT/yKaH/b45XRQgWo927rGxkA1zajaCQvIzHKkhYmOvVCPc17Hl
 3sHQ==
X-Gm-Message-State: AOAM531B0BsLRXJ/wObA8OPG09i8qVS5i/jMtjieQPv6VGhNMMwNzk2l
 nCynYicOZplsS4qK1b0sGQIuXBJ2xdLt+B2Opc2seiNTb4be7a83Qzd23jJSEfFxfxPnc8RyiPZ
 ZyR4nMiRCq3iyGRl9WbM8Ktfy/Q==
X-Received: by 2002:adf:f34a:: with SMTP id e10mr491657wrp.91.1600976215162;
 Thu, 24 Sep 2020 12:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynpHjsvPmbyspQelrDSoXiAKotSicrrWAZZ3D0g/KyVrY5rzQz/w0XAUEKgRr9DXJGglK1Gg==
X-Received: by 2002:adf:f34a:: with SMTP id e10mr491615wrp.91.1600976214950;
 Thu, 24 Sep 2020 12:36:54 -0700 (PDT)
Received: from x1.bristot.me (host-87-17-196-109.retail.telecomitalia.it.
 [87.17.196.109])
 by smtp.gmail.com with ESMTPSA id h204sm302746wmf.35.2020.09.24.12.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 12:36:54 -0700 (PDT)
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: peterz@infradead.org, Steven Rostedt <rostedt@goodmis.org>
References: <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
 <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
 <20200923084032.GU1362448@hirez.programming.kicks-ass.net>
 <20200923115251.7cc63a7e@oasis.local.home>
 <20200924082717.GA1362448@hirez.programming.kicks-ass.net>
From: Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <7541acd1-65a0-0d55-4028-71cab544e90d@redhat.com>
Date: Thu, 24 Sep 2020 21:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200924082717.GA1362448@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bristot@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Sep 2020 08:02:51 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Greentime Hu <green.hu@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/24/20 10:27 AM, peterz@infradead.org wrote:
> So my current todo list is:
> 
>  - Change RT PULL
>  - Change DL PULL
>  - Add migrate_disable() tracer; exactly like preempt/irqoff, except
>    measuring task-runtime instead of cpu-time.
>  - Add a mode that measures actual interference.
>  - Add a traceevent to detect preemption in migrate_disable().
> 
> 
> And then I suppose I should twist Daniel's arm to update his model to
> include these scenarios and numbers.

Challenge accepted :-)

-- Daniel

