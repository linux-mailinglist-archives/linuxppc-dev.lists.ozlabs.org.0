Return-Path: <linuxppc-dev+bounces-11308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13DCB356B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 10:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB11121kjz3dQ9;
	Tue, 26 Aug 2025 18:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756196677;
	cv=none; b=W6MJ8e3Yu7lQI9lRw6HEkfChiAHk+HB5kjK847mJ9fVCYfzQOTB+6LRz/BHrGD7wg0ay/GJ1q6IpHKFZ8KqyshSv3A3UNXAa6losZq8s+EHWoPX8qBVzp/CGG8Adlz+22rOCBtOkwgWoO/ll5C98UBzWESglyZUi2psaEJJcMtDZWf5vyUXVjkbLVYlHT7mbNXvY96XqRwWd/q9WopT+SPhkQ/KfBGHPtf5cp7kADJUEFQoKHw4h0+AAjH/TQBcKgyhbJXjKXmL4JwC0aV2N6D5ryGjspZkDcsVbtwMilGg+cvt+7Nhn5NArndICMOjEZSuf0hIxT0p+wZU1psjepg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756196677; c=relaxed/relaxed;
	bh=7rF4Z3nFFKjvmRCuB0uyqnPIPVz/DLlRjcPNglDabus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX3FALDAj2mSFPuo06SQ1h9MQlA4nKFR6XR+GUUnKVhjs30n8EFY/csRobUSEYf7vO4oNZuhfsXC5BcpbMSD/RwpS4NIb/RzqXGxXvpq/Hmp3yT8oP8+TnD+rpiaJEJmapfefBrh3GV8Ek2oproEV+CVi1t+rcSofTFocEy+fGjbw7IwT24b3gt0B/KglaHrtE1qMMSeGzWzZYiSGf9Hqfwlxb+njKOgFAiHBG+eUaow+l0GIV6CI4AYKV31oThqqKHK6wsEYmU4VOcW2qbLSesGMXZ80rd7jH0B64oqrPkrSfBG0ikonVUPLnOiZm+N4JA99Q0Mfzew5AA3Iy6rpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=p+Q6uFyl; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=p+Q6uFyl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB10y0nQBz3d2N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 18:24:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7rF4Z3nFFKjvmRCuB0uyqnPIPVz/DLlRjcPNglDabus=; b=p+Q6uFylxWqCNSMkjEFeg4rdfp
	QJ5psU8HRDgFK7/NXSdQKPJO2dqVJJFbWPBmr5cq797ldtSP4kAlLzBYWekPI7GCqhu1kOFMcKxkt
	y6uSzCktiivrZCMhNE6Owbk+vGLsxHeSOCYz6LqZTNsWEguOZUp4iJpX9V3iDn5Iktz2dj3kbeSQt
	zcCcajnHO2mHJAYqN8NR9E0eM7nGHNiFphhooovRkw6xjXYFq1A1zUkW9wXfc89u27t/ImZzVQCEV
	CWGJ8TqNVA5DdoOUVRjFmpX1BkZfTo1A9u4Q6IPv8ovGp5lUIUUkRRBtxOg+ysOUON28JLZO5Y1YR
	SmbYdxNw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoyK-0000000F6R7-2qfM;
	Tue, 26 Aug 2025 08:24:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DAE223002C5; Tue, 26 Aug 2025 10:24:04 +0200 (CEST)
Date: Tue, 26 Aug 2025 10:24:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
	Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: Re: [PATCH v7 5/8] sched/topology: Unify tl_smt_mask() across core
 and all arch
Message-ID: <20250826082404.GF3245006@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-6-kprateek.nayak@amd.com>
 <20250826080123.GB3245006@noisy.programming.kicks-ass.net>
 <a506bb53-6e17-4a10-a870-50ce87a4ce06@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a506bb53-6e17-4a10-a870-50ce87a4ce06@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 10:11:40AM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/08/2025 à 10:01, Peter Zijlstra a écrit :
> > > diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> > > index 602508130c8a..d75fbb7d9667 100644
> > > --- a/include/linux/sched/topology.h
> > > +++ b/include/linux/sched/topology.h
> > > @@ -37,7 +37,13 @@ static inline int cpu_smt_flags(void)
> > >   {
> > >   	return SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
> > >   }
> > > -#endif
> > > +
> > > +static const __maybe_unused
> > > +struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
> > > +{
> > > +	return cpu_smt_mask(cpu);
> > > +}
> > > +#endif /* CONFIG_SCHED_SMT */
> > 
> > Problem with that __maybe_unused is that you forgot inline.
> > 
> > static inline const
> > struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
> > {
> > 	return cpu_smt_mask(cpu);
> > }
> > 
> > seems to make it happy.
> > 
> 
> But the function is referenced by SDTL_INIT() macro so there is no real
> point in declaring it inline. Would be cleaner to have it defined in a C
> file.

Ah, that's what you mean. I was more focussed on getting rid of that
horrible __maybe_unused and then either works. But yes, perhaps just
having them in a .c file is best.

