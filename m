Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE332D674
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:23:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drvlr6mQxz3dCr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 02:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 312 seconds by postgrey-1.36 at boromir;
 Fri, 05 Mar 2021 02:23:34 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrvlV5770z3cbZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 02:23:33 +1100 (AEDT)
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mxpqo-1lhS8G0EJC-00zIBj for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar
 2021 16:18:14 +0100
Received: by mail-ot1-f51.google.com with SMTP id 97so637245otf.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 07:18:13 -0800 (PST)
X-Gm-Message-State: AOAM530yeh6mmFw/6vTlTAejGwwQgMrlWCmkC9iw7gtrum5Lr92qL5Co
 lq158fEQkesdl6LV/iX/PyWGEjjGBj2bPGHWF74=
X-Google-Smtp-Source: ABdhPJxsAeVZP55vxQObqQCcGRYx5uyd3bK326QT6JPGejb1DQh9/gqdNMtw502+OlNnt24OanUNCRyoHMe0+ilQ4Ko=
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr3828655otq.210.1614871092267; 
 Thu, 04 Mar 2021 07:18:12 -0800 (PST)
MIME-Version: 1.0
References: <2daa39fa210d971863a6f9ac7c81849764e7a261.1614862233.git.christophe.leroy@csgroup.eu>
In-Reply-To: <2daa39fa210d971863a6f9ac7c81849764e7a261.1614862233.git.christophe.leroy@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Mar 2021 16:17:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2=qOG1iLhw2fi=r128bRMdfNx4BseXONiS7vrnbVvr6w@mail.gmail.com>
Message-ID: <CAK8P3a2=qOG1iLhw2fi=r128bRMdfNx4BseXONiS7vrnbVvr6w@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/32: remove bogus ppc_select syscall
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lK288wbW7vDn0ZUXoc7FKwJfew2pn1MoiN3pt8+lwSWS2oOUqc9
 hfgsQ+SsAT6eFO23rsOoY/CHAX/FIdcj3ByMLgv20cc9hek9CDECfw1P5ekYHoYjsnQ5jNF
 5NLB/9vZT8ck6mT+5LhnOdAa04iduNB2dq7FfCLjuBnAt6aNrUUNR6ivg8mIL7wPFG+Gm+n
 wpPHoXhVYQ+DeVYqBbJjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l7aUePzmxVA=:LZ16KEiCLJvYKr+QU+NZkb
 dw1Xxnmu7HAu2VTuIVcjudBW/jnvvDOsVdxe7JcZfYYtcUxFoipjKYPh+fQgPjWk60GLWf6pr
 7FAK2rCW07rBmwDQJZO2f4dmDk1zWLnHQfBobmDON/qCrs6xltKHhRAg5U3JALt+LffN4lXVb
 jR3d+LpllX6RERWATUUUumRERDl7kufnxl7X8nWZOyjZJna3K8ta71BV4AR3XFrGSZzNpiL1+
 DSbOCXOLTaLkIYjAPuUnAoq+Dzi38wKqvB1QGmDy/qidmzw+N0/uR/6ksiqbzzgRCaPpOuhNB
 TBzApL+EcwHwt7WATJtBTouDk9+B/52UwI/JwieD+qj/HpCU1VZc2i4ANGhh5qcPEG4As1D4k
 wqgxOZ77o4yvScNmr8VhbEdnmOEB3Eyelq0A+pjrotzTGKzDO5czIBVcfLbv2
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, halesh.sadashiv@ap.sony.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 4, 2021 at 1:51 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The ppc_select function was introduced in linux-2.3.48 in order to support
> code confusing the legacy select() calling convention with the standard one.
> Even 24 years ago, all correctly built code should not have done this and
> could have easily been phased out. Nothing that was compiled later should
> actually try to use the old_select interface, and it would have been broken
> already on all ppc64 kernels with the syscall emulation layer.
>
> This patch brings the 32 bit compat ABI and the native 32 bit ABI for
> powerpc into a consistent state, by removing support for both the
> old_select system call number and the handler for it.
>
> The bug report triggering this came from
> Halesh Sadashiiv <halesh.sadashiv@ap.sony.com>, who discovered that the
> 32 bit implementation of ppc_select would in case of a negative number
> of file descriptors incorrectly return -EFAULT instead of -EINVAL.
> There seems to be no way to fix this problem in a way that would
> keep broken pre-1997 binaries running.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Halesh Sadashiiv <halesh.sadashiv@ap.sony.com>
> [chleroy: Rebased and updated the number of years elapsed in the commit message]
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> First version was in 2008, at that time it was rejected, see
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/200809240839.14902.arnd@arndb.de/

The patch from 2008 did two things:

- it removed the ppc32 specific 'select' syscall at #82
- it fixed the generic '_newselect' syscall at #142

Back then, the decision was to only address the second issue, which
got merged in commit dad2f2fb0fc7 ("powerpc: Fix wrong error code from
ppc32 select syscall").

It is probably ok to remove the old select system call now, but
my changelog text no longer makes sense, as the patch has nothing
to do with the bug that was reported back then.

       Arnd
