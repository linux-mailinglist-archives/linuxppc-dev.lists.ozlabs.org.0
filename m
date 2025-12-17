Return-Path: <linuxppc-dev+bounces-14831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E2CC6046
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 06:14:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWMQy2PXkz2yft;
	Wed, 17 Dec 2025 16:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765948442;
	cv=none; b=UKn84BFcj1znUw7Y7vOJ6FMIesRl9lMpFp8Y5wLtSxsaxAlK8ubdu/cboDm37jEjm20bgz1MlXJfaH8SzoKL+fYSgySdZp4yIXZaP3Iri3JpfJN7UQ/PDCYXQMktVriPautxumj8XNSguJVuM73cS0fWEQmjnfcuIJZzIRNK7AgCLEWfzBdwGh9DgkCyhguRQ1fYfkxR8m37e5x5uKfAYP4Ziy5wb2RvhX3G1HAJjPUdJsDcawaVvtMdv11rrdXQY1Jd5fxedqoKr4ZKP9C3sjxm3QqUY8rMDJiSPMogGp+oqKsXcAXjw/djBha1M9GwDbQxHsk2XoYV2Im7YfTOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765948442; c=relaxed/relaxed;
	bh=A4WDSMZ1C3SaU7AOGVp5yj7ltERnkRNiYPqSRB35fng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpdU7v+n+vTvcQ2PKazeNuxopTNjUTCVTppE9aKyHenspFRcCes5qv9lO7+01Mh7FqOnLkiGIEUDmbIcwUTeQ3ulhbFdoQa8tGZpVRDbZnX7F5OENavJFqJOeNDHdrB297GD74Xv2i5D4JAUkwD8fTlDY9vL72DKIWpYmQLApMhzE9rC3UExFtOj5JRh6GV36AMFPKhFKxYxb6hoqIly9l+NfF2KsWqUcoy91uxh+03nzsS4+VlAfWOm2Jn8D3Geq8Ox9RNePLNBcH1ouRulOuAtnwfbNhrhJ2/k07DzObdSA0pZVpcW+YxQgAb3lpszGqjkHGENs6OJnHsS/pxeYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ivTvT2gD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ivTvT2gD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWMQx3LQbz2ydn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 16:14:01 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGIfqkH012199;
	Wed, 17 Dec 2025 05:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=A4WDSM
	Z1C3SaU7AOGVp5yj7ltERnkRNiYPqSRB35fng=; b=ivTvT2gD7+yXz+Zf8nQiYV
	ox4sJpBOJSsqr9iqLv7e3biC/ygEiCLnirCqwIV9Tr1ClrkhUo5j+cIRB17iVF6O
	kMqwAEY61YtcdbCBcNcmMcwu/dOGRkoMf68jDm/0gFKGL7//HkKhQnmWlf8XSR5m
	OfgYSfWNaU970Rr8sdE7jY16unoNwExOzogJimf0ESZL9gDJwNXBz7DjsGuPGQxp
	RR9DG1dMHl7mg1oc+RKZ99HW+pP2Z0C/CSYEiSQM097kwIHe7uhtokuFXCHZUVB7
	v27OYYbvjRrzT9a68Eg/j+kK7LJm2kVaW6MdOKwS75BNxrwxcBrBCC9yMXzRPRmQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvb282-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:13:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BH5Al56017182;
	Wed, 17 Dec 2025 05:13:28 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvb27y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:13:27 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH1DeHZ026753;
	Wed, 17 Dec 2025 05:13:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfsgsbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:13:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BH5DNUq55247274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 05:13:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34F6F20043;
	Wed, 17 Dec 2025 05:13:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BE1620040;
	Wed, 17 Dec 2025 05:13:19 +0000 (GMT)
Received: from [9.109.222.214] (unknown [9.109.222.214])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 05:13:19 +0000 (GMT)
Message-ID: <aca5ed6d-8d39-4968-aef2-d5ab6c8cfb60@linux.ibm.com>
Date: Wed, 17 Dec 2025 10:43:18 +0530
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
Subject: Re: [PATCH bpf-next v4 0/2] powerpc64/bpf: Inline helper in powerpc
 JIT
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, sachinpb@linux.ibm.com,
        venkat88@linux.ibm.com, andrii@kernel.org, eddyz87@gmail.com,
        ast@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev,
        song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
        jolsa@kernel.org, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
References: <cover.1765343385.git.skb99@linux.ibm.com>
 <CAEf4BzbiyJwSoaSRDtSRetze-yST-NQX83FyECSmRex9szx0NQ@mail.gmail.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAEf4BzbiyJwSoaSRDtSRetze-yST-NQX83FyECSmRex9szx0NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX4RvWgSemv5lB
 pQRx301Z4RvzN1dMa/TrSYZZbVLKLj1PbYeFm5KydyopzmunVaUmxvSDTJw0JtwZ/Dayqc6oNee
 h5F5qIlOGoRs78gljeNUeD4c9REAR0N4XBRzSrfJopjaVQxPquWf2I92vBMdZOzx+dx9C4+Ybby
 1LaI1iwxgyDI9EMEVKtDn8FpnHrY9J4rMpd+ptJ/xkmZbAKGtsVGAjOg64MWobc3uycY3Sn+oOx
 OKdwAjcZhjzdnXk8MzYVLNHJhrD7jMNRsmcNGVarg/15cwga7fxTAe7QA3tEMv+a8GQYhrAgCan
 LGweJeb3TTzqTlC6m9DRaSty3IV/cgwGhCZDHsFLvQuuO5i2moYdZmSdOchvGeTq801pf7ZDbMq
 AuBe0EWdZ42WG9+oqROpmfKtwZfcPw==
X-Proofpoint-ORIG-GUID: 6WpgZuMtsvuhqxth8Cqbgu9sRG6J5xtW
X-Authority-Analysis: v=2.4 cv=QtRTHFyd c=1 sm=1 tr=0 ts=69423bf8 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=KN6hZ7hgYJA-1HVgs7wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bLkxCxGXIlSNBlcq817jJKV-Oy5h1Sd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 16/12/25 11:46 pm, Andrii Nakryiko wrote:
> On Tue, Dec 9, 2025 at 10:51 PM Saket Kumar Bhaskar <skb99@linux.ibm.com> wrote:
>>
>> This series add support for internal only per-CPU instructions,
>> inlines the bpf_get_smp_processor_id() and bpf_get_current_task()
>> helper calls for powerpc BPF JIT.
>>
> 
> This is marked for bpf-next tree, but I think this should actually go
> through ppc64-specific tree, is that right?

Yeah.
Maddy, can you pick it via powerpc tree?

- Hari

