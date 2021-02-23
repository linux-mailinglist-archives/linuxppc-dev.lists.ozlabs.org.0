Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF132234F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 01:54:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl0tr1gn5z3cTR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 11:54:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OoK4jrhr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OoK4jrhr; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl0tQ38TGz30QK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 11:54:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dl0tB6d2Dz9sS8;
 Tue, 23 Feb 2021 11:53:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614041645;
 bh=aa+K8Nsatfk9ECjgauAQRY0LNVMvN0lgz7Bn7cRNvPI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OoK4jrhrRNDhE5HESbrR/JIr1yTHMJvXEhNrsVZ6kTWFctv0wc11QiChVTa4ZoNrV
 KhwyC3IONpVjkhOhDK/UzhSaaoJZxo/AoHce8c4QYkCAReD/uePXk0m76fdDIzG+y3
 IzYUe4tQlrZh/hSDKOGiRZkUDzvet2ZmoX9aLrFwXDpotGFY9KSI3NN9ptcuR82SPW
 Iw2+VmOmnKt9G1zabmvgLNChXNxB7Mubm6hq0bfb3h1wZTfGyoH5iPnF8Ldr3ncHFe
 cmNf3K0RUMRlOB0H7MDPB4ndf5fA/KeQmxFzNeBfq9TU9nI2aCbpJFKaEgGLiWDNFt
 RGbsCzc6NPBSw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-1 tag
In-Reply-To: <CAOSf1CH67Htam33UvYhaypD7HW7q1xU4tUW0soshao2FKa+Czw@mail.gmail.com>
References: <87o8gctii6.fsf@mpe.ellerman.id.au>
 <CAHk-=wj9nZYEZnTYMpHwVT6B6P+zFXW_P-PWH_bRR5bp-cWbOQ@mail.gmail.com>
 <CAOSf1CH67Htam33UvYhaypD7HW7q1xU4tUW0soshao2FKa+Czw@mail.gmail.com>
Date: Tue, 23 Feb 2021 11:53:53 +1100
Message-ID: <87k0qztxi6.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Pingfan Liu <kernelfans@gmail.com>,
 cmr@codefail.de, Zheng Yongjun <zhengyongjun3@huawei.com>,
 Po-Hsu Lin <po-hsu.lin@canonical.com>, sandipan@linux.ibm.com,
 cy.fan@huawei.com, Markus Elfring <elfring@users.sourceforge.net>,
 jiapeng.chong@linux.alibaba.com, skirmisher@protonmail.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, eerykitty@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, ganeshgr@linux.ibm.com,
 Michal Suchanek <msuchanek@suse.de>, Nathan Lynch <nathanl@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, kjain@linux.ibm.com,
 Nick Piggin <npiggin@gmail.com>, Mark Brown <broonie@kernel.org>,
 Qian Cai <cai@lca.pw>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:

> On Tue, Feb 23, 2021 at 9:44 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Mon, Feb 22, 2021 at 4:06 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> >
>> > Please pull powerpc updates for 5.12.
>>
>> Pulled. However:
>>
>> >  mode change 100755 => 100644 tools/testing/selftests/powerpc/eeh/eeh-functions.sh
>> >  create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
>> >  create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh
>>
>> Somebody is being confused.
>>
>> Why create two new shell scripts with the proper executable bit, and
>> then remove the executable bit from an existing one?
>>
>> That just seems very inconsistent.
>
> eeh-function.sh just provides some helper functions for the other
> scripts and doesn't do anything when executed directly. I thought
> making it non-executable made sense.

Yeah I think it does make sense. It just looks a bit odd in the diffstat
like this. Maybe if we called it lib.sh it would be more obvious?

cheers
