Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594D486C01
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 22:38:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVKVL0wFKz30NT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 08:38:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vrul6Ycx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vrul6Ycx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVKTX5LzRz2xBf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 08:38:08 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206KnD6G002692; 
 Thu, 6 Jan 2022 21:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DVTcEGvVPaPwh/cgYis91HUiyWmHrs7FOPdawLqiPJw=;
 b=Vrul6YcxD2azU7BnLQSEfit/f4RkXiUnMb4XlgkbnDySMjCn8TEZIgwnkFCej3XEBMft
 wn6s193jY3x9Jnb0eOKo3OZruU4j/BildmeVwHG1iCIFbgRGTXJ1UtozZEYp2hYgbaxO
 kyMMiPReFw94ADOUlsltDzwqoRXe+wW1OPlc3ujCC5g+Ty224mgGDEkh6SoF3hBwFsRV
 aG+5U++hgoh6LJ4BrCe85dSryp6tNdH47RxK7qA/hbBq1U9V4rmBanyZJwB7Fw48sVTh
 WQ+nX7Coq6sUA/vLU6tDbvvWqmUmZUPTVAJnxpRiNEf2aJfMPZObEAARBI3D/FV5p5Rb Yg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de59suk09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 21:38:05 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206LbMHh015635;
 Thu, 6 Jan 2022 21:38:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3de4xf53jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 21:38:04 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206Lc3rt10158744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 21:38:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A84052805E;
 Thu,  6 Jan 2022 21:38:03 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 200BF2805A;
 Thu,  6 Jan 2022 21:38:03 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.94.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 21:38:02 +0000 (GMT)
Subject: Re: [PATCH v5] powerpc/pseries: read the lpar name from the firmware
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220106161339.74656-1-ldufour@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <c26f2961-dd19-b888-b601-af5ade74c140@linux.ibm.com>
Date: Thu, 6 Jan 2022 13:38:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220106161339.74656-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NTw7RqtOZHEoeoQYlW1KHZDh51Y5vabQ
X-Proofpoint-ORIG-GUID: NTw7RqtOZHEoeoQYlW1KHZDh51Y5vabQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_09,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201060135
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/6/22 8:13 AM, Laurent Dufour wrote:
> The LPAR name may be changed after the LPAR has been started in the HMC.
> In that case lparstat command is not reporting the updated value because it
> reads it from the device tree which is read at boot time.
> 
> However this value could be read from RTAS.
> 
> Adding this value in the /proc/powerpc/lparcfg output allows to read the
> updated value.
> 
> However the hypervisor, like Qemu/KVM, may not support this RTAS
> parameter. In that case the value reported in lparcfg is read from the
> device tree and so is not updated accordingly.
> 
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

My only nit would be that in general for consistency with other function names
_RTAS_ and _DT_ should be lowercase. Seeing as they are statically scoped within
lparcfg.c maybe its ok. Otherwise,

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
> v5:
>  fallback to the device tree value if RTAS is not providing the value.
> v4:
>  address Nathan's new comments limiting size of the buffer.
> v3:
>  address Michael's comments.
> v2:
>  address Nathan's comments.
>  change title to partition_name aligning with existing partition_id
> ---
>  arch/powerpc/platforms/pseries/lparcfg.c | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index c7940fcfc911..8ca08fc306e7 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -311,6 +311,98 @@ static void parse_mpp_x_data(struct seq_file *m)
>  		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
>  }
>  
> +/*
> + * PAPR defines, in section "7.3.16 System Parameters Option", the token 55 to
> + * read the LPAR name, and the largest output data to 4000 + 2 bytes length.
> + */
> +#define SPLPAR_LPAR_NAME_TOKEN	55
> +#define GET_SYS_PARM_BUF_SIZE	4002
> +#if GET_SYS_PARM_BUF_SIZE > RTAS_DATA_BUF_SIZE
> +#error "GET_SYS_PARM_BUF_SIZE is larger than RTAS_DATA_BUF_SIZE"
> +#endif
> +
> +/**
> + * Read the lpar name using the RTAS ibm,get-system-parameter call.
> + *
> + * The name read through this call is updated if changes are made by the end
> + * user on the hypervisor side.
> + *
> + * Some hypervisor (like Qemu) may not provide this value. In that case, a non
> + * null value is returned.
> + */
> +static int read_RTAS_lpar_name(struct seq_file *m)
> +{
> +	int rc, len, token;
> +	union {
> +		char raw_buffer[GET_SYS_PARM_BUF_SIZE];
> +		struct {
> +			__be16 len;
> +			char name[GET_SYS_PARM_BUF_SIZE-2];
> +		};
> +	} *local_buffer;
> +
> +	token = rtas_token("ibm,get-system-parameter");
> +	if (token == RTAS_UNKNOWN_SERVICE)
> +		return -EINVAL;
> +
> +	local_buffer = kmalloc(sizeof(*local_buffer), GFP_KERNEL);
> +	if (!local_buffer)
> +		return -ENOMEM;
> +
> +	do {
> +		spin_lock(&rtas_data_buf_lock);
> +		memset(rtas_data_buf, 0, sizeof(*local_buffer));
> +		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
> +			       __pa(rtas_data_buf), sizeof(*local_buffer));
> +		if (!rc)
> +			memcpy(local_buffer->raw_buffer, rtas_data_buf,
> +			       sizeof(local_buffer->raw_buffer));
> +		spin_unlock(&rtas_data_buf_lock);
> +	} while (rtas_busy_delay(rc));
> +
> +	if (!rc) {
> +		/* Force end of string */
> +		len = min((int) be16_to_cpu(local_buffer->len),
> +			  (int) sizeof(local_buffer->name)-1);
> +		local_buffer->name[len] = '\0';
> +
> +		seq_printf(m, "partition_name=%s\n", local_buffer->name);
> +	} else
> +		rc = -ENODATA;
> +
> +	kfree(local_buffer);
> +	return rc;
> +}
> +
> +/**
> + * Read the LPAR name from the Device Tree.
> + *
> + * The value read in the DT is not updated if the end-user is touching the LPAR
> + * name on the hypervisor side.
> + */
> +static int read_DT_lpar_name(struct seq_file *m)
> +{
> +	struct device_node *rootdn;
> +	const char *name;
> +
> +	rootdn = of_find_node_by_path("/");
> +	if (!rootdn)
> +		return -ENOENT;
> +
> +	name = of_get_property(rootdn, "ibm,partition-name", NULL);
> +	if (!name)
> +		return -ENOENT;
> +
> +	seq_printf(m, "partition_name=%s\n", name);
> +	return 0;
> +}
> +
> +static void read_lpar_name(struct seq_file *m)
> +{
> +	if (read_RTAS_lpar_name(m) && read_DT_lpar_name(m))
> +		pr_err_once("Error can't get the LPAR name");
> +}
> +
>  #define SPLPAR_CHARACTERISTICS_TOKEN 20
>  #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
>  
> @@ -496,6 +588,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
>  
>  	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
>  		/* this call handles the ibm,get-system-parameter contents */
> +		read_lpar_name(m);
>  		parse_system_parameter_string(m);
>  		parse_ppp_data(m);
>  		parse_mpp_data(m);
> 

