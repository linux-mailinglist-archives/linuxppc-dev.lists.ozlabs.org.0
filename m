Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0D351524
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB3sz2L6wz3c2b
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:28:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LdF6JJ4x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LdF6JJ4x; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB3sZ0Hlsz3014
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 00:28:17 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id v186so1514599pgv.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=moDbZSIuQbE+Re/GxIqrR5DF17rrpW/0FK43E8e+pFA=;
 b=LdF6JJ4xXCgaxItU5LDAPV4SIK6+1ZisRfBsLfB5H1eu8ikNJ5B+DGAC2DaQTG7NwS
 HVEh8fAGufr1Y2jl/afLlsi+ZDQ8LF7NMzPzY/EBUPqIhRtJiAc1vQD9Etj97Y4CScoQ
 sCjkSBJ7STB2JywhLuU7vYCygtlIsoU4XyqM6AsTPtlHxDkOeB6d/3dUEZa6Zxxw0QWC
 +ZB4LjgduEiZWj2QflNkQmavrcikpvRIh1HzChO2haEbpaI3Uk8NsrY20/lbdGkKU/m6
 mlewigh1FrcR1IwLtIyT/Cx2K4/RbIUl+WOXTbX2gY7wiBZqDgqkhAyIbp4USbWWuxvR
 NtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=moDbZSIuQbE+Re/GxIqrR5DF17rrpW/0FK43E8e+pFA=;
 b=pECbCqPLEa/vkEBxiScGOEbvu4iaqp/YgIhAovRQSsgnBP3sYBPSeTkW8XuF4+rFZ1
 VT6iTpJ/qH8zkHhgta6JqLktwsu/ziHj2fq9wZJYMajBaoRBPSWQJDK8Sxyf+C7WuKC4
 CGfOGf6YGChb4SmCkHTX+ccu4lTwiYgxZNKeaMVTLUoeAL/+Xg1n8kINHlMi/REAlc7h
 72nPdEtS9futs/0FBM/VmddulFIDSE41BVlgqGZVwOyi1xI5/ecc9w48uz3KY+Sp8qbl
 RGiz3rABDs8MOSQWp+GELRS++Vu9EGyckshsqKxVnjDWoTtb63ZZakrilP7X1VU70YRe
 okYQ==
X-Gm-Message-State: AOAM532N4n1NPfEI6iTm4vCCRBsTUsH0tX7t+oS+HyD6MUQ3hu+rLHX1
 pQ6/ZsLNjJHTcHU2duiwVo4=
X-Google-Smtp-Source: ABdhPJw1sOrEU/4cofTB8qbdFtxs+oTQFcpgbhYGb0n/BpWB98aRuZDlGFVhKnmkasp8AP0EUr6IFA==
X-Received: by 2002:a62:180f:0:b029:225:5266:2b61 with SMTP id
 15-20020a62180f0000b029022552662b61mr7771209pfy.30.1617283695211; 
 Thu, 01 Apr 2021 06:28:15 -0700 (PDT)
Received: from localhost ([1.128.222.58])
 by smtp.gmail.com with ESMTPSA id z8sm5783437pjd.0.2021.04.01.06.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 06:28:14 -0700 (PDT)
Date: Thu, 01 Apr 2021 23:28:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/46] KVM: PPC: Book3S HV: Add a function to filter
 guest LPCR bits
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-3-npiggin@gmail.com>
 <YGP1uXH5q72auwP7@thinks.paulus.ozlabs.org>
 <1617269036.86nd07dbhp.astroid@bobo.none>
In-Reply-To: <1617269036.86nd07dbhp.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1617283627.0fudnz2en1.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 1, 2021 7:32 pm:
> Excerpts from Paul Mackerras's message of March 31, 2021 2:08 pm:
>> On Tue, Mar 23, 2021 at 11:02:21AM +1000, Nicholas Piggin wrote:
>>> Guest LPCR depends on hardware type, and future changes will add
>>> restrictions based on errata and guest MMU mode. Move this logic
>>> to a common function and use it for the cases where the guest
>>> wants to update its LPCR (or the LPCR of a nested guest).
>>=20
>> [snip]
>>=20
>>> @@ -4641,8 +4662,9 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned=
 long lpcr, unsigned long mask)
>>>  		struct kvmppc_vcore *vc =3D kvm->arch.vcores[i];
>>>  		if (!vc)
>>>  			continue;
>>> +
>>>  		spin_lock(&vc->lock);
>>> -		vc->lpcr =3D (vc->lpcr & ~mask) | lpcr;
>>> +		vc->lpcr =3D kvmppc_filter_lpcr_hv(vc, (vc->lpcr & ~mask) | lpcr);
>>=20
>> This change seems unnecessary, since kvmppc_update_lpcr is called only
>> to update MMU configuration bits, not as a result of any action by
>> userspace or a nested hypervisor.  It's also beyond the scope of what
>> was mentioned in the commit message.
>=20
> I didn't think it was outside the spirit of the patch, but yes
> only the guest update LPCR case was enumerated. Would it be more=20
> consistent to add it to the changelog and leave it in here or would
> you prefer it left out until there is a real use?

On second thoughts, I already left at least one other place without
such a check, so I now tend to agree with you. But I instead added
a test that just ensures the host is not out of synch with itself in
terms of what it can set the LPCR to.

Thanks,
Nick
