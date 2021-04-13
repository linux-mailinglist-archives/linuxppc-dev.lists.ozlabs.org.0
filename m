Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6435D4CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 03:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK7H50x48z3c12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 11:26:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Tv5h1waf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tv5h1waf; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK7Gd4FzBz3015
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 11:25:59 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so9826580pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=eTsr3d6eEOR1XzCTesXBOr0Fg+ji7sYoXLS4ON7fZRs=;
 b=Tv5h1wafbEIH7n1k/NLIvBt0+QeeH1lYum69s1tNNMTWJjDDNrcvVBMpMxsoEjApBe
 lbeSZQHtbnzqRchKUAd/SCjzVbZlVGotVtwusLfGdCA9XV57zsQhNWSBSeYXtdXuqZxv
 j3Vgov3oI1JFGsdU9c987DKs2ayTirLd/2B8RgRgvRKf8uvgLzsxkaNDbdm2k291MCvw
 N89jGeh76rD5AsYa0meWzErHPrW60pJOuYHl/vQ/Eohl50AP0q4T0vFTwbegGMQ4MtyA
 2eAJTrkPEaPhEpnfLcwJXWFJoDzxsT0+u7BGxrMs4+IZ0jSiBR7nu6oq4sQqtsr9jJEF
 z+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eTsr3d6eEOR1XzCTesXBOr0Fg+ji7sYoXLS4ON7fZRs=;
 b=DWekk4uLWd0cqCfgwE93/Yp3akCn7JRQyWMWyxC3iT2h0kdT/aRBK1pX69j37lF0Fn
 v5yiBPJvaKSxuiq8rxV8ko5yYoq1aZ3jtJmwl4txOdWfqcNP2R+WkvgJA6+CgXhMoKac
 xVjqcKFGXZaum3Jc0RDooi/SNDs2/l8Khkpk6HCA+QwrhU8tPBLpsocLl029YGJ+oMWS
 7bZLu84aRay+S/QyCSLqm7Om/xyx/G8KU6fW439RDouEQlgKDBiG85vHb6pH9/TohD+A
 lxyTzBf3xSoTQHo0L4aIENsRl4nWli8wsTUJMGQrwvp1q5JOx8LxmDTYwW+/fS4mg7Kq
 gsaA==
X-Gm-Message-State: AOAM533bfmNLA29OwIH2PS+CnkOIlLyFMRK1pK6YNH8qKAQMgnWO4Ppz
 XrPydfC8a9FkTcSpwkwGmDw=
X-Google-Smtp-Source: ABdhPJyhhV03O9hReo/24ro8yI4w/s0Iu7Uy2z6ZbFA4lwVcHK63Y8NhRy90xm45ymE6+owSdK5aeA==
X-Received: by 2002:a17:90b:608:: with SMTP id
 gb8mr2071317pjb.121.1618277157501; 
 Mon, 12 Apr 2021 18:25:57 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id q17sm11893966pfq.171.2021.04.12.18.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 18:25:57 -0700 (PDT)
Date: Tue, 13 Apr 2021 11:25:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 01/12] KVM: PPC: Book3S HV P9: Restore host CTRL SPR
 after guest exit
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210412014845.1517916-1-npiggin@gmail.com>
 <20210412014845.1517916-2-npiggin@gmail.com> <877dl761iv.fsf@linux.ibm.com>
In-Reply-To: <877dl761iv.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1618276972.38i1q7a28t.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of April 13, 2021 12:06 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> The host CTRL (runlatch) value is not restored after guest exit. The
>> host CTRL should always be 1 except in CPU idle code, so this can result
>> in the host running with runlatch clear, and potentially switching to
>> a different vCPU which then runs with runlatch clear as well.
>>
>> This has little effect on P9 machines, CTRL is only responsible for some
>> PMU counter logic in the host and so other than corner cases of software
>> relying on that, or explicitly reading the runlatch value (Linux does
>> not appear to be affected but it's possible non-Linux guests could be),
>> there should be no execution correctness problem, though it could be
>> used as a covert channel between guests.
>>
>> There may be microcontrollers, firmware or monitoring tools that sample
>> the runlatch value out-of-band, however since the register is writable
>> by guests, these values would (should) not be relied upon for correct
>> operation of the host, so suboptimal performance or incorrect reporting
>> should be the worst problem.
>>
>> Fixes: 95a6432ce9038 ("KVM: PPC: Book3S HV: Streamlined guest entry/exit=
 path on P9 for radix guests")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 13bad6bf4c95..208a053c9adf 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3728,7 +3728,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *=
vcpu, u64 time_limit,
>>  	vcpu->arch.dec_expires =3D dec + tb;
>>  	vcpu->cpu =3D -1;
>>  	vcpu->arch.thread_cpu =3D -1;
>> +	/* Save guest CTRL register, set runlatch to 1 */
>>  	vcpu->arch.ctrl =3D mfspr(SPRN_CTRLF);
>> +	if (!(vcpu->arch.ctrl & 1))
>> +		mtspr(SPRN_CTRLT, vcpu->arch.ctrl | 1);
>=20
> Maybe ditch the comment and use the already defined CTRL_RUNLATCH?

I did it this way so you can more easily match up the C with the=20
existing asm version.

I have a later patch to clean up CTRL handling a bit (in both C and=20
asm).

Thanks,
Nick
