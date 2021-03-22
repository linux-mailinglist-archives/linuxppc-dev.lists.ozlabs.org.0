Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F86343766
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 04:27:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3g1B2yPdz3042
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:27:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YrsobDmX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YrsobDmX; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3g0n2Jlsz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 14:27:18 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id f17so5813813plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 20:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=G/MrW95o3wTpkGn3xBSw1QV9Ky7pWJ39YmqwrFHA0kE=;
 b=YrsobDmXdbZYfK5pANFSFVISLsbol5RaLwiqY0BID97Issa2mmCzMfqj53xQS6bou/
 iH9xlStOPyRd7f6ikx9I/AquNTaARyWwYC+XTj0tq6Ya0+/pgSpWC77C2BD+0awvA6+b
 EsNKg11DKqIAxQFXafnzKbWH9NZ4S/zehUe6QgcHxHsqZ27aXAd/kzK+Sylg9av0FECQ
 HLbGRJ5aLoIjXWsNjeMlKdPtOfw82nJ5wih987tH1HaEvVl0GVP/c/2IhRYIOYIfEWsi
 4Zd+snqGn+9bhNd4qgnYocVHASI7yZRi8/qw0/nfjRLIqyAUHSXiBRn9WuQgbKJIzlv/
 D90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=G/MrW95o3wTpkGn3xBSw1QV9Ky7pWJ39YmqwrFHA0kE=;
 b=MjvLinvbbA6fZTCL+y6HAMzUDWmL9APwIP/tzffQRG7N6R/d/9ZzN+1KDhV+wl69ri
 3U3FXkAKVgYb8vuPWryB0VbBA12CvRYlY93tQTT/4ldoRFMuJ2KfKNdpers+Mx8hl49h
 qBCDcK03xySDzi77sHugzSwVpeRCXJ23Zc5T5/u6na+pMl5Tk3FXm85Mz7Fs5EYExjLb
 /kC1i0UGkgVaRt7ksWdJzEV6vYVC41HSJLyenawbqnZ78lFygG2bpGH9nqYQBYST/juF
 Y7/X18buf2hnSemOZxjvG6f6oUnZH0ENRbj43yCRgqCma5K03/bRbqni1bC/ZDT8oWn5
 lLuA==
X-Gm-Message-State: AOAM53071d9Isrhd4HtospmCUiICuEwcHpiga8jQvZVcZTjZuOKk8v51
 5C6a5jbbkRGKV3y7bY1+8VM=
X-Google-Smtp-Source: ABdhPJyI7hkhuRRyFmuikHycx7qL5FUFckW3Lw//9yrzFtlVzh49hYOs3AVH4Qs9Ug7hl9htoZh8Bg==
X-Received: by 2002:a17:902:c382:b029:e4:7015:b646 with SMTP id
 g2-20020a170902c382b02900e47015b646mr25634069plg.83.1616383635752; 
 Sun, 21 Mar 2021 20:27:15 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id gz4sm12631722pjb.0.2021.03.21.20.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 20:27:15 -0700 (PDT)
Date: Mon, 22 Mar 2021 13:27:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 34/41] KVM: PPC: Book3S HV: Remove support for
 dependent threads mode on P9
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-35-npiggin@gmail.com> <87ft0tzug8.fsf@linux.ibm.com>
In-Reply-To: <87ft0tzug8.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1616383211.2tllx3llud.astroid@bobo.none>
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

Excerpts from Aneesh Kumar K.V's message of March 18, 2021 1:11 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Radix guest support will be removed from the P7/8 path, so disallow
>> dependent threads mode on P9.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/kvm_host.h |  1 -
>>  arch/powerpc/kvm/book3s_hv.c        | 27 +++++----------------------
>>  2 files changed, 5 insertions(+), 23 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/=
asm/kvm_host.h
>> index 05fb00d37609..dd017dfa4e65 100644
>> --- a/arch/powerpc/include/asm/kvm_host.h
>> +++ b/arch/powerpc/include/asm/kvm_host.h
>> @@ -304,7 +304,6 @@ struct kvm_arch {
>>  	u8 fwnmi_enabled;
>>  	u8 secure_guest;
>>  	u8 svm_enabled;
>> -	bool threads_indep;
>>  	bool nested_enable;
>>  	bool dawr1_enabled;
>>  	pgd_t *pgtable;
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index cb428e2f7140..928ed8180d9d 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -103,13 +103,9 @@ static int target_smt_mode;
>>  module_param(target_smt_mode, int, 0644);
>>  MODULE_PARM_DESC(target_smt_mode, "Target threads per core (0 =3D max)"=
);
>> =20
>> -static bool indep_threads_mode =3D true;
>> -module_param(indep_threads_mode, bool, S_IRUGO | S_IWUSR);
>> -MODULE_PARM_DESC(indep_threads_mode, "Independent-threads mode (only on=
 POWER9)");
>> -
>>  static bool one_vm_per_core;
>>  module_param(one_vm_per_core, bool, S_IRUGO | S_IWUSR);
>> -MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a=
 core (requires indep_threads_mode=3DN)");
>> +MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a=
 core (requires POWER8 or older)");
>=20
> Isn't this also a security feature, where there was an ask to make sure
> threads/vCPU from other VM won't run on this core? In that context isn't
> this applicable also for P9?

I'm not sure about an ask, but it is a possible security feature that=20
would be relevant to all SMT CPUs running KVM guests.

It doesn't make much sense to plumb P9 support all through the P8 path=20
just for that though, in my opinion? Is it tested? Who uses it? It's
lacking features of the P9 path.

It would be better added to KVM/QEMU in general (or until that is=20
available, disable SMT, or use CPU pinning and isolcpus to prevent host=20
code running on secondaries, and isolating VMs from one another, etc).

I think it's quite possible to rendezvous threads in kernel, move them
onto the threads of a core, and then have them all running in KVM code=20
before they enter the guest, without disabling SMT in the host.

You could do it with kernel threads on the secondaries even, but I=20
wouldn't like to have to plumb the vcore concept entirely through=20
everywhere so I would actually prefer to see QEMU grow an understanding=20
of it so it would know it has to call the ioctl on every guest SMT=20
thread.

Thanks,
Nick
