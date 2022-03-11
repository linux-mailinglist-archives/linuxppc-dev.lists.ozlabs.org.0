Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0594D6705
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 18:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFXLQ0qQ9z3bZJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 04:02:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFXKy16G4z2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 04:02:30 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KFXKx3N1Zz4xL3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 04:02:29 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KFXKx325Lz4xPt; Sat, 12 Mar 2022 04:02:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KFXKx18S0z4xL3
 for <linuxppc-dev@ozlabs.org>; Sat, 12 Mar 2022 04:02:27 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFXKs09F4z9sSC;
 Fri, 11 Mar 2022 18:02:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3tJ2Pqa3JuzL; Fri, 11 Mar 2022 18:02:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFXKr6Pfnz9sSB;
 Fri, 11 Mar 2022 18:02:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C82728B78F;
 Fri, 11 Mar 2022 18:02:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id M0zNjWjTw6RX; Fri, 11 Mar 2022 18:02:24 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 306BA8B763;
 Fri, 11 Mar 2022 18:02:24 +0100 (CET)
Message-ID: <e3a464d0-541a-0f7b-91de-79a446a4ee80@csgroup.eu>
Date: Fri, 11 Mar 2022 18:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 0/8] reduce memory consumption for powerpc
 firmware-assisted capture kernel
Content-Language: fr-FR
To: Hari Bathini <hbathini@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, =?UTF-8?Q?Michal_Such=c3=a1nek?=
 <msuchanek@suse.de>
References: <151075897205.14434.9005256552409420263.stgit@hbathini.in.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <151075897205.14434.9005256552409420263.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ankit Kumar <ankit@linux.vnet.ibm.com>, lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/11/2017 à 16:16, Hari Bathini a écrit :
> I posted the initial version [1] of patchset [2] adding support to enforce
> additional parameters when firmware-assisted dump capture kernel is active.
> Michal reposted it with few improvements to parameter processing to make
> it more robust. He further posted patchset [3] with few more improvements.
> 
> This patch series clubs the work from these two patch-sets while segregating
> the generic and arch-specific code to ease the review process.
> 
> [1] http://patchwork.ozlabs.org/patch/758176/
> [2] http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=2733
> [3] http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3338
> 

Hello,

We still have this series flagged as "new" in powerpc's patchwork.

It is still of interest ?

Patch 1 applies but patch 2 hardly conflicts in init/main.c

So I'll flag it as "change requested", fell free to resubmit if still 
relevant.

Or if you think that's still required but don't plan to handle it, tell 
me and I'll open an issue in our issue board so that we don't loose history.

Thanks
Christophe


> ---
> 
> Hari Bathini (2):
>        powerpc/fadump: reduce memory consumption for capture kernel
>        powerpc/fadump: update documentation about 'fadump_extra_args=' parameter
> 
> Michal Suchanek (6):
>        lib/cmdline.c: remove quotes symmetrically
>        boot/param: add pointer to current and next argument to unknown parameter callback
>        lib/cmdline.c: add backslash support to kernel commandline parsing
>        Documentation/admin-guide: backslash support in commandline
>        lib/cmdline.c: implement single quotes in commandline argument parsing
>        Documentation/admin-guide: single quotes in kernel arguments
> 
> 
>   Documentation/admin-guide/kernel-parameters.rst  |    5 +
>   Documentation/powerpc/firmware-assisted-dump.txt |   20 ++++-
>   arch/powerpc/include/asm/fadump.h                |    2
>   arch/powerpc/kernel/fadump.c                     |   97 +++++++++++++++++++++-
>   arch/powerpc/kernel/prom.c                       |    7 ++
>   include/linux/moduleparam.h                      |    1
>   init/main.c                                      |    8 +-
>   kernel/module.c                                  |    5 +
>   kernel/params.c                                  |   18 +++-
>   lib/cmdline.c                                    |   54 +++++++-----
>   lib/dynamic_debug.c                              |    1
>   11 files changed, 179 insertions(+), 39 deletions(-)
