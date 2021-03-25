Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687A349718
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 17:43:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5rWt1YXlz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 03:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ALPbykLR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ALPbykLR; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5rWR0DLZz30D8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 03:42:57 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id q3so2372420qkq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=nQz2FFQOVbXdb1nbA7usuQscVjdcM+pKQXNSzOfg+hY=;
 b=ALPbykLRvkeSQXAwHyRm4zfDOnJh4b6/wRGs+aUYsGZSIjDlbhhMFjIDFemRMdYPMq
 V0mugNl66OVvvLY4jcKxG7wlEQuZ2tLNJdsfpx92KDNEcH49zxOL/VVSD7apxqvXSUIa
 cZzdX2nJ79iU7+K/cs9CqIYV/Q01Y35WOKKOyv0S/g79GK0wo8hDMCU68nlXyohluUUN
 pDP/R++uPfjtJVXnpDEYJK8/A0SerROMRL4of8IsPM/gk69UYSZhANaIOS3vPEK2L7IQ
 eVUj5BnMsLefSjObFHH8VfsrWGXoAl1+QTErTvGryQrBIXXp+I5IxNEgU3CnnKc34rVj
 Sszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=nQz2FFQOVbXdb1nbA7usuQscVjdcM+pKQXNSzOfg+hY=;
 b=rmZpMjA569KJjYnkD/yVCDTePUPItDKLBMgvD53CcNyie/b6qI599RC4iQhm0hpT2M
 qV0S4PEiVbTFdOC5oYLC9tfPGQMA4VqH6v2aaaBAWX4NCP88CcRKVMpKojxOSeL1No0A
 TEycAViObPwsBsBMPzxHgddn2Eujsz8rKCUmCUhSFuliBzxdUn9XQyQjKWK4L8MiA1H2
 PLfDnBcyBYsK8w/AZDgX4Dsmld6lmpGGNW67Lh/c56JUx4c5VDtE0tFnvFWc+IjRGN3/
 VleL3QtGtnZfQRBOg2hFo/YCriO5w7bZaoCtOV+rsR1qVrC526YGHXg7KARBS5/k06wA
 v8Ug==
X-Gm-Message-State: AOAM532KqQcStqNyYHqZ/ORFS0shLZbmsgFrkj+Y/tPUIuDnFZGqOpeJ
 /1ufSwwiK6Lfhg9L+JOCUds=
X-Google-Smtp-Source: ABdhPJwFootViaDnm/L5OAhIV4/loi9y5igxc62Na47b2/oBl1G7aIZhhS0rvK90N5qsxuI7E3p/ZA==
X-Received: by 2002:a37:9e4e:: with SMTP id h75mr8931214qke.180.1616690571930; 
 Thu, 25 Mar 2021 09:42:51 -0700 (PDT)
Received: from [172.16.141.208] ([187.68.194.76])
 by smtp.gmail.com with ESMTPSA id a187sm4512112qkd.69.2021.03.25.09.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:42:51 -0700 (PDT)
Date: Thu, 25 Mar 2021 13:42:23 -0300
User-Agent: K-9 Mail for Android
In-Reply-To: <YFygSdFOT5B0DwRU@hirez.programming.kicks-ass.net>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <d7dd633b-e28a-155a-a8e2-0e5a83b4eead@linux.ibm.com>
 <YFyJr+R24TlrMNrC@kernel.org>
 <YFygSdFOT5B0DwRU@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 1/5] powerpc/perf: Expose processor pipeline stage
 cycles using PERF_SAMPLE_WEIGHT_STRUCT
To: Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
From: Arnaldo <arnaldo.melo@gmail.com>
Message-ID: <2BAC42AE-6BD3-45EF-8867-1A15F25FE80B@gmail.com>
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
Cc: ravi.bangoria@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, jolsa@kernel.org,
 kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On March 25, 2021 11:38:01 AM GMT-03:00, Peter Zijlstra <peterz@infradead=
=2Eorg> wrote:
>On Thu, Mar 25, 2021 at 10:01:35AM -0300, Arnaldo Carvalho de Melo
>wrote:=2E
>> > > Also for CPU_FTR_ARCH_31, capture the two cycle counter
>information in
>> > > two 16 bit fields of perf_sample_weight structure=2E
>> >=20
>> > Changes looks fine to me=2E
>> >=20
>> > Reviewed-by: Madhavan Srinivasan <maddy@linux=2Eibm=2Ecom>
>>=20
>> So who will process the kernel bits? I'm merging the tooling parts,
>
>I was sorta expecting these to go through the powerpc tree=2E Let me know
>if you want them in tip/perf/core instead=2E

Shouldn't matter by which tree it gets upstream, as long as it gets picked=
 :-)

- Arnaldo

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
