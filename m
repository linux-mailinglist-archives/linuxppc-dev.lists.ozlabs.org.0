Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1A1486D90
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 00:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVMWg22YHz3Wtr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 10:10:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eaYopRoH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVMW13pPhz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 10:09:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eaYopRoH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JVMW130qnz4xts;
 Fri,  7 Jan 2022 10:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1641510573;
 bh=B+bWhhgzDSj+fEAQVcMQLTtKkWLuJI8V8ABaSomc3R0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eaYopRoHSCly3KuF1RT//gnvMY/nRhG9qGnvHOkbkpX7NPp5Xxe0QcnEwTKkzN2Wb
 ODNKaaPw4toaKi0gfn4+x1NuQklg4fDWzSzBgQS/IGBmHBmZfjp7XfLkLgwUWvlLW4
 XkWM+3p9ajCtUQaKZ+q+do3N0kOLvmEX4SNu+TdhifWylLLmcwMmuenroD09gQoE7g
 2B91JXTz63WNhPGFFYNGl3XE1Tgr1TlS5vKqsdFgEcnIJlHBwnqiJob7VtintImJ28
 izl6Ejt73W3dUop4dWdtufMHjsVWCHprr0x4/KFRMehDZIh6WF3yAD3xXPnL+X9BkX
 rAun794XQgv/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <25527544-b0ac-596c-3876-560493b99f6b@linux.ibm.com>
References: <20211207171109.22793-1-ldufour@linux.ibm.com>
 <25527544-b0ac-596c-3876-560493b99f6b@linux.ibm.com>
Date: Fri, 07 Jan 2022 10:09:32 +1100
Message-ID: <87h7ag31hv.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Happy New Year, Michael!
>
> Do you consider taking that patch soon?

I did but I was hoping you and Nathan could come to an agreement.

Looks like you did while I was sleeping, perfect :)

I'll pick up v5.

cheers


> On 07/12/2021, 18:11:09, Laurent Dufour wrote:
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
>> v4:
>>  address Nathan's new comments limiting size of the buffer.
>> v3:
>>  address Michael's comments.
>> v2:
>>  address Nathan's comments.
>>  change title to partition_name aligning with existing partition_id
>> ---
>>  arch/powerpc/platforms/pseries/lparcfg.c | 54 ++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index f71eac74ea92..058d9a5fe545 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -311,6 +311,59 @@ static void parse_mpp_x_data(struct seq_file *m)
>>  		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
>>  }
>>  
>> +/*
>> + * PAPR defines, in section "7.3.16 System Parameters Option", the token 55 to
>> + * read the LPAR name, and the largest output data to 4000 + 2 bytes length.
>> + */
>> +#define SPLPAR_LPAR_NAME_TOKEN	55
>> +#define GET_SYS_PARM_BUF_SIZE	4002
>> +#if GET_SYS_PARM_BUF_SIZE > RTAS_DATA_BUF_SIZE
>> +#error "GET_SYS_PARM_BUF_SIZE is larger than RTAS_DATA_BUF_SIZE"
>> +#endif
>> +static void read_lpar_name(struct seq_file *m)
>> +{
>> +	int rc, len, token;
>> +	union {
>> +		char raw_buffer[GET_SYS_PARM_BUF_SIZE];
>> +		struct {
>> +			__be16 len;
>> +			char name[GET_SYS_PARM_BUF_SIZE-2];
>> +		};
>> +	} *local_buffer;
>> +
>> +	token = rtas_token("ibm,get-system-parameter");
>> +	if (token == RTAS_UNKNOWN_SERVICE)
>> +		return;
>> +
>> +	local_buffer = kmalloc(sizeof(*local_buffer), GFP_KERNEL);
>> +	if (!local_buffer)
>> +		return;
>> +
>> +	do {
>> +		spin_lock(&rtas_data_buf_lock);
>> +		memset(rtas_data_buf, 0, sizeof(*local_buffer));
>> +		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
>> +			       __pa(rtas_data_buf), sizeof(*local_buffer));
>> +		if (!rc)
>> +			memcpy(local_buffer->raw_buffer, rtas_data_buf,
>> +			       sizeof(local_buffer->raw_buffer));
>> +		spin_unlock(&rtas_data_buf_lock);
>> +	} while (rtas_busy_delay(rc));
>> +
>> +	if (!rc) {
>> +		/* Force end of string */
>> +		len = min((int) be16_to_cpu(local_buffer->len),
>> +			  (int) sizeof(local_buffer->name)-1);
>> +		local_buffer->name[len] = '\0';
>> +
>> +		seq_printf(m, "partition_name=%s\n", local_buffer->name);
>> +	} else
>> +		pr_err_once("Error calling get-system-parameter (0x%x)\n", rc);
>> +
>> +	kfree(local_buffer);
>> +}
>> +
>> +
>>  #define SPLPAR_CHARACTERISTICS_TOKEN 20
>>  #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
>>  
>> @@ -496,6 +549,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
>>  
>>  	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
>>  		/* this call handles the ibm,get-system-parameter contents */
>> +		read_lpar_name(m);
>>  		parse_system_parameter_string(m);
>>  		parse_ppp_data(m);
>>  		parse_mpp_data(m);
