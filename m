Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D282E31F577
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 08:54:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhkP22J8Gz3cP2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 18:54:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J1DgzqzZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J1DgzqzZ; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhkNZ5hkPz30N1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 18:53:49 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 75so3232942pgf.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 23:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=MVbZ8wWeXK4mKt0FDnIsVjHfDjUPC/AonkPo50DERmU=;
 b=J1DgzqzZ9LJF1vU7jzT1alSndglPmtTubVdvorRlBogGbXxIBWXOzUsmYVtPPOkbtA
 nBmH2ur/Ia0xVshpTTd50K4kiZKmqMPpErARB4eH9ImQOGxDvftlUOwOGDYmRrfXDpw5
 Gkm6LNXDwMQeUkz8o9GbKB65Fu4xvzWAxuioffFrzjxbtwXB4/mSsC1YyhwyBGIl8QeE
 hsXmG6AHSLqcY4Pv9iF1hNGqSarDXbSb9x1IUwfVLsFsdt0FBgHm1p+Gj2OKOjwYAK3k
 cQqq0lMzGBVfI8jjQwpdcMX0xk+tprkUOfLsIxigJcVR6/8sZEXCTElbJ7lg7blq0oQY
 bpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MVbZ8wWeXK4mKt0FDnIsVjHfDjUPC/AonkPo50DERmU=;
 b=PtWVi6BSdgbGJblNef5pTHXlCn6pUnzYukrkKiVhtH2vwt08mHrsVKY+nYGboUtm0k
 kI1+LFe7dsC7LROzAul9YiWyBJXf3HkujujOsRWJI9asC/i8eE0sseHcvp/4pzSnM2Lu
 /CRgluOE6Y1JFu58ogB8LjcQpeA+RDv7TK98dSTceTPFkeqyvvas/sQbrXrBfSmuoJPb
 3bb3M4q8DCb453J4bkaT3x3dvb40DwAxc3nNypWGbngXZkxT3eQ+vPDdfm+y9/Je+N0h
 kVnEkMNxV65r+O5ZZSF4EvmrFAgWt6nNtYyJ+xh8Au8a2BnoHwKGfLiZm+pt2p3ZQppn
 9oWw==
X-Gm-Message-State: AOAM532QWn2FFPNIxzmgTvY2Zypg1zqbZOvljEmuNTMsbGio5SdxDbRW
 1ZfvX0YXC3WQBiC6lrbfvK0=
X-Google-Smtp-Source: ABdhPJx3VO2cY7orZDKXRSXv0vR6GXUieSy9Y0LgkAERz+JrqHz7jFXKMFxFromnW9yQlpSyp3hBNg==
X-Received: by 2002:a63:1524:: with SMTP id v36mr7476851pgl.383.1613721226763; 
 Thu, 18 Feb 2021 23:53:46 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id y67sm8297845pfb.71.2021.02.18.23.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:53:46 -0800 (PST)
Date: Fri, 19 Feb 2021 17:53:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 2/9] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test
 into KVM
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-3-npiggin@gmail.com> <87tuqhxc01.fsf@linux.ibm.com>
In-Reply-To: <87tuqhxc01.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1613721057.j3az02k29i.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of February 13, 2021 6:33 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Move the GUEST_MODE_SKIP logic into KVM code. This is quite a KVM
>> internal detail that has no real need to be in common handlers.
>=20
> LGTM,
>=20
>>
>> (XXX: Need to confirm CBE handlers etc)
>=20
> Do these interrupts exist only in Cell? I see that they set HSRRs and
> MSR_HV, but CPU_FTRS_CELL does not contain CPU_HVMODE. So I don't get
> why they use the KVM macros.

Good question, I asked Michael Ellerman and he said there is a bare=20
metal Cell which predates or otherwise does not define HVMODE.

However it does not support KVM. So I think we can remove it.

> And for the instruction_breakpoint (0x1300) I think it would help if we
> could at least restrict when it is built. But I don't know what
> ISA/processor version it is from.

Yeah we should be documenting these non-architected handlers a little=20
better IMO.

I think we can get rid of the kvm skip from this one though. I've done=20
that in a separate patch in the next series.

Thanks,
Nick
