Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD74344B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 07:36:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYzqt24h3z30BM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 16:36:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gmS/KPHy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gmS/KPHy; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYzqF3PYxz2yPq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 16:35:52 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id i5so9092221pla.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 22:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=bj3hx8Y6AacG6Of7JEEk2v73n8thJfWW7BGtf0XwtkE=;
 b=gmS/KPHyQX7FAsqux0+YDviUifTY1ZMSSY+i/gfBMKYVFf2a4Fwv9JLzMdylQoSev4
 4lWtL6xuxhXp16Kvq7uLBrF/hVI9Y/yUrbBopHrkp3zxfyxyneFwNQvbT26PHOLurgpi
 RWwY4NOxQaPPG+vHtZazZU79EsojV8jehR5IYuHQc+PRZl1lvJbyRdjnBsdT4sMBp23P
 X1SMWOCJj2ZvrnBKna7nSSmBeHB9EFq0+3jCjHj/TbFWdsn/o6nxxRmMt+Dl+oVylalO
 SAz8QRYpVi3teFl8oc5B5kFPo9MvNM0mhDvVqnYMFQ428qKcwVbe9nXNUA/ZE8q3qV7H
 Bxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bj3hx8Y6AacG6Of7JEEk2v73n8thJfWW7BGtf0XwtkE=;
 b=N0/r5KcsRarn7M6q4uYMHL0nJlsGazUMl+EJWincTjbEaofU3Pcq13hscg9T1i+IPS
 Jog7MN0DaLjr0azWlwOCPwEmazqtRhor/IVQutPYGvy8Lu1dlZ4Z6yrpDYLZ2YxUItDC
 45bjByB3Xn95ek5PqPqVbVJc8MozHmRd3ehdcTMtdfPn/0YHuytgJvFacxH4FDZhkAhv
 OVNTd2fFWq/xD0F2INJRTVh2tOs7GJkPQ6FpGiXaE2Rt/58xFv039fnUtkA+3R/ZGjXQ
 VYog8wavh6U4IlpQRzNK3dmzcu3MDo+qozh35UcmJ4KdhVsVXDdy2MkdDPpgVp/9i+EY
 lBqw==
X-Gm-Message-State: AOAM533lm6vi7H7/qaZ3qspMWrgGQ0AacwkIfO9zu3rWeNBJli37YkhZ
 75XoUPvf20PmHqRxrp05pXiM9tzpyRA=
X-Google-Smtp-Source: ABdhPJyYWmPuvcR3GgqSyVpA+gZGrCHU3CwR3fhKX2mrZLKmHzLirQvZAhpvkqHlaJVtBIkmMlJJBA==
X-Received: by 2002:a17:90a:6b0b:: with SMTP id
 v11mr2419300pjj.178.1634708149510; 
 Tue, 19 Oct 2021 22:35:49 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 m11sm906035pga.27.2021.10.19.22.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 22:35:49 -0700 (PDT)
Date: Wed, 20 Oct 2021 15:35:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 19/52] KVM: PPC: Book3S HV P9: Reduce mtmsrd
 instructions required to save host SPRs
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20211004160049.1338837-1-npiggin@gmail.com>
 <20211004160049.1338837-20-npiggin@gmail.com> <87r1clw0a7.fsf@linux.ibm.com>
In-Reply-To: <87r1clw0a7.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1634707623.6hcz0vobiz.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of October 16, 2021 11:45 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This reduces the number of mtmsrd required to enable facility bits when
>> saving/restoring registers, by having the KVM code set all bits up front
>> rather than using individual facility functions that set their particula=
r
>> MSR bits.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
>=20
> Aside: at msr_check_and_set what's with MSR_VSX always being implicitly
> set whenever MSR_FP is set? I get that it depends on MSR_FP, but if FP
> always implies VSX, then you could stop setting MSR_VSX in this patch.

Good question, this seems to come from quite old code and is carried
forward. I did not immediately see why, might have been to avoid
another mtmsrd operation if we later want to set VSX.

But the rule seems to be to set MSR_VSX if both FP and VEC are set, so
this seems a bit odd. __msr_check_and_clear similarly clears VSX if we=20
clear FP, but not if we clear VEC.

I might be good to remove that logic or turn it into warnings and make=20
sure the callers do the right thing. Not sure.

Thanks,
Nick
