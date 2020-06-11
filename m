Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 468381F6010
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 04:36:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j7K35CDZzDqth
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 12:36:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D4FGCFPB; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49j7HN0YldzDqgk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 12:34:55 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id ga6so1634080pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=j6ZlNulXBfaoztQzBtzxcVceSQOoQmmBqbAzrl3yuMg=;
 b=D4FGCFPBil2uaP+M14TPOOhMf/TlrkQR76EqDho8hJ1eQ+T8pJqveJhQ4C4iWKqRhZ
 n9z2qPGgWSrw+P9vIBd6raIvMjIZuwjQMxxapYtOfkfUySxFry7mZAwBazrIWSmXh7RX
 AI5E0E7vd5MzYt5ZUd15cSBcEMbXMy0O34t8BfS/XJ2ec5cLa0Aaz0ytWVvMmqbJiRvo
 BzXh9EtirdXrWAO16g27USbxjkJRY9P7/HUWuUTAjMfUHdnkC1tzZ+udTGDvlyGsIpX/
 hMCpSpmLYePD0eheXGI04qcgwG3odPKxZCuqZsWomUlHlIvjjQpYJeOCRqvjljYDhEVo
 9RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=j6ZlNulXBfaoztQzBtzxcVceSQOoQmmBqbAzrl3yuMg=;
 b=lVgOUyt1qsZYXGyhpoT991FrbgU27ZrvZK22eh/ctRg8luynMugnjsdTfKoXZ2Gu27
 ztCn2J7hew5ApbjMz3vzkyUD0QSsbCEl/LY2jiJ+b2ksQl63J0PHkAiRjHjOFqfwxRkb
 b6eryuuKOEg4tUnTjV/g4q62HpaWP6Z3bUDJNVYgYBa2I6IoICf7GTf85ofGg7igwNrc
 7ZIhTX5rNC8vpc97kq5E8KK8yOVyhx/jnpZ7QanUr4GBIfGjPFPnKN0ql5URhkqrw83k
 256ZW56yMR9AMGibmhSgPaLHgBMRyx5inhxMAwPK6BibD0adtO6J2u4SVvZrcexkMcbc
 qXwQ==
X-Gm-Message-State: AOAM530/Vb2xsO/3ZgxAFVjIHlHG4Z5ECQPTT6sqzeAyS8Z2FFrOPAeq
 Up3SDhiPU1hvgg9e5T6euHYipi2+
X-Google-Smtp-Source: ABdhPJxQEdrLwcPn22+2YWxeMqzUzAVDNuBF7j4fo2LF6dz2hpXr8vLc9krUzdnuxqrrN6q1rDsThw==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr6023845pjb.206.1591842892323; 
 Wed, 10 Jun 2020 19:34:52 -0700 (PDT)
Received: from localhost (193-116-110-116.tpgi.com.au. [193.116.110.116])
 by smtp.gmail.com with ESMTPSA id b140sm1222510pfb.119.2020.06.10.19.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 19:34:51 -0700 (PDT)
Date: Thu, 11 Jun 2020 12:34:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 2/2] powerpc/64s: system call support for scv/rfscv
 instructions
To: linuxppc-dev@lists.ozlabs.org, Matheus Castanho <msc@linux.ibm.com>
References: <20200430040202.1735506-1-npiggin@gmail.com>
 <20200430040202.1735506-3-npiggin@gmail.com>
 <cc609f82-1d11-b1f9-2594-153936d7fe48@linux.ibm.com>
In-Reply-To: <cc609f82-1d11-b1f9-2594-153936d7fe48@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1591842371.v075mecq5w.astroid@bobo.none>
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

Excerpts from Matheus Castanho's message of May 14, 2020 6:55 am:
> Hi Nicholas,
>=20
> Small comment below:
>=20
> On 4/30/20 1:02 AM, Nicholas Piggin wrote:
>> Add support for the scv instruction on POWER9 and later CPUs.
>>=20
>> For now this implements the zeroth scv vector 'scv 0', as identical
>> to 'sc' system calls, with the exception that lr is not preserved, and
>> it is 64-bit only. There may yet be changes made to this ABI, so it's
>> for testing only.
>>=20
>> rfscv is implemented to return from scv type system calls. It can not
>> be used to return from sc system calls because those are defined to
>> preserve lr.
>>=20
>> In a comparison of getpid syscall, the test program had scv taking
>> about 3 more cycles in user mode (92 vs 89 for sc), due to lr handling.
>> getpid syscall throughput on POWER9 is improved by 33%, mostly due to
>> reducing mtmsr and mtspr.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  Documentation/powerpc/syscall64-abi.rst   |  42 ++++--
>=20
> [...]
>=20
>> +Return value
>> +------------
>> +- For the sc instruction, both a return value and a return error code a=
re
>> +  returned. cr0.SO is the return error code, and r3 is the return value=
 or
>> +  error code. When cr0.SO is clear, the syscall succeeded and r3 is the=
 return
>> +  value. When cr0.SO is set, the syscall failed and r3 is the error cod=
e that
>> +  generally corresponds to errno.
>> +
>> +- For the scv 0 instruction, there is a return value indicates failure =
if it
>> +  is >=3D -MAX_ERRNO (-4095) as an unsigned comparison, in which case i=
t is the
>> +  negated return error code. Otherwise it is the successful return valu=
e.
>=20
> I believe this last paragraph is a bit confusing (didn't quite get the
> unsigned comparison with negative values). So instead of cr0.SO to
> indicate failure, scv returns the negated error code, and positive in
> case of success?

Yes, it will be like other major architectures and return values from
-4095..-1 indicate an error with error value equal to -return value.

I will try to make it a bit clearer.

Thanks,
Nick
