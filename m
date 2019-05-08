Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60717040
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 07:00:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zPSD6z3lzDqNs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 15:00:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vR7G+WW+"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zPQk01QZzDqKb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 14:59:25 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id p6so9451381pgh.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=uv+cr3UWPmACRlIEgtiQra2smdl7Sym7R7Qit7K6ZOI=;
 b=vR7G+WW+PTmaYxKx2JGjnx+TO/SASNtV+ssRlB3l+F0QMJKpix/+cpLJSDrcrxR/c9
 KF3teCnDJJY2t32VOLE2a0gF6hKfj51wdBPOuTugo7saOm+pob3TNc2DFtPPT3fh1FeI
 87pA0u2rHIHslKyY5k1KWIzKj2oFLfTY0OH54DMXRbpKMb9VVQg+SXlHWCcWtkrh3qXg
 /Nr61iswM325GRSgC7naQPeyLgEYm9L6EcVztp/tfhPrkuWn6IwCUGI/WKmg7xOZo+Ov
 etQETSpFqQFV+5zYDv+CSkndRcXRCF4gjE4aWXKvchEY9yjwh+QWhKQ6Ik6xiagxeO03
 J6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=uv+cr3UWPmACRlIEgtiQra2smdl7Sym7R7Qit7K6ZOI=;
 b=fjgXzTm0wTxLZJpRhlxCoJA2IVSP4iCRStfrUpNdAAe60GQ6s/NSIMjhv6Je8f81IN
 F9g7hK2hDtrXGdhTxI1rhGs2RlbVGRkyO4ifUMDA/CScok6Z2rgWXydz2kcRu8TU7DvC
 7pxh9EXIoaoxoixuzSgjQzZ3TWlAKGbu/yHPZCJE4NUYn+tlhuXnp0lk2sl+wTZ1g9nP
 8trLKsA+INWqF6vCvzHTQrAtpmKZ9mOX3tnkYALbMFiWRiCAF/q33Eh5HmSmHPgx6dTM
 JFeZ6UEYxDd7nrOcoGlxERoOP93sIKyaHHtCuMYzstZnYurXEUPS59kbCFAeMgQUQSyf
 sndg==
X-Gm-Message-State: APjAAAV1GQpAE6wpHopazJQRnR3FH6zSZOJS3NAuG73Mz8F+R/PieIAX
 orkLJ9wTOuGGvR3frLcYxWM=
X-Google-Smtp-Source: APXvYqysggG6fawTukJyxPpFmm6P68sY/iFM72uVHKOky45vKDFnfbonXbQljCpqxIE/VfDS3QCX2w==
X-Received: by 2002:a62:4602:: with SMTP id t2mr46014067pfa.26.1557291562322; 
 Tue, 07 May 2019 21:59:22 -0700 (PDT)
Received: from localhost ([203.63.161.72])
 by smtp.gmail.com with ESMTPSA id k67sm26046002pfb.44.2019.05.07.21.59.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 21:59:21 -0700 (PDT)
Date: Wed, 08 May 2019 14:59:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/1] Forced-wakeup for stop lite states on Powernv
To: Abhishek Goel <huntbag@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20190422063231.51043-1-huntbag@linux.vnet.ibm.com>
In-Reply-To: <20190422063231.51043-1-huntbag@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1557291178.ow4spjzq5t.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: ego@linux.vnet.ibm.com, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Abhishek Goel's on April 22, 2019 4:32 pm:
> Currently, the cpuidle governors determine what idle state a idling CPU
> should enter into based on heuristics that depend on the idle history on
> that CPU. Given that no predictive heuristic is perfect, there are cases
> where the governor predicts a shallow idle state, hoping that the CPU wil=
l
> be busy soon. However, if no new workload is scheduled on that CPU in the
> near future, the CPU will end up in the shallow state.
>=20
> Motivation
> ----------
> In case of POWER, this is problematic, when the predicted state in the
> aforementioned scenario is a lite stop state, as such lite states will
> inhibit SMT folding, thereby depriving the other threads in the core from
> using the core resources.
>=20
> So we do not want to get stucked in such states for longer duration. To
> address this, the cpuidle-core can queue timer to correspond with the
> residency value of the next available state. This timer will forcefully
> wakeup the cpu. Few such iterations will essentially train the governor t=
o
> select a deeper state for that cpu, as the timer here corresponds to the
> next available cpuidle state residency. Cpu will be kicked out of the lit=
e
> state and end up in a non-lite state.
>=20
> Experiment
> ----------
> I performed experiments for three scenarios to collect some data.
>=20
> case 1 :
> Without this patch and without tick retained, i.e. in a upstream kernel,
> It would spend more than even a second to get out of stop0_lite.
>=20
> case 2 : With tick retained in a upstream kernel -
>=20
> Generally, we have a sched tick at 4ms(CONF_HZ =3D 250). Ideally I expect=
ed
> it to take 8 sched tick to get out of stop0_lite. Experimentally,
> observation was
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> sample          min            max           99percentile
> 20              4ms            12ms          4ms
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> It would take atleast one sched tick to get out of stop0_lite.
>=20
> case 2 :  With this patch (not stopping tick, but explicitly queuing a
>           timer)
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> sample          min             max             99percentile
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 20              144us           192us           144us
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> In this patch, we queue a timer just before entering into a stop0_lite
> state. The timer fires at (residency of next available state + exit laten=
cy
> of next available state * 2). Let's say if next state(stop0) is available
> which has residency of 20us, it should get out in as low as (20+2*2)*8
> [Based on the forumla (residency + 2xlatency)*history length] microsecond=
s
> =3D 192us. Ideally we would expect 8 iterations, it was observed to get o=
ut
> in 6-7 iterations. Even if let's say stop2 is next available state(stop0
> and stop1 both are unavailable), it would take (100+2*10)*8 =3D 960us to =
get
> into stop2.
>=20
> So, We are able to get out of stop0_lite generally in 150us(with this
> patch) as compared to 4ms(with tick retained). As stated earlier, we do n=
ot
> want to get stuck into stop0_lite as it inhibits SMT folding for other
> sibling threads, depriving them of core resources. Current patch is using
> forced-wakeup only for stop0_lite, as it gives performance benefit(primar=
y
> reason) along with lowering down power consumption. We may extend this
> model for other states in future.

I still have to wonder, between our snooze loop and stop0, what does
stop0_lite buy us.

That said, the problem you're solving here is a generic one that all
stop states have, I think. Doesn't the same thing apply going from
stop0 to stop5? You might under estimate the sleep time and lose power
savings and therefore performance there too. Shouldn't we make it
generic for all stop states?

Thanks,
Nick

=
