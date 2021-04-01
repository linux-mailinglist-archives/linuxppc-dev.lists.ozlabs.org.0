Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532943512F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 12:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9zKW0yWxz3btB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 21:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RTy5M/zE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RTy5M/zE; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9zK41lfZz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 21:03:19 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so760467pjv.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WLVHzoY7kPaQyg4hZLaFyzDphqotEQv7gB0kf6T3rrU=;
 b=RTy5M/zEUbjIkP3tWMMio3i59MK84fjewY/cIXFkXZv+Yj31pJt++9nPte+2ocpaMs
 zy6+ZczFT8gkowkrJzbhxiHSwSDrN7G0VH/EY5B7KxMopmkFzpekbp7gun5xsakPwluL
 /LmWkIhA8m/3KrsbJBYQZ1DLNAmZvmRcJRa0U2e3Bkhh504ECHJlGi1aY8qC7BA+V+35
 kejvQAGkeMHTdh+kVKE5CZY1ijSlzhlfSFFZNhbZZsAv7Sl7AWZ4x/2MsNzwPeXLqbTP
 nS4G/jK9JiUpTsKj6ukRk17TPl5VLSKA78vCQQeJz/oxSx7M6sJ8CedRL1CHNLNJcVwc
 oIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WLVHzoY7kPaQyg4hZLaFyzDphqotEQv7gB0kf6T3rrU=;
 b=e/FBJDS7ILQeFaf36/GA2W7WDmqJnMcHUojk+uB1l3atmznOzFLSs82Ub6hzx38MIS
 jhOgGZIrr02vA7v5RhLB+fPAfY3TeH8s/hcHb82ar2LSVC7uM3j1h3x1Wk90r+PQONrr
 Uh6T9XQ5MdPIQuMiaf780+idBKjipqNM+luKe7udCqW7NWyGuMlCz1X88CUKyxd5gBpd
 wje+npUb0TKr/f6TdtWQNXQGM5NeUrD60h94NH7Jng7FcXCNNGGbaDmy7nDwtPPB8SCA
 F64gIo9+4482nLZ/YXssihIdMCC+K8mCTVvplPijntw0dZhxpANhkBM57nLkZf9EEw0+
 DoFg==
X-Gm-Message-State: AOAM5314FdDD4MLPuDFT1nOJAKu9NxA1SHQLdW/6SNz2DSRmlTRKHcwL
 qTItRRURzQjN0y1vsAZRHGE=
X-Google-Smtp-Source: ABdhPJyRKHT6ILo69/SWLcrVFAXW427EIqTd2DbkN8dP7C0XjCTDD1CdF6m+NPDJm0MCII5ulMd0cg==
X-Received: by 2002:a17:90a:f02:: with SMTP id 2mr7993758pjy.209.1617271396085; 
 Thu, 01 Apr 2021 03:03:16 -0700 (PDT)
Received: from localhost ([1.128.221.56])
 by smtp.gmail.com with ESMTPSA id e1sm4960397pfi.175.2021.04.01.03.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:03:15 -0700 (PDT)
Date: Thu, 01 Apr 2021 20:03:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 15/46] KVM: PPC: Book3S 64: Move hcall early register
 setup to KVM
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-16-npiggin@gmail.com>
 <YGVdFrsEtD88oB90@thinks.paulus.ozlabs.org>
In-Reply-To: <YGVdFrsEtD88oB90@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1617271255.sz2p0e41kb.astroid@bobo.none>
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

Excerpts from Paul Mackerras's message of April 1, 2021 3:41 pm:
> On Tue, Mar 23, 2021 at 11:02:34AM +1000, Nicholas Piggin wrote:
>> System calls / hcalls have a different calling convention than
>> other interrupts, so there is code in the KVMTEST to massage these
>> into the same form as other interrupt handlers.
>>=20
>> Move this work into the KVM hcall handler. This means teaching KVM
>> a little more about the low level interrupt handler setup, PACA save
>> areas, etc., although that's not obviously worse than the current
>> approach of coming up with an entirely different interrupt register
>> / save convention.
>=20
> [snip]
>=20
>> @@ -1964,29 +1948,8 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
>> =20
>>  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
>>  TRAMP_REAL_BEGIN(system_call_kvm)
>> -	/*
>> -	 * This is a hcall, so register convention is as above, with these
>> -	 * differences:
>=20
> I haven't checked all the code changes in detail yet, but this comment
> at least is slightly misleading, since under PR KVM, system calls (to
> the guest kernel) and hypercalls both come through this path.

Yeah good point, I'll update the comment at its destination.

Thanks,
Nick
