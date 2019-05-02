Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E2512454
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 23:51:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w89C6HrbzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 07:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w87n0SBLzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 07:50:12 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42Llw70125804
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 May 2019 17:50:10 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s873num04-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 17:50:10 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <brking@linux.vnet.ibm.com>;
 Thu, 2 May 2019 22:50:09 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 May 2019 22:50:05 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x42Lo4jE8192068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 May 2019 21:50:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9BB3124054;
 Thu,  2 May 2019 21:50:04 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 526E3124055;
 Thu,  2 May 2019 21:50:04 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.10.86.114])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 May 2019 21:50:04 +0000 (GMT)
Subject: Re: [PATCH 1/3] ibmvscsi: Wire up host_reset() in the drivers
 scsi_host_template
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20190502004729.19962-1-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Date: Thu, 2 May 2019 16:50:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502004729.19962-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19050221-0040-0000-0000-000004EA492A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011037; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197680; UDB=6.00628196; IPR=6.00978537; 
 MB=3.00026705; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-02 21:50:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050221-0041-0000-0000-000008F64E41
Message-Id: <29e15e27-8cc6-d45e-a9e1-80603278dda2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905020136
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/1/19 7:47 PM, Tyrel Datwyler wrote:
> From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
> 
> Wire up the host_reset function in our driver_template to allow a user
> requested adpater reset via the host_reset sysfs attribute.
> 
> Example:
> 
> echo "adapter" > /sys/class/scsi_host/host0/host_reset
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvscsi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index 8cec5230fe31..1c37244f16a0 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -2050,6 +2050,18 @@ static struct device_attribute ibmvscsi_host_config = {
>  	.show = show_host_config,
>  };
>  
> +static int ibmvscsi_host_reset(struct Scsi_Host *shost, int reset_type)
> +{
> +	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
> +
> +	vio_disable_interrupts(to_vio_dev(hostdata->dev));
> +	dev_info(hostdata->dev, "Initiating adapter reset!\n");
> +	ibmvscsi_reset_host(hostdata);
> +	vio_enable_interrupts(to_vio_dev(hostdata->dev));

Is it necessary to disable / enable interrupts around the call to ibmvscsi_reset_host?
I don't know why we'd need to do that before calling the reset as we have other
cases, like ibmvscsi_timeout where we don't bother doing this. Also, at the end
of the reset we look to be already enabling interrupts.

Thanks,

Brian

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

