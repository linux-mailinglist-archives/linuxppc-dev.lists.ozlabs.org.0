Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F354A228E9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 05:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBLXs4YBvzDqPF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 13:29:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBJw63bnRzDqfM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 12:15:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M21ZWN000899; Tue, 21 Jul 2020 22:15:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x7hhy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 22:15:29 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M21uHe002707;
 Tue, 21 Jul 2020 22:15:28 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x7hhx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 22:15:28 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M2CBU8005651;
 Wed, 22 Jul 2020 02:15:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh4dv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 02:15:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M2FNtc53280946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 02:15:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D7AF4C04E;
 Wed, 22 Jul 2020 02:15:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B82B4C040;
 Wed, 22 Jul 2020 02:15:15 +0000 (GMT)
Received: from [9.199.41.93] (unknown [9.199.41.93])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 02:15:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <CA68E8F3-B0F4-4EF1-A1D6-7853A38831B9@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E146C295-A446-4594-870E-19D7D52EA2D8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [v3 01/15] powerpc/perf: Update cpu_hw_event to use `struct` for
 storing MMCR registers
Date: Wed, 22 Jul 2020 07:45:11 +0530
In-Reply-To: <CACzsE9rnE_z-uEw2tyvdFDVzkOeBKJoZiTHD9fSRm9d8fVBr5w@mail.gmail.com>
To: Jordan Niethe <jniethe5@gmail.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <CACzsE9rnE_z-uEw2tyvdFDVzkOeBKJoZiTHD9fSRm9d8fVBr5w@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_01:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220008
X-Mailman-Approved-At: Wed, 22 Jul 2020 13:25:54 +1000
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


--Apple-Mail=_E146C295-A446-4594-870E-19D7D52EA2D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 21-Jul-2020, at 9:12 AM, Jordan Niethe <jniethe5@gmail.com> wrote:
>=20
> On Sat, Jul 18, 2020 at 12:48 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com <mailto:atrajeev@linux.vnet.ibm.com>> =
wrote:
>>=20
>> core-book3s currently uses array to store the MMCR registers as part
>> of per-cpu `cpu_hw_events`. This patch does a clean up to use =
`struct`
>> to store mmcr regs instead of array. This will make code easier to =
read
>> and reduces chance of any subtle bug that may come in the future, say
>> when new registers are added. Patch updates all relevant code that =
was
>> using MMCR array ( cpuhw->mmcr[x]) to use newly introduced `struct`.
>> This includes the PMU driver code for supported platforms (power5
>> to power9) and ISA macros for counter support functions.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/include/asm/perf_event_server.h | 10 ++++--
>> arch/powerpc/perf/core-book3s.c              | 53 =
+++++++++++++---------------
>> arch/powerpc/perf/isa207-common.c            | 20 +++++------
>> arch/powerpc/perf/isa207-common.h            |  4 +--
>> arch/powerpc/perf/mpc7450-pmu.c              | 21 +++++++----
>> arch/powerpc/perf/power5+-pmu.c              | 17 ++++-----
>> arch/powerpc/perf/power5-pmu.c               | 17 ++++-----
>> arch/powerpc/perf/power6-pmu.c               | 16 ++++-----
>> arch/powerpc/perf/power7-pmu.c               | 17 ++++-----
>> arch/powerpc/perf/ppc970-pmu.c               | 24 ++++++-------
>> 10 files changed, 105 insertions(+), 94 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h
>> index 3e9703f..f9a3668 100644
>> --- a/arch/powerpc/include/asm/perf_event_server.h
>> +++ b/arch/powerpc/include/asm/perf_event_server.h
>> @@ -17,6 +17,12 @@
>>=20
>> struct perf_event;
>>=20
>> +struct mmcr_regs {
>> +       unsigned long mmcr0;
>> +       unsigned long mmcr1;
>> +       unsigned long mmcr2;
>> +       unsigned long mmcra;
>> +};
>> /*
>>  * This struct provides the constants and functions needed to
>>  * describe the PMU on a particular POWER-family CPU.
>> @@ -28,7 +34,7 @@ struct power_pmu {
>>        unsigned long   add_fields;
>>        unsigned long   test_adder;
>>        int             (*compute_mmcr)(u64 events[], int n_ev,
>> -                               unsigned int hwc[], unsigned long =
mmcr[],
>> +                               unsigned int hwc[], struct mmcr_regs =
*mmcr,
>>                                struct perf_event *pevents[]);
>>        int             (*get_constraint)(u64 event_id, unsigned long =
*mskp,
>>                                unsigned long *valp);
>> @@ -41,7 +47,7 @@ struct power_pmu {
>>        unsigned long   group_constraint_val;
>>        u64             (*bhrb_filter_map)(u64 branch_sample_type);
>>        void            (*config_bhrb)(u64 pmu_bhrb_filter);
>> -       void            (*disable_pmc)(unsigned int pmc, unsigned =
long mmcr[]);
>> +       void            (*disable_pmc)(unsigned int pmc, struct =
mmcr_regs *mmcr);
>>        int             (*limited_pmc_event)(u64 event_id);
>>        u32             flags;
>>        const struct attribute_group    **attr_groups;
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index cd6a742..18b1b6a 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -37,12 +37,7 @@ struct cpu_hw_events {
>>        struct perf_event *event[MAX_HWEVENTS];
>>        u64 events[MAX_HWEVENTS];
>>        unsigned int flags[MAX_HWEVENTS];
>> -       /*
>> -        * The order of the MMCR array is:
>> -        *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
>> -        *  - 32-bit, MMCR0, MMCR1, MMCR2
>> -        */
>> -       unsigned long mmcr[4];
>> +       struct mmcr_regs mmcr;
>>        struct perf_event *limited_counter[MAX_LIMITED_HWCOUNTERS];
>>        u8  limited_hwidx[MAX_LIMITED_HWCOUNTERS];
>>        u64 alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];
>> @@ -121,7 +116,7 @@ static void ebb_event_add(struct perf_event =
*event) { }
>> static void ebb_switch_out(unsigned long mmcr0) { }
>> static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events =
*cpuhw)
>> {
>> -       return cpuhw->mmcr[0];
>> +       return cpuhw->mmcr.mmcr0;
>> }
>>=20
>> static inline void power_pmu_bhrb_enable(struct perf_event *event) {}
>> @@ -590,7 +585,7 @@ static void ebb_switch_out(unsigned long mmcr0)
>>=20
>> static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events =
*cpuhw)
>> {
>> -       unsigned long mmcr0 =3D cpuhw->mmcr[0];
>> +       unsigned long mmcr0 =3D cpuhw->mmcr.mmcr0;
>>=20
>>        if (!ebb)
>>                goto out;
>> @@ -624,7 +619,7 @@ static unsigned long ebb_switch_in(bool ebb, =
struct cpu_hw_events *cpuhw)
>>         * unfreeze counters, it should not set exclude_xxx in its =
events and
>>         * instead manage the MMCR2 entirely by itself.
>>         */
>> -       mtspr(SPRN_MMCR2, cpuhw->mmcr[3] | current->thread.mmcr2);
>> +       mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2 | current->thread.mmcr2);
>> out:
>>        return mmcr0;
>> }
>> @@ -1232,9 +1227,9 @@ static void power_pmu_disable(struct pmu *pmu)
>>                /*
>>                 * Disable instruction sampling if it was enabled
>>                 */
>> -               if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
>> +               if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE) {
>>                        mtspr(SPRN_MMCRA,
>> -                             cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
>> +                             cpuhw->mmcr.mmcra & =
~MMCRA_SAMPLE_ENABLE);
>>                        mb();
>>                        isync();
>>                }
>> @@ -1308,18 +1303,18 @@ static void power_pmu_enable(struct pmu *pmu)
>>         * (possibly updated for removal of events).
>>         */
>>        if (!cpuhw->n_added) {
>> -               mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & =
~MMCRA_SAMPLE_ENABLE);
>> -               mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
>> +               mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & =
~MMCRA_SAMPLE_ENABLE);
>> +               mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>>                goto out_enable;
>>        }
>>=20
>>        /*
>>         * Clear all MMCR settings and recompute them for the new set =
of events.
>>         */
>> -       memset(cpuhw->mmcr, 0, sizeof(cpuhw->mmcr));
>> +       memset(&cpuhw->mmcr, 0, sizeof(cpuhw->mmcr));
>>=20
>>        if (ppmu->compute_mmcr(cpuhw->events, cpuhw->n_events, =
hwc_index,
>> -                              cpuhw->mmcr, cpuhw->event)) {
>> +                              &cpuhw->mmcr, cpuhw->event)) {
>>                /* shouldn't ever get here */
>>                printk(KERN_ERR "oops compute_mmcr failed\n");
>>                goto out;
>> @@ -1333,11 +1328,11 @@ static void power_pmu_enable(struct pmu *pmu)
>>                 */
>>                event =3D cpuhw->event[0];
>>                if (event->attr.exclude_user)
>> -                       cpuhw->mmcr[0] |=3D MMCR0_FCP;
>> +                       cpuhw->mmcr.mmcr0 |=3D MMCR0_FCP;
>>                if (event->attr.exclude_kernel)
>> -                       cpuhw->mmcr[0] |=3D freeze_events_kernel;
>> +                       cpuhw->mmcr.mmcr0 |=3D freeze_events_kernel;
>>                if (event->attr.exclude_hv)
>> -                       cpuhw->mmcr[0] |=3D MMCR0_FCHV;
>> +                       cpuhw->mmcr.mmcr0 |=3D MMCR0_FCHV;
>>        }
>>=20
>>        /*
>> @@ -1346,12 +1341,12 @@ static void power_pmu_enable(struct pmu *pmu)
>>         * Then unfreeze the events.
>>         */
>>        ppc_set_pmu_inuse(1);
>> -       mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
>> -       mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
>> -       mtspr(SPRN_MMCR0, (cpuhw->mmcr[0] & ~(MMCR0_PMC1CE | =
MMCR0_PMCjCE))
>> +       mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
>> +       mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>> +       mtspr(SPRN_MMCR0, (cpuhw->mmcr.mmcr0 & ~(MMCR0_PMC1CE | =
MMCR0_PMCjCE))
>>                                | MMCR0_FC);
>>        if (ppmu->flags & PPMU_ARCH_207S)
>> -               mtspr(SPRN_MMCR2, cpuhw->mmcr[3]);
>> +               mtspr(SPRN_MMCR2, cpuhw->mmcr.mmcr2);
>>=20
>>        /*
>>         * Read off any pre-existing events that need to move
>> @@ -1402,7 +1397,7 @@ static void power_pmu_enable(struct pmu *pmu)
>>                perf_event_update_userpage(event);
>>        }
>>        cpuhw->n_limited =3D n_lim;
>> -       cpuhw->mmcr[0] |=3D MMCR0_PMXE | MMCR0_FCECE;
>> +       cpuhw->mmcr.mmcr0 |=3D MMCR0_PMXE | MMCR0_FCECE;
>>=20
>>  out_enable:
>>        pmao_restore_workaround(ebb);
>> @@ -1418,9 +1413,9 @@ static void power_pmu_enable(struct pmu *pmu)
>>        /*
>>         * Enable instruction sampling if necessary
>>         */
>> -       if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
>> +       if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE) {
>>                mb();
>> -               mtspr(SPRN_MMCRA, cpuhw->mmcr[2]);
>> +               mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra);
>>        }
>>=20
>>  out:
>> @@ -1550,7 +1545,7 @@ static void power_pmu_del(struct perf_event =
*event, int ef_flags)
>>                                cpuhw->flags[i-1] =3D cpuhw->flags[i];
>>                        }
>>                        --cpuhw->n_events;
>> -                       ppmu->disable_pmc(event->hw.idx - 1, =
cpuhw->mmcr);
>> +                       ppmu->disable_pmc(event->hw.idx - 1, =
&cpuhw->mmcr);
>>                        if (event->hw.idx) {
>>                                write_pmc(event->hw.idx, 0);
>>                                event->hw.idx =3D 0;
>> @@ -1571,7 +1566,7 @@ static void power_pmu_del(struct perf_event =
*event, int ef_flags)
>>        }
>>        if (cpuhw->n_events =3D=3D 0) {
>>                /* disable exceptions if no events are running */
>> -               cpuhw->mmcr[0] &=3D ~(MMCR0_PMXE | MMCR0_FCECE);
>> +               cpuhw->mmcr.mmcr0 &=3D ~(MMCR0_PMXE | MMCR0_FCECE);
>>        }
>>=20
>>        if (has_branch_stack(event))
>> @@ -2240,7 +2235,7 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
>>         * XXX might want to use MSR.PM to keep the events frozen =
until
>>         * we get back out of this interrupt.
>>         */
>> -       write_mmcr0(cpuhw, cpuhw->mmcr[0]);
>> +       write_mmcr0(cpuhw, cpuhw->mmcr.mmcr0);
>>=20
>>        if (nmi)
>>                nmi_exit();
>> @@ -2262,7 +2257,7 @@ static int power_pmu_prepare_cpu(unsigned int =
cpu)
>>=20
>>        if (ppmu) {
>>                memset(cpuhw, 0, sizeof(*cpuhw));
>> -               cpuhw->mmcr[0] =3D MMCR0_FC;
>> +               cpuhw->mmcr.mmcr0 =3D MMCR0_FC;
>>        }
>>        return 0;
>> }
>> diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c
>> index 4c86da5..2fe63f2 100644
>> --- a/arch/powerpc/perf/isa207-common.c
>> +++ b/arch/powerpc/perf/isa207-common.c
>> @@ -363,7 +363,7 @@ int isa207_get_constraint(u64 event, unsigned =
long *maskp, unsigned long *valp)
>> }
>>=20
>> int isa207_compute_mmcr(u64 event[], int n_ev,
>> -                              unsigned int hwc[], unsigned long =
mmcr[],
>> +                              unsigned int hwc[], struct mmcr_regs =
*mmcr,
>>                               struct perf_event *pevents[])
>> {
>>        unsigned long mmcra, mmcr1, mmcr2, unit, combine, psel, cache, =
val;
>> @@ -464,30 +464,30 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>>        }
>>=20
>>        /* Return MMCRx values */
>> -       mmcr[0] =3D 0;
>> +       mmcr->mmcr0 =3D 0;
>>=20
>>        /* pmc_inuse is 1-based */
>>        if (pmc_inuse & 2)
>> -               mmcr[0] =3D MMCR0_PMC1CE;
>> +               mmcr->mmcr0 =3D MMCR0_PMC1CE;
>>=20
>>        if (pmc_inuse & 0x7c)
>> -               mmcr[0] |=3D MMCR0_PMCjCE;
>> +               mmcr->mmcr0 |=3D MMCR0_PMCjCE;
>>=20
>>        /* If we're not using PMC 5 or 6, freeze them */
>>        if (!(pmc_inuse & 0x60))
>> -               mmcr[0] |=3D MMCR0_FC56;
>> +               mmcr->mmcr0 |=3D MMCR0_FC56;
>>=20
>> -       mmcr[1] =3D mmcr1;
>> -       mmcr[2] =3D mmcra;
>> -       mmcr[3] =3D mmcr2;
>> +       mmcr->mmcr1 =3D mmcr1;
>> +       mmcr->mmcra =3D mmcra;
>> +       mmcr->mmcr2 =3D mmcr2;
>>=20
>>        return 0;
>> }
>>=20
>> -void isa207_disable_pmc(unsigned int pmc, unsigned long mmcr[])
>> +void isa207_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>> {
>>        if (pmc <=3D 3)
>> -               mmcr[1] &=3D ~(0xffUL << MMCR1_PMCSEL_SHIFT(pmc + =
1));
>> +               mmcr->mmcr1 &=3D ~(0xffUL << MMCR1_PMCSEL_SHIFT(pmc + =
1));
>> }
>>=20
>> static int find_alternative(u64 event, const unsigned int =
ev_alt[][MAX_ALT], int size)
>> diff --git a/arch/powerpc/perf/isa207-common.h =
b/arch/powerpc/perf/isa207-common.h
>> index 63fd4f3..df968fd 100644
>> --- a/arch/powerpc/perf/isa207-common.h
>> +++ b/arch/powerpc/perf/isa207-common.h
>> @@ -217,9 +217,9 @@
>>=20
>> int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned =
long *valp);
>> int isa207_compute_mmcr(u64 event[], int n_ev,
>> -                               unsigned int hwc[], unsigned long =
mmcr[],
>> +                               unsigned int hwc[], struct mmcr_regs =
*mmcr,
>>                                struct perf_event *pevents[]);
>> -void isa207_disable_pmc(unsigned int pmc, unsigned long mmcr[]);
>> +void isa207_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr);
>> int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned =
int flags,
>>                                        const unsigned int =
ev_alt[][MAX_ALT]);
>> void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 =
flags,
>> diff --git a/arch/powerpc/perf/mpc7450-pmu.c =
b/arch/powerpc/perf/mpc7450-pmu.c
>> index 4d5ef92..826de25 100644
>> --- a/arch/powerpc/perf/mpc7450-pmu.c
>> +++ b/arch/powerpc/perf/mpc7450-pmu.c
>> @@ -257,7 +257,7 @@ static int mpc7450_get_alternatives(u64 event, =
unsigned int flags, u64 alt[])
>>  * Compute MMCR0/1/2 values for a set of events.
>>  */
>> static int mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int =
hwc[],
>> -                               unsigned long mmcr[],
>> +                               struct mmcr_regs *mmcr,
>>                                struct perf_event *pevents[])
>> {
>>        u8 event_index[N_CLASSES][N_COUNTER];
>> @@ -321,9 +321,16 @@ static int mpc7450_compute_mmcr(u64 event[], int =
n_ev, unsigned int hwc[],
>>                mmcr0 |=3D MMCR0_PMCnCE;
>>=20
>>        /* Return MMCRx values */
>> -       mmcr[0] =3D mmcr0;
>> -       mmcr[1] =3D mmcr1;
>> -       mmcr[2] =3D mmcr2;
>> +       mmcr->mmcr0 =3D mmcr0;
>> +       mmcr->mmcr1 =3D mmcr1;
>> +       mmcr->mmcr2 =3D mmcr2;
> Will this mmcr->mmcr2 be used anywere, or will it always use =
mmcr->mmcra?

Hi Jordan

We will be actually using mmcr->mmcra in the core-book3s for =
mpc7450-pmu.c
I have still assigned mmcr->mmcr2 so that it will work for any future =
changes if made in corebook

>> +       /*
>> +        * 32-bit doesn't have an MMCRA and uses SPRN_MMCR2 to define
>> +        * SPRN_MMCRA. So assign mmcra of cpu_hw_events with `mmcr2`
>> +        * value to ensure that any write to this SPRN_MMCRA will
>> +        * use mmcr2 value.
>> +        */
> Something like this comment would probably be useful to near the =
struct mmcr.

Sure, I will add this information
Thanks for your suggestion

Athira
>> +       mmcr->mmcra =3D mmcr2;
>>        return 0;
>> }
>>=20
>> @@ -331,12 +338,12 @@ static int mpc7450_compute_mmcr(u64 event[], =
int n_ev, unsigned int hwc[],
>>  * Disable counting by a PMC.
>>  * Note that the pmc argument is 0-based here, not 1-based.
>>  */
>> -static void mpc7450_disable_pmc(unsigned int pmc, unsigned long =
mmcr[])
>> +static void mpc7450_disable_pmc(unsigned int pmc, struct mmcr_regs =
*mmcr)
>> {
>>        if (pmc <=3D 1)
>> -               mmcr[0] &=3D ~(pmcsel_mask[pmc] << =
pmcsel_shift[pmc]);
>> +               mmcr->mmcr0 &=3D ~(pmcsel_mask[pmc] << =
pmcsel_shift[pmc]);
>>        else
>> -               mmcr[1] &=3D ~(pmcsel_mask[pmc] << =
pmcsel_shift[pmc]);
>> +               mmcr->mmcr1 &=3D ~(pmcsel_mask[pmc] << =
pmcsel_shift[pmc]);
>> }
>>=20
>> static int mpc7450_generic_events[] =3D {
>> diff --git a/arch/powerpc/perf/power5+-pmu.c =
b/arch/powerpc/perf/power5+-pmu.c
>> index f857454..5f0821e 100644
>> --- a/arch/powerpc/perf/power5+-pmu.c
>> +++ b/arch/powerpc/perf/power5+-pmu.c
>> @@ -448,7 +448,8 @@ static int power5p_marked_instr_event(u64 event)
>> }
>>=20
>> static int power5p_compute_mmcr(u64 event[], int n_ev,
>> -                               unsigned int hwc[], unsigned long =
mmcr[], struct perf_event *pevents[])
>> +                               unsigned int hwc[], struct mmcr_regs =
*mmcr,
>> +                               struct perf_event *pevents[])
>> {
>>        unsigned long mmcr1 =3D 0;
>>        unsigned long mmcra =3D 0;
>> @@ -586,20 +587,20 @@ static int power5p_compute_mmcr(u64 event[], =
int n_ev,
>>        }
>>=20
>>        /* Return MMCRx values */
>> -       mmcr[0] =3D 0;
>> +       mmcr->mmcr0 =3D 0;
>>        if (pmc_inuse & 1)
>> -               mmcr[0] =3D MMCR0_PMC1CE;
>> +               mmcr->mmcr0 =3D MMCR0_PMC1CE;
>>        if (pmc_inuse & 0x3e)
>> -               mmcr[0] |=3D MMCR0_PMCjCE;
>> -       mmcr[1] =3D mmcr1;
>> -       mmcr[2] =3D mmcra;
>> +               mmcr->mmcr0 |=3D MMCR0_PMCjCE;
>> +       mmcr->mmcr1 =3D mmcr1;
>> +       mmcr->mmcra =3D mmcra;
>>        return 0;
>> }
>>=20
>> -static void power5p_disable_pmc(unsigned int pmc, unsigned long =
mmcr[])
>> +static void power5p_disable_pmc(unsigned int pmc, struct mmcr_regs =
*mmcr)
>> {
>>        if (pmc <=3D 3)
>> -               mmcr[1] &=3D ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
>> +               mmcr->mmcr1 &=3D ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
>> }
>>=20
>> static int power5p_generic_events[] =3D {
>> diff --git a/arch/powerpc/perf/power5-pmu.c =
b/arch/powerpc/perf/power5-pmu.c
>> index da52eca..426021d 100644
>> --- a/arch/powerpc/perf/power5-pmu.c
>> +++ b/arch/powerpc/perf/power5-pmu.c
>> @@ -379,7 +379,8 @@ static int power5_marked_instr_event(u64 event)
>> }
>>=20
>> static int power5_compute_mmcr(u64 event[], int n_ev,
>> -                              unsigned int hwc[], unsigned long =
mmcr[], struct perf_event *pevents[])
>> +                              unsigned int hwc[], struct mmcr_regs =
*mmcr,
>> +                              struct perf_event *pevents[])
>> {
>>        unsigned long mmcr1 =3D 0;
>>        unsigned long mmcra =3D MMCRA_SDAR_DCACHE_MISS | =
MMCRA_SDAR_ERAT_MISS;
>> @@ -528,20 +529,20 @@ static int power5_compute_mmcr(u64 event[], int =
n_ev,
>>        }
>>=20
>>        /* Return MMCRx values */
>> -       mmcr[0] =3D 0;
>> +       mmcr->mmcr0 =3D 0;
>>        if (pmc_inuse & 1)
>> -               mmcr[0] =3D MMCR0_PMC1CE;
>> +               mmcr->mmcr0 =3D MMCR0_PMC1CE;
>>        if (pmc_inuse & 0x3e)
>> -               mmcr[0] |=3D MMCR0_PMCjCE;
>> -       mmcr[1] =3D mmcr1;
>> -       mmcr[2] =3D mmcra;
>> +               mmcr->mmcr0 |=3D MMCR0_PMCjCE;
>> +       mmcr->mmcr1 =3D mmcr1;
>> +       mmcr->mmcra =3D mmcra;
>>        return 0;
>> }
>>=20
>> -static void power5_disable_pmc(unsigned int pmc, unsigned long =
mmcr[])
>> +static void power5_disable_pmc(unsigned int pmc, struct mmcr_regs =
*mmcr)
>> {
>>        if (pmc <=3D 3)
>> -               mmcr[1] &=3D ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
>> +               mmcr->mmcr1 &=3D ~(0x7fUL << MMCR1_PMCSEL_SH(pmc));
>> }
>>=20
>> static int power5_generic_events[] =3D {
>> diff --git a/arch/powerpc/perf/power6-pmu.c =
b/arch/powerpc/perf/power6-pmu.c
>> index 3929cac..e343a51 100644
>> --- a/arch/powerpc/perf/power6-pmu.c
>> +++ b/arch/powerpc/perf/power6-pmu.c
>> @@ -171,7 +171,7 @@ static int power6_marked_instr_event(u64 event)
>>  * Assign PMC numbers and compute MMCR1 value for a set of events
>>  */
>> static int p6_compute_mmcr(u64 event[], int n_ev,
>> -                          unsigned int hwc[], unsigned long mmcr[], =
struct perf_event *pevents[])
>> +                          unsigned int hwc[], struct mmcr_regs =
*mmcr, struct perf_event *pevents[])
>> {
>>        unsigned long mmcr1 =3D 0;
>>        unsigned long mmcra =3D MMCRA_SDAR_DCACHE_MISS | =
MMCRA_SDAR_ERAT_MISS;
>> @@ -243,13 +243,13 @@ static int p6_compute_mmcr(u64 event[], int =
n_ev,
>>                if (pmc < 4)
>>                        mmcr1 |=3D (unsigned long)psel << =
MMCR1_PMCSEL_SH(pmc);
>>        }
>> -       mmcr[0] =3D 0;
>> +       mmcr->mmcr0 =3D 0;
>>        if (pmc_inuse & 1)
>> -               mmcr[0] =3D MMCR0_PMC1CE;
>> +               mmcr->mmcr0 =3D MMCR0_PMC1CE;
>>        if (pmc_inuse & 0xe)
>> -               mmcr[0] |=3D MMCR0_PMCjCE;
>> -       mmcr[1] =3D mmcr1;
>> -       mmcr[2] =3D mmcra;
>> +               mmcr->mmcr0 |=3D MMCR0_PMCjCE;
>> +       mmcr->mmcr1 =3D mmcr1;
>> +       mmcr->mmcra =3D mmcra;
>>        return 0;
>> }
>>=20
>> @@ -457,11 +457,11 @@ static int p6_get_alternatives(u64 event, =
unsigned int flags, u64 alt[])
>>        return nalt;
>> }
>>=20
>> -static void p6_disable_pmc(unsigned int pmc, unsigned long mmcr[])
>> +static void p6_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr)
>> {
>>        /* Set PMCxSEL to 0 to disable PMCx */
>>        if (pmc <=3D 3)
>> -               mmcr[1] &=3D ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
>> +               mmcr->mmcr1 &=3D ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
>> }
>>=20
>> static int power6_generic_events[] =3D {
>> diff --git a/arch/powerpc/perf/power7-pmu.c =
b/arch/powerpc/perf/power7-pmu.c
>> index a137813..3152336 100644
>> --- a/arch/powerpc/perf/power7-pmu.c
>> +++ b/arch/powerpc/perf/power7-pmu.c
>> @@ -242,7 +242,8 @@ static int power7_marked_instr_event(u64 event)
>> }
>>=20
>> static int power7_compute_mmcr(u64 event[], int n_ev,
>> -                              unsigned int hwc[], unsigned long =
mmcr[], struct perf_event *pevents[])
>> +                              unsigned int hwc[], struct mmcr_regs =
*mmcr,
>> +                              struct perf_event *pevents[])
>> {
>>        unsigned long mmcr1 =3D 0;
>>        unsigned long mmcra =3D MMCRA_SDAR_DCACHE_MISS | =
MMCRA_SDAR_ERAT_MISS;
>> @@ -298,20 +299,20 @@ static int power7_compute_mmcr(u64 event[], int =
n_ev,
>>        }
>>=20
>>        /* Return MMCRx values */
>> -       mmcr[0] =3D 0;
>> +       mmcr->mmcr0 =3D 0;
>>        if (pmc_inuse & 1)
>> -               mmcr[0] =3D MMCR0_PMC1CE;
>> +               mmcr->mmcr0 =3D MMCR0_PMC1CE;
>>        if (pmc_inuse & 0x3e)
>> -               mmcr[0] |=3D MMCR0_PMCjCE;
>> -       mmcr[1] =3D mmcr1;
>> -       mmcr[2] =3D mmcra;
>> +               mmcr->mmcr0 |=3D MMCR0_PMCjCE;
>> +       mmcr->mmcr1 =3D mmcr1;
>> +       mmcr->mmcra =3D mmcra;
>>        return 0;
>> }
>>=20
>> -static void power7_disable_pmc(unsigned int pmc, unsigned long =
mmcr[])
>> +static void power7_disable_pmc(unsigned int pmc, struct mmcr_regs =
*mmcr)
>> {
>>        if (pmc <=3D 3)
>> -               mmcr[1] &=3D ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
>> +               mmcr->mmcr1 &=3D ~(0xffUL << MMCR1_PMCSEL_SH(pmc));
>> }
>>=20
>> static int power7_generic_events[] =3D {
>> diff --git a/arch/powerpc/perf/ppc970-pmu.c =
b/arch/powerpc/perf/ppc970-pmu.c
>> index 4035d93..89a90ab 100644
>> --- a/arch/powerpc/perf/ppc970-pmu.c
>> +++ b/arch/powerpc/perf/ppc970-pmu.c
>> @@ -253,7 +253,8 @@ static int p970_get_alternatives(u64 event, =
unsigned int flags, u64 alt[])
>> }
>>=20
>> static int p970_compute_mmcr(u64 event[], int n_ev,
>> -                            unsigned int hwc[], unsigned long =
mmcr[], struct perf_event *pevents[])
>> +                            unsigned int hwc[], struct mmcr_regs =
*mmcr,
>> +                            struct perf_event *pevents[])
>> {
>>        unsigned long mmcr0 =3D 0, mmcr1 =3D 0, mmcra =3D 0;
>>        unsigned int pmc, unit, byte, psel;
>> @@ -393,27 +394,26 @@ static int p970_compute_mmcr(u64 event[], int =
n_ev,
>>        mmcra |=3D 0x2000;        /* mark only one IOP per PPC =
instruction */
>>=20
>>        /* Return MMCRx values */
>> -       mmcr[0] =3D mmcr0;
>> -       mmcr[1] =3D mmcr1;
>> -       mmcr[2] =3D mmcra;
>> +       mmcr->mmcr0 =3D mmcr0;
>> +       mmcr->mmcr1 =3D mmcr1;
>> +       mmcr->mmcra =3D mmcra;
>>        return 0;
>> }
>>=20
>> -static void p970_disable_pmc(unsigned int pmc, unsigned long mmcr[])
>> +static void p970_disable_pmc(unsigned int pmc, struct mmcr_regs =
*mmcr)
>> {
>> -       int shift, i;
>> +       int shift;
>>=20
>> +       /*
>> +        * Setting the PMCxSEL field to 0x08 disables PMC x.
>> +        */
>>        if (pmc <=3D 1) {
>>                shift =3D MMCR0_PMC1SEL_SH - 7 * pmc;
>> -               i =3D 0;
>> +               mmcr->mmcr0 =3D (mmcr->mmcr0 & ~(0x1fUL << shift)) | =
(0x08UL << shift);
>>        } else {
>>                shift =3D MMCR1_PMC3SEL_SH - 5 * (pmc - 2);
>> -               i =3D 1;
>> +               mmcr->mmcr1 =3D (mmcr->mmcr1 & ~(0x1fUL << shift)) | =
(0x08UL << shift);
>>        }
>> -       /*
>> -        * Setting the PMCxSEL field to 0x08 disables PMC x.
>> -        */
>> -       mmcr[i] =3D (mmcr[i] & ~(0x1fUL << shift)) | (0x08UL << =
shift);
>> }
>>=20
>> static int ppc970_generic_events[] =3D {
>> --
>> 1.8.3.1


--Apple-Mail=_E146C295-A446-4594-870E-19D7D52EA2D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 21-Jul-2020, at 9:12 AM, Jordan Niethe &lt;<a =
href=3D"mailto:jniethe5@gmail.com" class=3D"">jniethe5@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Sat, Jul 18, 2020 at 12:48 AM =
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
text-decoration: none;" class=3D""><br class=3D"">core-book3s currently =
uses array to store the MMCR registers as part<br class=3D"">of per-cpu =
`cpu_hw_events`. This patch does a clean up to use `struct`<br =
class=3D"">to store mmcr regs instead of array. This will make code =
easier to read<br class=3D"">and reduces chance of any subtle bug that =
may come in the future, say<br class=3D"">when new registers are added. =
Patch updates all relevant code that was<br class=3D"">using MMCR array =
( cpuhw-&gt;mmcr[x]) to use newly introduced `struct`.<br class=3D"">This =
includes the PMU driver code for supported platforms (power5<br =
class=3D"">to power9) and ISA macros for counter support functions.<br =
class=3D""><br class=3D"">Signed-off-by: Athira Rajeev &lt;<a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">arch/powerpc/include/asm/perf_event_server.h | 10 ++++--<br =
class=3D"">arch/powerpc/perf/core-book3s.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| 53 +++++++++++++---------------<br =
class=3D"">arch/powerpc/perf/isa207-common.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 20 =
+++++------<br class=3D"">arch/powerpc/perf/isa207-common.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;4 +--<br class=3D"">arch/powerpc/perf/mpc7450-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| 21 +++++++----<br class=3D"">arch/powerpc/perf/power5+-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| 17 ++++-----<br class=3D"">arch/powerpc/perf/power5-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 17 ++++-----<br class=3D"">arch/powerpc/perf/power6-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 16 ++++-----<br class=3D"">arch/powerpc/perf/power7-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 17 ++++-----<br class=3D"">arch/powerpc/perf/ppc970-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 24 ++++++-------<br class=3D"">10 files changed, 105 =
insertions(+), 94 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">index =
3e9703f..f9a3668 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">@@ -17,6 =
+17,12 @@<br class=3D""><br class=3D"">struct perf_event;<br =
class=3D""><br class=3D"">+struct mmcr_regs {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr1;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr2;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcra;<br =
class=3D"">+};<br class=3D"">/*<br class=3D"">&nbsp;* This struct =
provides the constants and functions needed to<br class=3D"">&nbsp;* =
describe the PMU on a particular POWER-family CPU.<br class=3D"">@@ =
-28,7 +34,7 @@ struct power_pmu {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
&nbsp;&nbsp;add_fields;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
&nbsp;&nbsp;test_adder;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(*=
compute_mmcr)(u64 events[], int n_ev,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], unsigned long =
mmcr[],<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], struct mmcr_regs =
*mmcr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event =
*pevents[]);<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(*=
get_constraint)(u64 event_id, unsigned long *mskp,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
*valp);<br class=3D"">@@ -41,7 +47,7 @@ struct power_pmu {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
&nbsp;&nbsp;group_constraint_val;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u64 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(*=
bhrb_filter_map)(u64 branch_sample_type);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;void =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(*config=
_bhrb)(u64 pmu_bhrb_filter);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;void =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(*disabl=
e_pmc)(unsigned int pmc, unsigned long mmcr[]);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;void =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(*disabl=
e_pmc)(unsigned int pmc, struct mmcr_regs *mmcr);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(*=
limited_pmc_event)(u64 event_id);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fl=
ags;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const =
struct attribute_group &nbsp;&nbsp;&nbsp;**attr_groups;<br class=3D"">diff=
 --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br class=3D"">index cd6a742..18b1b6a =
100644<br class=3D"">--- a/arch/powerpc/perf/core-book3s.c<br =
class=3D"">+++ b/arch/powerpc/perf/core-book3s.c<br class=3D"">@@ -37,12 =
+37,7 @@ struct cpu_hw_events {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event =
*event[MAX_HWEVENTS];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u64 =
events[MAX_HWEVENTS];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int =
flags[MAX_HWEVENTS];<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* The order of the MMCR array =
is:<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* &nbsp;- =
64-bit, MMCR0, MMCR1, MMCRA, MMCR2<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* &nbsp;- 32-bit, MMCR0, =
MMCR1, MMCR2<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr[4];<br class=3D"">+=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct mmcr_regs mmcr;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event =
*limited_counter[MAX_LIMITED_HWCOUNTERS];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 =
&nbsp;limited_hwidx[MAX_LIMITED_HWCOUNTERS];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u64 =
alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];<br class=3D"">@@ =
-121,7 +116,7 @@ static void ebb_event_add(struct perf_event *event) { =
}<br class=3D"">static void ebb_switch_out(unsigned long mmcr0) { }<br =
class=3D"">static unsigned long ebb_switch_in(bool ebb, struct =
cpu_hw_events *cpuhw)<br class=3D"">{<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return cpuhw-&gt;mmcr[0];<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
cpuhw-&gt;mmcr.mmcr0;<br class=3D"">}<br class=3D""><br class=3D"">static =
inline void power_pmu_bhrb_enable(struct perf_event *event) {}<br =
class=3D"">@@ -590,7 +585,7 @@ static void ebb_switch_out(unsigned long =
mmcr0)<br class=3D""><br class=3D"">static unsigned long =
ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)<br class=3D"">{<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr0 =3D =
cpuhw-&gt;mmcr[0];<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr0 =3D =
cpuhw-&gt;mmcr.mmcr0;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!ebb)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;goto out;<br class=3D"">@@ -624,7 +619,7 @@ =
static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events =
*cpuhw)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* =
unfreeze counters, it should not set exclude_xxx in its events and<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* instead =
manage the MMCR2 entirely by itself.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR2, =
cpuhw-&gt;mmcr[3] | current-&gt;thread.mmcr2);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR2, =
cpuhw-&gt;mmcr.mmcr2 | current-&gt;thread.mmcr2);<br class=3D"">out:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return mmcr0;<br =
class=3D"">}<br class=3D"">@@ -1232,9 +1227,9 @@ static void =
power_pmu_disable(struct pmu *pmu)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Disable instruction sampling if it =
was enabled<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (cpuhw-&gt;mmcr[2] &amp; MMCRA_SAMPLE_ENABLE) {<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (cpuhw-&gt;mmcr.mmcra &amp; MMCRA_SAMPLE_ENABLE) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;mtspr(SPRN_MMCRA,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr[2] &amp; ~MMCRA_SAMPLE_ENABLE);<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr.mmcra &amp; ~MMCRA_SAMPLE_ENABLE);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;mb();<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;isync();<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">@@ -1308,18 +1303,18 @@ =
static void power_pmu_enable(struct pmu *pmu)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* (possibly =
updated for removal of events).<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(!cpuhw-&gt;n_added) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCRA, cpuhw-&gt;mmcr[2] &amp; =
~MMCRA_SAMPLE_ENABLE);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCR1, cpuhw-&gt;mmcr[1]);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCRA, cpuhw-&gt;mmcr.mmcra &amp; =
~MMCRA_SAMPLE_ENABLE);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCR1, cpuhw-&gt;mmcr.mmcr1);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;goto out_enable;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Clear all =
MMCR settings and recompute them for the new set of events.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memset(cpuhw-&gt;mmcr, =
0, sizeof(cpuhw-&gt;mmcr));<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memset(&amp;cpuhw-&gt;mmcr, 0, =
sizeof(cpuhw-&gt;mmcr));<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(ppmu-&gt;compute_mmcr(cpuhw-&gt;events, cpuhw-&gt;n_events, =
hwc_index,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr, cpuhw-&gt;event)) {<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&amp;cpuhw-&gt;mmcr, cpuhw-&gt;event)) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;/* shouldn't ever get here */<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;printk(KERN_ERR "oops compute_mmcr =
failed\n");<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;goto out;<br class=3D"">@@ -1333,11 +1328,11 =
@@ static void power_pmu_enable(struct pmu *pmu)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;event =3D cpuhw-&gt;event[0];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;if (event-&gt;attr.exclude_user)<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr[0=
] |=3D MMCR0_FCP;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr.m=
mcr0 |=3D MMCR0_FCP;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;if (event-&gt;attr.exclude_kernel)<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr[0=
] |=3D freeze_events_kernel;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr.m=
mcr0 |=3D freeze_events_kernel;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;if (event-&gt;attr.exclude_hv)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr[0=
] |=3D MMCR0_FCHV;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr.m=
mcr0 |=3D MMCR0_FCHV;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br class=3D"">@@ =
-1346,12 +1341,12 @@ static void power_pmu_enable(struct pmu *pmu)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Then =
unfreeze the events.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ppc_set_pmu_inuse(1);=
<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCRA, =
cpuhw-&gt;mmcr[2] &amp; ~MMCRA_SAMPLE_ENABLE);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR1, =
cpuhw-&gt;mmcr[1]);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, (cpuhw-&gt;mmcr[0] =
&amp; ~(MMCR0_PMC1CE | MMCR0_PMCjCE))<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCRA, =
cpuhw-&gt;mmcr.mmcra &amp; ~MMCRA_SAMPLE_ENABLE);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR1, =
cpuhw-&gt;mmcr.mmcr1);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR0, =
(cpuhw-&gt;mmcr.mmcr0 &amp; ~(MMCR0_PMC1CE | MMCR0_PMCjCE))<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| MMCR0_FC);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ppmu-&gt;flags =
&amp; PPMU_ARCH_207S)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCR2, cpuhw-&gt;mmcr[3]);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCR2, cpuhw-&gt;mmcr.mmcr2);<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Read off =
any pre-existing events that need to move<br class=3D"">@@ -1402,7 =
+1397,7 @@ static void power_pmu_enable(struct pmu *pmu)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;perf_event_update_userpage(event);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;n_limited =
=3D n_lim;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr[0] |=3D MMCR0_PMXE | =
MMCR0_FCECE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;mmcr.mmcr0 |=3D MMCR0_PMXE =
| MMCR0_FCECE;<br class=3D""><br class=3D"">&nbsp;out_enable:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pmao_restore_workarou=
nd(ebb);<br class=3D"">@@ -1418,9 +1413,9 @@ static void =
power_pmu_enable(struct pmu *pmu)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Enable =
instruction sampling if necessary<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (cpuhw-&gt;mmcr[2] =
&amp; MMCRA_SAMPLE_ENABLE) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (cpuhw-&gt;mmcr.mmcra &amp; =
MMCRA_SAMPLE_ENABLE) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;mb();<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCRA, cpuhw-&gt;mmcr[2]);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mtspr(SPRN_MMCRA, cpuhw-&gt;mmcr.mmcra);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D"">&nbsp;out:<br class=3D"">@@ -1550,7 +1545,7 @@ static void =
power_pmu_del(struct perf_event *event, int ef_flags)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;flags[i-1] =3D =
cpuhw-&gt;flags[i];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;--cpuhw-&gt;n_events;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ppmu-&gt;disable=
_pmc(event-&gt;hw.idx - 1, cpuhw-&gt;mmcr);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ppmu-&gt;disable=
_pmc(event-&gt;hw.idx - 1, &amp;cpuhw-&gt;mmcr);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;if (event-&gt;hw.idx) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;write_pmc(event-&gt;hw.id=
x, 0);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;event-&gt;hw.idx =3D =
0;<br class=3D"">@@ -1571,7 +1566,7 @@ static void power_pmu_del(struct =
perf_event *event, int ef_flags)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpuhw-&gt;n_events =3D=3D 0) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;/* disable exceptions if no events are =
running */<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;cpuhw-&gt;mmcr[0] &amp;=3D ~(MMCR0_PMXE | MMCR0_FCECE);<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;cpuhw-&gt;mmcr.mmcr0 &amp;=3D ~(MMCR0_PMXE | MMCR0_FCECE);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(has_branch_stack(event))<br class=3D"">@@ -2240,7 +2235,7 @@ static =
void __perf_event_interrupt(struct pt_regs *regs)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* XXX might =
want to use MSR.PM to keep the events frozen until<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* we get back =
out of this interrupt.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;write_mmcr0(cpuhw, =
cpuhw-&gt;mmcr[0]);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;write_mmcr0(cpuhw, =
cpuhw-&gt;mmcr.mmcr0);<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (nmi)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;nmi_exit();<br class=3D"">@@ -2262,7 +2257,7 =
@@ static int power_pmu_prepare_cpu(unsigned int cpu)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ppmu) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;memset(cpuhw, 0, sizeof(*cpuhw));<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;cpuhw-&gt;mmcr[0] =3D MMCR0_FC;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;cpuhw-&gt;mmcr.mmcr0 =3D MMCR0_FC;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0;<br =
class=3D"">}<br class=3D"">diff --git =
a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c<br class=3D"">index 4c86da5..2fe63f2 =
100644<br class=3D"">--- a/arch/powerpc/perf/isa207-common.c<br =
class=3D"">+++ b/arch/powerpc/perf/isa207-common.c<br class=3D"">@@ =
-363,7 +363,7 @@ int isa207_get_constraint(u64 event, unsigned long =
*maskp, unsigned long *valp)<br class=3D"">}<br class=3D""><br =
class=3D"">int isa207_compute_mmcr(u64 event[], int n_ev,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], unsigned long mmcr[],<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], struct mmcr_regs *mmcr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event =
*pevents[])<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
mmcra, mmcr1, mmcr2, unit, combine, psel, cache, val;<br class=3D"">@@ =
-464,30 +464,30 @@ int isa207_compute_mmcr(u64 event[], int n_ev,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Return MMCRx =
values */<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[0] =3D =
0;<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr0 =3D =
0;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* pmc_inuse is =
1-based */<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(pmc_inuse &amp; 2)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] =3D MMCR0_PMC1CE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 =3D MMCR0_PMC1CE;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
0x7c)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] |=3D MMCR0_PMCjCE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 |=3D MMCR0_PMCjCE;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* If we're not =
using PMC 5 or 6, freeze them */<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!(pmc_inuse =
&amp; 0x60))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] |=3D MMCR0_FC56;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 |=3D MMCR0_FC56;<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[1] =3D mmcr1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[2] =3D mmcra;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[3] =3D mmcr2;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr1 =3D mmcr1;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcra =3D =
mmcra;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr2 =3D mmcr2;<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return=
 0;<br class=3D"">}<br class=3D""><br class=3D"">-void =
isa207_disable_pmc(unsigned int pmc, unsigned long mmcr[])<br =
class=3D"">+void isa207_disable_pmc(unsigned int pmc, struct mmcr_regs =
*mmcr)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt;=3D =
3)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[1] &amp;=3D ~(0xffUL &lt;&lt; MMCR1_PMCSEL_SHIFT(pmc + =
1));<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr1 &amp;=3D ~(0xffUL &lt;&lt; =
MMCR1_PMCSEL_SHIFT(pmc + 1));<br class=3D"">}<br class=3D""><br =
class=3D"">static int find_alternative(u64 event, const unsigned int =
ev_alt[][MAX_ALT], int size)<br class=3D"">diff --git =
a/arch/powerpc/perf/isa207-common.h =
b/arch/powerpc/perf/isa207-common.h<br class=3D"">index 63fd4f3..df968fd =
100644<br class=3D"">--- a/arch/powerpc/perf/isa207-common.h<br =
class=3D"">+++ b/arch/powerpc/perf/isa207-common.h<br class=3D"">@@ =
-217,9 +217,9 @@<br class=3D""><br class=3D"">int =
isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long =
*valp);<br class=3D"">int isa207_compute_mmcr(u64 event[], int n_ev,<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], unsigned long =
mmcr[],<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], struct mmcr_regs =
*mmcr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event =
*pevents[]);<br class=3D"">-void isa207_disable_pmc(unsigned int pmc, =
unsigned long mmcr[]);<br class=3D"">+void isa207_disable_pmc(unsigned =
int pmc, struct mmcr_regs *mmcr);<br class=3D"">int =
isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int =
flags,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;const unsigned int ev_alt[][MAX_ALT]);<br =
class=3D"">void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, =
u32 flags,<br class=3D"">diff --git a/arch/powerpc/perf/mpc7450-pmu.c =
b/arch/powerpc/perf/mpc7450-pmu.c<br class=3D"">index 4d5ef92..826de25 =
100644<br class=3D"">--- a/arch/powerpc/perf/mpc7450-pmu.c<br =
class=3D"">+++ b/arch/powerpc/perf/mpc7450-pmu.c<br class=3D"">@@ -257,7 =
+257,7 @@ static int mpc7450_get_alternatives(u64 event, unsigned int =
flags, u64 alt[])<br class=3D"">&nbsp;* Compute MMCR0/1/2 values for a =
set of events.<br class=3D"">&nbsp;*/<br class=3D"">static int =
mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int hwc[],<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr[],<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct mmcr_regs *mmcr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event =
*pevents[])<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 =
event_index[N_CLASSES][N_COUNTER];<br class=3D"">@@ -321,9 +321,16 @@ =
static int mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int =
hwc[],<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr0 |=3D MMCR0_PMCnCE;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Return MMCRx =
values */<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[0] =3D =
mmcr0;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[1] =3D =
mmcr1;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[2] =3D =
mmcr2;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr0 =3D mmcr0;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr1 =3D =
mmcr1;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr2 =3D mmcr2;<br =
class=3D""></blockquote><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Will this mmcr-&gt;mmcr2 be used anywere, or will it always =
use mmcr-&gt;mmcra?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Hi Jordan</div><div><br class=3D""></div><div>We will =
be actually using mmcr-&gt;mmcra in the core-book3s for =
mpc7450-pmu.c</div><div>I have still assigned mmcr-&gt;mmcr2 so that it =
will work for any future changes if made in corebook</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 32-bit doesn't have an MMCRA =
and uses SPRN_MMCR2 to define<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* SPRN_MMCRA. So assign mmcra =
of cpu_hw_events with `mmcr2`<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* value to ensure that any =
write to this SPRN_MMCRA will<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* use mmcr2 value.<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D""></blockquote><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Something like this comment would probably be useful to near =
the struct mmcr.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Sure, I will add this information</div><div>Thanks for =
your suggestion</div><div><br class=3D""></div><div>Athira<br =
class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcra =3D mmcr2;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0;<br =
class=3D"">}<br class=3D""><br class=3D"">@@ -331,12 +338,12 @@ static =
int mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int hwc[],<br =
class=3D"">&nbsp;* Disable counting by a PMC.<br class=3D"">&nbsp;* Note =
that the pmc argument is 0-based here, not 1-based.<br =
class=3D"">&nbsp;*/<br class=3D"">-static void =
mpc7450_disable_pmc(unsigned int pmc, unsigned long mmcr[])<br =
class=3D"">+static void mpc7450_disable_pmc(unsigned int pmc, struct =
mmcr_regs *mmcr)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt;=3D =
1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] &amp;=3D ~(pmcsel_mask[pmc] &lt;&lt; =
pmcsel_shift[pmc]);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 &amp;=3D ~(pmcsel_mask[pmc] &lt;&lt; =
pmcsel_shift[pmc]);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[1] &amp;=3D ~(pmcsel_mask[pmc] &lt;&lt; =
pmcsel_shift[pmc]);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr1 &amp;=3D ~(pmcsel_mask[pmc] &lt;&lt; =
pmcsel_shift[pmc]);<br class=3D"">}<br class=3D""><br class=3D"">static =
int mpc7450_generic_events[] =3D {<br class=3D"">diff --git =
a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c<br =
class=3D"">index f857454..5f0821e 100644<br class=3D"">--- =
a/arch/powerpc/perf/power5+-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power5+-pmu.c<br class=3D"">@@ -448,7 +448,8 @@ =
static int power5p_marked_instr_event(u64 event)<br class=3D"">}<br =
class=3D""><br class=3D"">static int power5p_compute_mmcr(u64 event[], =
int n_ev,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], unsigned long =
mmcr[], struct perf_event *pevents[])<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], struct mmcr_regs =
*mmcr,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event *pevents[])<br =
class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr1 =
=3D 0;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned =
long mmcra =3D 0;<br class=3D"">@@ -586,20 +587,20 @@ static int =
power5p_compute_mmcr(u64 event[], int n_ev,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Return MMCRx =
values */<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[0] =3D =
0;<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr0 =3D =
0;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse =
&amp; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] =3D MMCR0_PMC1CE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 =3D MMCR0_PMC1CE;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
0x3e)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] |=3D MMCR0_PMCjCE;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[1] =3D mmcr1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[2] =3D mmcra;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 |=3D MMCR0_PMCjCE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr1 =3D mmcr1;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcra =3D =
mmcra;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
0;<br class=3D"">}<br class=3D""><br class=3D"">-static void =
power5p_disable_pmc(unsigned int pmc, unsigned long mmcr[])<br =
class=3D"">+static void power5p_disable_pmc(unsigned int pmc, struct =
mmcr_regs *mmcr)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt;=3D =
3)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[1] &amp;=3D ~(0x7fUL &lt;&lt; MMCR1_PMCSEL_SH(pmc));<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr1 &amp;=3D ~(0x7fUL &lt;&lt; =
MMCR1_PMCSEL_SH(pmc));<br class=3D"">}<br class=3D""><br class=3D"">static=
 int power5p_generic_events[] =3D {<br class=3D"">diff --git =
a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c<br =
class=3D"">index da52eca..426021d 100644<br class=3D"">--- =
a/arch/powerpc/perf/power5-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power5-pmu.c<br class=3D"">@@ -379,7 +379,8 @@ =
static int power5_marked_instr_event(u64 event)<br class=3D"">}<br =
class=3D""><br class=3D"">static int power5_compute_mmcr(u64 event[], =
int n_ev,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], unsigned long mmcr[], =
struct perf_event *pevents[])<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], struct mmcr_regs *mmcr,<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event *pevents[])<br class=3D"">{<br=
 class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
mmcr1 =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcra =
=3D MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;<br class=3D"">@@ =
-528,20 +529,20 @@ static int power5_compute_mmcr(u64 event[], int =
n_ev,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* =
Return MMCRx values */<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[0] =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr0 =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] =3D MMCR0_PMC1CE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 =3D MMCR0_PMC1CE;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
0x3e)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] |=3D MMCR0_PMCjCE;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[1] =3D mmcr1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[2] =3D mmcra;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 |=3D MMCR0_PMCjCE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr1 =3D mmcr1;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcra =3D =
mmcra;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
0;<br class=3D"">}<br class=3D""><br class=3D"">-static void =
power5_disable_pmc(unsigned int pmc, unsigned long mmcr[])<br =
class=3D"">+static void power5_disable_pmc(unsigned int pmc, struct =
mmcr_regs *mmcr)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt;=3D =
3)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[1] &amp;=3D ~(0x7fUL &lt;&lt; MMCR1_PMCSEL_SH(pmc));<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr1 &amp;=3D ~(0x7fUL &lt;&lt; =
MMCR1_PMCSEL_SH(pmc));<br class=3D"">}<br class=3D""><br class=3D"">static=
 int power5_generic_events[] =3D {<br class=3D"">diff --git =
a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c<br =
class=3D"">index 3929cac..e343a51 100644<br class=3D"">--- =
a/arch/powerpc/perf/power6-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power6-pmu.c<br class=3D"">@@ -171,7 +171,7 @@ =
static int power6_marked_instr_event(u64 event)<br class=3D"">&nbsp;* =
Assign PMC numbers and compute MMCR1 value for a set of events<br =
class=3D"">&nbsp;*/<br class=3D"">static int p6_compute_mmcr(u64 =
event[], int n_ev,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;unsigned int hwc[], unsigned long mmcr[], struct perf_event =
*pevents[])<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;unsigned int hwc[], struct mmcr_regs *mmcr, struct perf_event =
*pevents[])<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr1 =
=3D 0;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned =
long mmcra =3D MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;<br =
class=3D"">@@ -243,13 +243,13 @@ static int p6_compute_mmcr(u64 event[], =
int n_ev,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt; 4)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;mmcr1 |=3D (unsigned long)psel &lt;&lt; MMCR1_PMCSEL_SH(pmc);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[0] =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr0 =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] =3D MMCR0_PMC1CE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 =3D MMCR0_PMC1CE;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
0xe)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] |=3D MMCR0_PMCjCE;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[1] =3D mmcr1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[2] =3D mmcra;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 |=3D MMCR0_PMCjCE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr1 =3D mmcr1;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcra =3D =
mmcra;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
0;<br class=3D"">}<br class=3D""><br class=3D"">@@ -457,11 +457,11 @@ =
static int p6_get_alternatives(u64 event, unsigned int flags, u64 =
alt[])<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
nalt;<br class=3D"">}<br class=3D""><br class=3D"">-static void =
p6_disable_pmc(unsigned int pmc, unsigned long mmcr[])<br =
class=3D"">+static void p6_disable_pmc(unsigned int pmc, struct =
mmcr_regs *mmcr)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Set PMCxSEL to 0 =
to disable PMCx */<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt;=3D =
3)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[1] &amp;=3D ~(0xffUL &lt;&lt; MMCR1_PMCSEL_SH(pmc));<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr1 &amp;=3D ~(0xffUL &lt;&lt; =
MMCR1_PMCSEL_SH(pmc));<br class=3D"">}<br class=3D""><br class=3D"">static=
 int power6_generic_events[] =3D {<br class=3D"">diff --git =
a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c<br =
class=3D"">index a137813..3152336 100644<br class=3D"">--- =
a/arch/powerpc/perf/power7-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power7-pmu.c<br class=3D"">@@ -242,7 +242,8 @@ =
static int power7_marked_instr_event(u64 event)<br class=3D"">}<br =
class=3D""><br class=3D"">static int power7_compute_mmcr(u64 event[], =
int n_ev,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], unsigned long mmcr[], =
struct perf_event *pevents[])<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int hwc[], struct mmcr_regs *mmcr,<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;struct perf_event *pevents[])<br class=3D"">{<br=
 class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long =
mmcr1 =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcra =
=3D MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;<br class=3D"">@@ =
-298,20 +299,20 @@ static int power7_compute_mmcr(u64 event[], int =
n_ev,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* =
Return MMCRx values */<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[0] =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr0 =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] =3D MMCR0_PMC1CE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 =3D MMCR0_PMC1CE;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc_inuse &amp; =
0x3e)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[0] |=3D MMCR0_PMCjCE;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[1] =3D mmcr1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[2] =3D mmcra;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 |=3D MMCR0_PMCjCE;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr1 =3D mmcr1;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcra =3D =
mmcra;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
0;<br class=3D"">}<br class=3D""><br class=3D"">-static void =
power7_disable_pmc(unsigned int pmc, unsigned long mmcr[])<br =
class=3D"">+static void power7_disable_pmc(unsigned int pmc, struct =
mmcr_regs *mmcr)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt;=3D =
3)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr[1] &amp;=3D ~(0xffUL &lt;&lt; MMCR1_PMCSEL_SH(pmc));<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr1 &amp;=3D ~(0xffUL &lt;&lt; =
MMCR1_PMCSEL_SH(pmc));<br class=3D"">}<br class=3D""><br class=3D"">static=
 int power7_generic_events[] =3D {<br class=3D"">diff --git =
a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c<br =
class=3D"">index 4035d93..89a90ab 100644<br class=3D"">--- =
a/arch/powerpc/perf/ppc970-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/ppc970-pmu.c<br class=3D"">@@ -253,7 +253,8 @@ =
static int p970_get_alternatives(u64 event, unsigned int flags, u64 =
alt[])<br class=3D"">}<br class=3D""><br class=3D"">static int =
p970_compute_mmcr(u64 event[], int n_ev,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;unsigned int hwc[], unsigned long mmcr[], struct =
perf_event *pevents[])<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;unsigned int hwc[], struct mmcr_regs *mmcr,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;struct perf_event *pevents[])<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long mmcr0 =
=3D 0, mmcr1 =3D 0, mmcra =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int pmc, =
unit, byte, psel;<br class=3D"">@@ -393,27 +394,26 @@ static int =
p970_compute_mmcr(u64 event[], int n_ev,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcra |=3D 0x2000; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* mark only one IOP per PPC =
instruction */<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Return MMCRx =
values */<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[0] =3D =
mmcr0;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[1] =3D =
mmcr1;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[2] =3D =
mmcra;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr0 =3D mmcr0;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcr1 =3D =
mmcr1;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr-&gt;mmcra =3D mmcra;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0;<br =
class=3D"">}<br class=3D""><br class=3D"">-static void =
p970_disable_pmc(unsigned int pmc, unsigned long mmcr[])<br =
class=3D"">+static void p970_disable_pmc(unsigned int pmc, struct =
mmcr_regs *mmcr)<br class=3D"">{<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int shift, i;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int shift;<br class=3D""><br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Setting the PMCxSEL field to =
0x08 disables PMC x.<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (pmc &lt;=3D 1) =
{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;shift =3D MMCR0_PMC1SEL_SH - 7 * pmc;<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;i =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr0 =3D (mmcr-&gt;mmcr0 &amp; ~(0x1fUL &lt;&lt; =
shift)) | (0x08UL &lt;&lt; shift);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} else {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;shift =3D MMCR1_PMC3SEL_SH - 5 * (pmc - =
2);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;i =3D 1;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mmcr-&gt;mmcr1 =3D (mmcr-&gt;mmcr1 &amp; ~(0x1fUL &lt;&lt; =
shift)) | (0x08UL &lt;&lt; shift);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Setting the PMCxSEL field to =
0x08 disables PMC x.<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcr[i] =3D (mmcr[i] &amp; ~(0x1fUL =
&lt;&lt; shift)) | (0x08UL &lt;&lt; shift);<br class=3D"">}<br =
class=3D""><br class=3D"">static int ppc970_generic_events[] =3D {<br =
class=3D"">--<br =
class=3D"">1.8.3.1</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_E146C295-A446-4594-870E-19D7D52EA2D8--

