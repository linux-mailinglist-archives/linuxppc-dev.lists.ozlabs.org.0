Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A54CB56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 11:52:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Txtg0N5rzDrBj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 19:52:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oNzKb/mh"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Txrm62nHzDr9S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 19:50:30 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id f25so1291805pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=+mDUe4agjaww7pUTLcDdC+BdIcMQQfoL3c6O57Ufp2U=;
 b=oNzKb/mhO810DR5F03SbXf2Ln6xbMHsGQ1IgqTqzHKOQiS/eJCA2U/ZX2uTZVReRyv
 EmBsb429a8t48ex83wZSsEsUey/Pn/FRSknQlUooSU/p141oEqmwmS7wLoegbHkq2lvw
 jeN0erh9jhEvtxRFT9C6s1CAfcpU7P9TfhSgxsVQ617Uu9YOPt/GarKwwdGt+KNaZ5KR
 Pn6Fs6QWCMz/PFDMoH6ouFp9kMwcsRM+R7DEKsmkZToWFXyzgoFhnIdyc3M9cdeeoBsW
 W6bFEq5wQym9yGETlB3QyFgOgHuZh5s/U7O5ClTP4ctOJiJ+HvrWQwBAUKIo3D3o8GYF
 etVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=+mDUe4agjaww7pUTLcDdC+BdIcMQQfoL3c6O57Ufp2U=;
 b=qS17WrNPLdCJrV5wcsC1UX/HBImObPiG+5rYq4YiqZrAEh13Z/0zqrkf+dexKgN79b
 iY+wXEUebypE9JsXbKsTjw4CM/OOwfYqzHwsIMtIhAhgRNEDQWwsGuH3O241DB50XdcM
 foi0szDKvns2D5y/VV8fmu7k0JIac0YNCk6RTwbg96OzZW43gvnwI6ZRN2rUeHFfEmMr
 tqXKrFX/FmSpe2yP/WmdbFgqmLFSdwz+LhwF1QPynL20n7P7JaBo/DZR3MwjpQHA+UU5
 LPUd1WqcuussVlV4Yh2/ez9GlJxJag8BFvoiZczvVIf02ePirPYm8UEg/Y1A2TZ2JA4S
 d6Vg==
X-Gm-Message-State: APjAAAVGbAR7AHn3ZVyVd+AtYh8aeaS9eFNtU02xmzT4k1WlHt7uaoOF
 evUvOeW9hywKSFNh3gB7ycHFpumyTE4=
X-Google-Smtp-Source: APXvYqzBBzUi04O8pspRQeDL+SeGP8UTSBWwdxR8jDwaLLksjU5kNhet8eYJMjtr5LsKsJH05/v1kw==
X-Received: by 2002:a17:90a:8d09:: with SMTP id
 c9mr2199014pjo.131.1561024227121; 
 Thu, 20 Jun 2019 02:50:27 -0700 (PDT)
Received: from localhost ([203.220.63.126])
 by smtp.gmail.com with ESMTPSA id s15sm28532309pfd.183.2019.06.20.02.50.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:50:26 -0700 (PDT)
Date: Thu, 20 Jun 2019 19:50:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 42/52] powerpc/64s/exception: machine check fwnmi does
 not trigger when in HV mode
To: linuxppc-dev@lists.ozlabs.org, Mahesh Jagannath Salgaonkar
 <mahesh@linux.vnet.ibm.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
 <20190620051459.29573-43-npiggin@gmail.com>
 <275c465d-f7de-9c2d-af90-ab5d230b7240@linux.vnet.ibm.com>
In-Reply-To: <275c465d-f7de-9c2d-af90-ab5d230b7240@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561023966.j8war0qcu0.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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

Mahesh Jagannath Salgaonkar's on June 20, 2019 7:26 pm:
> On 6/20/19 10:44 AM, Nicholas Piggin wrote:
>> Remove dead code.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kernel/exceptions-64s.S | 3 ---
>>  1 file changed, 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index 286bd5670d60..b12755a4f884 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -1040,9 +1040,6 @@ TRAMP_REAL_BEGIN(machine_check_pSeries)
>>  	.globl machine_check_fwnmi
>>  machine_check_fwnmi:
>>  	EXCEPTION_PROLOG_0 PACA_EXMC
>> -BEGIN_FTR_SECTION
>> -	b	machine_check_common_early
>> -END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
>=20
> Didn't We add that to handle SLB/ERAT errors in real mode for pseries ?
> Are we taking that off ?

Oh that's a stupid mistake, as patch title says I mistook it for
IFSET. Good catch, thanks, that probably messes up a later patch
too, I'll fix.

Thanks,
Nick
=
