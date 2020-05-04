Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA191C343F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 10:21:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Fwn72Z2JzDqdr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 18:21:47 +1000 (AEST)
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
 header.s=20161025 header.b=fwbM1ulg; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Fwl73J4HzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 18:20:00 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id h11so6488154plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 01:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=uUW5/vF4MOLkv4M2783FGaQzcfGkuT5UyWk53Hddhq4=;
 b=fwbM1ulglqp5T1mxRQXDANJ5m6xMWeRuSRYM7qjwjmXeO54HBJUkvEVEEP708006Yb
 VVT/mWuk2pqDj1fKkxyMwdYeXonPlw8Gh07zh4MRFRBtKLVgy/STEEcO3naZDJknS5P/
 pcyHYVy8aYE9W3CD2odXFF82w8lMmrfNjR6yYyq/5aMhk4wXwOkr8oarwDIElfEjKF/m
 bkxkfQHSDswcY6uWAVY4lLiO/XYTdfZObnmRFyO7BLVAjbw1cqJMKc4c2ifzzAaJSNoP
 fXd6TXGarVXHTWeVBAVxvdbZxbKHvjAefJVD6huXsxKPJj8wgy8aFmt80X8DIEoShWf8
 8hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=uUW5/vF4MOLkv4M2783FGaQzcfGkuT5UyWk53Hddhq4=;
 b=M6z921aAnW5FGds8j0sH5E6jm/afc+PCPDVZ3CBnF4yxXjpuf/ZGrV/rKS9AJ7THw/
 RFoijF7BsnTqCP96sn/IUzEB4DcSb9tJbg2KrJhaZy8/YR32OnazC5XTDtpqVEfMnooH
 96i1HxLDeD5eXHzoiWTOxOqGpavFSJEi0+4vMVsQ4icBcu3xkuHNZwAnW7/XJ9bFSS8O
 Nc0yX9XiVrGDnVlCQ6mzBj4baX6KpBKs2Un33cGIvLdB+ryCzLPS7/GvR6y+8Yc4KhBn
 vmxlJdEldtuba5Azg3VAD+t9VlNpWh0ZCatB4Uw3kF7ehnMQT7r8+BPrXTN3wCV4J/m5
 mF3w==
X-Gm-Message-State: AGi0Pubj00V/kaMNmfvMcylVKIutbnmtWAokqXE+QtgXBpMgqoZA7a5r
 Sa5BJV3O6Dg278S/dZBD4SQ=
X-Google-Smtp-Source: APiQypJ9eY2b0BtT6GvvKrbF2Jmd3tTbiHsy2vtKlNRN6hT7jMwA/ZI1fIComFENFzxaiaV4O16ONg==
X-Received: by 2002:a17:902:d70b:: with SMTP id
 w11mr657568ply.216.1588580398888; 
 Mon, 04 May 2020 01:19:58 -0700 (PDT)
Received: from localhost (193-116-199-65.tpgi.com.au. [193.116.199.65])
 by smtp.gmail.com with ESMTPSA id e2sm6069266pjt.2.2020.05.04.01.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 01:19:58 -0700 (PDT)
Date: Mon, 04 May 2020 18:19:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s/hash: add torture_slb kernel boot option
 to increase SLB faults
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200503082236.17991-1-npiggin@gmail.com>
 <877dxsma7p.fsf@linux.ibm.com>
In-Reply-To: <877dxsma7p.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1588579594.33h8ri1xco.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of May 4, 2020 5:27 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This option increases the number of SLB misses by limiting the number of
>> kernel SLB entries, and increased flushing of cached lookaside informati=
on.
>> This helps stress test difficult to hit paths in the kernel.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> ....
>=20
>> +{
>> +	unsigned long slbie_data =3D get_paca()->slb_cache[index];
>> +	unsigned long ksp =3D get_paca()->kstack;
>> +
>> +	slbie_data <<=3D SID_SHIFT;
>> +	slbie_data |=3D 0xc000000000000000ULL;
>> +	if ((ksp & slb_esid_mask(mmu_kernel_ssize)) =3D=3D slbie_data)
>> +		return;
>> +	slbie_data |=3D mmu_kernel_ssize << SLBIE_SSIZE_SHIFT;
>> +
>> +	asm volatile("slbie %0" : : "r" (slbie_data));
>> +}
>> +
>> +static void slb_cache_slbie(unsigned int index)
>=20
> May be slb_cache_slbie_user()? Similar to _kernel above?

Yeah that'd help.

>> +{
>> +	unsigned long slbie_data =3D get_paca()->slb_cache[index];
>> +
>> +	slbie_data <<=3D SID_SHIFT;
>> +	slbie_data |=3D user_segment_size(slbie_data) << SLBIE_SSIZE_SHIFT;
>> +	slbie_data |=3D SLBIE_C; /* user slbs have C=3D1 */
>> +
>> +	asm volatile("slbie %0" : : "r" (slbie_data));
>> +}
>> =20
>>  /* Flush all user entries from the segment table of the current process=
or. */
>>  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>> @@ -414,8 +449,14 @@ void switch_slb(struct task_struct *tsk, struct mm_=
struct *mm)
>>  	 * which would update the slb_cache/slb_cache_ptr fields in the PACA.
>>  	 */
>>  	hard_irq_disable();
>> -	asm volatile("isync" : : : "memory");
>> -	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
>> +	isync();
>> +	if (torture_slb()) {
>> +		__slb_flush_and_restore_bolted(0);
>=20
> s/0/SLIBA_IH_ALL or something like that?=20

IH isn't so simple. 0 isn't all, it's clear all SLBE except index zero,=20
and flush all EA lookaside data.

Maybe callers should use a bool parameter though to flush kernel=20
lookaside data.

Thanks,
Nick
