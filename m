Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DD32E71D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 12:17:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsQDw282vz3dKD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 22:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsQDZ5wj7z3cGk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 22:16:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DsQDP6krLz9txfD;
 Fri,  5 Mar 2021 12:16:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IaumhEy4LJKR; Fri,  5 Mar 2021 12:16:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DsQDP5NzTz9txf7;
 Fri,  5 Mar 2021 12:16:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0909B8B81F;
 Fri,  5 Mar 2021 12:16:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ahQmwKGZx4cI; Fri,  5 Mar 2021 12:16:54 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A0DF8B78B;
 Fri,  5 Mar 2021 12:16:54 +0100 (CET)
Subject: Re: Build regressions/improvements in v5.12-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20210301104316.2766484-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2103011342520.710098@ramsan.of.borg>
 <CADnq5_O-j8EWL+Eb8zK-7WqUuWKWETVWYRQNFdS_ymUSgo1jrg@mail.gmail.com>
 <CAMuHMdVFstnce-WKmj=4h3ZdtSThJNOLz_f1ervcZxE6hg=KsA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <09155bb0-4403-bcde-239f-eae4067953ca@csgroup.eu>
Date: Fri, 5 Mar 2021 12:16:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVFstnce-WKmj=4h3ZdtSThJNOLz_f1ervcZxE6hg=KsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/03/2021 à 21:01, Geert Uytterhoeven a écrit :
> Hi Alex,
> 
> On Tue, Mar 2, 2021 at 8:30 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Mon, Mar 1, 2021 at 9:21 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Mon, 1 Mar 2021, Geert Uytterhoeven wrote:
>>>> Below is the list of build error/warning regressions/improvements in
>>>> v5.12-rc1[1] compared to v5.11[2].
>>>>
>>>> Summarized:
>>>>   - build errors: +2/-0
>>>
>>>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8/ (all 192 configs)
>>>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/f40ddce88593482919761f74910f42f4b84c004b/ (all 192 configs)
>>>>
>>>>
>>>> *** ERRORS ***
>>>>
>>>> 2 error regressions:
>>>>   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'disable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 674:2
>>>>   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'enable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 638:2
>>>
>>> powerpc-gcc4.9/ppc64_book3e_allmodconfig
>>>
>>> This was fixed in v5.11-rc1, but reappeared in v5.12-rc1?
>>
>> Do you know what fixed in for 5.11?  I guess for PPC64 we depend on CONFIG_VSX?
> 
> Looking at the kisskb build logs for v5.11*, it seems compilation never
> got to drivers/gpu/drm/ due to internal compiler errors that weren't caught
> by my scripts.  So the errors listed above were not really fixed.
> 

As far as I can see, the problem has been there for any config without CONFIG_VSX from the beginning 
ie since https://github.com/linuxppc/linux/commit/16a9dea110a6

The following should fix it up:

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index fdab93428372..9d1fbd8be1c7 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -71,6 +71,16 @@ static inline void disable_kernel_vsx(void)
  {
  	msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
  }
+#else
+static inline void enable_kernel_vsx(void)
+{
+	BUILD_BUG();
+}
+
+static inline void disable_kernel_vsx(void)
+{
+	BUILD_BUG();
+}
  #endif

  #ifdef CONFIG_SPE
---
Christophe
Christophe
