Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1365D46C057
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 17:08:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7lZm6tqSz300S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 03:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N2u/XNXY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N2u/XNXY; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7lZ26W6Kz2yZx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 03:07:38 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7EqWt3018172; 
 Tue, 7 Dec 2021 16:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KhR7aBzxn5ylYqmhqahWZ1ONXD7ujdIkLRxq8HLSKhU=;
 b=N2u/XNXYxIEMkKaIt7BmbFZLY/e1AJKvrJxPRDsipGhTGLkPSdUtm3se/sKLpX7JhCEF
 YRkKiiiTzgFqHzB2sKhnSQ/tCcXOg/BTWWOKMA8JxWRn3jPWTjEWSyEr46XQfdgcOzOV
 I2wOrppeQXW4SNYWpAsCdpJIBcHFnRC9vpABbr8bMFEBw+qZpsXqrdrjWRovNWLEc0uM
 09xlhAwfjVO9vZ9ZMLiqAVoNfU7PhIxod5/pux73rRT/JO6fXBCXb1xcz1FvLnEx8ArW
 iCVbXzbnbLzKO9imxzSJU2s01xcVfzbsOZ5/wsuyuymIeFbMnlRjMw6QBv8wR0DhpfgG dw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct9ru1sq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 16:07:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7G2joN025848;
 Tue, 7 Dec 2021 16:07:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3cqykj88xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 16:07:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B7G7UV030474578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 16:07:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 651F8A405E;
 Tue,  7 Dec 2021 16:07:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BFA7A4051;
 Tue,  7 Dec 2021 16:07:30 +0000 (GMT)
Received: from [9.145.91.80] (unknown [9.145.91.80])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 16:07:30 +0000 (GMT)
Message-ID: <bbaa0d78-a09f-3ce3-25a9-67434039b741@linux.ibm.com>
Date: Tue, 7 Dec 2021 17:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3] powerpc/pseries: read the lpar name from the firmware
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211203154321.13168-1-ldufour@linux.ibm.com>
 <87bl1so588.fsf@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87bl1so588.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KvSKrxeJPNMmUHxXyKeJ_sgKxjGxyvy7
X-Proofpoint-GUID: KvSKrxeJPNMmUHxXyKeJ_sgKxjGxyvy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_06,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070098
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/12/2021, 15:32:39, Nathan Lynch wrote:
> Hi Laurent,
> 
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> +/*
>> + * PAPR defines, in section "7.3.16 System Parameters Option", the token 55 to
>> + * read the LPAR name.
>> + */
>> +#define SPLPAR_LPAR_NAME_TOKEN	55
>> +static void read_lpar_name(struct seq_file *m)
>> +{
>> +	int rc, len, token;
>> +	union {
>> +		char raw_buffer[RTAS_DATA_BUF_SIZE];
>> +		struct {
>> +			__be16 len;
> 
> This:
> 
>> +			char name[RTAS_DATA_BUF_SIZE-2];
>                                        ^^^^^^
> 
> should be 4000, not (4K - 2), according to PAPR (it's weird and I don't
> know the reason).

That's true, PAPR defines the largest output buffer for
ibm,get-system-parameter to 4002, so we could limit this to 4002, not sure
whether this would make a big difference here. Anyway I will limit that
buffer size this way.
> 
> 
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
>> +		memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
>> +		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
>> +			       __pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
>> +		if (!rc)
>> +			memcpy(local_buffer->raw_buffer, rtas_data_buf,
>> +			       RTAS_DATA_BUF_SIZE);
>> +		spin_unlock(&rtas_data_buf_lock);
>> +	} while (rtas_busy_delay(rc));
>> +
>> +	if (rc != 0) {
>> +		pr_err_once(
>> +			"%s %s Error calling get-system-parameter (0x%x)\n",
>> +			__FILE__, __func__, rc);
> 
> The __FILE__ and __func__ in the message seem unnecessary, and rc should
> be reported in decimal so the error meaning is apparent.

Fair enough.

> Is there a reasonable fallback for VMs where this parameter doesn't
> exist? PowerVM partitions should always have it, but what do we want the
> behavior to be on other hypervisors?

In that case, there is no value displayed in the /proc/powerpc/lparcfg and
the lparstat -i command will fall back to the device tree value. I can't
see any valid reason to report the value defined in the device tree here.

> 
> 
>> +	} else {
>> +		/* Force end of string */
>> +		len = be16_to_cpu(local_buffer->len);
>> +		if (len >= (RTAS_DATA_BUF_SIZE-2))
>> +			len = RTAS_DATA_BUF_SIZE-2;
> 
> Could use min() or clamp(), and it would be better to build the
> expression using the value of sizeof(local_buffer->name).

Fair enough.

> 
>> +		local_buffer->name[len] = '\0';
> 
> If 'len' can be (RTAS_DATA_BUF_SIZE - 2), then this writes past the end
> of the buffer, no?

Oh yes, the previous test should be
		if (len >= (RTAS_DATA_BUF_SIZE-2))
			len = RTAS_DATA_BUF_SIZE-3;

Thanks,
Laurent.
