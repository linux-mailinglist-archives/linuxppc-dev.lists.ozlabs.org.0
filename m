Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1D6F22BB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 05:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7ZzX32wtz3fCk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 13:42:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DMN6Hrma;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7Zyf2yDbz3c8V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 13:41:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DMN6Hrma;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q7ZyR3r4nz4xDH;
	Sat, 29 Apr 2023 13:41:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682739686;
	bh=ekrUI3+8BrR0nHkWhYZH1OoQichJoAnJM3+aShy0lg0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DMN6HrmakjqW9uKPK1tW24ZW4779qPY6K7IeQkEZiZaf0luHkL9dTZb5vzYNZaslY
	 TIrDK1Vne+EcqG+R+zgVTIONZu92d9nHia9Ltneb/Rm2afD4ENPM/e3MlRXH9/Nrwf
	 1/AE8Qu8OC30on7wWHOJK1kWsrRcCQCPfGB4pD788HlENoahSmfxajD6i+CgQlhsKV
	 smCK/g9sgfKX7E1e2iRWPigaU9/UiZBeGYBAVFxLg7yWHYXTDUslhbDNQmspT4kYm3
	 ttMdWip7Z2BTI2oZcIpTa9hrD3YOAo+PQWtpfHdlUtDqnFTleigO8lAdkFleftt12Q
	 1Q2f2TOCC1pBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-1 tag
In-Reply-To: <CAHk-=wgY8_-BvS5mFR+UtCwbLrOVikYfHi_m9OFxE2D43B+=8g@mail.gmail.com>
References: <87fs8k734t.fsf@mail.concordia>
 <CAHk-=wgY8_-BvS5mFR+UtCwbLrOVikYfHi_m9OFxE2D43B+=8g@mail.gmail.com>
Date: Sat, 29 Apr 2023 13:41:18 +1000
Message-ID: <87wn1v2w4h.fsf@mail.concordia>
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
Cc: arkamar@atlas.cz, aik@ozlabs.ru, paul.gortmaker@windriver.com, bgray@linux.ibm.com, ira.weiny@intel.com, robh@kernel.org, mikey@neuling.org, windhl@126.com, tpearson@raptorengineering.com, nicholas@linux.ibm.com, joel@jms.id.au, liubo03@inspur.com, kconsul@linux.vnet.ibm.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, nathan@kernel.org, alex.williamson@redhat.com, pali@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, mcgrof@kernel.org, nysal@linux.ibm.com, seanjc@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Fri, Apr 28, 2023 at 2:44=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags=
/powerpc-6.4-1
>
> Odd. Your shortlog has this:
>
>> Michael Ellerman (46):
>>       powerpc/configs: Make pseries_defconfig an alias for ppc64le_guest
>
> that removed the 'pseries_defconfig' file, but then your diffstat
>
>>  arch/powerpc/configs/pq2fads_defconfig                                 =
              |  80 ----
>>  arch/powerpc/include/asm/atomic.h                                      =
              |  53 +-
>
> doesn't have it, resulting in the summary not matching what I get:
>
>> 278 files changed, 2672 insertions(+), 9188 deletions(-)
>
> versus my
>
>  279 files changed, 2690 insertions(+), 9528 deletions(-)
>
> and I see no obvious reason for it.
>
> I wonder if your test-merge just didn't remove the file (it did have a
> conflict due to the IXGB driver removal), and that's why.

Yeah my fault, looks like I edited the conflict in powernv_defconfig and
then did 'git add arch/powerpc/configs/*' which added back the pseries
one.

> Anyway, I'm not entirely sure about the mismatch of the end result,
> but it seems to be due to that one defconfig file, and I think my
> merge is fine. But please double-check.

Yep looks fine, thanks.

cheers
