Return-Path: <linuxppc-dev+bounces-11274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F62B3526B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 05:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9v3G74Fdz3d94;
	Tue, 26 Aug 2025 13:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756180570;
	cv=none; b=k6x/9dJn0m70tAFZh4gTefBjiG667BXDLQIKVzRv7KwTRMj1OWPW4HNjXhEDbfHWbuDTxWRmp6102bTbBhhbN0teQfgYIdxmFmnvVvmbJ0Hny05XAHB+Lr893Mv0+7kMf+2vlIwrQUa2srhxtmy5Pxc73vsLV388lInDOUHxBZwsyWq7eYTxTNAzRkju0wfxfSmThei1Fyuys1DhCa3KTz1yq+L3bGBf9uKmkIkbOQkxJyFrXDQuLf91Jp0n7CUw3TYJZqo3ikP1vDIRzCOE9VWRXE3YX1G9cCAKZG8uu0yJ3Ijv21w44D7cyqu6dddWVjVw1+FVO9zk0D6lO7KeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756180570; c=relaxed/relaxed;
	bh=h6t98DzHgHBwz8z5QxTcjIVl1X5R3PFRJgfNPf43aGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvKKvZg3EtFKHVMbSaj5a881NQmjfrRjlGZP7t23vu8p/aDdicuH54I0TqCeyIlztlJqStLUT09l/R+lAb1ndqqVlf3DzSuvEAia73PwAT7V3VLdfF6JcxnY8pfw7U5c8ThJHTyvp8Okl7VC66qhPNxxEv4ehxBqsR6QoC8w0RTxJgV1dj2Yqu8idwGwQrXuAmLlf0BSEUuLLeMYpQrECBdppjfa942EEz8VQlya0BujTPOYHVtf+LWgumrrhvBboWxjlPbJ9qLePCmL2NGBXxmWhRujvqrehE6hSZMq/L9YZPHZ8BocD9t7hnQbH01TB7Ue0bpVxIqkAnMXIj9AJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T7oVWybq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T7oVWybq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9v3C2WMPz3d8K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 13:56:06 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PL16wi000840;
	Tue, 26 Aug 2025 03:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=h6t98D
	zHgHBwz8z5QxTcjIVl1X5R3PFRJgfNPf43aGw=; b=T7oVWybqAPdLrG7BPne3VZ
	src9mRK/pLXAg22DLqDaQ0yZn+D4rI2AQ94OKoFRuFMo6itTzP6jZAxdN0iKpvUe
	NgG1vycesm+20at4tKP6/f74I+4B98nu8ZETY4YKNa4ERDxTRfa70+4o5NYp88zB
	akareX+aPYm0Paji+r2z54NWwcxvAShbIc47TsvxrfdgKTMjUIF6TBwwAE7CwCW9
	1ht992l5H8DD7qhSX53Q9rZzFYnuMnStVsCFc6qtKpRClinp13aw0P/M6AJQ4HKp
	l1yjC0ZOWnIoIJyoj95cgybZHd1XgvYccrIBES6Vhob1Dvt7rzGrQjYgu9UiDjBA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q557vd6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 03:55:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57PNFRWc017989;
	Tue, 26 Aug 2025 03:55:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp38mqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 03:55:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57Q3tqD257868706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Aug 2025 03:55:52 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 467C42004D;
	Tue, 26 Aug 2025 03:55:52 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D861420040;
	Tue, 26 Aug 2025 03:55:49 +0000 (GMT)
Received: from [9.61.241.59] (unknown [9.61.241.59])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Aug 2025 03:55:49 +0000 (GMT)
Message-ID: <e490cf23-df51-4362-8a64-163d479a1658@linux.ibm.com>
Date: Tue, 26 Aug 2025 09:25:47 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/eeh: parse AER registers
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, mahesh@linux.ibm.com
References: <20250808082234.645375-1-ganeshgr@linux.ibm.com>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <20250808082234.645375-1-ganeshgr@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tfQqzlZ-uLdhZGMe94kvu9K0ZOIxGL0q
X-Proofpoint-ORIG-GUID: tfQqzlZ-uLdhZGMe94kvu9K0ZOIxGL0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX0KcyOv61CkR+
 l54E+gjI1c/K4M4TzC8jeKsEVWtEOrW8tCElZogcemDOfNYEJZT1zA5JXIyext2jB+F3IZtiVdN
 ZxaKZ1Z07pVapSDkTCRb6b+5ahD9mH9iboCZ1Fp626JwO7F1e1W/+tavcMdTWLvRsCEUZ5B18f4
 iMY5NpCj9GFOk/6yg3IJ4kGEpZnAji+Z9Fb2YwP/W4l7NDFGKJ+MBC7pqWpmEe5Hzs1fMOL7/bt
 58FsqCU1vRrDzgp/sBt+pgPZ7bUkx8KUJbYo49/daIIUWlIW4ZghImRsiSYDw3qXqWpweTdhd7B
 KZBr4m1W0wIntw4Nnb44UUS00edgroqOxSaRKtqG0m1NT17Fvz2V0RHHxo/aAvJsC9yMvvmeIrt
 3K2+Njnm
X-Authority-Analysis: v=2.4 cv=A8ZsP7WG c=1 sm=1 tr=0 ts=68ad304d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=cltVPYpP0qIymd1zJPEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 08/08/25 1:52 PM, Ganesh Goudar wrote:
> parse AER uncorrectable and correctable error status
> registers to print error type and severity.
>
> output looks like
> EEH:AER severity=Uncorrected (Fatal), Error Type: Data Link Protocol Error
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> v2:
> * Remove unnecessary checks.
> * Change the error message format.
> ---
>   arch/powerpc/kernel/eeh.c | 81 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 80 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 83fe99861eb1..cd083e59d6b3 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -139,6 +139,49 @@ struct eeh_stats {
>   
>   static struct eeh_stats eeh_stats;
>   
> +static const char * const aer_uncor_errors[] = {
> +	"Undefined",
> +	"Undefined",
> +	"Undefined",
> +	"Undefined",
> +	"Data Link Protocol",
> +	"Surprise Down",
> +	"Poisoned TLP",
> +	"Flow Control Protocol",
> +	"Completion Timeout",
> +	"Completer Abort",
> +	"Unexpected Completion",
> +	"Receiver Overflow",
> +	"Malformed TLP",
> +	"ECRC Error",
> +	"Unsupported Request",
> +	"ACS Violation",
> +	"Uncorrectable Internal Error",
> +	"MC Blocked TLP",
> +	"AtomicOp Egress Blocked",
> +	"TLPPrefix Blocked",
> +	"Poisoned TLP Egress Blocked"
> +};
> +
> +static const char * const aer_cor_errors[] = {
> +	"Receiver Error",
> +	"Undefined",
> +	"Undefined",
> +	"Undefined",
> +	"Undefined",
> +	"Undefined",
> +	"Bad TLP",
> +	"Bad DLLP",
> +	"Replay Num Rollover",
> +	"Undefined",
> +	"Undefined",
> +	"Undefined",
> +	"Replay Timer Timeout",
> +	"Advisory Non-Fatal Error",
> +	"Corrected Internal Error",
> +	"Header Log Overflow",
> +};
> +
>   static int __init eeh_setup(char *str)
>   {
>   	if (!strcmp(str, "off"))
> @@ -160,6 +203,40 @@ void eeh_show_enabled(void)
>   		pr_info("EEH: No capable adapters found: recovery disabled.\n");
>   }
>   
> +static void eeh_parse_aer_registers(struct eeh_dev *edev, int cap)
> +{
> +	int i;
> +	const char *error_type;
> +	u32 uncor_status, uncor_severity, cor_status;
> +
> +	eeh_ops->read_config(edev, cap + PCI_ERR_UNCOR_STATUS, 4, &uncor_status);
> +	eeh_ops->read_config(edev, cap + PCI_ERR_UNCOR_SEVER, 4, &uncor_severity);
> +	eeh_ops->read_config(edev, cap + PCI_ERR_COR_STATUS, 4, &cor_status);
> +
> +	if (uncor_status) {
> +		for (i = 0; i < ARRAY_SIZE(aer_uncor_errors); i++) {
> +			if (uncor_status & (1 << i)) {
> +				error_type = (i < ARRAY_SIZE(aer_uncor_errors))
> +					     ? aer_uncor_errors[i] : "Unknown";
> +				pr_err("EEH:AER severity=Uncorrected (%s), Error type: %s\n",
> +				       (uncor_severity & (1 << i)) ?
> +				       "Fatal" : "Non-Fatal", error_type);
> +			}
> +		}
> +	}
> +
> +	if (cor_status) {
> +		for (i = 0; i < ARRAY_SIZE(aer_cor_errors); i++) {
> +			if (cor_status & (1 << i)) {
> +				error_type = (i < ARRAY_SIZE(aer_cor_errors))
> +					      ? aer_cor_errors[i] : "Unknown";
> +				pr_err("EEH:AER severity=Correctable, Error Type: %s\n",
> +				       error_type);
> +			}
> +		}
> +	}
> +}
> +
In the last version you missed my review comment.
If you include it would be better to also consider the AER mask 
registers when
interpreting error status. Otherwise masked-off bits may still appear in
logs, leading to false positives. For example, something like:

     eeh_ops->read_config(edev, cap + PCI_ERR_UNCOR_MASK, 4, &uncor_mask);
     eeh_ops->read_config(edev, cap + PCI_ERR_COR_MASK, 4, &cor_mask);

     if (uncor_status & ~uncor_mask) { ... }
     if (cor_status & ~cor_mask) { ... }

This way only unmasked errors are reported.

Regards,
Narayana Murty N

>   /*
>    * This routine captures assorted PCI configuration space data
>    * for the indicated PCI device, and puts them into a buffer
> @@ -237,9 +314,11 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
>   		pr_warn("%s\n", buffer);
>   	}
>   
> -	/* If AER capable, dump it */
> +	/* If AER capable, parse and dump it */
>   	cap = edev->aer_cap;
>   	if (cap) {
> +		eeh_parse_aer_registers(edev, cap);
> +
>   		n += scnprintf(buf+n, len-n, "pci-e AER:\n");
>   		pr_warn("EEH: PCI-E AER capability register set follows:\n");
>   

