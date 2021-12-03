Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DBB46776A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 13:29:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5Bw10jyxz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 23:29:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W0ElR2W8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=michaele@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W0ElR2W8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5BvB69Xkz2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 23:28:37 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3CGNn7010249; 
 Fri, 3 Dec 2021 12:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=LRLOOJ7/3hfjF/D49FdHFMROASWsk4EMEY3Y57zhtBw=;
 b=W0ElR2W88Vu+Pa8ozjf8i3hApaA4F+iyWGCC+DD8TKCIP/ozy/i0FVhLrmxXbYDLb31u
 mgdYl2SEHVI6nXUhE1qHsv05tPL7fXXli0MJaRNXMPKspHiZ+bln7Zd8cLT+EpOe/JFJ
 jJp7yAeqN4PjESn9m9Xwy7Zleeg5s78RTMSIRtxwOE+inNScVITBLRFnFX+mNzPOJQ4+
 PwWSeFMKchycSMNnJbqhpI7RwWzRZcAyVAJeSXiFu3R4pxgIE7xJLQ++AONW8XStAKc9
 CEQc8KXtwhMSQCmxnOK/f+K7jbO+RMIUQgCuqERLImUujecze8IbYOsP31RMFl0Juv4Y sw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqk3ng6xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:28:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3CITit009901;
 Fri, 3 Dec 2021 12:28:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxkwra1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:28:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B3CSTAQ32178668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 12:28:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63D735204E;
 Fri,  3 Dec 2021 12:28:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B959552050;
 Fri,  3 Dec 2021 12:28:28 +0000 (GMT)
Received: from localhost (unknown [9.43.225.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C990960036;
 Fri,  3 Dec 2021 23:28:16 +1100 (AEDT)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <20211201190642.49897-1-ldufour@linux.ibm.com>
References: <20211201190642.49897-1-ldufour@linux.ibm.com>
Date: Fri, 03 Dec 2021 23:28:10 +1100
Message-ID: <87y251ooth.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 70Mbsjelfo6ROtV38G5ICGU_XojtleOx
X-Proofpoint-GUID: 70Mbsjelfo6ROtV38G5ICGU_XojtleOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112030076
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

Just a few minor comments below ...

Laurent Dufour <ldufour@linux.ibm.com> writes:
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
> v2:
>  address Nathan's comments.
>  change title to partition_name aligning with existing partition_id
> ---
>  arch/powerpc/platforms/pseries/lparcfg.c | 53 ++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index f71eac74ea92..0deca7b4cd81 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -311,6 +311,58 @@ static void parse_mpp_x_data(struct seq_file *m)
>  		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
>  }
>  
> +/*
> + * PAPR defines no maximum for the LPAR name, and defines that the maximum
> + * length of the get-system-parameter's output buffer is 4000 plus 2 bytes for
> + * the length. Limit LPAR's name size to 1024
> + */
> +#define SPLPAR_LPAR_NAME_MAXLEN	1026

Why not just allocate the full 4000? That's not much memory in the
scheme of things, and allocating less risks us needing to update this in
future. I realise that's a ridiculously long LPAR name, but still.

> +#define SPLPAR_LPAR_NAME_TOKEN	55

Can you add a comment saying where that value is defined, PAPR?

> +static void parse_lpar_name(struct seq_file *m)

Nitpick, but we're not really parsing it, we're just reading it from firmware.

> +{
> +	int rc, len, token;
> +	unsigned char *local_buffer;
> +
> +	token = rtas_token("ibm,get-system-parameter");
> +	if (token == RTAS_UNKNOWN_SERVICE)
> +		return;
> +
> +	local_buffer = kmalloc(SPLPAR_LPAR_NAME_MAXLEN, GFP_KERNEL);
> +	if (!local_buffer)
> +		return;
> +
> +	do {
> +		spin_lock(&rtas_data_buf_lock);
> +
> +		memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
> +		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
> +			       __pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
> +		memcpy(local_buffer, rtas_data_buf, SPLPAR_LPAR_NAME_MAXLEN);

Would be nice to skip the memcpy() if rc is non-zero.

> +		spin_unlock(&rtas_data_buf_lock);
> +	} while (rtas_busy_delay(rc));
> +
> +	if (rc != 0) {
> +		pr_err_once(
> +			"%s %s Error calling get-system-parameter (0x%x)\n",
> +			__FILE__, __func__, rc);
> +	} else {
> +		local_buffer[SPLPAR_LPAR_NAME_MAXLEN - 1] = '\0';
> +		len = local_buffer[0] * 256 + local_buffer[1];

This is kind of a hand rolled be16_to_cpu().

And we also have the + 2 to skip the length in several places.

I feel like the code would be cleaner if we had a type for the result
buffer, eg something like:

union {
	char raw_buffer[1026];
        struct {
        	__be16 len;
                char data[1024];
        };
};

> +		/*
> +		 * Forces an empty string in the weird case fw reports no data.
> +		 */
> +		if (!len)
> +			local_buffer[2] = '\0';
> +
> +		seq_printf(m, "partition_name=%s\n", local_buffer + 2);

Then above you could use the data field rather than having to add the
"2" in both places.

> +	}
> +
> +	kfree(local_buffer);
> +}
> +
> +
>  #define SPLPAR_CHARACTERISTICS_TOKEN 20
>  #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
>  
> @@ -496,6 +548,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
>  
>  	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
>  		/* this call handles the ibm,get-system-parameter contents */
> +		parse_lpar_name(m);
>  		parse_system_parameter_string(m);
>  		parse_ppp_data(m);
>  		parse_mpp_data(m);
> -- 
> 2.34.1


cheers
