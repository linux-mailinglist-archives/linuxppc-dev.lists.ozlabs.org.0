Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 758546176D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 07:48:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2vTn2r5rz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 17:48:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JS6kjuou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JS6kjuou;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2vSm5nxfz3bms
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 17:47:20 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A358n43029699;
	Thu, 3 Nov 2022 06:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=5VHrsseso3ocP7cUocUjp/T4QjxkRhtG5hUhl3bV5LI=;
 b=JS6kjuouGD4/QzIasEbhjgNOCeCs6F34IbC30YeLOWPDMO67F5a+8Ec0AQVcrN6L8v1C
 DFq2Xw0eOs+p7XMkSQWQJtKD4TK+Pir5kioafdruCGpwAI7ZlkJV6wTYuppwsKkEKPxu
 VzCDiBgl43fTGUV7/4BfT+RipSIh3BTPV/E+hqnH3KuYYXs3PcwC8ojVfyFbPyhWFb57
 MhJOqmOPN952DdHxZQNXT3LV623GOr8PHHRLo8CHkCoeM/xuwUW4lJKuejfhNHok65fg
 6mqHW8PqStrwhpszZavbOlDS9zg2czUlAUiQ7aAII/W4y4nxgYIeJ9/6PNIugd1ITet+ 2w== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3km6h9kcv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 06:47:11 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A36a3nr024721;
	Thu, 3 Nov 2022 06:47:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3kgut9e49h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 06:47:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A36l6eN59113960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Nov 2022 06:47:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8EB542041;
	Thu,  3 Nov 2022 06:47:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FA7842042;
	Thu,  3 Nov 2022 06:47:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.108.240])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu,  3 Nov 2022 06:47:05 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2] powerpc/hv-gpci: Fix hv_gpci event list
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20221028154806.141272-1-kjain@linux.ibm.com>
Date: Thu, 3 Nov 2022 12:17:03 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8E5754E-9580-4B84-8EA2-4B3947D4FC3D@linux.vnet.ibm.com>
References: <20221028154806.141272-1-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UdlYt8J5I_WkNYcZrTYYFCN4ApDS6Qtk
X-Proofpoint-GUID: UdlYt8J5I_WkNYcZrTYYFCN4ApDS6Qtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211030046
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Disha Goel <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28-Oct-2022, at 9:18 PM, Kajol Jain <kjain@linux.ibm.com> wrote:
>=20
> Based on getPerfCountInfo v1.018 documentation, some of the
> hv_gpci events got deprecated for platforms firmware that
> supports counter_info_version 0x8 or above.
>=20
> Patch fixes the hv_gpci event list by adding a new attribute
> group called "hv_gpci_event_attrs_v6" and a "EVENT_ENABLE"
> macro to enable these events for platform firmware
> that supports counter_info_version 0x6 or below. And assigning
> the hv_gpci event list based on output counter info version
> of underlying plaform.
>=20
> Fixes: 97bf2640184f ("powerpc/perf/hv-gpci: add the remaining gpci =
requests")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> ---
> Changelog:
>=20
> v1 -> v2
> - As suggested by Michael Ellerman, using counter_info_version value
>  rather then cpu_has_feature() to assign hv-gpci event list.
>=20
> arch/powerpc/perf/hv-gpci-requests.h |  4 ++++
> arch/powerpc/perf/hv-gpci.c          | 35 ++++++++++++++++++++++++++--
> arch/powerpc/perf/hv-gpci.h          |  1 +
> arch/powerpc/perf/req-gen/perf.h     | 17 ++++++++++++++
> 4 files changed, 55 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/hv-gpci-requests.h =
b/arch/powerpc/perf/hv-gpci-requests.h
> index 8965b4463d43..baef3d082de9 100644
> --- a/arch/powerpc/perf/hv-gpci-requests.h
> +++ b/arch/powerpc/perf/hv-gpci-requests.h
> @@ -79,6 +79,7 @@ REQUEST(__field(0,	8,	partition_id)
> )
> #include I(REQUEST_END)
>=20
> +#ifdef EVENT_ENABLE
> /*
>  * Not available for counter_info_version >=3D 0x8, use
>  * run_instruction_cycles_by_partition(0x100) instead.
> @@ -92,6 +93,7 @@ REQUEST(__field(0,	8,	partition_id)
> 	__count(0x10,	8,	cycles)
> )
> #include I(REQUEST_END)
> +#endif
>=20
> #define REQUEST_NAME system_performance_capabilities
> #define REQUEST_NUM 0x40
> @@ -103,6 +105,7 @@ REQUEST(__field(0,	1,	=
perf_collect_privileged)
> )
> #include I(REQUEST_END)
>=20
> +#ifdef EVENT_ENABLE
> #define REQUEST_NAME processor_bus_utilization_abc_links
> #define REQUEST_NUM 0x50
> #define REQUEST_IDX_KIND "hw_chip_id=3D?"
> @@ -194,6 +197,7 @@ REQUEST(__field(0,	4,	=
phys_processor_idx)
> 	__count(0x28,	8,	instructions_completed)
> )
> #include I(REQUEST_END)
> +#endif
>=20
> /* Processor_core_power_mode (0x95) skipped, no counters */
> /* Affinity_domain_information_by_virtual_processor (0xA0) skipped,
> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
> index 5eb60ed5b5e8..6eeabf3975e5 100644
> --- a/arch/powerpc/perf/hv-gpci.c
> +++ b/arch/powerpc/perf/hv-gpci.c
> @@ -70,9 +70,9 @@ static const struct attribute_group format_group =3D =
{
> 	.attrs =3D format_attrs,
> };
>=20
> -static const struct attribute_group event_group =3D {
> +static struct attribute_group event_group =3D {
> 	.name  =3D "events",
> -	.attrs =3D hv_gpci_event_attrs,
> +	/* .attrs is set in init */
> };
>=20
> #define HV_CAPS_ATTR(_name, _format)				\
> @@ -330,6 +330,7 @@ static int hv_gpci_init(void)
> 	int r;
> 	unsigned long hret;
> 	struct hv_perf_caps caps;
> +	struct hv_gpci_request_buffer *arg;
>=20
> 	hv_gpci_assert_offsets_correct();
>=20
> @@ -353,6 +354,36 @@ static int hv_gpci_init(void)
> 	/* sampling not supported */
> 	h_gpci_pmu.capabilities |=3D PERF_PMU_CAP_NO_INTERRUPT;
>=20
> +	arg =3D (void *)get_cpu_var(hv_gpci_reqb);
> +	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
> +
> +	/*
> +	 * hcall H_GET_PERF_COUNTER_INFO populates the output
> +	 * counter_info_version value based on the system hypervisor.
> +	 * Pass the counter request 0x10 corresponds to request type
> +	 * 'Dispatch_timebase_by_processor', to get the supported
> +	 * counter_info_version.
> +	 */
> +	arg->params.counter_request =3D cpu_to_be32(0x10);
> +
> +	r =3D plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
> +			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
> +	if (r) {
> +		pr_devel("hcall failed, can't get supported =
counter_info_version: 0x%x\n", r);
> +		arg->params.counter_info_version_out =3D 0x8;
> +	}
> +
> +	/*
> +	 * Use counter_info_version_out value to assign
> +	 * required hv-gpci event list.
> +	 */
> +	if (arg->params.counter_info_version_out >=3D 0x8)
> +		event_group.attrs =3D hv_gpci_event_attrs;
> +	else
> +		event_group.attrs =3D hv_gpci_event_attrs_v6;
> +
> +	put_cpu_var(hv_gpci_reqb);
> +
> 	r =3D perf_pmu_register(&h_gpci_pmu, h_gpci_pmu.name, -1);
> 	if (r)
> 		return r;
> diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
> index 4d108262bed7..10aba0ccb434 100644
> --- a/arch/powerpc/perf/hv-gpci.h
> +++ b/arch/powerpc/perf/hv-gpci.h
> @@ -26,6 +26,7 @@ enum {
> #define REQUEST_FILE "../hv-gpci-requests.h"
> #define NAME_LOWER hv_gpci
> #define NAME_UPPER HV_GPCI
> +#define EVENT_ENABLE
> #include "req-gen/perf.h"
> #undef REQUEST_FILE
> #undef NAME_LOWER
> diff --git a/arch/powerpc/perf/req-gen/perf.h =
b/arch/powerpc/perf/req-gen/perf.h
> index fa9bc804e67a..e0b355931271 100644
> --- a/arch/powerpc/perf/req-gen/perf.h
> +++ b/arch/powerpc/perf/req-gen/perf.h
> @@ -139,6 +139,23 @@ PMU_EVENT_ATTR_STRING(					=
		\
> #define REQUEST_(r_name, r_value, r_idx_1, r_fields)			=
\
> 	r_fields
>=20
> +/* Generate event list for platforms with counter_info_version 0x6 or =
below */
> +static __maybe_unused struct attribute *hv_gpci_event_attrs_v6[] =3D =
{
> +#include REQUEST_FILE
> +	NULL
> +};
> +
> +/*
> + * Based on getPerfCountInfo v1.018 documentation, some of the =
hv-gpci
> + * events got deprecated for platforms firmware that supports
> + * counter_info_version 0x8 or above.
> + * Undefining macro EVENT_ENABLE, to disable the addition of =
deprecated
> + * events in "hv_gpci_event_attrs" attribute group, for platforms =
that
> + * supports counter_info_version 0x8 or above.
> + */
> +#undef EVENT_ENABLE
> +
> +/* Generate event list for platforms with counter_info_version 0x8 or =
above*/
> static __maybe_unused struct attribute *hv_gpci_event_attrs[] =3D {
> #include REQUEST_FILE
> 	NULL
> --=20
> 2.31.1
>=20

