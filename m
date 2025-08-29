Return-Path: <linuxppc-dev+bounces-11474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE6B3B4C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 09:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCr9q0FT0z2yrZ;
	Fri, 29 Aug 2025 17:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756454014;
	cv=none; b=Us1QAhQXAn9UHlsIm6WQGpFUGv60VegjzyQBEk0SeLMXhMlrC1ZYyZbvw/jo4VHUTbu9id6D0CrvqPiQQ3cOTmWBhdQ5IhdOJI+EK7l6h0GIo04AY9RGYhG/0ROPyGWoYQVEStj27gieOQDufJi1BZVlznJfsIzjj9IR7mqDCpDe6yGHIdUxp1dwEIcEiK5thDaXMFbR2pzy4ioCeVbybTD+1gK31pVby5wqXZfVZxOJONQX2o+Qi7BzrIT3z2Kl75ky9/4XcgVMCaAWnGqcJWG9j9IVXoq06hDrSOTehm2OtYxcsh/6dEo4fS35QeCHAOn7uYmjhQxZTX2lbMkqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756454014; c=relaxed/relaxed;
	bh=hd/Q4wK5Af44IVTmRDhb0IMpmen0zove7usKL1pLP5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WKtJdr6halsN/Sx/7EVFk8qnhZAYWAeuqgWv9+5sO43ZHLWULaPqLe8g+15WWiKK73YaT1Vwk9y3Hpch6j8MamnuzL1mHVbUh8QfiknPoBaMDk0rEzw56FVoRTzZagiIAuiHXnWvEfLK7A/toEFqxc8K5FumuYvvZUK6aAV1HxF6jK/5UnEpWZDZvTkHURi/QJztmpxOfGwbDmx0+QrV6yHE8bdrYEe+iwOmw9sMLkMCZdTveQQfajQjwn+a5JesNQxuva+dEvNE1svju5KcVKcsXx1EuksKmnxPHU0lWjDsI5uNlXlDo8F+wslF1J2rLyQiCHTwCNHoKQzEX04NUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLguMpKC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLguMpKC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLguMpKC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLguMpKC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCr9n4PC2z2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 17:53:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756454008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hd/Q4wK5Af44IVTmRDhb0IMpmen0zove7usKL1pLP5w=;
	b=PLguMpKCwrY0MvQex2yOSMRH+rzgEcpvOL8MupbtDy/XI9TMICl+X/vhJK3Kv3bDAep2zH
	l6ea0piK88C53dzN6GEKPnWr0LbgvFeqQwWqU53Dt34X36GYTgfojHLcBEK/108YkHiKkQ
	VCDryVkg2ymsNU/cTUAo+XJmKmPShP4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756454008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hd/Q4wK5Af44IVTmRDhb0IMpmen0zove7usKL1pLP5w=;
	b=PLguMpKCwrY0MvQex2yOSMRH+rzgEcpvOL8MupbtDy/XI9TMICl+X/vhJK3Kv3bDAep2zH
	l6ea0piK88C53dzN6GEKPnWr0LbgvFeqQwWqU53Dt34X36GYTgfojHLcBEK/108YkHiKkQ
	VCDryVkg2ymsNU/cTUAo+XJmKmPShP4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-hNREGAHgMJudp_qVEyDjmw-1; Fri, 29 Aug 2025 03:53:22 -0400
X-MC-Unique: hNREGAHgMJudp_qVEyDjmw-1
X-Mimecast-MFC-AGG-ID: hNREGAHgMJudp_qVEyDjmw_1756454001
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7f7dd47f712so628019085a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 00:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454001; x=1757058801;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hd/Q4wK5Af44IVTmRDhb0IMpmen0zove7usKL1pLP5w=;
        b=k0e22cYOPKro5o5kHt3u7YvzMQ6ijrRz4EMwrZF0aUZJO8UEUIwTjjmvvT9G66DM4c
         d7OLslTmJZtYf2FvHNGJx/8/o4gUk6pjdpz/kS5L6Wo31+p8w9SPlCfM7BAznFLw27/P
         2GIAuKXzwjT4DZcjLKEajn6/rok3OtA5PvwwJGwvv8qQOH8HRLPgNMx7zBljWpe+WH7P
         jY5bAutEdsPb5ri/EvwNK7Xtg4P8zt+5OwPuZeCArri36U+jcflPPCi7CIgqTMxZPWYu
         esBhXYBm2nJg/0C5tnz20FyWSugCcfsIG8EStH1DrASCSqi1NM0o2p9LhzdZigIBtxmW
         5Ivg==
X-Forwarded-Encrypted: i=1; AJvYcCWHYgy2vplLTVPDpXhPDE+JpV75imliYcu3HmbC6SsaNTdHtsxGR4SCpaa2V0MiiWdLfra9vze27Pq3Q40=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+D+L2QvRblrHYxmviRTxEjuRIvXU+v7Rg52jujT01ya45Stig
	rXF/qvaYVXn/YIySdnRQuaUHWTdBbUmmcfC5sC4dqcYoVoMPniOmnrdC8IJ6tjjD8k2jLqSfhzz
	VJciCfKQuIASiXCfZRScH5FnWRM3lkG9rDtj07QWiBEVeZEFZnwC1tS6Zq5gcgWeTE+g=
X-Gm-Gg: ASbGncumqp66LYlx8+Z/OIbCMlr9RVpGh+raz2/+M1TGW+ngDFPhcikXbTQ8qVu8YnA
	NfQEJRsOSJbob0g8gSfN6oqsrhUyuI/z/4Kw/19oDhLdU9X71+jNwSvEUaCCMIRnpBYV3IsOKvc
	XAwwnyfaZZ2aCyQd2HxGudrC/6aIOA0aoXS6+rXDuJB7G6mCVmI5zz3ScTGs+GcKfeKJWJErldF
	t1aGJO0jEuTLgCHXwhippXO0AHKEDv6iGXDmNA7rA4g8mG8dw5oPE8AY83OEcvr5bRGdS/+U/Yy
	YH53obrXgNDA2FXkOFEGk9K5jNCT6FiAAnoMp5tqlxAB9cMiOuG/m6JctlhEiPpRC9H4zTRLXi/
	KP9QZxBQD6PRfsKy9rMXoJvWw
X-Received: by 2002:a05:620a:3184:b0:7fd:2801:11c3 with SMTP id af79cd13be357-7fd280114e2mr79780485a.17.1756454001458;
        Fri, 29 Aug 2025 00:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9OYt/OUzYXYXQDHJZwPmeAhxWwWDVQls1oZvlM8N0wCLdQg6ik5gqoc+qY2nFzfns/uXsYQ==
X-Received: by 2002:a05:620a:3184:b0:7fd:2801:11c3 with SMTP id af79cd13be357-7fd280114e2mr79774785a.17.1756454000877;
        Fri, 29 Aug 2025 00:53:20 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc066657fasm134986185a.0.2025.08.29.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:53:19 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, Shrikanth Hegde
 <sshegde@linux.ibm.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>, Bibo
 Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>, Tobias
 Huschle <huschle@linux.ibm.com>, Easwar Hariharan
 <easwar.hariharan@linux.microsoft.com>, Guo Weikang
 <guoweikang.kernel@gmail.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk
 Wlazlyn <patryk.wlazlyn@linux.intel.com>, Swapnil Sapkal
 <swapnil.sapkal@amd.com>, "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Andrea Righi <arighi@nvidia.com>, Yicong
 Yang <yangyicong@hisilicon.com>, Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>, Tim Chen
 <tim.c.chen@linux.intel.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 0/8] sched/fair: Get rid of sched_domains_curr_level
 hack for tl->cpumask()
In-Reply-To: <20250826101328.GV4067720@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
 <20250826101328.GV4067720@noisy.programming.kicks-ass.net>
Date: Fri, 29 Aug 2025 09:53:12 +0200
Message-ID: <xhsmh7bymlg2f.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z9VYhDLBGjt7HHQdLkwtPKC2Yv7TLmvLdska_StGdOM_1756454001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 26/08/25 12:13, Peter Zijlstra wrote:
> Subject: sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Mon, 25 Aug 2025 12:02:44 +0000
>
> Leon [1] and Vinicius [2] noted a topology_span_sane() warning during
> their testing starting from v6.16-rc1. Debug that followed pointed to
> the tl->mask() for the NODE domain being incorrectly resolved to that of
> the highest NUMA domain.
>
> tl->mask() for NODE is set to the sd_numa_mask() which depends on the
> global "sched_domains_curr_level" hack. "sched_domains_curr_level" is
> set to the "tl->numa_level" during tl traversal in build_sched_domains()
> calling sd_init() but was not reset before topology_span_sane().
>
> Since "tl->numa_level" still reflected the old value from
> build_sched_domains(), topology_span_sane() for the NODE domain trips
> when the span of the last NUMA domain overlaps.
>
> Instead of replicating the "sched_domains_curr_level" hack, get rid of
> it entirely and instead, pass the entire "sched_domain_topology_level"
> object to tl->cpumask() function to prevent such mishap in the future.
>
> sd_numa_mask() now directly references "tl->numa_level" instead of
> relying on the global "sched_domains_curr_level" hack to index into
> sched_domains_numa_masks[].
>

Eh, of course I see this *after* looking at the v6 patch.

I tested this again for good measure, but given I only test this under
x86 and the changes with v6 are in s390/ppc, I didn't expect to see much
change :-)

Reviewed-by: Valentin Schneider <vschneid@redhat.com>
Tested-by: Valentin Schneider <vschneid@redhat.com>


