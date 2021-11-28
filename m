Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 329364609FC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:06:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Lcc1TXXz3cZM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:06:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JS75cm1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JS75cm1k; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J25MW1gmdz2ymr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 22:08:53 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so10001098pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 03:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=RLGVormZNrRFWCDJ7jdRt19siDEPnOtSgoMRMWSMPpw=;
 b=JS75cm1kNmau6QTu2rqjTEH1lacCTylUddbQig/MfaOv87fU1R4ixeZwUTvWkojCLe
 FVsH5wJQluo9fnDCJtLxlNsFRugI2zkbabpCQ9VhDSP+vCMkQ9XcDyPUZsKoAN0XUVPp
 aHUTDQx+GNGjfhDN5ufjzO429xe7p71bZ6QrT/eU2apwdj3VV4bcd4Oz9OEiXGFLWmkO
 KTg66HtHflRGYT80QQO1K0h4MxrasFS2dEY2Sip94P5OybBl2LvseRqW7ZJqQswnXYN6
 Cntrs/UrWT/QrCgRauE5NdDXQthF0aHKCC9fzaz2Cb2jdPmYhTY0PX3z2F7VkaSzQTfW
 T9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RLGVormZNrRFWCDJ7jdRt19siDEPnOtSgoMRMWSMPpw=;
 b=yto0Uxauf8vQZk40QYwfgxf0rWQHHRK8G8waeob4gPhnyOQ7R7U/80xgzpjDuecFBa
 5HRW8v8TiJRFwXBs2GG/bI+9U9PtoqkGpvgBfVaOPLalG+sJALZl2DskPZUievmCe/0G
 mih0jpEYDW23oX1kQuftTzBZJSumQjvCH7wttqVveQJr+V4p4kDVa+RtVKvXJkKsLGbd
 ygbn0dUhUwRujOTxPMPWHo7ZgHIfp+eNDEYWCEhczvvRiZQgXtb/e779ot9P63vF85uG
 IELc2kBjAeF7RPW1iOJBt56H72ZXv7a+AKgKd4W6iOiTdog8Ao+EyGMA3avd48xRO4A2
 enVg==
X-Gm-Message-State: AOAM531IwpHWqmQDzPti/F072KnFPOKcrHgYO0998fJOHFzFGjz5ubcE
 XJMx97hkesPNp3ucgM5E16I=
X-Google-Smtp-Source: ABdhPJwy0Op9mcVC2NuBsFMopKknqC2dkNsLfr7KDw0piI/fX2AvzDRr44yqwWjkuQxAQyAX4DCrnA==
X-Received: by 2002:a17:902:7fc3:b0:144:e29c:228d with SMTP id
 t3-20020a1709027fc300b00144e29c228dmr51588052plb.4.1638097728470; 
 Sun, 28 Nov 2021 03:08:48 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id 9sm9412647pgq.57.2021.11.28.03.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 03:08:48 -0800 (PST)
Date: Sun, 28 Nov 2021 21:08:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Gross
 <agross@kernel.org>, David Airlie <airlied@linux.ie>, Alexey Klimov
 <aklimov@redhat.com>, Andi Kleen <ak@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Amitkumar Karwar
 <amitkarwar@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko
 <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel
 <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@fb.com>,
 bcm-kernel-feedback-list@broadcom.com, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>, Dennis Zhou <dennis@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, Heiko Carstens
 <hca@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Hans de Goede
 <hdegoede@redhat.com>, Ian Rogers <irogers@google.com>, Jason Wessel
 <jason.wessel@windriver.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Jonathan Cameron <jic23@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Jakub Kicinski
 <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, kvm@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Andy Lutomirski <luto@kernel.org>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Marc Zyngier <maz@kernel.org>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mel Gorman <mgorman@suse.de>, Mike Marciniszyn
 <mike.marciniszyn@cornelisnetworks.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Marcin Wojtas <mw@semihalf.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Solomon Peachy <pizza@shaftnet.org>,
 Petr Mladek <pmladek@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Roy Pledge <Roy.Pledge@nxp.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Stephen Boyd <sboyd@kernel.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Sunil Goutham <sgoutham@marvell.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Tariq Toukan <tariqt@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tejun Heo <tj@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vlastimil Babka <vbabka@suse.cz>,
 Vineet Gupta <vgupta@kernel.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
Message-Id: <1638096766.3elxdzb8ly.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 29 Nov 2021 08:05:03 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Yury Norov's message of November 28, 2021 1:56 pm:
> In many cases people use bitmap_weight()-based functions like this:
>=20
> 	if (num_present_cpus() > 1)
> 		do_something();
>=20
> This may take considerable amount of time on many-cpus machines because
> num_present_cpus() will traverse every word of underlying cpumask
> unconditionally.
>=20
> We can significantly improve on it for many real cases if stop traversing
> the mask as soon as we count present cpus to any number greater than 1:
>=20
> 	if (num_present_cpus_gt(1))
> 		do_something();
>=20
> To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> functions together with corresponding wrappers in cpumask and nodemask.

There would be no change to callers if you maintain counters like what
is done for num_online_cpus() today. Maybe some fixes to arch code that
does not use set_cpu_possible() etc APIs required, but AFAIKS it would
be better to fix such cases anyway.

Thanks,
Nick
