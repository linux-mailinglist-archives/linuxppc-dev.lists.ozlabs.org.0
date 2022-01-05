Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5B348568E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 17:14:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTZLz1dJpz3bN7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 03:14:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G5a/cLDn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G5a/cLDn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTZLB6xDVz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 03:14:10 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205FCm2K027500; 
 Wed, 5 Jan 2022 16:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6eTp/MWldCknR3BxbRr2//E7agbIxaGW9bm0MMpaJt8=;
 b=G5a/cLDnTIWiJydmDdx8eC68sTZWw89xm5tf3B0pDcEWdFgYTC1lg0ntyR/8tCMhrTbE
 oyLMqwtaTjIqUT+t+tPdyC/n5q/mnWIxM8M3KKhLMOV9Sojfzo65ZMM1ybp/SxgEM9Xp
 guw2m8vfcjWNm099CjO6v6+yBkVxPf2gSGM5w/Vz6ABlhVWes8JEoaGtZVwJrsT1S5f6
 u4ZM+otZ9rz2tYugkcoQvqI1CiY+ALRNXs7tsV3/f+C8aMSi8B5AaikbicgUF3ewlIfP
 dBB5W/rYaYJs/LGMBPUhtJb8gUhA7SBCDK+pUy9GbVhxtXgWXaeNqRT/6boUTbwQ/ly/ aw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dcnpbk4rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 16:14:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205GE14r015203;
 Wed, 5 Jan 2022 16:14:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek9u5f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 16:14:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205GE0gx43319656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 16:14:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBD625204E;
 Wed,  5 Jan 2022 16:13:59 +0000 (GMT)
Received: from [9.145.180.154] (unknown [9.145.180.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BA99F52054;
 Wed,  5 Jan 2022 16:13:59 +0000 (GMT)
Message-ID: <25527544-b0ac-596c-3876-560493b99f6b@linux.ibm.com>
Date: Wed, 5 Jan 2022 17:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v4] powerpc/pseries: read the lpar name from the firmware
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20211207171109.22793-1-ldufour@linux.ibm.com>
In-Reply-To: <20211207171109.22793-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P15voHhJVxlRPFlDjZE2izYBYt0jT4rt
X-Proofpoint-GUID: P15voHhJVxlRPFlDjZE2izYBYt0jT4rt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_03,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050108
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Happy New Year, Michael!

Do you consider taking that patch soon?

Thanks,
Laurent.

On 07/12/2021, 18:11:09, Laurent Dufour wrote:
> The LPAR name may be changed after the LPAR has been started in the HMC.
> In that case lparstat command is not reporting the updated value because it
> reads it from the device tree which is read at boot time.
> 
> However this value could be read from RTAS.
> 
> Adding this value in the /proc/powerpc/lparcfg output allows to read the
> updated value.
> 
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
> v4:
>  address Nathan's new comments limiting size of the buffer.
> v3:
>  address Michael's comments.
> v2:
>  address Nathan's comments.
>  change title to partition_name aligning with existing partition_id
> ---
>  arch/powerpc/platforms/pseries/lparcfg.c | 54 ++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index f71eac74ea92..058d9a5fe545 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -311,6 +311,59 @@ static void parse_mpp_x_data(struct seq_file *m)
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
> +static void read_lpar_name(struct seq_file *m)
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
> +		return;
> +
> +	local_buffer = kmalloc(sizeof(*local_buffer), GFP_KERNEL);
> +	if (!local_buffer)
> +		return;
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
> +		pr_err_once("Error calling get-system-parameter (0x%x)\n", rc);
> +
> +	kfree(local_buffer);
> +}
> +
> +
>  #define SPLPAR_CHARACTERISTICS_TOKEN 20
>  #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
>  
> @@ -496,6 +549,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
>  
>  	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
>  		/* this call handles the ibm,get-system-parameter contents */
> +		read_lpar_name(m);
>  		parse_system_parameter_string(m);
>  		parse_ppp_data(m);
>  		parse_mpp_data(m);

