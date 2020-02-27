Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F2172AF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:17:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T6VY2lx0zDr7K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 09:17:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T6Sx3ydBzDr13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 09:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FQ+Ch8yW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48T6Sw6TCWz9sNg;
 Fri, 28 Feb 2020 09:16:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582841777;
 bh=C0sQUbJcUy3SCxluJOVutQ4Q/pprgmEge+rCNcrvXlw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FQ+Ch8yWcGWV3+pKERY7iAIiROMwV+lINicwcODo5g+5qp73grrdmzJPe3+NXh+7r
 0gB1l5PijcsfeopK9gvtr2ju3aY1x16Am0t12VIEg6gG57lUa+SykMgWF0xPI66mnj
 5WGmRjOlGY54euU0vvGvYGv3wRAoTWTzr4ChBPu1L5+ywoT10GVX+IVvPYOjCvPMva
 ujZLPsqpDJjD7TkwVSos3+XQieM/mtqnINm/fwqhpXhYfUwueYx3li1IgOlkdhM8SS
 szoooUY/aS5MaO1U9a4+lHcDzxPuWrzSjKuH6uTvC2pEOmTlh/klsqVlelMi/1F7ta
 dJLGiMUJQiI+w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, mikey@neuling.org,
 Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH v4 13/13] powerpc/ptrace: move ptrace_triggered() into
 hw_breakpoint.c
In-Reply-To: <4e528bf2-2b53-ae93-cdcc-0c80953f40f2@c-s.fr>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
 <d45c91cf5f83424b8f3989b7ead28c50d8d765a9.1582803998.git.christophe.leroy@c-s.fr>
 <4e528bf2-2b53-ae93-cdcc-0c80953f40f2@c-s.fr>
Date: Fri, 28 Feb 2020 09:16:16 +1100
Message-ID: <87pndz1xsf.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Russel,
>
> Le 27/02/2020 =C3=A0 12:49, Christophe Leroy a =C3=A9crit=C2=A0:
>> ptrace_triggered() is declared in asm/hw_breakpoint.h and
>> only needed when CONFIG_HW_BREAKPOINT is set, so move it
>> into hw_breakpoint.c
>
> My series v4 is definitely buggy (I included ptrace_decl.h instead=20
> instead of ptrace-decl.h), how can Snowpatch say build succeeded=20
> (https://patchwork.ozlabs.org/patch/1245807/) ?

Which links to:
  https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15895//art=
ifact/linux/report.txt

The actual build log of which is:
  https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15895/arti=
fact/linux/build_new.log

Which contains:
  scripts/Makefile.build:267: recipe for target 'arch/powerpc/kernel/ptrace=
/ptrace-altivec.o' failed
  make[3]: *** [arch/powerpc/kernel/ptrace/ptrace-altivec.o] Error 1
  make[3]: *** Waiting for unfinished jobs....
  scripts/Makefile.build:505: recipe for target 'arch/powerpc/kernel/ptrace=
' failed
  make[2]: *** [arch/powerpc/kernel/ptrace] Error 2
  make[2]: *** Waiting for unfinished jobs....
  scripts/Makefile.build:505: recipe for target 'arch/powerpc/kernel' failed
  make[1]: *** [arch/powerpc/kernel] Error 2
  make[1]: *** Waiting for unfinished jobs....
  Makefile:1681: recipe for target 'arch/powerpc' failed
  make: *** [arch/powerpc] Error 2
  make: *** Waiting for unfinished jobs....

Same for ppc64le:
  https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15896/arti=
fact/linux/build_new.log


So it seems like snowpatch always reports the build as succeeded even
when it fails.

cheers
