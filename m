Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6973A4B5D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 12:04:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TLBk0trbzDqG1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 20:03:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TL8Y0blyzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 20:02:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45TL8X2Wwzz9sN6;
 Wed, 19 Jun 2019 20:02:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 06/28] powerpc/64s/exception: remove the "extra" macro
 parameter
In-Reply-To: <1560933396.zhudswbcjr.astroid@bobo.none>
References: <20190611143040.7834-1-npiggin@gmail.com>
 <20190611143040.7834-7-npiggin@gmail.com>
 <1560933396.zhudswbcjr.astroid@bobo.none>
Date: Wed, 19 Jun 2019 20:02:04 +1000
Message-ID: <8736k5evvn.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Nicholas Piggin <npiggin@gmail.com> writes:
> Nicholas Piggin's on June 12, 2019 12:30 am:
>> @@ -265,7 +275,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
>>  EXC_REAL_END(machine_check, 0x200, 0x100)
>>  EXC_VIRT_NONE(0x4200, 0x100)
>>  TRAMP_REAL_BEGIN(machine_check_common_early)
>> -	EXCEPTION_PROLOG_1(PACA_EXMC, NOTEST, 0x200)
>> +	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXMC, 0, 0x200
>>  	/*
>>  	 * Register contents:
>>  	 * R13		= PACA
>
> This is a little bug here, machine check is an EXC_STD exception. It
> does not show up as generated code problem because EXCEPTION_PROLOG_1
> does not actually do anything with this parameter if KVM is false,
> which it is here.
>
> Still, it's wrong. I may just resend the series, because it caused a
> few conflicts in subsequent patches, and I have a few more to add to
> the end.

OK. I'll pull the series out for now.

cheers
