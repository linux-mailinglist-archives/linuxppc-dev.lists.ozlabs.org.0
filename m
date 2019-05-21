Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D12475F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 07:12:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457P6421YfzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:12:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maddy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457P4n67XrzDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 15:11:36 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L56ebl098054
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 01:11:33 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sm6pwywxt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 01:11:33 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Tue, 21 May 2019 06:11:31 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 May 2019 06:11:30 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4L5BTsS48431218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 05:11:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 798E5A405C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 05:11:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 258B8A405B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 05:11:29 +0000 (GMT)
Received: from [9.126.30.226] (unknown [9.126.30.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 05:11:28 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv: Return for invalid IMC domain
To: linuxppc-dev@lists.ozlabs.org
References: <20190520085753.19670-1-anju@linux.vnet.ibm.com>
From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Date: Tue, 21 May 2019 10:41:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520085753.19670-1-anju@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052105-0020-0000-0000-0000033ECF3F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052105-0021-0000-0000-00002191AAAF
Message-Id: <5cb603d0-e07e-af3b-185c-77b17db2ab49@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210033
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 20/05/19 2:27 PM, Anju T Sudhakar wrote:
> Currently init_imc_pmu() can be failed either because
> an IMC unit with invalid domain(i.e an IMC node not
> supported by the kernel) is attempted a pmu-registration
> or something went wrong while registering a valid IMC unit.
> In both the cases kernel provides a 'Registration failed'
> error message.
>
> Example:
> Log message, when trace-imc node is not supported by the kernel, and the
> skiboot supports trace-imc node.
>
> So for kernel, trace-imc node is now an unknown domain.
>
> [    1.731870] nest_phb5_imc performance monitor hardware support registered
> [    1.731944] nest_powerbus0_imc performance monitor hardware support registered
> [    1.734458] thread_imc performance monitor hardware support registered
> [    1.734460] IMC Unknown Device type
> [    1.734462] IMC PMU (null) Register failed
> [    1.734558] nest_xlink0_imc performance monitor hardware support registered
> [    1.734614] nest_xlink1_imc performance monitor hardware support registered
> [    1.734670] nest_xlink2_imc performance monitor hardware support registered
> [    1.747043] Initialise system trusted keyrings
> [    1.747054] Key type blacklist registered
>
>
> To avoid ambiguity on the error message, return for invalid domain
> before attempting a pmu registration.

Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>


> Fixes: 8f95faaac56c1 (`powerpc/powernv: Detect and create IMC device`)
> Reported-by: Pavaman Subramaniyam <pavsubra@in.ibm.com>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> ---
>   arch/powerpc/platforms/powernv/opal-imc.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
> index 58a0794..4e8b0e1 100644

> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -161,6 +161,10 @@ static int imc_pmu_create(struct device_node *parent, int pmu_index, int domain)
>   	struct imc_pmu *pmu_ptr;
>   	u32 offset;
>
> +	/* Return for unknown domain */
> +	if (domain < 0)
> +		return -EINVAL;
> +
>   	/* memory for pmu */
>   	pmu_ptr = kzalloc(sizeof(*pmu_ptr), GFP_KERNEL);
>   	if (!pmu_ptr)

