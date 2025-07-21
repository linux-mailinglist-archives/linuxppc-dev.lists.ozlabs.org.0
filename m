Return-Path: <linuxppc-dev+bounces-10333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FF3B0BBAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 06:12:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bln6844PYz3bgX;
	Mon, 21 Jul 2025 14:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753071120;
	cv=none; b=XiNZkFM8zvVrhkMFOfO42PFHNEfhIjVhHOpavCCFkWBNEr2t3PBCjoJnWOMUoCZlqCouz+PxYuxBsW4vyca5Dos1DGPpM0vO/IEVUYoLrfP7PeNPP+Gtcfpl8eggW9/5rK+BOCZfBdgw8EMHhCJzvW/ZtabTXmqv9eI2NkHV6UETea9eYmyLa7zGMAhdJSjff61Koi04tsqROCX0c9K/ZIReUSd9O+rzVZ+mx7SUxfH4//mtpcEeWdyk+hJ3nn7RxhJG64bULFV4Y1tVx5fc3/IVDg9Ik2q6XtYk6kcLC4l3fv4U0HYR4qe2RXMN3YUQcebcuPYIFEdq9oIHdJXa+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753071120; c=relaxed/relaxed;
	bh=fx8qCKOo6dfEwGE+L0a9n59Ih7ZF1hprQZsiImo96AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT+JVj6KTJpsDGeDJDFGans0H5DAGWdYtFmZK3nyCU46qTmzIylk5MTjeXtzVKx309oGCXFqM0i58oDbu8jLbuxFkmbfCN3MvClbLDXXkKl5bpTlnuRszQlt+JF+H4JqhII/m6IaaVhWsX6ORVKZ1k+k/5metMe02aBqXFYsxPz5ryBNEDy5JqCLIeJtGV4l4/ZmYBLLhL5prqp6j05OKpEburtKgpN8/E4rNNyAsGtoV6Tr8ZWlfKyJ6tZaNnjF9K6OwMcIZP2trzczRgvTPRZuC1x4dr1ePmV3FKNxal1L3ZC2q621ZM4zPq8Bm0fc+KIVnVl0xicj80JmAo0fTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZnjT2ITd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZnjT2ITd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bln6723Z4z2yfx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 14:11:58 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KLLNtb028037;
	Mon, 21 Jul 2025 04:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=fx8qCKOo6dfEwGE+L0a9n
	59Ih7ZF1hprQZsiImo96AE=; b=ZnjT2ITdEffgLF3qOom213L/mI4W7OZmMzKFI
	09H2fwh6Uxmsb6OTuAHpNzk8rnQy7qq/tL4X0Y2shrqrItAnvlqANODp3Vwia4fW
	NkUU2wBF9OG7YYYh6yq8GmLdAPJX00+0lNr6PB4U9JUaMAh/V7SwlR+IZ0zm3cAf
	2UGG9/ptS2qeNNvHtSsz4pzTb5nee8oLSVz75LABu8usPemQCUbdOpUNL7hBQSbX
	MSFUjvxLMgOEnGxj4laLdoLyuVtUzMFADfB6WayE0T5kymH//K58hlypCpzY+EO4
	VR8vrKcXBj+HIpFY8U6T3WdYzzod74Ys/xmeuPiRVoA9BzTww==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48069v6jed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 04:11:49 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56L3Z4Ia005457;
	Mon, 21 Jul 2025 04:11:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 480tvqkmv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 04:11:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56L4BiIX48234980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 04:11:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1A7B20043;
	Mon, 21 Jul 2025 04:11:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D28120040;
	Mon, 21 Jul 2025 04:11:43 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.249.184])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 21 Jul 2025 04:11:43 +0000 (GMT)
Date: Mon, 21 Jul 2025 09:41:40 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/eeh: parse AER registers
Message-ID: <zo23ugy7g5f64mt2plq7jo7yqvcumiewchjzosifssuc5ip7er@y7xwezyyqppp>
Reply-To: mahesh@linux.ibm.com
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
X-Authority-Analysis: v=2.4 cv=QLdoRhLL c=1 sm=1 tr=0 ts=687dbe05 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=L9vtxf685D2Alsklo1cA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDAzMiBTYWx0ZWRfXxkPMKVkY48pE
 nRTw2W8jIlfAFRpe11WBfP1UcClVzyc1Lacf999RO2nT7LkyJIYybvvQGWFXXw74mYU46NMxFie
 mVKfhUHX5+TLLrO+eG+Rbvo5xLYTqSxofKmp6WEy3orPJFyMOX177jUX7wcvF9PJadRB2nVDr6I
 p1nNSglS0s671CM72kTyP4iSmqlIka8PjOA6Mk3/WYdfE41PWGDEH0+UW/v1k32s3X7e9oVM5Jb
 n0SAs7rS0ZBRzVVMvXNxL7R6wxhLza613tfg473f4jXA7VYwDjaBf+OZUw5S8BQsQ9CiG1w9Mqc
 1pT+FduI8IfcDDSvsrrqeSkKn8FcvqfsNeMajW8S7GIElfENcw4apXshUucvvgEyl/r/k6t/9ho
 eS37vnNNGsrEl4/6Uhly7mxxxtNOtvQ1HK/yS0vCI2OPELh9OUDI2qTpsYd19sGjVM4rR2kU
X-Proofpoint-ORIG-GUID: aljhRT2TPSP5SNc6soK6fPAKTTrPCJOH
X-Proofpoint-GUID: aljhRT2TPSP5SNc6soK6fPAKTTrPCJOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-07-03 09:15:04 Thu, Ganesh Goudar wrote:
> parse AER uncorrectable and correctable error status
> registers to print error type and severity.
> 
> output looks like
> EEH:AER Uncorrectable Error
> EEH:AER Error Type: Data Link Protocol Error [Fatal]

Thanks for working on this. But how do we know which PHB this error is
reported on ? Can we have PHB details as prefix in the error message ?

Also, can we have Error message format something like below ?

0000:50:00.0: PCIe Bus Error: severity=Uncorrected (Fatal), type=Transaction Layer, id=0500(Requester ID)

Thanks,
-Mahesh.

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

-- 
Mahesh J Salgaonkar

