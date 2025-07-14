Return-Path: <linuxppc-dev+bounces-10239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3876BB0349C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 04:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgRY65LBgz3bnx;
	Mon, 14 Jul 2025 12:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752461210;
	cv=none; b=P/83BhfKBhwj1ZFulYiqpiMj7Jfm+Zmq1clbw1+VOnG7q1nrwlV7wc2w6rh181sGo2EOCrNtzGCnejb33VJab1G3glxw6sRlliW6RWlFLY/wcbOOwIh5VIyy6L7x3/9HwdMG/8hSVJevI/R6EqSKZthQ1X5Nd/WVuUtu1bQvI1ob37KzDQFS9qRTSXnu/N5oSRHZ+rBzfH/Q1lgpeMgPf/2sUjc/AYgJTdc7S0ZTVsYQvRJVKImR2cis1BK7xfjn4Wmyr5dxvoschfLAtoLWtmVjpkbL6rkIjB+Y/keCm192CgFvpqUMeVGfnu0inbTWlBKUdOs9Kv30wHYzpOdwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752461210; c=relaxed/relaxed;
	bh=JWfYSIG6I7rVkluKLLqWpmYdSnPexiUt7de1+X95vKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlbqZCkoZWjqN6Rkx3mamja2gxD8Tgl5+GRY9yl6g4cg/ciMxTbbQ7yMjdRpRBtvmEsUH2CqpyljSaHDLqJrUmlyzoXj2/hUOHmjCg8C3fFg+XVKI9p56znQmaQtO9SC1ufuiZuk05pAJvSKjmVqOFAvUNRWNZZgfqe1dpXySxSOHIjnzfUNBxt4alRT5L3pvFyC0zJUx8CpsQVnsVnIuMUarakZbb4xxlOY6QKec7DKVjboaTFdHeLhGT45dgboC+t7S5M8kOmVQG1mlN8WjDTAg432cuB20zt41ANZFrnnKQVb/J+RzdwqPJOLluODhszYlo0pSKkMistKAGuIUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pruja2CJ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pruja2CJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgRY54rhbz3bnm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 12:46:49 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNHoVl026978;
	Mon, 14 Jul 2025 02:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JWfYSI
	G6I7rVkluKLLqWpmYdSnPexiUt7de1+X95vKU=; b=Pruja2CJxc0MnzqChhVvb/
	ZuA53oYN8peSUHjiCHeInFHueTQpDbHTSd7OQ3CYjsG8BHes8NMFh4s366qdCszp
	Nb1CD3FCCKOuOKL1okfjOMFlxFxgq+XXbJjB3WjEbbeZWdIka3bbak7Sb8S4UE3e
	zAADUvZo3c4Tm+GpsC69QMJs57gFMIDfoEtQTwnwdzBe+5n3hWLF/4MDMhHM63AB
	LKn5krCLIRNwz1tDHYvz7Q4Q4vM4rQ68xOnEalyOH3cOhxOUV6IkawIP9St61OjK
	hSx7USa+CGm3PP7boyyt0G3gT6sOkSPs4XIzkx+JLWVvaMk6u2tjbkhIgqJ+hrwQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47uf7cq8dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 02:46:39 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56E2kcuA015642;
	Mon, 14 Jul 2025 02:46:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47uf7cq8cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 02:46:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMcLsE031903;
	Mon, 14 Jul 2025 02:46:06 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47v21tv6ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 02:46:06 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56E2k5aP12649174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jul 2025 02:46:05 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 668A35805B;
	Mon, 14 Jul 2025 02:46:05 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48DF758055;
	Mon, 14 Jul 2025 02:46:00 +0000 (GMT)
Received: from [9.39.29.80] (unknown [9.39.29.80])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Jul 2025 02:45:59 +0000 (GMT)
Message-ID: <926d9ce3-04fc-4055-b5e5-fda8772e3da8@linux.ibm.com>
Date: Mon, 14 Jul 2025 08:15:58 +0530
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
Subject: Re: [PATCH v2 0/3] ioctl numbers list cleanup for
 papr-physical-attestation.h
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Richard Cochran <richardcochran@gmail.com>,
        Haren Myneni <haren@linux.ibm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch <nathanl@linux.ibm.com>
References: <20250714015711.14525-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250714015711.14525-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: txyLKlAusqD86jgsu6Jhws2pezSwcL-B
X-Authority-Analysis: v=2.4 cv=LoGSymdc c=1 sm=1 tr=0 ts=68746f8f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=k9sf4av91IVL3TbTha8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ejVelwgNTWVw-bzXUfSzhnsqVssm4XJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAxNCBTYWx0ZWRfX+49B4kjAte+2 bQC1hgd9dbASOcQGSUWS4i3BCc1CuWkDPqzZLX3g6bkS6joh/jI/tW7kIQpY5FkhHAPSEl5xZdV dolDM6K8gieG3MO7X97M7PFWAybp1Qe1mPpYRUBlW/7ninEmnYYQ8C0fBG9zo8aqmUZJHbXBo6W
 Ef+2nyugMp0AZ/BfylMX+50UiU+pIHWmNoEX2dzvWNYc5plpiVpQa2HrAvz1sYoK0j14/HHfEey ZiF+Po351nfTNx6KELqBCYCQUNl9AhBkPJUPxUEVpW3EaJuRIAGZC+OhPZ90ZUP7bw9vZLaZm3g 8jen2oe1g/fTktvOqVzN4nOSwMr+2vrRxpQiAnOtDw4Hknk308uMn9x5H3JpMvawNNBTASb5rRW
 pWQEm1lN7V7CDpFISPrKa1t/uq5KwmI/4AoaCY+qnH5QgJ3lbV2o1EHhPMPc3ObOD6phaHFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140014
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/14/25 7:27 AM, Bagas Sanjaya wrote:
> Hi,
> 
> This is the cleanup series following up from 03c9d1a5a30d93 ("Documentation:
> Fix description format for powerpc RTAS ioctls"). It is based on docs-next
> tree. The end result should be the same as my previous fixup patch [1].
> 
> Enjoy!
> 

for powerpc changes
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>


> Changes since v1 (RESEND) [2]:
> 
>   * Add Fixes: and Reviewed-by: trailers (Haren)
>   * Expand tabs for uapi/misc/amd-apml.h to match other entries
> 
> Jon: Would you like to apply this series on docs-next or should powerpc
> folks handle it?
> 
> [1]: https://lore.kernel.org/linuxppc-dev/20250429130524.33587-2-bagasdotme@gmail.com/
> [2]: https://lore.kernel.org/lkml/20250708004334.15861-1-bagasdotme@gmail.com/
> 
> Bagas Sanjaya (3):
>   Documentation: ioctl-number: Fix linuxppc-dev mailto link
>   Documentation: ioctl-number: Extend "Include File" column width
>   Documentation: ioctl-number: Correct full path to
>     papr-physical-attestation.h
> 
>  .../userspace-api/ioctl/ioctl-number.rst      | 516 +++++++++---------
>  1 file changed, 258 insertions(+), 258 deletions(-)
> 
> 
> base-commit: f55b3ca3cf1d1652c4b3481b671940461331d69f


