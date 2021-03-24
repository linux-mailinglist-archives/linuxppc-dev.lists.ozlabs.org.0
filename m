Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAD346E9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4r8G1BdPz3bwq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 12:22:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fLMWxkB3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fLMWxkB3; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4r7s2cD7z30B1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 12:22:33 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id y5so16167922pfn.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 18:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VLp0/dDyk4EjnBgHnzs0JikL651xSfQ2Nz2XUIvb9N4=;
 b=fLMWxkB3JDtH6E17o/W8rZ+8d0BOCXklBK52kmGAcny4yJ+aZYWfCMXZQ1aTbSzAIS
 nOpG3umXljOc8fJ9+MkU1WJjpAQBDOjbjF6Saa8t+FOmigrg1mIIislQieSKY3MhzxCu
 5/RYmIlr+BdZJwATUccj/66KRvqVJdgqzNrBmtICMcTMhUhiZ0OJW88wuDbvL2d460uY
 XwZwShYP5k3Keo2lBgeKYwtUsKA6iK5udId7YB8z+OkB9aG9OVb5ZE+PgahsWo+ZHCcV
 XQOcTUlzyTFUMP1vr5W1TxG6acvtEGlZEaz4qeYipFRg1i036/ekumpx5ChkepJ/ROEN
 sM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VLp0/dDyk4EjnBgHnzs0JikL651xSfQ2Nz2XUIvb9N4=;
 b=TOu9PgEiiuIb6TiZclqXI+S1zcd1Bgbvzy7bx7BYT/O/Tr4pKXAZW8dqZBmzSItUir
 x8dSx2qDEw9B4tzTRIB4Lx2l4ys44xF404Mt2WjVuYvGAlhIksV+am8gFd6cAJLglsgQ
 C8fqhi3Be8ths8RwSMlc0jlLjRzhcKTy1c8XinmLvr+iL+Hgq84knoV/Q4liz5rxhcS0
 izt0A/RhYR2z9d5m763ZxyVU8uIQ+cjP7lulPM3X72zXt0cp/sHPibVVgXi8Auf7ipCJ
 YVjq5jGwiL5rPgeNa1PTG5a4Pte6HJakoYl4FN44AMaELL7ZInJc4x8cbakYeTxKwKZ0
 NIgw==
X-Gm-Message-State: AOAM530ECTUcSunuShbIMuDiAKPI/wITORpJV2BGELioHHNyv+l4PsEF
 xZqqKg2PuhoeaeOiwY/zyME=
X-Google-Smtp-Source: ABdhPJyfpFoUMy4L8Y8Bbw1hcDFGPQ8d98zEK++nehDthIzCF37Si42eFq1lC/447SPZnfJlWV8QKA==
X-Received: by 2002:aa7:990d:0:b029:21d:7aef:c545 with SMTP id
 z13-20020aa7990d0000b029021d7aefc545mr778385pff.77.1616548950944; 
 Tue, 23 Mar 2021 18:22:30 -0700 (PDT)
Received: from localhost (193-116-197-97.tpgi.com.au. [193.116.197.97])
 by smtp.gmail.com with ESMTPSA id i1sm359645pfo.160.2021.03.23.18.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:22:30 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:22:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 22/46] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-23-npiggin@gmail.com> <871rc5g32x.fsf@linux.ibm.com>
In-Reply-To: <871rc5g32x.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1616548908.9uulj8jwq3.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of March 24, 2021 4:03 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> In the interest of minimising the amount of code that is run in
>> "real-mode", don't handle hcalls in real mode in the P9 path.
>>
>> POWER8 and earlier are much more expensive to exit from HV real mode
>> and switch to host mode, because on those processors HV interrupts get
>> to the hypervisor with the MMU off, and the other threads in the core
>> need to be pulled out of the guest, and SLBs all need to be saved,
>> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
>> in host mode. Hash guests also require a lot of hcalls to run. The
>> XICS interrupt controller requires hcalls to run.
>>
>> By contrast, POWER9 has independent thread switching, and in radix mode
>> the hypervisor is already in a host virtual memory mode when the HV
>> interrupt is taken. Radix + xive guests don't need hcalls to handle
>> interrupts or manage translations.
>>
>> So it's much less important to handle hcalls in real mode in P9.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> I tried this again in the L2 with xive=3Doff and it works as expected now=
.
>=20
> Tested-by: Fabiano Rosas <farosas@linux.ibm.com>

Oh good, thanks for spotting the problem and re testing.

Thanks,
Nick

