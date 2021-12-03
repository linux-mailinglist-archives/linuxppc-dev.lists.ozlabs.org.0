Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC15467A34
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 16:24:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5GpP207xz3cBx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 02:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YrATOJa6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YrATOJa6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5Gnc0kXzz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 02:24:03 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3DGefn028636; 
 Fri, 3 Dec 2021 15:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Efo9Jhs0LpQtMwBo3VZ/1mqeig4JdcHeFLgixmH13U8=;
 b=YrATOJa6A+T1gMBGVjwmfbxBjLoIWyVUnoOdk4PYXLRJMoP+Npzd6m/AsAetyPB4GXV/
 ZDmuzMi3EvPPcP3MmnFf3g/aYzTmqyxyjwFtIPIzrucC5udwA5d/PLkP86HmoA4wZdY7
 jQiYX1/pzA2DAFHhzsCywzaZCk9xGivTlRORcq+QojyRXkSzXGW3WX8UEJ+AZOw/3cnv
 0dXJpQFXSGexRAy1I5KTvBnmV/YNPUB2ubEEuIkOHB6sebyz9p3a39QXsOGj6DlWghdL
 fJfbtxVMxAOpNhZNikO0/zrRHZMMl7Sc8GH+LMaGkX4roTAfXZoWY8+TlLV9Q1y8RYZ8 hg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqkyvtwee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 15:24:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3FIH6X007556;
 Fri, 3 Dec 2021 15:23:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxky45v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 15:23:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3FNs2v29360618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 15:23:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C514311C04A;
 Fri,  3 Dec 2021 15:23:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9599D11C050;
 Fri,  3 Dec 2021 15:23:54 +0000 (GMT)
Received: from [9.145.11.85] (unknown [9.145.11.85])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 15:23:54 +0000 (GMT)
Message-ID: <a1fb26c0-14a4-0d8f-6f31-37cca112df14@linux.ibm.com>
Date: Fri, 3 Dec 2021 16:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v2] powerpc/pseries: read the lpar name from the firmware
Content-Language: en-US
To: Michael Ellerman <michaele@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211201190642.49897-1-ldufour@linux.ibm.com>
 <87y251ooth.fsf@mpe.ellerman.id.au>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87y251ooth.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gojMuHEmzQAgrqppuuxMlG_Im2AMFxTJ
X-Proofpoint-ORIG-GUID: gojMuHEmzQAgrqppuuxMlG_Im2AMFxTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_07,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030095
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

On 03/12/2021, 13:28:10, Michael Ellerman wrote:
> Hi Laurent,
> 
> Just a few minor comments below ...

Thanks, Michael, for your _major_ comments.

I'll send a version 3 soon.

Laurent.

> 
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> The LPAR name may be changed after the LPAR has been started in the HMC.
>> In that case lparstat command is not reporting the updated value because it
>> reads it from the device tree which is read at boot time.
>>
>> However this value could be read from RTAS.
>>
>> Adding this value in the /proc/powerpc/lparcfg output allows to read the
>> updated value.
>>
>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>> v2:
>>  address Nathan's comments.
>>  change title to partition_name aligning with existing partition_id
>> ---
>>  arch/powerpc/platforms/pseries/lparcfg.c | 53 ++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index f71eac74ea92..0deca7b4cd81 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -311,6 +311,58 @@ static void parse_mpp_x_data(struct seq_file *m)
>>  		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
>>  }
>>  
>> +/*
>> + * PAPR defines no maximum for the LPAR name, and defines that the maximum
>> + * length of the get-system-parameter's output buffer is 4000 plus 2 bytes for
>> + * the length. Limit LPAR's name size to 1024
>> + */
>> +#define SPLPAR_LPAR_NAME_MAXLEN	1026
> 
> Why not just allocate the full 4000? That's not much memory in the
> scheme of things, and allocating less risks us needing to update this in
> future. I realise that's a ridiculously long LPAR name, but still.
> 
>> +#define SPLPAR_LPAR_NAME_TOKEN	55
> 
> Can you add a comment saying where that value is defined, PAPR?
> 
>> +static void parse_lpar_name(struct seq_file *m)
> 
> Nitpick, but we're not really parsing it, we're just reading it from firmware.
> 
>> +{
>> +	int rc, len, token;
>> +	unsigned char *local_buffer;
>> +
>> +	token = rtas_token("ibm,get-system-parameter");
>> +	if (token == RTAS_UNKNOWN_SERVICE)
>> +		return;
>> +
>> +	local_buffer = kmalloc(SPLPAR_LPAR_NAME_MAXLEN, GFP_KERNEL);
>> +	if (!local_buffer)
>> +		return;
>> +
>> +	do {
>> +		spin_lock(&rtas_data_buf_lock);
>> +
>> +		memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
>> +		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
>> +			       __pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
>> +		memcpy(local_buffer, rtas_data_buf, SPLPAR_LPAR_NAME_MAXLEN);
> 
> Would be nice to skip the memcpy() if rc is non-zero.
> 
>> +		spin_unlock(&rtas_data_buf_lock);
>> +	} while (rtas_busy_delay(rc));
>> +
>> +	if (rc != 0) {
>> +		pr_err_once(
>> +			"%s %s Error calling get-system-parameter (0x%x)\n",
>> +			__FILE__, __func__, rc);
>> +	} else {
>> +		local_buffer[SPLPAR_LPAR_NAME_MAXLEN - 1] = '\0';
>> +		len = local_buffer[0] * 256 + local_buffer[1];
> 
> This is kind of a hand rolled be16_to_cpu().
> 
> And we also have the + 2 to skip the length in several places.
> 
> I feel like the code would be cleaner if we had a type for the result
> buffer, eg something like:
> 
> union {
> 	char raw_buffer[1026];
>         struct {
>         	__be16 len;
>                 char data[1024];
>         };
> };
> 
>> +		/*
>> +		 * Forces an empty string in the weird case fw reports no data.
>> +		 */
>> +		if (!len)
>> +			local_buffer[2] = '\0';
>> +
>> +		seq_printf(m, "partition_name=%s\n", local_buffer + 2);
> 
> Then above you could use the data field rather than having to add the
> "2" in both places.
> 
>> +	}
>> +
>> +	kfree(local_buffer);
>> +}
>> +
>> +
>>  #define SPLPAR_CHARACTERISTICS_TOKEN 20
>>  #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
>>  
>> @@ -496,6 +548,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
>>  
>>  	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
>>  		/* this call handles the ibm,get-system-parameter contents */
>> +		parse_lpar_name(m);
>>  		parse_system_parameter_string(m);
>>  		parse_ppp_data(m);
>>  		parse_mpp_data(m);
>> -- 
>> 2.34.1
> 
> 
> cheers
> 

