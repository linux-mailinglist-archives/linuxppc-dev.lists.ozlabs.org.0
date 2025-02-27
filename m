Return-Path: <linuxppc-dev+bounces-6535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB1A480CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 15:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3YQH4Z3dz30Vr;
	Fri, 28 Feb 2025 01:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740666007;
	cv=none; b=S2fb5XTTj32/VXOhIeFaujwstlJK63k6TWosLc7FyUaazpey5eoTnFvtdqXH61iVeq+aog0LpPs4vtrxpgtBKJMPacSBZWXuuYD4ovJPOQymvRHB+ARd8XlUOLEsRdFKAUa+zqUa5U3cEiVbM3oAkszQlEHqG8A6ymgGzUHnyLZm2UBKmNfWi5C7laT1vgq7hdQqHKUS2Arlv5AAnvWYuniWqNftGlX/GV9F1Laxwb95Rb68zZuZ0VELAZkkzYq0i4KoQ7LLYQtxddzdj/qGofm3J/UGNKh2kLwcemrXkF/DNbZhlKqlgu+f+PB8dgdWqOcIxepDalWFqfI8kNVw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740666007; c=relaxed/relaxed;
	bh=lLkF4cglL1B4U957UQIoskZzgCUjpXQItpbexnwwJ74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzvL3gLK6+hiMO+Iccm6Yc+3+t9MLeSNuv0M6/m4mxs9sxseabk3+QciZu8M40P8xOCbChDpsxEY27E2E24EsalWp7TY4f2yPjct4AXB6cKXrHeWIJ/A2Yyl2GrFbB8im4L4+dbklR1GAtbelG5ONP2nTmN3GFaFpZ/OXUrgaCPPhXHl0NoNwA32e3mrZPPChDVRv7ilNHjinZckyS8v3TGrcvTflkeCe5pWpIWVbB2h05jTobhAPnLPDiU1nO1oeChKMcvfjsaALpHj5gHKN8/+geMI3LTLmLLQUOg1ndqxsTYJ0aZjUYSwrZadCFhT0SU0J8WAaA5eboc3iK6aKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3YQF3wLhz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 01:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z3Y843xhSz9sSN;
	Thu, 27 Feb 2025 15:07:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FP5Z442qQhRv; Thu, 27 Feb 2025 15:07:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z3Y842nk2z9sSC;
	Thu, 27 Feb 2025 15:07:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C49D8B78B;
	Thu, 27 Feb 2025 15:07:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cZKqapAsXdTe; Thu, 27 Feb 2025 15:07:48 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE4CE8B77C;
	Thu, 27 Feb 2025 15:07:47 +0100 (CET)
Message-ID: <be7782a1-5e92-46c1-a315-c1edbd0746d9@csgroup.eu>
Date: Thu, 27 Feb 2025 15:07:47 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20250226]Build Failure
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <adbe8dd1-a725-4811-ae7e-76fe770cf096@linux.vnet.ibm.com>
 <20250227123804.5dd71cef@canb.auug.org.au>
 <14193c98-fb30-4ee8-a19a-fe85d1230d74@csgroup.eu>
 <cdd5dc55-4674-40fa-80d3-f6a6688c0d97@linux.vnet.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cdd5dc55-4674-40fa-80d3-f6a6688c0d97@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 27/02/2025 à 14:47, Venkat Rao Bagalkote a écrit :
> Hello,
> 
> 
> Attached is the .config file.
> 
> This is being run on IBM Power8 system in PowerVM mode, as a full system 
> LPAR.

Ah ok so you are using a quite old version of GCC, that is GCC 8.5

I get the same problem when building ppc64_defconfig with GCC 8.5

Kees, can you have a look ?

Regards
Christophe

> 
> Regards,
> 
> Venkat.
> 
> On 27/02/25 4:13 pm, Christophe Leroy wrote:
>>
>>
>> Le 27/02/2025 à 02:38, Stephen Rothwell a écrit :
>>> Hi Venkat,
>>>
>>> CC Kees Cook for advice.  This is a result of the tests added in commit
>>>
>>>    bbeb38b8487a ("string.h: Validate memtostr*()/strtomem*() 
>>> arguments more carefully")
>>>
>>> from the kspp tree.
>>>
>>> I note that the comment about memtostr() says "Copy a possibly
>>> non-NUL-term string".
>>
>> Can you tell more about your config and your environment ?
>>
>> I just tested with ppc64_defconfig and ppc64le_defconfig, with gcc 
>> 12.4, gcc 13.2 and gcc 14.2 and didn't get that build error.
>>
>> Christophe
>>
>>>
>>> On Thu, 27 Feb 2025 06:30:12 +0530 Venkat Rao Bagalkote 
>>> <venkat88@linux.vnet.ibm.com> wrote:
>>>>
>>>> I am seeing build failures with kernel next-20250226, on IBM Power8 
>>>> systems.
>>>>
>>>> Failures:
>>>>
>>>> In file included from ./include/asm-generic/div64.h:27,
>>>>                    from ./arch/powerpc/include/generated/asm/div64.h:1,
>>>>                    from ./include/linux/math.h:6,
>>>>                    from ./include/linux/math64.h:6,
>>>>                    from ./include/linux/time.h:6,
>>>>                    from fs/ext4/file.c:22:
>>>> fs/ext4/file.c: In function 'ext4_sample_last_mounted':
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:418:6: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>         __must_be_noncstr(dest) +  \
>>>>         ^~~~~~~~~~~~~~~~~
>>>> fs/ext4/file.c:869:2: note: in expansion of macro 'strtomem_pad'
>>>>     strtomem_pad(sbi->s_es->s_last_mounted, cp, 0);
>>>>     ^~~~~~~~~~~~
>>>> In file included from ./include/linux/build_bug.h:5,
>>>>                    from ./include/linux/container_of.h:5,
>>>>                    from ./include/linux/list.h:5,
>>>>                    from ./include/linux/module.h:12,
>>>>                    from drivers/message/fusion/mptsas.c:46:
>>>> drivers/message/fusion/mptsas.c: In function 
>>>> 'mptsas_exp_repmanufacture_info':
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/message/fusion/mptsas.c:2968:3: note: in expansion of macro 
>>>> 'memtostr'
>>>>      memtostr(edev->vendor_id, manufacture_reply->vendor_id);
>>>>      ^~~~~~~~
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/message/fusion/mptsas.c:2969:3: note: in expansion of macro 
>>>> 'memtostr'
>>>>      memtostr(edev->product_id, manufacture_reply->product_id);
>>>>      ^~~~~~~~
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/message/fusion/mptsas.c:2970:3: note: in expansion of macro 
>>>> 'memtostr'
>>>>      memtostr(edev->product_rev, manufacture_reply->product_rev);
>>>>      ^~~~~~~~
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/message/fusion/mptsas.c:2973:4: note: in expansion of macro 
>>>> 'memtostr'
>>>>       memtostr(edev->component_vendor_id,
>>>>       ^~~~~~~~
>>>> make[4]: *** [scripts/Makefile.build:203: fs/ext4/file.o] Error 1
>>>> make[3]: *** [scripts/Makefile.build:461: fs/ext4] Error 2
>>>> make[3]: *** Waiting for unfinished jobs....
>>>> In file included from ./include/linux/array_size.h:5,
>>>>                    from ./include/linux/kernel.h:16,
>>>>                    from drivers/scsi/mpt3sas/mpt3sas_base.c:46:
>>>> drivers/scsi/mpt3sas/mpt3sas_base.c: In function 
>>>> '_base_display_ioc_capabilities':
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/scsi/mpt3sas/mpt3sas_base.c:4798:2: note: in expansion of 
>>>> macro 'memtostr'
>>>>     memtostr(desc, ioc->manu_pg0.ChipName);
>>>>     ^~~~~~~~
>>>> In file included from ./include/linux/build_bug.h:5,
>>>>                    from ./include/linux/container_of.h:5,
>>>>                    from ./include/linux/list.h:5,
>>>>                    from ./include/linux/module.h:12,
>>>>                    from drivers/scsi/mpt3sas/mpt3sas_transport.c:45:
>>>> drivers/scsi/mpt3sas/mpt3sas_transport.c: In function 
>>>> '_transport_expander_report_manufacture':
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/scsi/mpt3sas/mpt3sas_transport.c:461:3: note: in expansion 
>>>> of macro 'memtostr'
>>>>      memtostr(edev->vendor_id, manufacture_reply->vendor_id);
>>>>      ^~~~~~~~
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/scsi/mpt3sas/mpt3sas_transport.c:462:3: note: in expansion 
>>>> of macro 'memtostr'
>>>>      memtostr(edev->product_id, manufacture_reply->product_id);
>>>>      ^~~~~~~~
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/scsi/mpt3sas/mpt3sas_transport.c:463:3: note: in expansion 
>>>> of macro 'memtostr'
>>>>      memtostr(edev->product_rev, manufacture_reply->product_rev);
>>>>      ^~~~~~~~
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/scsi/mpt3sas/mpt3sas_transport.c:466:4: note: in expansion 
>>>> of macro 'memtostr'
>>>>       memtostr(edev->component_vendor_id,
>>>>       ^~~~~~~~
>>>> make[5]: *** [scripts/Makefile.build:203: drivers/scsi/mpt3sas/ 
>>>> mpt3sas_transport.o] Error 1
>>>> make[5]: *** Waiting for unfinished jobs....
>>>> make[5]: *** [scripts/Makefile.build:203: drivers/message/fusion/ 
>>>> mptsas.o] Error 1
>>>> make[4]: *** [scripts/Makefile.build:461: drivers/message/fusion] 
>>>> Error 2
>>>> make[3]: *** [scripts/Makefile.build:461: drivers/message] Error 2
>>>> make[3]: *** Waiting for unfinished jobs....
>>>> make[5]: *** [scripts/Makefile.build:203: drivers/scsi/mpt3sas/ 
>>>> mpt3sas_base.o] Error 1
>>>> In file included from ./include/linux/array_size.h:5,
>>>>                    from ./include/linux/kernel.h:16,
>>>>                    from drivers/scsi/qla2xxx/qla_def.h:9,
>>>>                    from drivers/scsi/qla2xxx/qla_mr.c:6:
>>>> drivers/scsi/qla2xxx/qla_mr.c: In function 'qlafx00_fx_disc':
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/scsi/qla2xxx/qla_mr.c:1912:3: note: in expansion of macro 
>>>> 'memtostr'
>>>>      memtostr(vha->hw->model_number, pinfo->model_num);
>>>>      ^~~~~~~~
>>>> ./include/linux/compiler.h:197:62: error: static assertion failed: 
>>>> "must be non-C-string (not NUL-terminated)"
>>>>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct 
>>>> {_Static_assert(!(e), msg);}))
>>>> ^~~~~~~~~~~~~~
>>>> ./include/linux/compiler.h:226:2: note: in expansion of macro 
>>>> '__BUILD_BUG_ON_ZERO_MSG'
>>>>     __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>>> ./include/linux/string.h:468:26: note: in expansion of macro 
>>>> '__must_be_noncstr'
>>>>     const size_t _src_len = __must_be_noncstr(src) +  \
>>>>                             ^~~~~~~~~~~~~~~~~
>>>> drivers/scsi/qla2xxx/qla_mr.c:1913:3: note: in expansion of macro 
>>>> 'memtostr'
>>>>      memtostr(vha->hw->model_desc, pinfo->model_description);
>>>>      ^~~~~~~~
>>>> make[5]: *** [scripts/Makefile.build:203: drivers/scsi/qla2xxx/ 
>>>> qla_mr.o] Error 1
>>>> make[5]: *** Waiting for unfinished jobs....
>>>> make[2]: *** [scripts/Makefile.build:461: fs] Error 2
>>>> make[2]: *** Waiting for unfinished jobs....
>>>> make[4]: *** [scripts/Makefile.build:461: drivers/scsi/mpt3sas] Error 2
>>>> make[4]: *** Waiting for unfinished jobs....
>>>> make[4]: *** [scripts/Makefile.build:461: drivers/scsi/qla2xxx] Error 2
>>>> make[3]: *** [scripts/Makefile.build:461: drivers/scsi] Error 2
>>>> make[2]: *** [scripts/Makefile.build:461: drivers] Error 2
>>>> make[1]: *** [/root/linux-next/Makefile:1989: .] Error 2
>>>> make: *** [Makefile:251: __sub-make] Error 2
>>>
>>
>>


