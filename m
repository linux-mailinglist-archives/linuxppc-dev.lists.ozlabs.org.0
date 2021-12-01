Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE314651B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 16:31:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J432r43WKz301K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 02:31:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PGArTp6T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PGArTp6T; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J43250FTVz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 02:30:36 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B1FBgK8029904; 
 Wed, 1 Dec 2021 15:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jM5LpDjzppsF3No21Wq3sZXITvd/HQ+u1JpXeEB1nZc=;
 b=PGArTp6TYAo4xsNke5hzMeq46ybQNohLO64fl0M6IjFHcrH69dejH97hlo907y24Xx/Y
 qf1yp5YDLGJLhDH/DzNFdSeDPl7afN3LYUS2sffbQWIW5u7rclu+wjWLVi6s8uCdNMIL
 BWtgwD3QN79b4ScD0wxl65/i3eXZ76ghBx0OOnYQcXwErZ3wrOipIHRB1a5FX0+ILyqe
 CTF5cJyDJbmzzn9AnZmoO+rEpB16Zq8r2CGycpJGiNHbAgFlW2v7T7vTwy9nP6AbtP3Q
 BvpJSqmM/QbffY/DfF6VrWFE7X4RGPbHqOAGUuCnXQvg5CHe8LDg5WC5Yi/hBOgXnnEk pA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cpapf9t7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 15:30:32 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B1FD9Ho028041;
 Wed, 1 Dec 2021 15:30:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3ckcac7b0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 15:30:32 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B1FUUkQ20513220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Dec 2021 15:30:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB51FAE071;
 Wed,  1 Dec 2021 15:30:30 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F060AE05F;
 Wed,  1 Dec 2021 15:30:30 +0000 (GMT)
Received: from localhost (unknown [9.211.92.203])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Dec 2021 15:30:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <20211201144826.45342-1-ldufour@linux.ibm.com>
References: <20211201144826.45342-1-ldufour@linux.ibm.com>
Date: Wed, 01 Dec 2021 09:30:29 -0600
Message-ID: <87h7bsny0a.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H2Q0ljlBphBOUhz9dFQXfeaTsa6HOYP8
X-Proofpoint-GUID: H2Q0ljlBphBOUhz9dFQXfeaTsa6HOYP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112010086
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> The LPAR name may be changed after the LPAR has been started in the HMC.
> In that case lparstat command is not reporting the updated value because it
> reads it from the device tree which is read at boot time.

Could lparstat be changed to make the appropriate get-system-parameter
call via librtas, avoiding a kernel change?


> However this value could be read from RTAS.
>
> Adding this value in the /proc/powerpc/lparcfg output allows to read the
> updated value.
>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/lparcfg.c | 50 ++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index f71eac74ea92..b597b132ce32 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -311,6 +311,55 @@ static void parse_mpp_x_data(struct seq_file *m)
>  		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
>  }
>  
> +/*
> + * PAPR defines no maximum for the LPAR name, and defines that the maximum
> + * length of the get-system-parameter's output buffer is 4000 plus 2 bytes for
> + * the length. Limit LPAR's name size to 1024
> + */
> +#define SPLPAR_LPAR_NAME_MAXLEN	1026
> +#define SPLPAR_LPAR_NAME_TOKEN	55
> +static void parse_lpar_name(struct seq_file *m)
> +{
> +	int call_status, len;
> +	unsigned char *local_buffer;
> +
> +	local_buffer = kmalloc(SPLPAR_LPAR_NAME_MAXLEN, GFP_KERNEL);
> +	if (!local_buffer) {
> +		pr_err("%s %s kmalloc failure at line %d\n",
> +		       __FILE__, __func__, __LINE__);
> +		return;
> +	}

No error prints on memory allocation failure, the mm code will do that.

> +
> +	spin_lock(&rtas_data_buf_lock);
> +	memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
> +				NULL,
> +				SPLPAR_LPAR_NAME_TOKEN,
> +				__pa(rtas_data_buf),
> +				RTAS_DATA_BUF_SIZE);
> +	memcpy(local_buffer, rtas_data_buf, SPLPAR_LPAR_NAME_MAXLEN);
> +	spin_unlock(&rtas_data_buf_lock);
> +
> +	if (call_status != 0) {
> +		pr_err("%s %s Error calling get-system-parameter (0x%x)\n",
> +		       __FILE__, __func__, call_status);

If this yields an error then it should fall back to the device tree.

ibm,get-system-parameter can return -2 or 990x, which are not errors.
Callers of ibm,get-system-parameter must handle these statuses using
rtas_busy_delay() or similar, which potentially involves sleeping.
Granted this is inconvenient when dealing the rtas_data_buf and
rtas_data_buf_lock - you can't call rtas_busy_delay() before you've
released the buffer lock. See dlpar_configure_connector() for an example
of how this can be structured.

It looks like most existing users of ibm,get-system-parameter have this
bug, unfortunately.
