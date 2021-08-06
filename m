Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A473E28A5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 12:33:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh1yw59Pyz3d8F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 20:33:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=udTY6LYc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=udTY6LYc; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh1yT5q7yz3cHR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 20:32:48 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id q2so6450963plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FY9wGttQOvoswk4T19oVTWVLvt0qApUxTXdsanwYGM4=;
 b=udTY6LYcGvag50UNK8icCVl2/hUtd+ibX7PRLRDjYmiSDsPcw5IV1b46Do9sUSubWr
 xivqS+R0ePIp2Yy6YuFdaIl7TPesFQsUMxYl3RX5tFT6CpS2q+VcCxDuP533HwUIjofq
 8DocgNH4UShWtP2aMAPacVrQJhvK80dpsEfyo+eINmem4kV8qxctoKKaT/B7OR7iTNQa
 KfCVeAJ1Bf0kSnGE1a5/Slt50M5+wq8x6DTiVaM7Q8Qj70FJK8BneYdAw9OLc0eASY1j
 DeSLQJGsaJ78IzuInVFqRwxsMrlsObSEJFENE1z5IN/YjlpwT4vdSM9ofhaYtYgbv2eG
 0G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FY9wGttQOvoswk4T19oVTWVLvt0qApUxTXdsanwYGM4=;
 b=owgFIMc1mkuKReqscANpOu/OvY1/UYNF0bZjz9NK7mcZxXDGWIbk86bHKi9ZnlhXil
 IegOs1Hjt3ONiPugbk74yupkpivRGhAL/orvcfW3PJP6wLw0PiO6NKjP1ZlI5wKimbtC
 dK+Y3imZNvsbRsVsABvXR+xIRjDSbg7nzkNwowa7B1Ei2nLbW4LbxvDOer3BFDrxKGk2
 Q+mpxEmvS0A0PR0SplQ53PMwDQoKjTofbuEP6G2fzW2WXeFCzyc7ngaTKL4keZumjp8z
 tXrDZ8Mw3wRH2eW+2aE6jn00xL6vVlmaHlr6tEvMnKIr59x9Rs/I4stQD1MT6daCz0lQ
 7mAA==
X-Gm-Message-State: AOAM533UFQ8sUKW7KQ658BQI7wpJRUaprOz9viWvBvqgPielcCA5egv5
 r3VOJXjOyoweekZ9lnOFJ4Q=
X-Google-Smtp-Source: ABdhPJyy5l8Ku5yxRyZJNOY07SANGOLCpqkmGWuYVEauPmOHmjBl7NFXhsGcgNp6PAuCWBC2NB+xzQ==
X-Received: by 2002:a17:90a:e38b:: with SMTP id
 b11mr9806787pjz.70.1628245965861; 
 Fri, 06 Aug 2021 03:32:45 -0700 (PDT)
Received: from localhost ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id 20sm12630150pgg.36.2021.08.06.03.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:32:45 -0700 (PDT)
Date: Fri, 06 Aug 2021 20:32:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 14/55] KVM: PPC: Book3S HV: Don't always save PMU for
 guest capable of nesting
To: kvm-ppc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-15-npiggin@gmail.com>
 <871r77ni1g.fsf@mpe.ellerman.id.au>
In-Reply-To: <871r77ni1g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1628245856.8cocc7zj8u.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of August 6, 2021 5:34 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Revert the workaround added by commit 63279eeb7f93a ("KVM: PPC: Book3S
>> HV: Always save guest pmu for guest capable of nesting").
>>
>> Nested capable guests running with the earlier commit ("KVM: PPC: Book3S
>> HV Nested: Indicate guest PMU in-use in VPA") will now indicate the PMU
>> in-use status of their guests, which means the parent does not need to
>> unconditionally save the PMU for nested capable guests.
>>
>> This will cause the PMU to break for nested guests when running older
>> nested hypervisor guests under a kernel with this change. It's unclear
>> there's an easy way to avoid that, so this could wait for a release or
>> so for the fix to filter into stable kernels.
>=20
> I'm not sure PMU inside nested guests is getting much use, but I don't
> think we can break this quite so casually :)
>=20
> Especially as the failure mode will be PMU counts that don't match
> reality, which is hard to diagnose. It took nearly a year for us to find
> the original bug.
>=20
> I think we need to hold this back for a while.
>=20
> We could put it under a CONFIG option, and then flip that option to off
> at some point in the future.

Okay that might be a good compromise, I'll do that.

Thanks,
Nick
