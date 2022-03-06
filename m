Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 428DF4CE9E6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 08:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBDJx0fWNz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 18:50:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sFwkcJ5J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBDJL1c07z2xKW
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Mar 2022 18:49:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sFwkcJ5J; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KBDJG5CDPz4xnG;
 Sun,  6 Mar 2022 18:49:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646552974;
 bh=llmvS9tL0CaBZTfcuaM4fhB+LqC8phPwcLDPaJL+BSM=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=sFwkcJ5JMDZuwUmFxD/FLFW6WV2KSYoWtNOF/xXLUivCqzcY1/Pf6EBf43rEPJAAp
 UCgttSi7JmSD1OP5Mjmh0wt2cABC1ejNy2jSWdYvyZywZkDCOSNLzt0T/NQpj+q2wa
 NPciM57frP/H9I5WuWBsd0QKdRZX+bAg8sYNnrALoysoTi8vvjSPWpykaaoy0Z6KfJ
 8ptBpljFJ2B9M+1ubgztKc+X633Lyo/HWWM4+0bDI7r5iYUmrSRM9kJpmrdj4VBiLt
 pUyzRDH6hWkRtk1T1Kqv4tMYaj10vsbR30wxP4BKGpbko94fe7Ag3Tt/GToUwZFDa4
 oe2RwQZQwxJqA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Rohan McLure
 <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: declare unmodified attribute_group usages
 const
In-Reply-To: <e111d334-6551-5eb9-f814-f072b4b1ba71@csgroup.eu>
References: <20220304002130.46185-1-rmclure@linux.ibm.com>
 <e111d334-6551-5eb9-f814-f072b4b1ba71@csgroup.eu>
Date: Sun, 06 Mar 2022 18:49:33 +1100
Message-ID: <87ee3fo702.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 04/03/2022 =C3=A0 01:21, Rohan McLure a =C3=A9crit=C2=A0:
>> Inspired by (bd75b4ef4977: Constify static attribute_group structs),
>> accepted by linux-next, reported:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220210202805.7=
750-4-rikard.falkeborn@gmail.com/
>>=20
>> Nearly all singletons of type struct attribute_group are never
>> modified, and so
>> are candidates for being const. Declare them as const.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>>   arch/powerpc/perf/generic-compat-pmu.c      | 4 ++--
>>   arch/powerpc/perf/hv-24x7.c                 | 6 +++---
>>   arch/powerpc/perf/hv-gpci.c                 | 8 ++++----
>>   arch/powerpc/perf/imc-pmu.c                 | 6 +++---
>>   arch/powerpc/perf/isa207-common.c           | 2 +-
>>   arch/powerpc/perf/power10-pmu.c             | 6 +++---
>>   arch/powerpc/perf/power7-pmu.c              | 4 ++--
>>   arch/powerpc/perf/power8-pmu.c              | 4 ++--
>>   arch/powerpc/perf/power9-pmu.c              | 6 +++---
>>   arch/powerpc/platforms/cell/cbe_thermal.c   | 4 ++--
>>   arch/powerpc/platforms/powernv/opal-core.c  | 2 +-
>>   arch/powerpc/platforms/powernv/opal-dump.c  | 2 +-
>>   arch/powerpc/platforms/powernv/opal-flash.c | 2 +-
>>   arch/powerpc/platforms/pseries/papr_scm.c   | 2 +-
>>   arch/powerpc/platforms/pseries/power.c      | 2 +-
>>   15 files changed, 30 insertions(+), 30 deletions(-)
>>=20
>
> /linux/arch/powerpc/platforms/cell/cbe_thermal.c: In function=20
> 'thermal_init':
> /linux/arch/powerpc/platforms/cell/cbe_thermal.c:370:26: error: passing=20
> argument 1 of 'spu_add_dev_attr_group' discards 'const' qualifier from=20
> pointer target type [-Werror=3Ddiscarded-qualifiers]
>     spu_add_dev_attr_group(&spu_attribute_group);

Hi Rohan,

If you follow the instructions here:

  https://github.com/linuxppc/wiki/wiki/Testing-with-GitHub-Actions

You can get some automatic build tests done before you post, which would
have caught this.

cheers
