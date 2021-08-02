Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 218453DD048
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 08:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdSCv0WZ9z3bjV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 16:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QLa6R7sP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QLa6R7sP; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdSCS6gDpz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 16:05:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdSCJ6pGlz9sRK;
 Mon,  2 Aug 2021 16:05:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627884304;
 bh=qXEb2UzRisxyK6QcnXmpfTpGx/yy4F8807vcEKuRsX8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QLa6R7sPUSANlDS6R6TqZ9cvu1BDN6t+OmgyGdnOcJ49OkNtKdpmvT7VQgNCle0Kd
 PzRBuyzPNCyANvppZWabv47SSlvG6b0sgBjKAuM+p75KvuRx4cuAWTwtsQDfKaevfc
 LDCztzhSzyhy3xgNLGHGBZg+MYEPJFGiYUNfGnVxPySWUdt02laILBWXOPtPjRdTMq
 GChFoSYZb99y443YXYfRw9cR79A/ZG+tX649iQivD1sNg4oP40LOhOkCH6BeRVSPuW
 oArXr4gcozDxLsIvn539QkdGAxgkVOCy7VXqkmyZrB0eMtV19E00PiIXn8mpk7iRaZ
 6MROJoxSTWl9g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Possible regression by ab037dd87a2f (powerpc/vdso: Switch VDSO
 to generic C implementation.)
In-Reply-To: <87fsvx4ia5.fsf@igel.home>
References: <a273c619-9258-e29a-24c3-ea47a13c4817@molgen.mpg.de>
 <3661999754da1a5e5c810fa669654cc7db95b059.camel@kernel.crashing.org>
 <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
 <878s1q1udj.fsf@mpe.ellerman.id.au>
 <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>
 <875ywt1s9r.fsf__45665.8238823124$1627544516$gmane$org@mpe.ellerman.id.au>
 <87fsvx4ia5.fsf@igel.home>
Date: Mon, 02 Aug 2021 16:04:59 +1000
Message-ID: <87fsvsl6us.fsf@mpe.ellerman.id.au>
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
Cc: Derek Parker <parkerderek86@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 laboger@linux.vnet.ibm.com, Dmitrii Okunev <xaionaro@gmail.com>, murp@ibm.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> writes:
> On Jul 29 2021, Michael Ellerman wrote:
>
>> I haven't been able to reproduce the crash by following the instructions
>> in your bug report, I have go1.13.8, I guess the crash is only in newer
>> versions?
>
> Yes, only go1.14 and later are affected.
>
> https://build.opensuse.org/package/live_build_log/openSUSE:Factory:PowerPC/go1.13/standard/ppc64
> https://build.opensuse.org/package/live_build_log/openSUSE:Factory:PowerPC/go1.14/standard/ppc64

Thanks. That helps explain why I didn't see it, my test boxes have 1.13 installed.

cheers
