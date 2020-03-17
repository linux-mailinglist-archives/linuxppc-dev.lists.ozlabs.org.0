Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EECD187DB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:03:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hTK32G9fzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l6Kmf/9d; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hTHh3CtvzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:02:40 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id ay11so9418536plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=ZxeoLRVGJSK4vH+PBuL9sM9mn91shhGrAGr4bn0gzoY=;
 b=l6Kmf/9dIvW9osZL8cdTBW+MoWRLc92laGiVS6T3eads/SfxwacrUY6RT2bBL+U8M2
 7/B1lzsm9QxAUIX7Mi+EO7GM4OKgm4NJRzhdDEXyf3vDTOUmEvhRyYDpjoOs1jT/Z1Qs
 IlptBB4D7mYgnrCV6K/rFzOZb/gCVZACcGQJnm9u9fNlj0qYeEXZj13MDTG7BMWoJiZH
 MWEZ0DoFHd1nINQEdFrvkYeCQ05tzv9DyK1QAWzlUhNOBelFBPXIJ6uaLV24GUniekp2
 NF7YxMp70vVv8vCb/paDc7dVgysJgt1e719DNSddpno2d71/M6R5IvZOJPUqifYrG8kO
 4ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=ZxeoLRVGJSK4vH+PBuL9sM9mn91shhGrAGr4bn0gzoY=;
 b=lhRoZl0PF6QZeV72fI0qMcBmsTmwijsZuNMlnh2G7g9mUZy7jINdXNTQp4EbA/u96i
 yyVqqHDmEtaC11L43Fu1McG2xqPH9L+3R+JGaGvt7OLIMSRlY7D1nBgkXc/ZCINWzw+E
 eweJFmZh/4hUhL+UUL8NCl8TGRQKULLroH+bGcd6hNjEV3BPX5DFTqh/eZ2dfuZNuD2T
 OiNVJZuqMOSCYHKMLL+2lkOJs/W3TC2p12rAn8u825xWjqXDabfCkyXzVmMu9BGneh5t
 nMyQ/me1jfps6U9YyEwQwRo8T4ivvd5I5CVFXowcacH1zw+H/1L3tQ+W9KQwnd7o6P+1
 Qm3Q==
X-Gm-Message-State: ANhLgQ1QR+/dd1Hm5WaTA6o+VCGSigkoPKiIBTzXl647g8v2UxcmwWAZ
 CJD3XsCVEO5YGcWEaeVT6el60tkU
X-Google-Smtp-Source: ADFU+vtOXgddz5rm9ecrsB7onD8JG48efZsg4QvDgO2wN7PMR4gKmA4NveCnfkB7GXZzCyeWE3VbEQ==
X-Received: by 2002:a17:902:b198:: with SMTP id
 s24mr3497746plr.89.1584439355281; 
 Tue, 17 Mar 2020 03:02:35 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id u12sm2498372pfm.165.2020.03.17.03.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 03:02:34 -0700 (PDT)
Date: Tue, 17 Mar 2020 20:01:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix MCE handling on pseries
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200313140418.7940-1-ganeshgr@linux.ibm.com>
 <1584157063.g5s75uhbdu.astroid@bobo.none>
 <d22f9ef9-07db-9615-6420-001b85dd2742@linux.ibm.com>
In-Reply-To: <d22f9ef9-07db-9615-6420-001b85dd2742@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584437866.2pbq6ca4ia.astroid@bobo.none>
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh's on March 16, 2020 9:47 pm:
>=20
>=20
> On 3/14/20 9:18 AM, Nicholas Piggin wrote:
>> Ganesh Goudar's on March 14, 2020 12:04 am:
>>> MCE handling on pSeries platform fails as recent rework to use common
>>> code for pSeries and PowerNV in machine check error handling tries to
>>> access per-cpu variables in realmode. The per-cpu variables may be
>>> outside the RMO region on pSeries platform and needs translation to be
>>> enabled for access. Just moving these per-cpu variable into RMO region
>>> did'nt help because we queue some work to workqueues in real mode, whic=
h
>>> again tries to touch per-cpu variables.
>> Which queues are these? We should not be using Linux workqueues, but the
>> powerpc mce code which uses irq_work.
>=20
> Yes, irq work queues accesses memory outside RMO.
> irq_work_queue()->__irq_work_queue_local()->[this_cpu_ptr(&lazy_list) | t=
his_cpu_ptr(&raised_list)]

Hmm, okay.

>>> Also fwnmi_release_errinfo()
>>> cannot be called when translation is not enabled.
>> Why not?
>=20
> It crashes when we try to get RTAS token for "ibm, nmi-interlock" device
> tree node. But yes we can avoid it by storing it rtas_token somewhere but=
 haven't
> tried it, here is the backtrace I got when fwnmi_release_errinfo() called=
 from
> realmode handler.

Okay, I actually had problems with that messing up soft-irq state too
and so I sent a patch to get rid of it, but that's the least of your
problems really.

>>> This patch fixes this by enabling translation in the exception handler
>>> when all required real mode handling is done. This change only affects
>>> the pSeries platform.
>> Not supposed to do this, because we might not be in a state
>> where the MMU is ready to be turned on at this point.
>>
>> I'd like to understand better which accesses are a problem, and whether
>> we can fix them all to be in the RMO.
>=20
> I faced three such access problems,
>   * accessing per-cpu data (like mce_event,mce_event_queue and mce_event_=
queue),
>     we can move this inside RMO.
>   * calling fwnmi_release_errinfo().
>   * And queuing work to irq_work_queue, not sure how to fix this.

Yeah. The irq_work_queue one is the biggest problem.

This code "worked" prior to the series unifying pseries and powernv
machine check handlers, 9ca766f9891d ("powerpc/64s/pseries: machine=20
check convert to use common event code") and friends. But it does in
basically the same way as your fix (i.e., it runs this early handler
in virtual mode), but that's not really the right fix.

Consider: you get a SLB multi hit on a kernel address due to hardware or=20
software error. That access causes a MCE, but before the error can be=20
decode to save and flush the SLB, you turn on relocation and that
causes another SLB multi hit...

I think the irq_work subsystem will have to be changed to use an array
unfortunately.

Thanks,
Nick

=
