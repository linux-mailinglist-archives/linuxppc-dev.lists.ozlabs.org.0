Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B14229883
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:49:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBZzT5VnLzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 22:49:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBSkM04sQzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 18:07:38 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M81jsR046380; Wed, 22 Jul 2020 04:07:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x7sdp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 04:07:34 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M82lAG050421;
 Wed, 22 Jul 2020 04:07:33 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x7sdnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 04:07:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M81pcW004488;
 Wed, 22 Jul 2020 08:07:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7mrw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 08:07:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M87TjC32834034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 08:07:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51757AE051;
 Wed, 22 Jul 2020 08:07:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03444AE045;
 Wed, 22 Jul 2020 08:07:26 +0000 (GMT)
Received: from [9.85.103.169] (unknown [9.85.103.169])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 08:07:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <F54F7D50-8255-428A-B79E-EE1E2D70074B@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E869EF44-9629-4F72-99B8-387E87A72405"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [v3 04/15] powerpc/perf: Add support for ISA3.1 PMU SPRs
Date: Wed, 22 Jul 2020 13:37:23 +0530
In-Reply-To: <CACzsE9r9fy22hScRm7yz5OeZH9jXA+97hEfAOo-Nk_EPwW-_Dw@mail.gmail.com>
To: Jordan Niethe <jniethe5@gmail.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-5-git-send-email-atrajeev@linux.vnet.ibm.com>
 <CACzsE9r9fy22hScRm7yz5OeZH9jXA+97hEfAOo-Nk_EPwW-_Dw@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220056
X-Mailman-Approved-At: Wed, 22 Jul 2020 22:44:44 +1000
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_E869EF44-9629-4F72-99B8-387E87A72405
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 22-Jul-2020, at 9:48 AM, Jordan Niethe <jniethe5@gmail.com> wrote:
>=20
> On Sat, Jul 18, 2020 at 1:02 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com <mailto:atrajeev@linux.vnet.ibm.com>> =
wrote:
>>=20
>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>=20
>> PowerISA v3.1 includes new performance monitoring unit(PMU)
>> special purpose registers (SPRs). They are
>>=20
>> Monitor Mode Control Register 3 (MMCR3)
>> Sampled Instruction Event Register 2 (SIER2)
>> Sampled Instruction Event Register 3 (SIER3)
>>=20
>> MMCR3 is added for further sampling related configuration
>> control. SIER2/SIER3 are added to provide additional
>> information about the sampled instruction.
>>=20
>> Patch adds new PPMU flag called "PPMU_ARCH_310S" to support
>> handling of these new SPRs, updates the struct thread_struct
>> to include these new SPRs, include MMCR3 in struct mmcr_regs.
>> This is needed to support programming of MMCR3 SPR during
>> event_[enable/disable]. Patch also adds the sysfs support
>> for the MMCR3 SPR along with SPRN_ macros for these new pmu sprs.
>>=20
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> arch/powerpc/include/asm/perf_event_server.h |  2 ++
>> arch/powerpc/include/asm/processor.h         |  4 ++++
>> arch/powerpc/include/asm/reg.h               |  6 ++++++
>> arch/powerpc/kernel/sysfs.c                  |  8 ++++++++
>> arch/powerpc/perf/core-book3s.c              | 29 =
++++++++++++++++++++++++++++
>> 5 files changed, 49 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h
>> index 14b8dc1..832450a 100644
>> --- a/arch/powerpc/include/asm/perf_event_server.h
>> +++ b/arch/powerpc/include/asm/perf_event_server.h
>> @@ -22,6 +22,7 @@ struct mmcr_regs {
>>        unsigned long mmcr1;
>>        unsigned long mmcr2;
>>        unsigned long mmcra;
>> +       unsigned long mmcr3;
>> };
>> /*
>>  * This struct provides the constants and functions needed to
>> @@ -75,6 +76,7 @@ struct power_pmu {
>> #define PPMU_HAS_SIER          0x00000040 /* Has SIER */
>> #define PPMU_ARCH_207S         0x00000080 /* PMC is architecture =
v2.07S */
>> #define PPMU_NO_SIAR           0x00000100 /* Do not use SIAR */
>> +#define PPMU_ARCH_310S         0x00000200 /* Has MMCR3, SIER2 and =
SIER3 */
> We elsewhere have CPU_FTR_ARCH_31, so should this be PPMU_ARCH_31S to
> be consistent.
>>=20

Ok,
This change will need to be done in all places which are currently using =
PPMU_ARCH_310S

>> /*
>>  * Values for flags to get_alternatives()
>> diff --git a/arch/powerpc/include/asm/processor.h =
b/arch/powerpc/include/asm/processor.h
>> index 52a6783..a466e94 100644
>> --- a/arch/powerpc/include/asm/processor.h
>> +++ b/arch/powerpc/include/asm/processor.h
>> @@ -272,6 +272,10 @@ struct thread_struct {
>>        unsigned        mmcr0;
>>=20
>>        unsigned        used_ebb;
>> +       unsigned long   mmcr3;
>> +       unsigned long   sier2;
>> +       unsigned long   sier3;
>> +
>> #endif
>> };
>>=20
>> diff --git a/arch/powerpc/include/asm/reg.h =
b/arch/powerpc/include/asm/reg.h
>> index 88e6c78..21a1b2d 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -876,7 +876,9 @@
>> #define   MMCR0_FCHV   0x00000001UL /* freeze conditions in =
hypervisor mode */
>> #define SPRN_MMCR1     798
>> #define SPRN_MMCR2     785
>> +#define SPRN_MMCR3     754
>> #define SPRN_UMMCR2    769
>> +#define SPRN_UMMCR3    738
>> #define SPRN_MMCRA     0x312
>> #define   MMCRA_SDSYNC 0x80000000UL /* SDAR synced with SIAR */
>> #define   MMCRA_SDAR_DCACHE_MISS 0x40000000UL
>> @@ -918,6 +920,10 @@
>> #define   SIER_SIHV            0x1000000       /* Sampled MSR_HV */
>> #define   SIER_SIAR_VALID      0x0400000       /* SIAR contents valid =
*/
>> #define   SIER_SDAR_VALID      0x0200000       /* SDAR contents valid =
*/
>> +#define SPRN_SIER2     752
>> +#define SPRN_SIER3     753
>> +#define SPRN_USIER2    736
>> +#define SPRN_USIER3    737
>> #define SPRN_SIAR      796
>> #define SPRN_SDAR      797
>> #define SPRN_TACR      888
>> diff --git a/arch/powerpc/kernel/sysfs.c =
b/arch/powerpc/kernel/sysfs.c
>> index 571b325..46b4ebc 100644
>> --- a/arch/powerpc/kernel/sysfs.c
>> +++ b/arch/powerpc/kernel/sysfs.c
>> @@ -622,8 +622,10 @@ void ppc_enable_pmcs(void)
>> SYSFS_PMCSETUP(pmc8, SPRN_PMC8);
>>=20
>> SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);
>> +SYSFS_PMCSETUP(mmcr3, SPRN_MMCR3);
>>=20
>> static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);
>> +static DEVICE_ATTR(mmcr3, 0600, show_mmcr3, store_mmcr3);
>> #endif /* HAS_PPC_PMC56 */
>>=20
>>=20
>> @@ -886,6 +888,9 @@ static int register_cpu_online(unsigned int cpu)
>> #ifdef CONFIG_PMU_SYSFS
>>        if (cpu_has_feature(CPU_FTR_MMCRA))
>>                device_create_file(s, &dev_attr_mmcra);
>> +
>> +       if (cpu_has_feature(CPU_FTR_ARCH_31))
>> +               device_create_file(s, &dev_attr_mmcr3);
>> #endif /* CONFIG_PMU_SYSFS */
>>=20
>>        if (cpu_has_feature(CPU_FTR_PURR)) {
>> @@ -980,6 +985,9 @@ static int unregister_cpu_online(unsigned int =
cpu)
>> #ifdef CONFIG_PMU_SYSFS
>>        if (cpu_has_feature(CPU_FTR_MMCRA))
>>                device_remove_file(s, &dev_attr_mmcra);
>> +
>> +       if (cpu_has_feature(CPU_FTR_ARCH_31))
>> +               device_remove_file(s, &dev_attr_mmcr3);
>> #endif /* CONFIG_PMU_SYSFS */
>>=20
>>        if (cpu_has_feature(CPU_FTR_PURR)) {
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index f4d07b5..ca32fc0 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -72,6 +72,11 @@ struct cpu_hw_events {
>> /*
>>  * 32-bit doesn't have MMCRA but does have an MMCR2,
>>  * and a few other names are different.
>> + * Also 32-bit doesn't have MMCR3, SIER2 and SIER3.
>> + * Define them as zero knowing that any code path accessing
>> + * these registers (via mtspr/mfspr) are done under ppmu flag
>> + * check for PPMU_ARCH_310S and we will not enter that code path
>> + * for 32-bit.
>>  */
>> #ifdef CONFIG_PPC32
>>=20
>> @@ -85,6 +90,9 @@ struct cpu_hw_events {
>> #define MMCR0_PMCC_U6          0
>>=20
>> #define SPRN_MMCRA             SPRN_MMCR2
>> +#define SPRN_MMCR3             0
>> +#define SPRN_SIER2             0
>> +#define SPRN_SIER3             0
>> #define MMCRA_SAMPLE_ENABLE    0
>>=20
>> static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
>> @@ -581,6 +589,11 @@ static void ebb_switch_out(unsigned long mmcr0)
>>        current->thread.sdar  =3D mfspr(SPRN_SDAR);
>>        current->thread.mmcr0 =3D mmcr0 & MMCR0_USER_MASK;
>>        current->thread.mmcr2 =3D mfspr(SPRN_MMCR2) & MMCR2_USER_MASK;
>> +       if (ppmu->flags & PPMU_ARCH_310S) {
>> +               current->thread.mmcr3 =3D mfspr(SPRN_MMCR3);
> Like MMCR0_USER_MASK and MMCR2_USER_MASK do we need a MMCR3_USER_MASK
> here, or is there no need?

Jordan

We don=E2=80=99t need user mask for MMCR3 and other new SPRs ( SIER2/3) =
. Incase of MMCR3, we dont have any Freeze control bits and incase of =
SIER2/3, it is similar to SIER (where HW handles the masking of the =
bits), hence we didn't add any user_mask for these SPRs

Thanks
Athira

>> +               current->thread.sier2 =3D mfspr(SPRN_SIER2);
>> +               current->thread.sier3 =3D mfspr(SPRN_SIER3);
>> +       }
>> }
>>=20
>> static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events =
*cpuhw)
>> @@ -620,6 +633,12 @@ static unsigned long ebb_switch_in(bool ebb, =
struct cpu_hw_events *cpuhw)
>>         * instead manage the MMCR2 entirely by itself.
>>         */
>>        mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2 | current->thread.mmcr2);
>> +
>> +       if (ppmu->flags & PPMU_ARCH_310S) {
>> +               mtspr(SPRN_MMCR3, current->thread.mmcr3);
>> +               mtspr(SPRN_SIER2, current->thread.sier2);
>> +               mtspr(SPRN_SIER3, current->thread.sier3);
>> +       }
>> out:
>>        return mmcr0;
>> }
>> @@ -840,6 +859,11 @@ void perf_event_print_debug(void)
>>                pr_info("EBBRR: %016lx BESCR: %016lx\n",
>>                        mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));
>>        }
>> +
>> +       if (ppmu->flags & PPMU_ARCH_310S) {
>> +               pr_info("MMCR3: %016lx SIER2: %016lx SIER3: =
%016lx\n",
>> +                       mfspr(SPRN_MMCR3), mfspr(SPRN_SIER2), =
mfspr(SPRN_SIER3));
>> +       }
>> #endif
>>        pr_info("SIAR:  %016lx SDAR:  %016lx SIER:  %016lx\n",
>>                mfspr(SPRN_SIAR), sdar, sier);
>> @@ -1305,6 +1329,8 @@ static void power_pmu_enable(struct pmu *pmu)
>>        if (!cpuhw->n_added) {
>>                mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & =
~MMCRA_SAMPLE_ENABLE);
>>                mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>> +               if (ppmu->flags & PPMU_ARCH_310S)
>> +                       mtspr(SPRN_MMCR3, cpuhw->mmcr.mmcr3);
>>                goto out_enable;
>>        }
>>=20
>> @@ -1348,6 +1374,9 @@ static void power_pmu_enable(struct pmu *pmu)
>>        if (ppmu->flags & PPMU_ARCH_207S)
>>                mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2);
>>=20
>> +       if (ppmu->flags & PPMU_ARCH_310S)
>> +               mtspr(SPRN_MMCR3, cpuhw->mmcr.mmcr3);
>> +
>>        /*
>>         * Read off any pre-existing events that need to move
>>         * to another PMC.
>> --
>> 1.8.3.1


--Apple-Mail=_E869EF44-9629-4F72-99B8-387E87A72405
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 22-Jul-2020, at 9:48 AM, Jordan Niethe &lt;<a =
href=3D"mailto:jniethe5@gmail.com" class=3D"">jniethe5@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Sat, Jul 18, 2020 at 1:02 AM =
Athira Rajeev</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">&lt;</span><a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">atrajeev@linux.vnet.ibm.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">From: Madhavan =
Srinivasan &lt;<a href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D""><br =
class=3D"">PowerISA v3.1 includes new performance monitoring =
unit(PMU)<br class=3D"">special purpose registers (SPRs). They are<br =
class=3D""><br class=3D"">Monitor Mode Control Register 3 (MMCR3)<br =
class=3D"">Sampled Instruction Event Register 2 (SIER2)<br =
class=3D"">Sampled Instruction Event Register 3 (SIER3)<br class=3D""><br =
class=3D"">MMCR3 is added for further sampling related configuration<br =
class=3D"">control. SIER2/SIER3 are added to provide additional<br =
class=3D"">information about the sampled instruction.<br class=3D""><br =
class=3D"">Patch adds new PPMU flag called "PPMU_ARCH_310S" to =
support<br class=3D"">handling of these new SPRs, updates the struct =
thread_struct<br class=3D"">to include these new SPRs, include MMCR3 in =
struct mmcr_regs.<br class=3D"">This is needed to support programming of =
MMCR3 SPR during<br class=3D"">event_[enable/disable]. Patch also adds =
the sysfs support<br class=3D"">for the MMCR3 SPR along with SPRN_ =
macros for these new pmu sprs.<br class=3D""><br class=3D"">Signed-off-by:=
 Madhavan Srinivasan &lt;<a href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">arch/powerpc/include/asm/perf_event_server.h | &nbsp;2 ++<br =
class=3D"">arch/powerpc/include/asm/processor.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;4 ++++<br =
class=3D"">arch/powerpc/include/asm/reg.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;6 ++++++<br class=3D"">arch/powerpc/kernel/sysfs.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;8 ++++++++<br =
class=3D"">arch/powerpc/perf/core-book3s.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| 29 ++++++++++++++++++++++++++++<br class=3D"">5 files changed, 49 =
insertions(+)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">index =
14b8dc1..832450a 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">@@ -22,6 =
+22,7 @@ struct mmcr_regs {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
mmcr1;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned =
long mmcr2;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
mmcra;<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
mmcr3;<br class=3D"">};<br class=3D"">/*<br class=3D"">&nbsp;* This =
struct provides the constants and functions needed to<br class=3D"">@@ =
-75,6 +76,7 @@ struct power_pmu {<br class=3D"">#define PPMU_HAS_SIER =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x00000040 /* Has =
SIER */<br class=3D"">#define PPMU_ARCH_207S =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x00000080 /* PMC is =
architecture v2.07S */<br class=3D"">#define PPMU_NO_SIAR =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x00000100 =
/* Do not use SIAR */<br class=3D"">+#define PPMU_ARCH_310S =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x00000200 /* Has MMCR3, =
SIER2 and SIER3 */<br class=3D""></blockquote><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">We elsewhere have CPU_FTR_ARCH_31, so should this be =
PPMU_ARCH_31S to</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">be consistent.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br =
class=3D""></blockquote></div></blockquote><div><br =
class=3D""></div>Ok,</div><div>This change will need to be done in all =
places which are currently using PPMU_ARCH_310S</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">/*<br =
class=3D"">&nbsp;* Values for flags to get_alternatives()<br =
class=3D"">diff --git a/arch/powerpc/include/asm/processor.h =
b/arch/powerpc/include/asm/processor.h<br class=3D"">index =
52a6783..a466e94 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/processor.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/processor.h<br class=3D"">@@ -272,6 +272,10 =
@@ struct thread_struct {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr0;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;used_ebb;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long &nbsp;&nbsp;mmcr3;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
&nbsp;&nbsp;sier2;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long &nbsp;&nbsp;sier3;<br =
class=3D"">+<br class=3D"">#endif<br class=3D"">};<br class=3D""><br =
class=3D"">diff --git a/arch/powerpc/include/asm/reg.h =
b/arch/powerpc/include/asm/reg.h<br class=3D"">index 88e6c78..21a1b2d =
100644<br class=3D"">--- a/arch/powerpc/include/asm/reg.h<br =
class=3D"">+++ b/arch/powerpc/include/asm/reg.h<br class=3D"">@@ -876,7 =
+876,9 @@<br class=3D"">#define &nbsp;&nbsp;MMCR0_FCHV =
&nbsp;&nbsp;0x00000001UL /* freeze conditions in hypervisor mode */<br =
class=3D"">#define SPRN_MMCR1 &nbsp;&nbsp;&nbsp;&nbsp;798<br =
class=3D"">#define SPRN_MMCR2 &nbsp;&nbsp;&nbsp;&nbsp;785<br =
class=3D"">+#define SPRN_MMCR3 &nbsp;&nbsp;&nbsp;&nbsp;754<br =
class=3D"">#define SPRN_UMMCR2 &nbsp;&nbsp;&nbsp;769<br =
class=3D"">+#define SPRN_UMMCR3 &nbsp;&nbsp;&nbsp;738<br =
class=3D"">#define SPRN_MMCRA &nbsp;&nbsp;&nbsp;&nbsp;0x312<br =
class=3D"">#define &nbsp;&nbsp;MMCRA_SDSYNC 0x80000000UL /* SDAR synced =
with SIAR */<br class=3D"">#define &nbsp;&nbsp;MMCRA_SDAR_DCACHE_MISS =
0x40000000UL<br class=3D"">@@ -918,6 +920,10 @@<br class=3D"">#define =
&nbsp;&nbsp;SIER_SIHV =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x100000=
0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Sampled MSR_HV */<br =
class=3D"">#define &nbsp;&nbsp;SIER_SIAR_VALID =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x0400000 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* SIAR contents valid */<br =
class=3D"">#define &nbsp;&nbsp;SIER_SDAR_VALID =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x0200000 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* SDAR contents valid */<br =
class=3D"">+#define SPRN_SIER2 &nbsp;&nbsp;&nbsp;&nbsp;752<br =
class=3D"">+#define SPRN_SIER3 &nbsp;&nbsp;&nbsp;&nbsp;753<br =
class=3D"">+#define SPRN_USIER2 &nbsp;&nbsp;&nbsp;736<br =
class=3D"">+#define SPRN_USIER3 &nbsp;&nbsp;&nbsp;737<br =
class=3D"">#define SPRN_SIAR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;796<br =
class=3D"">#define SPRN_SDAR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;797<br =
class=3D"">#define SPRN_TACR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;888<br =
class=3D"">diff --git a/arch/powerpc/kernel/sysfs.c =
b/arch/powerpc/kernel/sysfs.c<br class=3D"">index 571b325..46b4ebc =
100644<br class=3D"">--- a/arch/powerpc/kernel/sysfs.c<br class=3D"">+++ =
b/arch/powerpc/kernel/sysfs.c<br class=3D"">@@ -622,8 +622,10 @@ void =
ppc_enable_pmcs(void)<br class=3D"">SYSFS_PMCSETUP(pmc8, SPRN_PMC8);<br =
class=3D""><br class=3D"">SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);<br =
class=3D"">+SYSFS_PMCSETUP(mmcr3, SPRN_MMCR3);<br class=3D""><br =
class=3D"">static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);<br =
class=3D"">+static DEVICE_ATTR(mmcr3, 0600, show_mmcr3, store_mmcr3);<br =
class=3D"">#endif /* HAS_PPC_PMC56 */<br class=3D""><br class=3D""><br =
class=3D"">@@ -886,6 +888,9 @@ static int register_cpu_online(unsigned =
int cpu)<br class=3D"">#ifdef CONFIG_PMU_SYSFS<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpu_has_feature(CPU_FTR_MMCRA))<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;device_create_file(s, =
&amp;dev_attr_mmcra);<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpu_has_feature(CPU_FTR_ARCH_31))<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;device_create_file(s, &amp;dev_attr_mmcr3);<br class=3D"">#endif=
 /* CONFIG_PMU_SYSFS */<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpu_has_feature(CPU_FTR_PURR)) {<br class=3D"">@@ -980,6 +985,9 @@ =
static int unregister_cpu_online(unsigned int cpu)<br class=3D"">#ifdef =
CONFIG_PMU_SYSFS<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpu_has_feature(CPU_FTR_MMCRA))<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;device_remove_file(s, =
&amp;dev_attr_mmcra);<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpu_has_feature(CPU_FTR_ARCH_31))<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;device_remove_file(s, &amp;dev_attr_mmcr3);<br class=3D"">#endif=
 /* CONFIG_PMU_SYSFS */<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpu_has_feature(CPU_FTR_PURR)) {<br class=3D"">diff --git =
a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c<br =
class=3D"">index f4d07b5..ca32fc0 100644<br class=3D"">--- =
a/arch/powerpc/perf/core-book3s.c<br class=3D"">+++ =
b/arch/powerpc/perf/core-book3s.c<br class=3D"">@@ -72,6 +72,11 @@ =
struct cpu_hw_events {<br class=3D"">/*<br class=3D"">&nbsp;* 32-bit =
doesn't have MMCRA but does have an MMCR2,<br class=3D"">&nbsp;* and a =
few other names are different.<br class=3D"">+ * Also 32-bit doesn't =
have MMCR3, SIER2 and SIER3.<br class=3D"">+ * Define them as zero =
knowing that any code path accessing<br class=3D"">+ * these registers =
(via mtspr/mfspr) are done under ppmu flag<br class=3D"">+ * check for =
PPMU_ARCH_310S and we will not enter that code path<br class=3D"">+ * =
for 32-bit.<br class=3D"">&nbsp;*/<br class=3D"">#ifdef CONFIG_PPC32<br =
class=3D""><br class=3D"">@@ -85,6 +90,9 @@ struct cpu_hw_events {<br =
class=3D"">#define MMCR0_PMCC_U6 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<br class=3D""><br =
class=3D"">#define SPRN_MMCRA =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SP=
RN_MMCR2<br class=3D"">+#define SPRN_MMCR3 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<=
br class=3D"">+#define SPRN_SIER2 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<=
br class=3D"">+#define SPRN_SIER3 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<=
br class=3D"">#define MMCRA_SAMPLE_ENABLE &nbsp;&nbsp;&nbsp;0<br =
class=3D""><br class=3D"">static inline unsigned long =
perf_ip_adjust(struct pt_regs *regs)<br class=3D"">@@ -581,6 +589,11 @@ =
static void ebb_switch_out(unsigned long mmcr0)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;current-&gt;thread.sd=
ar &nbsp;=3D mfspr(SPRN_SDAR);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;current-&gt;thread.mm=
cr0 =3D mmcr0 &amp; MMCR0_USER_MASK;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;current-&gt;thread.mm=
cr2 =3D mfspr(SPRN_MMCR2) &amp; MMCR2_USER_MASK;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ppmu-&gt;flags &amp; =
PPMU_ARCH_310S) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;current-&gt;thread.mmcr3 =3D mfspr(SPRN_MMCR3);<br =
class=3D""></blockquote><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Like MMCR0_USER_MASK and MMCR2_USER_MASK do we need a =
MMCR3_USER_MASK</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">here, or is there no need?</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Jordan</div><div><br class=3D""></div><div>We don=E2=80=99=
t need user mask for MMCR3 and other new SPRs ( SIER2/3) . I<font =
face=3D"Helvetica Neue" class=3D"">ncase of MMCR3, we dont have any =
Freeze control bits and incase of SIER2/3, it is&nbsp;similar&nbsp;to =
SIER (where HW handles the masking of the bits), hence we didn't add any =
user_mask</font><span style=3D"font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp;</span><span style=3D"font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">for these SPRs</span></div><div><span =
style=3D"font-family: &quot;Helvetica Neue&quot;;" class=3D""><br =
class=3D""></span></div><div><span style=3D"font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">Thanks</span></div><div><span =
style=3D"font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">Athira</span></div><div><font face=3D"Helvetica Neue" =
class=3D""><br class=3D""></font><blockquote type=3D"cite" class=3D""><div=
 class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;current-&gt;thread.sier2 =3D mfspr(SPRN_SIER2);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;current-&gt;thread.sier3 =3D mfspr(SPRN_SIER3);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">}<br class=3D""><br =
class=3D"">static unsigned long ebb_switch_in(bool ebb, struct =
cpu_hw_events *cpuhw)<br class=3D"">@@ -620,6 +633,12 @@ static unsigned =
long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* instead =
manage the MMCR2 entirely by itself.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR2, =
cpuhw-&gt;mmcr.mmcr2 | current-&gt;thread.mmcr2);<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ppmu-&gt;flags =
&amp; PPMU_ARCH_310S) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCR3, current-&gt;thread.mmcr3);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_SIER2, current-&gt;thread.sier2);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_SIER3, current-&gt;thread.sier3);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">out:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return mmcr0;<br =
class=3D"">}<br class=3D"">@@ -840,6 +859,11 @@ void =
perf_event_print_debug(void)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;pr_info("EBBRR: %016lx BESCR: %016lx\n",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ppmu-&gt;flags =
&amp; PPMU_ARCH_310S) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;pr_info("MMCR3: %016lx SIER2: %016lx SIER3: %016lx\n",<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mfspr(SPRN_MMCR3=
), mfspr(SPRN_SIER2), mfspr(SPRN_SIER3));<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">#endif<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pr_info("SIAR: =
&nbsp;%016lx SDAR: &nbsp;%016lx SIER: &nbsp;%016lx\n",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;mfspr(SPRN_SIAR), sdar, sier);<br class=3D"">@@=
 -1305,6 +1329,8 @@ static void power_pmu_enable(struct pmu *pmu)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(!cpuhw-&gt;n_added) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCRA, cpuhw-&gt;mmcr.mmcra &amp; =
~MMCRA_SAMPLE_ENABLE);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR1, cpuhw-&gt;mmcr.mmcr1);<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (ppmu-&gt;flags &amp; PPMU_ARCH_310S)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR3=
, cpuhw-&gt;mmcr.mmcr3);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;goto out_enable;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D"">@@ -1348,6 +1374,9 @@ static void power_pmu_enable(struct pmu =
*pmu)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(ppmu-&gt;flags &amp; PPMU_ARCH_207S)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR2, cpuhw-&gt;mmcr.mmcr2);<br =
class=3D""><br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(ppmu-&gt;flags &amp; PPMU_ARCH_310S)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCR3, cpuhw-&gt;mmcr.mmcr3);<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Read off =
any pre-existing events that need to move<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* to another =
PMC.<br class=3D"">--<br =
class=3D"">1.8.3.1</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_E869EF44-9629-4F72-99B8-387E87A72405--

