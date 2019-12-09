Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 301CA11697E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 10:37:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WdQ36Rl7zDqPS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 20:37:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WblG1tpyzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 19:22:01 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB98COsi014579; Mon, 9 Dec 2019 03:21:44 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wrt9wgf9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 03:21:44 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB98KGfn032215;
 Mon, 9 Dec 2019 08:21:43 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 2wr3q657uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 08:21:43 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB98LgC752888054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 08:21:42 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 881452805A;
 Mon,  9 Dec 2019 08:21:42 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4A3928059;
 Mon,  9 Dec 2019 08:21:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.61])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 08:21:40 +0000 (GMT)
Subject: Re: [RESEND PATCH v2] powerpc/kernel/sysfs: Add PMU_SYSFS config
 option to enable PMU SPRs sysfs file creation
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org, 
 mpe@ellerman.id.au
References: <20191205052558.2091-1-kjain@linux.ibm.com>
 <0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <3075c2bf-1cfc-1191-e569-297f461bad1e@linux.ibm.com>
Date: Mon, 9 Dec 2019 13:51:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr>
Content-Type: multipart/alternative;
 boundary="------------28070D871CB98A2E7C8851ED"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_01:2019-12-09,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090071
X-Mailman-Approved-At: Mon, 09 Dec 2019 20:35:31 +1100
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
Cc: anju@linux.vnet.ibm.com, Nageswara R Sastry <nasastry@in.ibm.com>,
 maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------28070D871CB98A2E7C8851ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christophe,

             Thankyou for reviewing the patch.

On 12/5/19 11:28 AM, Christophe Leroy wrote:
>
>
> Le 05/12/2019 à 06:25, Kajol Jain a écrit :
>> Many of the performance moniroting unit (PMU) SPRs are
>> exposed in the sysfs. "perf" API is the primary interface to program
>> PMU and collect counter data in the system. So expose these
>> PMU SPRs in the absence of CONFIG_PERF_EVENTS.
>>
>> Patch adds a new CONFIG option 'CONFIG_PMU_SYSFS'. The new config
>> option used in kernel/sysfs.c for PMU SPRs sysfs file creation and
>> this new option is enabled only if 'CONFIG_PERF_EVENTS' option is
>> disabled.
>
> Not sure this new unselectable option is worth it. See below.
> By the way I also find the subject misleading, as you may believe when 
> reading it that there is something to select.


Ok I wiil change the subject.


>
>>
>> Tested this patch with enable/disable CONFIG_PERF_EVENTS option
>> in powernv and pseries machines.
>> Also did compilation testing for different architecture include:
>> x86, mips, mips64, alpha, arm. And with book3s_32.config option.
>
> How do you use book3s_32.config exactly ? That's a portion of config, 
> not a config by itself. You should use pmac32_defconfig I guess.


Yes you are right, its not a config option. Actually I was playing 
around with 'CONFIG_PPC_BOOK3S' option in .config file. As you suggested,

I will try to build with 'pmac32_defconfig' option.


>
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>> Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>
>>
>> Tested using the following different scenarios:
>> 1. CONFIG_PERF_EVENT - enabled, CONFIG_PMU_SYSFS - disabled,
>> RESULT: not seen any sysfs files(mmrc*, pmc*) from 
>> /sys/bus/cpu/devices/cpu?/
>> 2. CONFIG_PERF_EVENT - disabled, CONFIG_PMU_SYSFS - enabled,
>> RESULT: seen any sysfs files(mmrc*, pmc*) from 
>> /sys/bus/cpu/devices/cpu?/
>> 3. CONFIG_PERF_EVENT -disabled, CONFIG_PMU_SYSFS - disabled,
>> RESULT: not possible, any one of the config options need to be enabled.
>> 4. CONFIG_PERF_EVENT -enabled, CONFIG_PMU_SYSFS - enabled,
>> RESULT: not possible, any one of the config options need to be enabled.
>> ---
>>   arch/powerpc/kernel/sysfs.c            | 21 +++++++++++++++++++++
>>   arch/powerpc/platforms/Kconfig.cputype |  8 ++++++++
>>   2 files changed, 29 insertions(+)
>>
>> ---
>> Changelog:
>> Resend v2
>>     Added 'Reviewed-by' and 'Tested-by' tag along with test scenarios.
>>
>> v1 -> v2
>> - Added new config option 'PMU_SYSFS' for PMU SPR's creation
>>    rather than using PERF_EVENTS config option directly and make
>>    sure SPR's file creation only if 'CONFIG_PERF_EVENTS' disabled.
>> ---
>> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
>> index 80a676da11cb..b7c01f1ef236 100644
>> --- a/arch/powerpc/kernel/sysfs.c
>> +++ b/arch/powerpc/kernel/sysfs.c
>> @@ -457,16 +457,21 @@ static ssize_t __used \
>>     #if defined(CONFIG_PPC64)
>>   #define HAS_PPC_PMC_CLASSIC    1
>> +#ifdef CONFIG_PMU_SYSFS
>>   #define HAS_PPC_PMC_IBM        1
>> +#endif
>>   #define HAS_PPC_PMC_PA6T    1
>>   #elif defined(CONFIG_PPC_BOOK3S_32)
>>   #define HAS_PPC_PMC_CLASSIC    1
>> +#ifdef CONFIG_PMU_SYSFS
>>   #define HAS_PPC_PMC_IBM        1
>>   #define HAS_PPC_PMC_G4        1
>>   #endif
>> +#endif
>>       #ifdef HAS_PPC_PMC_CLASSIC
>> +#ifdef CONFIG_PMU_SYSFS
>
> You don't need this big forest of #ifdefs (this one and all the ones 
> after). All the objets you are protecting with this are indeed static. 
> So the only thing you have to do is to register them only when 
> relevant, and GCC will get rid of the objects by itself when the 
> config option is not enabled. See below.
>
> And the advantage of doing that way is that you don't need to build it 
> with both options to check the build. That's recommended by kernel 
> codying style (Refer 
> https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation)
>
> [...]
>
>> @@ -787,8 +804,10 @@ static int register_cpu_online(unsigned int cpu)
>>               device_create_file(s, &pmc_attrs[i]);
>>     #ifdef CONFIG_PPC64
>> +#ifdef CONFIG_PMU_SYSFS
>
> Don't use #ifdef here, just do instead:
>
> if (IS_ENABLED(CONFIG_PMU_SYSFS) && cpu_has_feature(CPU_FTR_MMCRA))


Thanks for the suggestion I will use IS_ENABLED here.


>
>>       if (cpu_has_feature(CPU_FTR_MMCRA))
>>           device_create_file(s, &dev_attr_mmcra);
>> +#endif /* CONFIG_PMU_SYSFS */
>>         if (cpu_has_feature(CPU_FTR_PURR)) {
>>           if (!firmware_has_feature(FW_FEATURE_LPAR))
>> @@ -876,8 +895,10 @@ static int unregister_cpu_online(unsigned int cpu)
>>               device_remove_file(s, &pmc_attrs[i]);
>>     #ifdef CONFIG_PPC64
>> +#ifdef CONFIG_PMU_SYSFS
>
> Same, use IS_ENABLED() here as well.
>
>>       if (cpu_has_feature(CPU_FTR_MMCRA))
>>           device_remove_file(s, &dev_attr_mmcra);
>> +#endif /* CONFIG_PMU_SYSFS */
>>         if (cpu_has_feature(CPU_FTR_PURR))
>>           device_remove_file(s, &dev_attr_purr);
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype 
>> b/arch/powerpc/platforms/Kconfig.cputype
>> index 12543e53fa96..f3ad579c559f 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -417,6 +417,14 @@ config PPC_MM_SLICES
>>   config PPC_HAVE_PMU_SUPPORT
>>          bool
>>   +config PMU_SYSFS
>> +    bool
>> +    default y if !PERF_EVENTS
>> +    help
>> +      This option enables PMU SPR sysfs file creation. Since PMU 
>> SPRs are
>> +      intended to be used via "perf" interface, config option is 
>> enabled
>> +      only when CONFIG_PERF_EVENTS is disabled.
>> +
>
> Not sure you need this at all. Once you have changed to just using 
> IS_ENABLED() in the two places above, I think it is acceptable to use 
> !IS_ENABLED(CONFIG_PERF_EVENTS) instead.

Actually with v1 of the patch, I tried with PERF_EVENT option, but it 
was getting bit messy to recreate the current arrangement in the file. 
So took a new config option path.


>
>>   config PPC_PERF_CTRS
>>          def_bool y
>>          depends on PERF_EVENTS && PPC_HAVE_PMU_SUPPORT
>>
>
>
> Christophe


Thanks,

Kajol Jain


--------------28070D871CB98A2E7C8851ED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Christophe,<br>
      <br>
                  Thankyou for reviewing the patch.<br>
    </p>
    <div class="moz-cite-prefix">On 12/5/19 11:28 AM, Christophe Leroy
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr">
      <br>
      <br>
      Le 05/12/2019 à 06:25, Kajol Jain a écrit :
      <br>
      <blockquote type="cite">Many of the performance moniroting unit
        (PMU) SPRs are
        <br>
        exposed in the sysfs. "perf" API is the primary interface to
        program
        <br>
        PMU and collect counter data in the system. So expose these
        <br>
        PMU SPRs in the absence of CONFIG_PERF_EVENTS.
        <br>
        <br>
        Patch adds a new CONFIG option 'CONFIG_PMU_SYSFS'. The new
        config
        <br>
        option used in kernel/sysfs.c for PMU SPRs sysfs file creation
        and
        <br>
        this new option is enabled only if 'CONFIG_PERF_EVENTS' option
        is
        <br>
        disabled.
        <br>
      </blockquote>
      <br>
      Not sure this new unselectable option is worth it. See below.
      <br>
      By the way I also find the subject misleading, as you may believe
      when reading it that there is something to select.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Ok I wiil change the subject.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr">
      <br>
      <blockquote type="cite">
        <br>
        Tested this patch with enable/disable CONFIG_PERF_EVENTS option
        <br>
        in powernv and pseries machines.
        <br>
        Also did compilation testing for different architecture include:
        <br>
        x86, mips, mips64, alpha, arm. And with book3s_32.config option.
        <br>
      </blockquote>
      <br>
      How do you use book3s_32.config exactly ? That's a portion of
      config, not a config by itself. You should use pmac32_defconfig I
      guess.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Yes you are right, its not a config option. Actually I was
      playing around with '<span style="color: rgb(29, 28, 29);
        font-family: Slack-Lato, appleLogo, sans-serif; font-size: 15px;
        font-style: normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(248, 248, 248); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">CONFIG_PPC_BOOK3S' option in .config
        file. As you suggested,</span></p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(248, 248,
        248); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">I will try to
        build with '</span><span style="color: rgb(29, 28, 29);
        font-family: Slack-Lato, appleLogo, sans-serif; font-size: 15px;
        font-style: normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(248, 248, 248); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">pmac32_defconfig' option.</span></p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(248, 248,
        248); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><br>
      </span></p>
    <blockquote type="cite"
      cite="mid:0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr">
      <br>
      <blockquote type="cite">
        <br>
        Signed-off-by: Kajol Jain <a class="moz-txt-link-rfc2396E" href="mailto:kjain@linux.ibm.com">&lt;kjain@linux.ibm.com&gt;</a>
        <br>
        <br>
        Reviewed-by: Madhavan Srinivasan
        <a class="moz-txt-link-rfc2396E" href="mailto:maddy@linux.vnet.ibm.com">&lt;maddy@linux.vnet.ibm.com&gt;</a>
        <br>
        Tested-by: Nageswara R Sastry <a class="moz-txt-link-rfc2396E" href="mailto:nasastry@in.ibm.com">&lt;nasastry@in.ibm.com&gt;</a>
        <br>
        <br>
        Tested using the following different scenarios:
        <br>
        1. CONFIG_PERF_EVENT - enabled, CONFIG_PMU_SYSFS - disabled,
        <br>
        RESULT: not seen any sysfs files(mmrc*, pmc*) from
        /sys/bus/cpu/devices/cpu?/
        <br>
        2. CONFIG_PERF_EVENT - disabled, CONFIG_PMU_SYSFS - enabled,
        <br>
        RESULT: seen any sysfs files(mmrc*, pmc*) from
        /sys/bus/cpu/devices/cpu?/
        <br>
        3. CONFIG_PERF_EVENT -disabled, CONFIG_PMU_SYSFS - disabled,
        <br>
        RESULT: not possible, any one of the config options need to be
        enabled.
        <br>
        4. CONFIG_PERF_EVENT -enabled, CONFIG_PMU_SYSFS - enabled,
        <br>
        RESULT: not possible, any one of the config options need to be
        enabled.
        <br>
        ---
        <br>
          arch/powerpc/kernel/sysfs.c            | 21
        +++++++++++++++++++++
        <br>
          arch/powerpc/platforms/Kconfig.cputype |  8 ++++++++
        <br>
          2 files changed, 29 insertions(+)
        <br>
        <br>
        ---
        <br>
        Changelog:
        <br>
        Resend v2
        <br>
            Added 'Reviewed-by' and 'Tested-by' tag along with test
        scenarios.    <br>
        <br>
        v1 -&gt; v2
        <br>
        - Added new config option 'PMU_SYSFS' for PMU SPR's creation
        <br>
           rather than using PERF_EVENTS config option directly and make
        <br>
           sure SPR's file creation only if 'CONFIG_PERF_EVENTS'
        disabled.
        <br>
        ---
        <br>
        diff --git a/arch/powerpc/kernel/sysfs.c
        b/arch/powerpc/kernel/sysfs.c
        <br>
        index 80a676da11cb..b7c01f1ef236 100644
        <br>
        --- a/arch/powerpc/kernel/sysfs.c
        <br>
        +++ b/arch/powerpc/kernel/sysfs.c
        <br>
        @@ -457,16 +457,21 @@ static ssize_t __used \
        <br>
            #if defined(CONFIG_PPC64)
        <br>
          #define HAS_PPC_PMC_CLASSIC    1
        <br>
        +#ifdef CONFIG_PMU_SYSFS
        <br>
          #define HAS_PPC_PMC_IBM        1
        <br>
        +#endif
        <br>
          #define HAS_PPC_PMC_PA6T    1
        <br>
          #elif defined(CONFIG_PPC_BOOK3S_32)
        <br>
          #define HAS_PPC_PMC_CLASSIC    1
        <br>
        +#ifdef CONFIG_PMU_SYSFS
        <br>
          #define HAS_PPC_PMC_IBM        1
        <br>
          #define HAS_PPC_PMC_G4        1
        <br>
          #endif
        <br>
        +#endif
        <br>
              #ifdef HAS_PPC_PMC_CLASSIC
        <br>
        +#ifdef CONFIG_PMU_SYSFS
        <br>
      </blockquote>
      <br>
      You don't need this big forest of #ifdefs (this one and all the
      ones after). All the objets you are protecting with this are
      indeed static. So the only thing you have to do is to register
      them only when relevant, and GCC will get rid of the objects by
      itself when the config option is not enabled. See below.
      <br>
      <br>
      And the advantage of doing that way is that you don't need to
      build it with both options to check the build. That's recommended
      by kernel codying style (Refer
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation">https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation</a>)<br>
      <br>
      [...]
      <br>
      <br>
      <blockquote type="cite">@@ -787,8 +804,10 @@ static int
        register_cpu_online(unsigned int cpu)
        <br>
                      device_create_file(s, &amp;pmc_attrs[i]);
        <br>
            #ifdef CONFIG_PPC64
        <br>
        +#ifdef CONFIG_PMU_SYSFS
        <br>
      </blockquote>
      <br>
      Don't use #ifdef here, just do instead:
      <br>
      <br>
      if (IS_ENABLED(CONFIG_PMU_SYSFS) &amp;&amp;
      cpu_has_feature(CPU_FTR_MMCRA))
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks for the suggestion I will use IS_ENABLED here.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr">
      <br>
      <blockquote type="cite">      if (cpu_has_feature(CPU_FTR_MMCRA))
        <br>
                  device_create_file(s, &amp;dev_attr_mmcra);
        <br>
        +#endif /* CONFIG_PMU_SYSFS */
        <br>
                if (cpu_has_feature(CPU_FTR_PURR)) {
        <br>
                  if (!firmware_has_feature(FW_FEATURE_LPAR))
        <br>
        @@ -876,8 +895,10 @@ static int unregister_cpu_online(unsigned
        int cpu)
        <br>
                      device_remove_file(s, &amp;pmc_attrs[i]);
        <br>
            #ifdef CONFIG_PPC64
        <br>
        +#ifdef CONFIG_PMU_SYSFS
        <br>
      </blockquote>
      <br>
      Same, use IS_ENABLED() here as well.
      <br>
      <br>
      <blockquote type="cite">      if (cpu_has_feature(CPU_FTR_MMCRA))
        <br>
                  device_remove_file(s, &amp;dev_attr_mmcra);
        <br>
        +#endif /* CONFIG_PMU_SYSFS */
        <br>
                if (cpu_has_feature(CPU_FTR_PURR))
        <br>
                  device_remove_file(s, &amp;dev_attr_purr);
        <br>
        diff --git a/arch/powerpc/platforms/Kconfig.cputype
        b/arch/powerpc/platforms/Kconfig.cputype
        <br>
        index 12543e53fa96..f3ad579c559f 100644
        <br>
        --- a/arch/powerpc/platforms/Kconfig.cputype
        <br>
        +++ b/arch/powerpc/platforms/Kconfig.cputype
        <br>
        @@ -417,6 +417,14 @@ config PPC_MM_SLICES
        <br>
          config PPC_HAVE_PMU_SUPPORT
        <br>
                 bool
        <br>
          +config PMU_SYSFS
        <br>
        +    bool
        <br>
        +    default y if !PERF_EVENTS
        <br>
        +    help
        <br>
        +      This option enables PMU SPR sysfs file creation. Since
        PMU SPRs are
        <br>
        +      intended to be used via "perf" interface, config option
        is enabled
        <br>
        +      only when CONFIG_PERF_EVENTS is disabled.
        <br>
        +
        <br>
      </blockquote>
      <br>
      Not sure you need this at all. Once you have changed to just using
      IS_ENABLED() in the two places above, I think it is acceptable to
      use !IS_ENABLED(CONFIG_PERF_EVENTS) instead.
      <br>
    </blockquote>
    <br>
    <p>Actually with v1 of the patch, I tried with PERF_EVENT option,
      but it was getting bit messy to recreate the current arrangement
      in the file. So took a new config option path.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr">
      <br>
      <blockquote type="cite">  config PPC_PERF_CTRS
        <br>
                 def_bool y
        <br>
                 depends on PERF_EVENTS &amp;&amp; PPC_HAVE_PMU_SUPPORT
        <br>
        <br>
      </blockquote>
      <br>
      <br>
      Christophe
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Kajol Jain<br>
    </p>
  </body>
</html>

--------------28070D871CB98A2E7C8851ED--

