Return-Path: <linuxppc-dev+bounces-10353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 847AFB0D533
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 11:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmWVN0Cjtz3bh0;
	Tue, 22 Jul 2025 19:02:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753174923;
	cv=none; b=jhaNV4vZUmpD0TqYyK4oH272jzULFz7wrYpvVpTWxck+TVCMQldNp/uaDJKjkoKFjnp0JuoZ7y4JXK1FNBo7HoU9RKWYxCGUzHlvOAJEfC7TqxbAM70SU6wTrOIyhDeNZ8lUgF0JqSFl1Scl6LR5GhTS6FliYI7xTdrJNCGQlFw0EoUwqDU3qkgv7O7FITzAIBgLVgj3Vgnmfhg+KBVp5RO8UpzZkhMEvjs1xn5ctG7OcN9VBbvstRMvdVWdgk45iRfv2m4J6Dnvst6cIesxPiAYHFKo/gKF1fRCXrjB+XDbS5T1HHiE0/aEU+TdmMX+Nl7rOii4471k+Cbm055vQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753174923; c=relaxed/relaxed;
	bh=Tl6JYlwsKAc4Z3ibzqArP/NGthJ1XFpQo4enBTN3IdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDcyyDvUwonqDk7/WUo4c683j6xn95zRebmCPASMhOH+RGXNtkAMVkNFSbLbQW2aCewNhpTbtSeyCCjW/smXX+gIkpByT6afr+EwFhNVWR136JbJFxpVk67X0oSile5GWsWe0fO1A401UlmP4WiZzgHZ83W+Qr7yM5/XgZMN1AQ9l0OjXEoKJmwuhrtIpVXqoO/CbxbFLJLTte7VNggzAE3hGbhU8lWLkEAj0fut5pTOAcuTZQ6GcMBrKCFENN1/AcOhdzDZqVvcZdDUoArGfIL4vJW3jAPAbvpIb+7nMEa+KevoXhHJGWiQsp46/DC/nVU0vU4xPH2QU6qwtrIF9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DsM4luPt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DsM4luPt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmWVM1fSBz3bgw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 19:02:02 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LNwIDE003680;
	Tue, 22 Jul 2025 09:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Tl6JYlwsKAc4Z3ibzqArP/NGthJ1XF
	pQo4enBTN3IdQ=; b=DsM4luPtqa1ynhL3EWdcjY+eKPcSBJW4TeUy2gORVk9mzD
	DgXbmYlrcLN6ijPFDdFfNjGWoNH1mO9p6WNQ4Cxww3qiNiSXNPCtRlvYemMpZdZ2
	ND/mB9kFNrpnj07685lHTf3kykDNA2ZrV8yVowJ2eaiVkuRbnLDRDzCqXU3OPr5c
	iRNLdFB1K8+Gj0os2IzDIx5UZfJGWMd8Gv2wUrqQLLe4RGiMc+HzTGlk6mWV73oi
	8tR537Ra9UGar7V0V6W1Af70NWPseO5ED/XhNDCItbx5OCLFv82hdmn0tYnyQiUT
	fOF4pG4GoBsZLK29Hh1IA6J68h1j+XeiUfQzCFUQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4805hfwc5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 09:01:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56M6tfH5004735;
	Tue, 22 Jul 2025 09:01:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 480u8fs8yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 09:01:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56M91olP48365852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jul 2025 09:01:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 623C320043;
	Tue, 22 Jul 2025 09:01:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63BAA20040;
	Tue, 22 Jul 2025 09:01:49 +0000 (GMT)
Received: from 58f794c1ab86 (unknown [9.204.206.122])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Jul 2025 09:01:49 +0000 (GMT)
Date: Tue, 22 Jul 2025 09:01:39 +0000
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        mahesh@linux.ibm.com
Subject: Re: [PATCH] powerpc/eeh: parse AER registers
Message-ID: <olx6uq7sykzc3jyqwhu72ddo6wf33fxjfvkebhwqie25gc5572@dkfsv444nkhn>
Mail-Followup-To: Ganesh Goudar <ganeshgr@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, mahesh@linux.ibm.com
References: <20250703034504.274940-1-ganeshgr@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703034504.274940-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3MSBTYWx0ZWRfX6Y+NA3P97Bfi
 JhKAZ3MmbjGvgWvymz1/WW4dFOaXGPfa43wL+SsE9jcI8mf7g7+NhORCFs0QN9nLvSPdZm/Fp15
 PN8/9U9Rqn1YEhamuwP5zMKy3KAhAHvDKSc/vmVW/M1ni4aD3NbYkkfONYPda9Hqb7EzZqL9Y/D
 FRINu6PTUH7FI1vowRfw4NZehiVi1bcGjSBWEUWC4QvHq1qse1Au9uFH/E7bKmQFTjwQa3s6cU1
 H4IZSPb9dcmtrQULPDl2NtLSQ2d0rI73NGoyz2nVrrDeozveHXbmZT6Ywe8QA+MMwGn4ay76jh8
 /6kFR+V9yJ49jOaBL98Qu5BqDAm2XYCL3eBm1nHfX3cnixAE3rzNbVAh3zOgj6WPc27LoWMZtSm
 RjyhLNUrvBCvVU6R2pXM3T4UrQWyX8ygTUsqY192gDRgQFWk/GwXDtxcxj61T4yAeNTXWqbh
X-Proofpoint-GUID: d-zAAIHE20qnhMkhlQlHnsSk5qrQTw7o
X-Proofpoint-ORIG-GUID: d-zAAIHE20qnhMkhlQlHnsSk5qrQTw7o
X-Authority-Analysis: v=2.4 cv=X9RSKHTe c=1 sm=1 tr=0 ts=687f5383 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=L9vtxf685D2Alsklo1cA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220071
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/07/03 09:15 AM, Ganesh Goudar wrote:
> parse AER uncorrectable and correctable error status
> registers to print error type and severity.
> 
> output looks like
> EEH:AER Uncorrectable Error
> EEH:AER Error Type: Data Link Protocol Error [Fatal]
> 
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh.c | 84 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 83fe99861eb1..03e1e2eeb679 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -139,6 +139,49 @@ struct eeh_stats {
>  
>  static struct eeh_stats eeh_stats;
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
>  static int __init eeh_setup(char *str)
>  {
>  	if (!strcmp(str, "off"))
> @@ -160,6 +203,43 @@ void eeh_show_enabled(void)
>  		pr_info("EEH: No capable adapters found: recovery disabled.\n");
>  }
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
> +	if (!uncor_status && !cor_status)
> +		return;
> +
> +	if (uncor_status) {
> +		pr_err("EEH:AER Uncorrectable Error\n");
> +		for (i = 0; i < ARRAY_SIZE(aer_uncor_errors); i++) {
> +			if (uncor_status & (1 << i)) {
> +				error_type = (i < ARRAY_SIZE(aer_uncor_errors))
> +					     ? aer_uncor_errors[i] : "Unknown";
> +				pr_err("EEH:AER Error Type: %s [%s]\n", error_type,
> +				       (uncor_severity & (1 << i)) ? "Fatal" : "Non-Fatal");
> +			}
> +		}
> +	}
> +
> +	if (cor_status) {
> +		pr_err("EEH:AER Correctable Error\n");
> +		for (i = 0; i < ARRAY_SIZE(aer_cor_errors); i++) {
> +			if (cor_status & (1 << i)) {
> +				error_type = (i < ARRAY_SIZE(aer_cor_errors))
> +					      ? aer_cor_errors[i] : "Unknown";
> +				pr_err("EEH:AER Error Type: %s\n", error_type);
> +			}
> +		}
> +	}
> +}
> +
I think masks are essential to understand which errors are enabled, filtered,
or significant in the given context. Ignoring them could result in misinterpreting
disabled error bits,  producing false positives or unintended error recovery behavior.
Reading and applying the relevant mask when interpreting status values.
Ensuring masked-off bits are either ignored or logged appropriately.

Regards,
Narayana Murty N.
>  /*
>   * This routine captures assorted PCI configuration space data
>   * for the indicated PCI device, and puts them into a buffer
> @@ -237,9 +317,11 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
>  		pr_warn("%s\n", buffer);
>  	}
>  
> -	/* If AER capable, dump it */
> +	/* If AER capable, parse and dump it */
>  	cap = edev->aer_cap;
>  	if (cap) {
> +		eeh_parse_aer_registers(edev, cap);
> +
>  		n += scnprintf(buf+n, len-n, "pci-e AER:\n");
>  		pr_warn("EEH: PCI-E AER capability register set follows:\n");
>  
> -- 
> 2.48.1
> 
> 
> 

