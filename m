Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B001FA20F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 22:54:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m3V02rn8zDqZw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 06:54:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=CAVO4gWs; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m3RF335yzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 06:51:49 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id k2so364636pjs.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=NEGpBhzajRvF6MnLoS3/tW4o+xI54R1ORmU7+pXtHgE=;
 b=CAVO4gWs4evuqxTXK2KCGxd4s8FQi+TTDSLN297LSL3es1KODeKbGPV9mlrfjetsXf
 v0HKTGVYLoAqhJhrwOd5Vk0N5GOco/ahrHy/bgts2ivjvsbkW6XgnzOHmBrYE+Pp2Y1J
 nGdFYpsbdrlQlebSLBTotHPvmRSjaUsVZqye4Dd2PA0OURe3oRw0zP2eMBDcd6VQZihT
 FRcuywOs/douthqwTVN6eo7mcBIE7qXFhbRpBk2SHNXj25Qi3MP8jltZVZIXtbslMuaB
 VD3oaozewaoKV4crG14zN+9m85zBgfwiDTmWyKTBDDSH261G6U1wYGLJwtEtYDDK+7kb
 c+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=NEGpBhzajRvF6MnLoS3/tW4o+xI54R1ORmU7+pXtHgE=;
 b=qJuwG7mLaC5eE/QjI8+ExI0L8cQHzG8A4ozBPXyyk1cgoFQxyN3C4AjTTgNfcxh3SG
 xq8i4/ncmFLZkkEATOwIqwVD2QadP9nt3rsswRgAxhMjqSnb0zTVnuhS/vdoPKrJT9lj
 NIYLPV7gzL7WnuE70Xfmc9i5a+UauE4LmR1VFXD7oW3tBY7WpxbPZnCdkCaKA/lg/D5L
 GBoVB4HHs3WEDM/pXUxFxGWWt0ZoYR4MRfU+eWbr3g6Zqam6rcyVVgCE8oJqMqyZ51e9
 NseCWXcg99iXfPdqPFPBJnfwGrKcPp451lAurAJ8bXkmvebn4OdFYHUBwAOM+wwIB9GG
 v+Fg==
X-Gm-Message-State: AOAM533A/XewkxsQqafo+cxlStEUpG7lJfrB9BWaV+8vqtu4FB/S5ufn
 pDCG4csES76hDs+JzhNqgrDTAg==
X-Google-Smtp-Source: ABdhPJzJVNx7nQtAyuRZTQv2cHaZxJpL+9jFfYmiZnjQELc31r77D7nEgtShc/qKvBOxL6bGQEnZAg==
X-Received: by 2002:a17:902:7896:: with SMTP id
 q22mr13701253pll.338.1592254306139; 
 Mon, 15 Jun 2020 13:51:46 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:bdcc:b60c:73b8:18ca?
 ([2601:646:c200:1ef2:bdcc:b60c:73b8:18ca])
 by smtp.gmail.com with ESMTPSA id i5sm14721024pfd.5.2020.06.15.13.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 13:51:45 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Date: Mon, 15 Jun 2020 13:51:39 -0700
Message-Id: <C41D099B-BE2E-4D0E-A7B5-7CE587E11930@amacapital.net>
References: <20200615201735.GE13792@romley-ivt3.sc.intel.com>
In-Reply-To: <20200615201735.GE13792@romley-ivt3.sc.intel.com>
To: Fenghua Yu <fenghua.yu@intel.com>
X-Mailer: iPhone Mail (17F80)
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 H Peter Anvin <hpa@zytor.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 x86 <x86@kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Sohil Mehta <sohil.mehta@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Jun 15, 2020, at 1:17 PM, Fenghua Yu <fenghua.yu@intel.com> wrote:
>=20
> =EF=BB=BFHi, Peter,
>=20
>> On Mon, Jun 15, 2020 at 09:09:28PM +0200, Peter Zijlstra wrote:
>>> On Mon, Jun 15, 2020 at 11:55:29AM -0700, Fenghua Yu wrote:
>>>=20
>>> Or do you suggest to add a random new flag in struct thread_info instead=

>>> of a TIF flag?
>>=20
>> Why thread_info? What's wrong with something simple like the below. It
>> takes a bit from the 'strictly current' flags word.
>>=20
>>=20
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index b62e6aaf28f0..fca830b97055 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -801,6 +801,9 @@ struct task_struct {
>>    /* Stalled due to lack of memory */
>>    unsigned            in_memstall:1;
>> #endif
>> +#ifdef CONFIG_PCI_PASID
>> +    unsigned            has_valid_pasid:1;
>> +#endif
>>=20
>>    unsigned long            atomic_flags; /* Flags requiring atomic acces=
s. */
>>=20
>> diff --git a/kernel/fork.c b/kernel/fork.c
>> index 142b23645d82..10b3891be99e 100644
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c
>> @@ -955,6 +955,10 @@ static struct task_struct *dup_task_struct(struct ta=
sk_struct *orig, int node)
>>    tsk->use_memdelay =3D 0;
>> #endif
>>=20
>> +#ifdef CONFIG_PCI_PASID
>> +    tsk->has_valid_pasid =3D 0;
>> +#endif
>> +
>> #ifdef CONFIG_MEMCG
>>    tsk->active_memcg =3D NULL;
>> #endif
>=20
> The PASID MSR is x86 specific although PASID is PCIe concept and per-mm.
> Checking if the MSR has valid PASID (bit31=3D1) is an x86 specifc work.
> The flag should be cleared in cloned()/forked() and is only set and
> read in fixup() in x86 #GP for heuristic. It's not used anywhere outside
> of x86.
>=20
> That's why we think the flag should be in x86 struct thread_info instead
> of in generice struct task_struct.
>=20

Are we planning to keep PASID live once a task has used it once or are we go=
ing to swap it lazily?  If the latter, a percpu variable might be better.

> Please advice.
>=20
> Thanks.
>=20
> -Fenghua
