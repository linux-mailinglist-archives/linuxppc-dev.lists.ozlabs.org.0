Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE385BAD42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:20:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTY7F68Jfz3chk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 22:20:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JpX5aBaT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JpX5aBaT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTX3w5vdcz3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 21:32:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GB1MDY008949;
	Fri, 16 Sep 2022 11:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=y9WLAXCjybBKnhqbfhkHPy2Y8MDOL3kJsRpX3OVr994=;
 b=JpX5aBaTM/p8x1QMX56Gra9zEELPpwtu7i6dshXLVIaV7q/tTI1ESIP44UrJjz83pt+3
 phLYHNwAfev4gxuGqEm+zCdDoxdNKCM+TYkcvSX130+osdifuFDKsnGVA0VnMSMvurGz
 ZrNIp+SsyruDTcD2nrLL8fSIhuH6iIYgN6FkZ27PEQR33z8mOnTjn/4eerdEP2xNZNCB
 DrKlf1CIHknGeTeX/uSanV9H8LZwx00UdofjeNaQNrNuVuoO5mbczKAlAeFDBJ4WAj1t
 JVKBo1rKcoFMvxAkEa4eUoYlyfXWIODM6uotz754KmAelRfEMQbUmMzkRm02KyRyRsqP ug== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqwbgxtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 11:32:20 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GBL5vm019449;
	Fri, 16 Sep 2022 11:32:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3jm9198ny9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 11:32:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GBWFEM30540086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 11:32:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59C9FA405B;
	Fri, 16 Sep 2022 11:32:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D2C2A4060;
	Fri, 16 Sep 2022 11:32:09 +0000 (GMT)
Received: from [9.43.57.26] (unknown [9.43.57.26])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 11:32:08 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------f5OfR2TQUJJoexMgKaVVH4pm"
Message-ID: <ea4db5b9-ac85-ada0-5940-23255b4106da@linux.ibm.com>
Date: Fri, 16 Sep 2022 17:02:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] powerpc/perf: Fix branch_filter support for multiple
 filters in powerpc
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, mpe@ellerman.id.au
References: <20220913115546.36179-1-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20220913115546.36179-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -6BUX2Eis5Ix1zU_mDio7oWmAuGGutlJ
X-Proofpoint-GUID: -6BUX2Eis5Ix1zU_mDio7oWmAuGGutlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_06,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160082
X-Mailman-Approved-At: Fri, 16 Sep 2022 22:18:31 +1000
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------f5OfR2TQUJJoexMgKaVVH4pm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/13/22 5:25 PM, Athira Rajeev wrote:
> For PERF_SAMPLE_BRANCH_STACK sample type, different branch_sample_type
> ie branch filters are supported. The branch filters are requested via
> event attribute "branch_sample_type". Multiple branch filters can be
> passed in event attribute.
>
> Example:
> perf record -b -o- -B --branch-filter any,ind_call true
>
> Powerpc does not support having multiple branch filters at
> sametime. In powerpc, branch filters for branch stack sampling
> is set via MMCRA IFM bits [32:33]. But currently when requesting
> for multiple filter types, the "perf record" command does not
> report any error.
>
> Example:
> perf record -b -o- -B --branch-filter any,save_type true
> perf record -b -o- -B --branch-filter any,ind_call true
>
> The "bhrb_filter_map" function in PMU driver code does the
> validity check for supported branch filters. But this check
> is done for single filter. Hence "perf record" will proceed
> here without reporting any error.
>
> Fix power_pmu_event_init to return EOPNOTSUPP when multiple
> branch filters are requested in the event attr.
>
> After the fix:
> perf record --branch-filter any,ind_call -- ls
> Error:
> cycles: PMU Hardware doesn't support sampling/overflow-interrupts.
> Try 'perf stat'
>
> Reported-by: Disha Goel<disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan<maddy@linux.ibm.com>

Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>

> ---
>   arch/powerpc/perf/core-book3s.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 13919eb96931..2c2d235cb8d8 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2131,6 +2131,21 @@ static int power_pmu_event_init(struct perf_event *event)
>   	if (has_branch_stack(event)) {
>   		u64 bhrb_filter = -1;
>
> +		/*
> +		 * powerpc does not support having multiple branch filters
> +		 * at sametime. Branch filters are set via MMCRA IFM[32:33]
> +		 * bits for power8 and above. Return EOPNOTSUPP when multiple
> +		 * branch filters are requested in the event attr.
> +		 *
> +		 * When opening event via perf_event_open, branch_sample_type
> +		 * gets adjusted in perf_copy_attr function. Kernel will
> +		 * automatically adjust the branch_sample_type based on the
> +		 * event modifier settings to include PERF_SAMPLE_BRANCH_PLM_ALL.
> +		 * Hence drop the check for PERF_SAMPLE_BRANCH_PLM_ALL.
> +		 */
> +		if (hweight64(event->attr.branch_sample_type & ~PERF_SAMPLE_BRANCH_PLM_ALL) > 1)
> +			return -EOPNOTSUPP;
> +
>   		if (ppmu->bhrb_filter_map)
>   			bhrb_filter = ppmu->bhrb_filter_map(
>   					event->attr.branch_sample_type);
--------------f5OfR2TQUJJoexMgKaVVH4pm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/13/22 5:25 PM, Athira Rajeev
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220913115546.36179-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">For PERF_SAMPLE_BRANCH_STACK sample type, different branch_sample_type
ie branch filters are supported. The branch filters are requested via
event attribute "branch_sample_type". Multiple branch filters can be
passed in event attribute.

Example:
perf record -b -o- -B --branch-filter any,ind_call true

Powerpc does not support having multiple branch filters at
sametime. In powerpc, branch filters for branch stack sampling
is set via MMCRA IFM bits [32:33]. But currently when requesting
for multiple filter types, the "perf record" command does not
report any error.

Example:
perf record -b -o- -B --branch-filter any,save_type true
perf record -b -o- -B --branch-filter any,ind_call true

The "bhrb_filter_map" function in PMU driver code does the
validity check for supported branch filters. But this check
is done for single filter. Hence "perf record" will proceed
here without reporting any error.

Fix power_pmu_event_init to return EOPNOTSUPP when multiple
branch filters are requested in the event attr.

After the fix:
perf record --branch-filter any,ind_call -- ls
Error:
cycles: PMU Hardware doesn't support sampling/overflow-interrupts.
Try 'perf stat'

Reported-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a>
Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a>
Reviewed-by: Madhavan Srinivasan <a class="moz-txt-link-rfc2396E" href="mailto:maddy@linux.ibm.com">&lt;maddy@linux.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20220913115546.36179-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
 arch/powerpc/perf/core-book3s.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 13919eb96931..2c2d235cb8d8 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2131,6 +2131,21 @@ static int power_pmu_event_init(struct perf_event *event)
 	if (has_branch_stack(event)) {
 		u64 bhrb_filter = -1;

+		/*
+		 * powerpc does not support having multiple branch filters
+		 * at sametime. Branch filters are set via MMCRA IFM[32:33]
+		 * bits for power8 and above. Return EOPNOTSUPP when multiple
+		 * branch filters are requested in the event attr.
+		 *
+		 * When opening event via perf_event_open, branch_sample_type
+		 * gets adjusted in perf_copy_attr function. Kernel will
+		 * automatically adjust the branch_sample_type based on the
+		 * event modifier settings to include PERF_SAMPLE_BRANCH_PLM_ALL.
+		 * Hence drop the check for PERF_SAMPLE_BRANCH_PLM_ALL.
+		 */
+		if (hweight64(event-&gt;attr.branch_sample_type &amp; ~PERF_SAMPLE_BRANCH_PLM_ALL) &gt; 1)
+			return -EOPNOTSUPP;
+
 		if (ppmu-&gt;bhrb_filter_map)
 			bhrb_filter = ppmu-&gt;bhrb_filter_map(
 					event-&gt;attr.branch_sample_type);
</pre>
    </blockquote>
  </body>
</html>

--------------f5OfR2TQUJJoexMgKaVVH4pm--

