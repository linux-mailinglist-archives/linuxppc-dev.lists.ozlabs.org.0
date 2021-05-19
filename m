Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77325388C60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 13:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlVWd3FJjz2yxr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 21:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AqRy7PoV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AqRy7PoV; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlVW90lLbz2xgL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 21:09:23 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 cu11-20020a17090afa8bb029015d5d5d2175so3294294pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 04:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=e62NCutqVCKY1HZkBPIYfPXud7+Npfa1OW39gmbpZNw=;
 b=AqRy7PoVVsGWyaOqAExW+UbJ5G2Hg8v5DwW0yaQa4vR2DJ62ZlwKffibyrBx7d6fdF
 noszNvJZm3l0ad+gbM9y/fbi8ZYxUIS2pJebrXsod087KBCpm/dHj+CHE7b0FpEdy1+d
 z4qlFFQ4qLxwVvk4TLd9wKaa9bZEnv7oeKsukZyS+5uFkZhb3QabrzUCGEXGkEFcBaLI
 2YenGVjj5Y46IJblWrwPHdKCd5Sjbh0BdmEl/XTjMAqFL7p8BJ3G1j+qtXGcs3rkXetg
 OYYrogimMCxT+Sj4BvaJgp7HTqTEb/MhNU9FfgD7YhHdlX873H7AhdoYIR+9cfYWAfG/
 YUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=e62NCutqVCKY1HZkBPIYfPXud7+Npfa1OW39gmbpZNw=;
 b=AzUYrVIody7pKs/dXkj/F5BQGaYbSOYMPiY3B3XzzSyZY31pNY+ktnul46twFMXEdv
 YQVucOjwmNTll2Odo+UlCy31qz8kUN76HIt0ukRjHZuXRiycxa4mkLpJOONX1lkHAM7U
 TcSOsOiUyjKXluFEBc41L0GL0GxAR60gmlZXdJIks4bCa6mVcQGOWXXSNiFzpR+Tth6j
 M6GCNuDwKmHs9JBR3seXQiyhnPZncMOoG82zkONlQ0EzRWm4CUo6bz63zKk8Xebks1f+
 Yln/ZlUmaMhfQ57aBwukQEXy9Xgq3GBUso2aijruEkMABQF5VU3AGA0R538Od6yDzTFE
 4ooA==
X-Gm-Message-State: AOAM533zwj9Siy4gTC56VXjt/z6bRE7HutzBXdLOuISUDUOkHBuBwUoo
 hOGhlRqoLtvU++CMk2D9BPI=
X-Google-Smtp-Source: ABdhPJzf5y+PAB13kZ36zpA6LV/PtNoQ5/SsALHEpOBAG8UxoHuBIAaArifwvs7eStDb2yHlpm/PbA==
X-Received: by 2002:a17:90a:a08c:: with SMTP id
 r12mr10540431pjp.204.1621422560590; 
 Wed, 19 May 2021 04:09:20 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id x13sm990257pfn.43.2021.05.19.04.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 04:09:20 -0700 (PDT)
Date: Wed, 19 May 2021 21:09:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 5/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
To: Peter Zijlstra <peterz@infradead.org>, Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>
References: <20210513154909.6385-1-ricardo.neri-calderon@linux.intel.com>
 <20210513154909.6385-6-ricardo.neri-calderon@linux.intel.com>
 <YJ5HQR943rSFsLxw@hirez.programming.kicks-ass.net>
 <20210515021415.GB14212@ranerica-svr.sc.intel.com>
 <20210518190740.GA15251@ranerica-svr.sc.intel.com>
 <YKThlA2yZBT2KuvW@hirez.programming.kicks-ass.net>
In-Reply-To: <YKThlA2yZBT2KuvW@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1621422058.5rx5cxsjqx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Len Brown <len.brown@intel.com>,
 Ricardo Neri <ricardo.neri@intel.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Quentin Perret <qperret@google.com>, linuxppc-dev@lists.ozlabs.org,
 Aubrey Li <aubrey.li@linux.intel.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>,
 Ben Segall <bsegall@google.com>, Aubrey Li <aubrey.li@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Mel Gorman <mgorman@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of May 19, 2021 7:59 pm:
> On Tue, May 18, 2021 at 12:07:40PM -0700, Ricardo Neri wrote:
>> On Fri, May 14, 2021 at 07:14:15PM -0700, Ricardo Neri wrote:
>> > On Fri, May 14, 2021 at 11:47:45AM +0200, Peter Zijlstra wrote:
>=20
>> > > So I'm thinking that this is a property of having ASYM_PACKING at a =
core
>> > > level, rather than some arch special. Wouldn't something like this b=
e
>> > > more appropriate?
>=20
>> > Thanks Peter for the quick review! This makes sense to me. The only
>> > reason we proposed arch_asym_check_smt_siblings() is because we were
>> > about breaking powerpc (I need to study how they set priorities for SM=
T,
>> > if applicable). If you think this is not an issue I can post a
>> > v4 with this update.
>>=20
>> As far as I can see, priorities in powerpc are set by the CPU number.
>> However, I am not sure how CPUs are enumerated? If CPUs in brackets are
>> SMT sibling, Does an enumeration looks like A) [0, 1], [2, 3] or B) [0, =
2],
>> [1, 3]? I guess B is the right answer. Otherwise, both SMT siblings of a
>> core would need to be busy before a new core is used.
>>=20
>> Still, I think the issue described in the cover letter may be
>> reproducible in powerpc as well. If CPU3 is offlined, and [0, 2] pulled
>> tasks from [1, -] so that both CPU0 and CPU2 become busy, CPU1 would not=
 be
>> able to help since CPU0 has the highest priority.
>>=20
>> I am cc'ing the linuxppc list to get some feedback.
>=20
> IIRC the concern with Power is that their Cores can go faster if the
> higher SMT siblings are unused.
>=20
> That is, suppose you have an SMT4 Core with only a single active task,
> then if only SMT0 is used it can reach max performance, but if the
> active sibling is SMT1 it can not reach max performance, and if the only
> active sibling is SMT2 it goes slower still.
>=20
> So they need to pack the tasks to the lowest SMT siblings, and have the
> highest SMT siblings idle (where possible) in order to increase
> performance.

That's correct.

Thanks,
Nick
