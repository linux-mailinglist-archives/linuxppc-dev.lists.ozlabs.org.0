Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 134CE17925D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 15:31:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xbt81VdmzDqdX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 01:31:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Xbln2d0vzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 01:26:12 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024EKBFi017412
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2020 09:26:10 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhrydp04c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 09:26:10 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 4 Mar 2020 14:26:07 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Mar 2020 14:26:00 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024EPwZ512648592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 14:25:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93DBCAE04D;
 Wed,  4 Mar 2020 14:25:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A97CAE045;
 Wed,  4 Mar 2020 14:25:57 +0000 (GMT)
Received: from pic2.home (unknown [9.145.145.27])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 14:25:57 +0000 (GMT)
Subject: Re: [PATCH v3 22/27] powerpc/powernv/pmem: Implement the heartbeat
 command
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-23-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 4 Mar 2020 15:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-23-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030414-0016-0000-0000-000002ED23C9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030414-0017-0000-0000-00003350725A
Message-Id: <c660294c-58aa-24cc-efd1-291ffe4836c1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_05:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040109
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/02/2020 à 04:27, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> The heartbeat admin command is a simple admin command that exercises
> the communication mechanisms within the controller.
> 
> This patch issues a heartbeat command to the card during init to ensure
> we can communicate with the card's controller.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---


Nothing to add compared to what has already been commented on previous 
patches (rc not set in probe(), higher level function to execute admin 
command in one call).

   Fred



>   arch/powerpc/platforms/powernv/pmem/ocxl.c | 43 ++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> index 081883a8247a..e01f6f9fc180 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> @@ -306,6 +306,44 @@ static bool is_usable(const struct ocxlpmem *ocxlpmem, bool verbose)
>   	return true;
>   }
>   
> +/**
> + * heartbeat() - Issue a heartbeat command to the controller
> + * @ocxlpmem: the device metadata
> + * Return: 0 if the controller responded correctly, negative on error
> + */
> +static int heartbeat(struct ocxlpmem *ocxlpmem)
> +{
> +	int rc;
> +
> +	mutex_lock(&ocxlpmem->admin_command.lock);
> +
> +	rc = admin_command_request(ocxlpmem, ADMIN_COMMAND_HEARTBEAT);
> +	if (rc)
> +		goto out;
> +
> +	rc = admin_command_execute(ocxlpmem);
> +	if (rc)
> +		goto out;
> +
> +	rc = admin_command_complete_timeout(ocxlpmem, ADMIN_COMMAND_HEARTBEAT);
> +	if (rc < 0) {
> +		dev_err(&ocxlpmem->dev, "Heartbeat timeout\n");
> +		goto out;
> +	}
> +
> +	rc = admin_response(ocxlpmem);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS)
> +		warn_status(ocxlpmem, "Unexpected status from heartbeat", rc);
> +
> +	(void)admin_response_handled(ocxlpmem);
> +
> +out:
> +	mutex_unlock(&ocxlpmem->admin_command.lock);
> +	return rc;
> +}
> +
>   /**
>    * allocate_minor() - Allocate a minor number to use for an OpenCAPI pmem device
>    * @ocxlpmem: the device metadata
> @@ -1458,6 +1496,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		goto err;
>   	}
>   
> +	if (heartbeat(ocxlpmem)) {
> +		dev_err(&pdev->dev, "Heartbeat failed\n");
> +		goto err;
> +	}
> +
>   	elapsed = 0;
>   	timeout = ocxlpmem->readiness_timeout + ocxlpmem->memory_available_timeout;
>   	while (!is_usable(ocxlpmem, false)) {
> 

