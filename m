Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384CC48A63C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 04:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXwyn0Dpgz3bTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 14:24:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xih5sPt5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Xih5sPt5; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXwy43QSsz2yRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 14:23:22 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso2466957pjm.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 19:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cGcjhxHa1UfE+w3Pwk1V+Srw14TjijtJvFVLj26vVvk=;
 b=Xih5sPt5ya8F7x6OJi3Vgl+zKxKXV3Vs0d8C5NqtFAHFULSatRxOCF1Ohknsaeuu+M
 cr2Kpue/a1sHrxZ2FaEirnXxczrB7/JmtLS0Z5C3w3gNyhHYRKEB+9YIZzXs+chGGW46
 xolCyFc62sJyng+oDzpiipONXIFe7aqiTBwszfCB4SmoVYJ8HNjXiaxCm28VJCpzKk3M
 C0D2BUsSmgM3z5HOQE7l90mwxo8ciKZHi/fZdDihAabd16nu527RvS2z0QKcKcphbYBB
 DFbMzdVT0ScFhicrFzxReRPl7f8l6epdHVhNSsHpudkMRfzGdjYIWTiJFeL3APp+x4ZK
 C6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cGcjhxHa1UfE+w3Pwk1V+Srw14TjijtJvFVLj26vVvk=;
 b=GeH7pziDTEzbbTqCRU7FvBXbKd7lhr9l215LJlfNFNKb5UUxO1yL91KiH2ezpIrW5G
 HV4TyiBT0rzDWDSzpDn2ks++OC90q2nsb+RstTZLI8tpyRqCf60ffxHDycuYGgaHX/WK
 XsuefiBDwnRCYKapDGrhy09EiTF9lrNkp+CTAKzz2ifP9AhpD3Cj49X/yZSS3+IVGBTx
 4lL6D/SvXsnYitL2bZC8q7l94MyshHYJ+pOG6RC2QMJDfYwVGV9sCPm4ClYtDiVi8QIe
 4r3Xvo74dWswfB5OvifQtJw7w70OqIQJxJjEgYyYcKHDsXKYEDFPAbyf2cAE3u89mWkF
 JSRQ==
X-Gm-Message-State: AOAM531YLbI+EyYJTte9Rux+9Wouw4MNxEHLJvIttlfBYu4bw8iH3Lbd
 7t+3o8y+gF6wOwjjo/e8K7U=
X-Google-Smtp-Source: ABdhPJxdlbhSugTpZ/4WKbny7vCIqL/mMNTIu6//CvE+AzpbsW4CZp+RjANvZmnFBx6h99eWTKSIKQ==
X-Received: by 2002:a63:cc4d:: with SMTP id q13mr2355485pgi.166.1641871399359; 
 Mon, 10 Jan 2022 19:23:19 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id em22sm431516pjb.23.2022.01.10.19.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 19:23:19 -0800 (PST)
Date: Tue, 11 Jan 2022 13:23:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 5/6] KVM: PPC: mmio: Return to guest after emulation
 failure
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Fabiano Rosas
 <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-6-farosas@linux.ibm.com>
 <1641799578.6dxlxsaaos.astroid@bobo.none>
 <bf61f021-15b3-7093-f991-cdcda93d059d@ozlabs.ru>
In-Reply-To: <bf61f021-15b3-7093-f991-cdcda93d059d@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1641870717.tcavxuxzck.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of January 11, 2022 9:51 am:
>=20
>=20
> On 1/10/22 18:36, Nicholas Piggin wrote:
>> Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
>>> If MMIO emulation fails we don't want to crash the whole guest by
>>> returning to userspace.
>>>
>>> The original commit bbf45ba57eae ("KVM: ppc: PowerPC 440 KVM
>>> implementation") added a todo:
>>>
>>>    /* XXX Deliver Program interrupt to guest. */
>>>
>>> and later the commit d69614a295ae ("KVM: PPC: Separate loadstore
>>> emulation from priv emulation") added the Program interrupt injection
>>> but in another file, so I'm assuming it was missed that this block
>>> needed to be altered.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>   arch/powerpc/kvm/powerpc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>>> index 6daeea4a7de1..56b0faab7a5f 100644
>>> --- a/arch/powerpc/kvm/powerpc.c
>>> +++ b/arch/powerpc/kvm/powerpc.c
>>> @@ -309,7 +309,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>>>   		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
>>>   		kvmppc_core_queue_program(vcpu, 0);
>>>   		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
>>> -		r =3D RESUME_HOST;
>>> +		r =3D RESUME_GUEST;
>>=20
>> So at this point can the pr_info just go away?
>>=20
>> I wonder if this shouldn't be a DSI rather than a program check.
>> DSI with DSISR[37] looks a bit more expected. Not that Linux
>> probably does much with it but at least it would give a SIGBUS
>> rather than SIGILL.
>=20
> It does not like it is more expected to me, it is not about wrong memory=20
> attributes, it is the instruction itself which cannot execute.

It's not an illegal instruction though, it can't execute because of the
nature of the data / address it is operating on. That says d-side to me.

DSISR[37] isn't perfect but if you squint it's not terrible. It's about
certain instructions that have restrictions operating on other than
normal cacheable mappings.

Thanks,
Nick


>=20
> DSISR[37]:
> Set to 1 if the access is due to a lq, stq, lwat, ldat, lbarx, lharx,=20
> lwarx, ldarx, lqarx, stwat,
> stdat, stbcx., sthcx., stwcx., stdcx., or stqcx. instruction that=20
> addresses storage that is Write
> Through Required or Caching Inhibited; or if the access is due to a copy=20
> or paste. instruction
> that addresses storage that is Caching Inhibited; or if the access is=20
> due to a lwat, ldat, stwat, or
> stdat instruction that addresses storage that is Guarded; otherwise set=20
> to 0.
>=20
