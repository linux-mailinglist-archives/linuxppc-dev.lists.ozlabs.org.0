Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966A32D16F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 12:03:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrnzM0PgPz3clq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:03:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VG/4OHrD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VG/4OHrD; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drnyw4Brzz3cYD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:03:03 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id 192so11657568pfv.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 03:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+gWRxcdUXMQou9ziU1lKLrEon8VwgQT0NWd6SS7G4WA=;
 b=VG/4OHrDaovLA3OwfWlPeMGZwqwJmibuMwD9pS1rOUXRvuUoHHwifAksU4b05zfxTa
 tsjvOXmESHzDbxC9GpjoCmjTkhLU3dwTQgfzRVDCgTkDE+ghjMThKSw73l7cQ5/SbLEt
 IoXUrWyPXtV16vrq4YZAxMXUwL9PsvkGLbYDzngCtHQkXl1CxFZ7g7/CguAWwGxoz+80
 vkvzWHLNSWCn6mrr/epHi2uc9dyMLSPbsHHQIfZIiWhGUnpuHCkRhmyNGQolgCoj/A+h
 u2o9Ec42TjIY+KhUfNhkhlI75Cp8u37JqSx3JYwLSzdu033xWfpoQ6CSRjNsAjAoGjAX
 kFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+gWRxcdUXMQou9ziU1lKLrEon8VwgQT0NWd6SS7G4WA=;
 b=pTDlYOJd27vo37210a1lQAjokD9IoBMNyuAeMvXxnYimfkFtz5p/cFHkYDXUco8UHi
 6djqcEOyo1KW1ukrMAudgj8yHFVygqTkGaxXflBK4AaV3flBGX8QRbyaRLkFdO5VzYys
 Ib7bAaHOQo6XWgdRZr8Z9s/yNd4IECcKWk5sZm/ZPG8KljyGc6/XVCBbxMFagxFMBl3i
 3L5QWDvOYIKSkQ3SwdUawDgkVnpwyGlwST8GlzXFqhs0ohxhF5mgVo/9kjCW1aARZc9I
 dzJn69BiVI0k7GXw6iG9Zp32CDVY7kHuqXlqpPbenWRMavIENUcHxGZ3cm/xvk1KjQHu
 yvOA==
X-Gm-Message-State: AOAM533FnKt40emAPgBMmpgNNjMCCrmfhDDBrGfnyvEwSWSGw+1g4esv
 N68aKiY0roYg2iFpx82GA5A=
X-Google-Smtp-Source: ABdhPJw7HGv6gZKtEV1R5UJu3lP8PDz4gVRtiwaqTD13kyQhdKUKNvA25N45gXzYzF1JzriQeZbPTA==
X-Received: by 2002:a05:6a00:22d1:b029:1b4:9bb5:724c with SMTP id
 f17-20020a056a0022d1b02901b49bb5724cmr3667161pfj.63.1614855776615; 
 Thu, 04 Mar 2021 03:02:56 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id n24sm2591073pgl.27.2021.03.04.03.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 03:02:55 -0800 (PST)
Date: Thu, 04 Mar 2021 21:02:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 28/37] KVM: PPC: Book3S HV P9: Add helpers for OS SPR
 handling
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-29-npiggin@gmail.com> <87pn0hwq9f.fsf@linux.ibm.com>
In-Reply-To: <87pn0hwq9f.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1614855554.y6ukh6cl5v.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of March 3, 2021 1:04 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This is a first step to wrapping supervisor and user SPR saving and
>> loading up into helpers, which will then be called independently in
>> bare metal and nested HV cases in order to optimise SPR access.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
> <snip>
>=20
>> +/* vcpu guest regs must already be saved */
>> +static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
>> +				    struct p9_host_os_sprs *host_os_sprs)
>> +{
>> +	mtspr(SPRN_PSPB, 0);
>> +	mtspr(SPRN_WORT, 0);
>> +	mtspr(SPRN_UAMOR, 0);
>> +	mtspr(SPRN_PSPB, 0);
>=20
> Not your fault, but PSPB is set twice here.

Yeah you're right.

>> +
>> +	mtspr(SPRN_DSCR, host_os_sprs->dscr);
>> +	mtspr(SPRN_TIDR, host_os_sprs->tidr);
>> +	mtspr(SPRN_IAMR, host_os_sprs->iamr);
>> +
>> +	if (host_os_sprs->amr !=3D vcpu->arch.amr)
>> +		mtspr(SPRN_AMR, host_os_sprs->amr);
>> +
>> +	if (host_os_sprs->fscr !=3D vcpu->arch.fscr)
>> +		mtspr(SPRN_FSCR, host_os_sprs->fscr);
>> +}
>> +
>=20
> <snip>
>=20
>> @@ -3605,34 +3666,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
*vcpu, u64 time_limit,
>>  	vcpu->arch.dec_expires =3D dec + tb;
>>  	vcpu->cpu =3D -1;
>>  	vcpu->arch.thread_cpu =3D -1;
>> -	vcpu->arch.ctrl =3D mfspr(SPRN_CTRLF);
>> -
>> -	vcpu->arch.iamr =3D mfspr(SPRN_IAMR);
>> -	vcpu->arch.pspb =3D mfspr(SPRN_PSPB);
>> -	vcpu->arch.fscr =3D mfspr(SPRN_FSCR);
>> -	vcpu->arch.tar =3D mfspr(SPRN_TAR);
>> -	vcpu->arch.ebbhr =3D mfspr(SPRN_EBBHR);
>> -	vcpu->arch.ebbrr =3D mfspr(SPRN_EBBRR);
>> -	vcpu->arch.bescr =3D mfspr(SPRN_BESCR);
>> -	vcpu->arch.wort =3D mfspr(SPRN_WORT);
>> -	vcpu->arch.tid =3D mfspr(SPRN_TIDR);
>> -	vcpu->arch.amr =3D mfspr(SPRN_AMR);
>> -	vcpu->arch.uamor =3D mfspr(SPRN_UAMOR);
>> -	vcpu->arch.dscr =3D mfspr(SPRN_DSCR);
>> -
>> -	mtspr(SPRN_PSPB, 0);
>> -	mtspr(SPRN_WORT, 0);
>> -	mtspr(SPRN_UAMOR, 0);
>> -	mtspr(SPRN_DSCR, host_dscr);
>> -	mtspr(SPRN_TIDR, host_tidr);
>> -	mtspr(SPRN_IAMR, host_iamr);
>> -	mtspr(SPRN_PSPB, 0);
>>
>> -	if (host_amr !=3D vcpu->arch.amr)
>> -		mtspr(SPRN_AMR, host_amr);
>> +	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
>>
>> -	if (host_fscr !=3D vcpu->arch.fscr)
>> -		mtspr(SPRN_FSCR, host_fscr);
>> +	store_spr_state(vcpu);
>=20
> store_spr_state should come first, right? We want to save the guest
> state before restoring the host state.

Yes good catch. I switched that back around later but looks like I
never brought the fix back to the right patch. Interestingly, things=20
pretty much work like this if the guest or host doesn't do anything
much with the SPRs!

Thanks,
Nick
