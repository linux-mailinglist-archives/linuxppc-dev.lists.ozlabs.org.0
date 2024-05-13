Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2288C46DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 20:31:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cMUSe1y4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdSkd1t2cz3cY7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 04:31:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cMUSe1y4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anjalik@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdKtC3DGsz3ckg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2024 23:22:59 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44DD76Qq014242;
	Mon, 13 May 2024 13:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : from : subject : to : cc : references : in-reply-to :
 mime-version; s=pp1; bh=om6RvStn41dFtjBCmjui9Y81jCvyoB54CHcz9QMDYcY=;
 b=cMUSe1y4ATXeZKAye+E6eiug/sY9IpSq2xmADEu2jDvoicCaZtQSjpcuTvsAm5/IZNEx
 ea8fsff4VqvA+verGwz5paP0xrxekVq7Zury+7Sc7K/tVxcXVcoKlvq6xiWGR8D03Ox3
 3ARvSSxY6Cj9UrCDn+xi+YfvqPiuvb9y/DvJFBMdeSkJAkBOqInmQpdmmiG4emnkiaAN
 PrgZgynnBMEckOYomkifZTfV+IPqA9+Q0DcS6TRPcyjT8fo7eRqSiGVDXLnyWyYWGgAN
 8twJPpkof79dOaHtywlf3AmMB9x1vuUEadc0C3yb7UqVP/C5G6eaT9NjBs/SGCf7KSQA Ag== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y3kfar1jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 13:22:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44DA69oJ020368;
	Mon, 13 May 2024 13:22:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kcyqt2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 13:22:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44DDMgTD38732184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 May 2024 13:22:44 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABDBD2005A;
	Mon, 13 May 2024 13:22:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 082982004B;
	Mon, 13 May 2024 13:22:41 +0000 (GMT)
Received: from [9.43.13.141] (unknown [9.43.13.141])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 May 2024 13:22:40 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------AfaaqY1BItYNUuU9UaZqQHy5"
Message-ID: <0eb29012-124e-426b-905b-07ebe5ce79de@linux.ibm.com>
Date: Mon, 13 May 2024 18:52:40 +0530
User-Agent: Mozilla Thunderbird
From: Anjali K <anjalik@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf: set cpumode flags using sample address in
 the PPMU_ARCH_31 case
To: kernel test robot <lkp@intel.com>
References: <20240511075344.1393631-1-anjalik@linux.ibm.com>
 <202405121056.KfeNJMXV-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202405121056.KfeNJMXV-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8_4HnpPx39VdpP0VRpFQkqq3DudRNItK
X-Proofpoint-ORIG-GUID: 8_4HnpPx39VdpP0VRpFQkqq3DudRNItK
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_09,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405130085
X-Mailman-Approved-At: Tue, 14 May 2024 04:31:18 +1000
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
Cc: atrajeev@linux.vnet.ibm.com, oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------AfaaqY1BItYNUuU9UaZqQHy5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/24 07:52, kernel test robot wrote:
> Hi Anjali,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on dd5a440a31fae6e459c0d6271dddd62825505361]
>
> url:https://github.com/intel-lab-lkp/linux/commits/Anjali-K/powerpc-perf-set-cpumode-flags-using-sample-address-in-the-PPMU_ARCH_31-case/20240511-202416
> base:   dd5a440a31fae6e459c0d6271dddd62825505361
> patch link:https://lore.kernel.org/r/20240511075344.1393631-1-anjalik%40linux.ibm.com
> patch subject: [PATCH] powerpc/perf: set cpumode flags using sample address in the PPMU_ARCH_31 case
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot<lkp@intel.com>
> | Closes:https://lore.kernel.org/oe-kbuild-all/202405121056.KfeNJMXV-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     arch/powerpc/perf/core-book3s.c: In function 'perf_get_misc_flags':
>>> arch/powerpc/perf/core-book3s.c:270:13: warning: unused variable 'marked' [-Wunused-variable]
>       270 |         int marked = mmcra & MMCRA_SAMPLE_ENABLE;
>           |             ^~~~~~
Thank you for reporting the build warning.
I will fix the same and send the patch as v2.
> vim +/marked +270 arch/powerpc/perf/core-book3s.c
>
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  265
> 98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  266  static inline u32 perf_get_misc_flags(struct pt_regs *regs)
> 98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  267  {
> 33904054b40832 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  268  	bool use_siar = regs_use_siar(regs);
> d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21  269  	unsigned long mmcra = regs->dsisr;
> d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21 @270  	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  271  	unsigned long siar = mfspr(SPRN_SIAR);
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  272  	unsigned long addr;
> 98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  273
> 75382aa72f0682 arch/powerpc/perf/core-book3s.c    Anton Blanchard        2012-06-26  274  	if (!use_siar)
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  275  		return perf_flags_from_msr(regs);
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  276
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  277  	/*
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  278  	 * If we don't have flags in MMCRA, rather than using
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  279  	 * the MSR, we intuit the flags from the address in
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  280  	 * SIAR which should give slightly more reliable
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  281  	 * results
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  282  	 */
> cbda6aa10bd2d9 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-05-15  283  	if (ppmu->flags & PPMU_NO_SIPR) {
> a2391b35f1d9d5 arch/powerpc/perf/core-book3s.c    Madhavan Srinivasan    2016-12-24  284  		if (is_kernel_addr(siar))
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  285  			return PERF_RECORD_MISC_KERNEL;
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  286  		return PERF_RECORD_MISC_USER;
> 1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  287  	}
> 98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  288
> 7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  289  	/* PR has priority over HV, so order below is important */
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  290  	if (regs_sipr(regs)) {
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  291  		if (!(ppmu->flags & PPMU_ARCH_31))
> 7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  292  			return PERF_RECORD_MISC_USER;
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  293  	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
> cdd6c482c9ff9c arch/powerpc/kernel/perf_event.c   Ingo Molnar            2009-09-21  294  		return PERF_RECORD_MISC_HYPERVISOR;
> 5682c460264149 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  295
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  296  	/*
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  297  	 * Check the address in SIAR to identify the
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  298  	 * privilege levels since the SIER[MSR_HV, MSR_PR]
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  299  	 * bits are not set correctly in power10 sometimes
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  300  	 */
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  301  	if (ppmu->flags & PPMU_ARCH_31) {
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  302  		addr = siar ? siar : regs->nip;
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  303  		if (!is_kernel_addr(addr))
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  304  			return PERF_RECORD_MISC_USER;
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  305  	}
> c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  306
> 7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  307  	return PERF_RECORD_MISC_KERNEL;
> 98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  308  }
> 98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  309
>

--------------AfaaqY1BItYNUuU9UaZqQHy5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><font size="2">On 12/05/24 07:52,
        kernel test robot wrote:</font><br>
    </div>
    <blockquote type="cite"
      cite="mid:202405121056.KfeNJMXV-lkp@intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Anjali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    <a class="moz-txt-link-freetext"
href="https://github.com/intel-lab-lkp/linux/commits/Anjali-K/powerpc-perf-set-cpumode-flags-using-sample-address-in-the-PPMU_ARCH_31-case/20240511-202416">https://github.com/intel-lab-lkp/linux/commits/Anjali-K/powerpc-perf-set-cpumode-flags-using-sample-address-in-the-PPMU_ARCH_31-case/20240511-202416</a>
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/r/20240511075344.1393631-1-anjalik%40linux.ibm.com">https://lore.kernel.org/r/20240511075344.1393631-1-anjalik%40linux.ibm.com</a>
patch subject: [PATCH] powerpc/perf: set cpumode flags using sample address in the PPMU_ARCH_31 case
config: powerpc-allmodconfig (<a class="moz-txt-link-freetext"
href="https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/config">https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/config</a>)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (<a class="moz-txt-link-freetext"
href="https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/reproduce">https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/reproduce</a>)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <a class="moz-txt-link-rfc2396E"
      href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>
| Closes: <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/oe-kbuild-all/202405121056.KfeNJMXV-lkp@intel.com/">https://lore.kernel.org/oe-kbuild-all/202405121056.KfeNJMXV-lkp@intel.com/</a>

All warnings (new ones prefixed by &gt;&gt;):

   arch/powerpc/perf/core-book3s.c: In function 'perf_get_misc_flags':
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">arch/powerpc/perf/core-book3s.c:270:13: warning: unused variable 'marked' [-Wunused-variable]
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">     270 |         int marked = mmcra &amp; MMCRA_SAMPLE_ENABLE;
         |             ^~~~~~
</pre>
    </blockquote>
    <font size="2">Thank you for reporting the build warning.<br>
      I will fix the same and send the patch as v2. </font>
    <blockquote type="cite"
      cite="mid:202405121056.KfeNJMXV-lkp@intel.com">
      <pre class="moz-quote-pre" wrap="">vim +/marked +270 arch/powerpc/perf/core-book3s.c

1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  265  
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  266  static inline u32 perf_get_misc_flags(struct pt_regs *regs)
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  267  {
33904054b40832 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  268  	bool use_siar = regs_use_siar(regs);
d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21  269  	unsigned long mmcra = regs-&gt;dsisr;
d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21 @270  	int marked = mmcra &amp; MMCRA_SAMPLE_ENABLE;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  271  	unsigned long siar = mfspr(SPRN_SIAR);
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  272  	unsigned long addr;
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  273  
75382aa72f0682 arch/powerpc/perf/core-book3s.c    Anton Blanchard        2012-06-26  274  	if (!use_siar)
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  275  		return perf_flags_from_msr(regs);
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  276  
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  277  	/*
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  278  	 * If we don't have flags in MMCRA, rather than using
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  279  	 * the MSR, we intuit the flags from the address in
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  280  	 * SIAR which should give slightly more reliable
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  281  	 * results
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  282  	 */
cbda6aa10bd2d9 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-05-15  283  	if (ppmu-&gt;flags &amp; PPMU_NO_SIPR) {
a2391b35f1d9d5 arch/powerpc/perf/core-book3s.c    Madhavan Srinivasan    2016-12-24  284  		if (is_kernel_addr(siar))
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  285  			return PERF_RECORD_MISC_KERNEL;
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  286  		return PERF_RECORD_MISC_USER;
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  287  	}
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  288  
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  289  	/* PR has priority over HV, so order below is important */
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  290  	if (regs_sipr(regs)) {
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  291  		if (!(ppmu-&gt;flags &amp; PPMU_ARCH_31))
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  292  			return PERF_RECORD_MISC_USER;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  293  	} else if (regs_sihv(regs) &amp;&amp; (freeze_events_kernel != MMCR0_FCHV))
cdd6c482c9ff9c arch/powerpc/kernel/perf_event.c   Ingo Molnar            2009-09-21  294  		return PERF_RECORD_MISC_HYPERVISOR;
5682c460264149 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  295  
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  296  	/*
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  297  	 * Check the address in SIAR to identify the
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  298  	 * privilege levels since the SIER[MSR_HV, MSR_PR]
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  299  	 * bits are not set correctly in power10 sometimes
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  300  	 */
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  301  	if (ppmu-&gt;flags &amp; PPMU_ARCH_31) {
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  302  		addr = siar ? siar : regs-&gt;nip;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  303  		if (!is_kernel_addr(addr))
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  304  			return PERF_RECORD_MISC_USER;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  305  	}
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  306  
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  307  	return PERF_RECORD_MISC_KERNEL;
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  308  }
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  309  

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------AfaaqY1BItYNUuU9UaZqQHy5--

