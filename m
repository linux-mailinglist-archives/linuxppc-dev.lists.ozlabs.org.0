Return-Path: <linuxppc-dev+bounces-10131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FAAAFAC39
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 08:54:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbFMZ39Hxz2yQH;
	Mon,  7 Jul 2025 16:54:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751871242;
	cv=none; b=jj8ISFI2v81HxZJw8zlJaXM/czfyV1P6/jkzmNVZJ9vzESupbAyzgf1+6eGqlAvS5xomIgPYRGMEn1813lmnAd1UCLhHbauEXfCq6zJPT9zWD81fsYOLGMiZpbDeiX/VQRMvIrBtfWq/Jl8GvBHrKGidB5N5zGi27V1hyIqX4MvHN8Ac8lz3Ee+7c5GYDouegU5DHuxL5azQ2A49CLYeFx9SfTvTEVz+2FOXOxTfpifxOHSrJocWeo5vu2OTjGdL2M9SxMBNFqEe6CPp7UQfDWFsc+hZDLdNbmWjfEpk+fDGPHa6wTky4GPQbUvH8jLYeM/8XwKZqoFwdQrPnhdo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751871242; c=relaxed/relaxed;
	bh=KPMntHS6gs/6bjAHUDqmY9k5/p5ddj/162/mtVQDGZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=J8QrToVCOxn2Mjn5Sz2+4+8bW199V9UnSitissqvIohcWnx/D4lwgkbCZC6dk4kGb2Ul4UiQLur+ZU8eTQ5TjhxWJpoUr502ZMi0BZPgwQZnXZ0pgNVF4wpZSUBvsSv3rKBMkRNgzsC3YpTC3Vdnky2C7XydEJoDYByN8/mfq5+Qs7f0Rv2K9bMmPKdAODAebhYSki61gmjQIcN+hZXGTD3xBtgbIJMbYPGmRFTsgqliTLY9Lr0B7lsFoCtKzA44q5P77uWsRnQcabYTfHExPfT/DI9pero33dHXWqfZtv30qKoWOpj1j2Fi2cN662/q8MnpQe5yq7gGfSZCTqUkmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iZ0oT0WH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iZ0oT0WH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbFMY18tFz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 16:54:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566LtYUZ020427;
	Mon, 7 Jul 2025 06:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KPMntH
	S6gs/6bjAHUDqmY9k5/p5ddj/162/mtVQDGZ4=; b=iZ0oT0WH56jS3ZWdBkOBPK
	JY9A5WfxCzKqxmHqoq79jtrJ820RO1gLoV2/HLDM9BzfQ4HiuHV/rfXfgXxB5agF
	Sv9s67yNzGoprMuCrDTKnvUc1GEaoj0royVzwY8eSrYoPd7wbiF6DSX2hapu7GD9
	Fol9QTzzUiH5TcVMLQTJy7LGFwVspNj+Fz/guZOmHC0X7tQgsDB/GREk6oZ9RNV9
	JNCda2ZxYhUXuqKnrQC3/7sfb4iPwYT77SNTXgGoWxxv/aWTO9bdXmecBGdue9HA
	curwfOOD5H68a0n9ZeDRDcQtVhrweG2xwodP1U9vRx9dW+dunYd45PskIKIwoz+w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47ptfyfnvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 06:53:49 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5676lfkc014240;
	Mon, 7 Jul 2025 06:53:48 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47ptfyfnvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 06:53:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5674fBQg002847;
	Mon, 7 Jul 2025 06:53:48 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfvm4s6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 06:53:48 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5676rj1326804750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 06:53:46 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E1E158056;
	Mon,  7 Jul 2025 06:53:45 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BC1958045;
	Mon,  7 Jul 2025 06:53:44 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.17.45])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 06:53:44 +0000 (GMT)
Message-ID: <63fca7415789098240700fc19a78b88f4fb5ca70.camel@linux.ibm.com>
Subject: Re: [PATCH RFC 3/9] powerpc/pseries: Add papr-hvpipe char driver
 for HVPIPE interfaces
From: Haren Myneni <haren@linux.ibm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Sun, 06 Jul 2025 23:53:38 -0700
In-Reply-To: <6ce5e5d2-0e6c-47a7-b1c8-7e03372c62bb@kernel.org>
References: <20250702221444.879256-1-haren@linux.ibm.com>
	 <20250702221444.879256-4-haren@linux.ibm.com>
	 <6ce5e5d2-0e6c-47a7-b1c8-7e03372c62bb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=crubk04i c=1 sm=1 tr=0 ts=686b6efd cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Ex6ADwCMHP9FVH_B8aMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wXgQ5SS7dz6ypHXh9Vx19_Pjye0I6ELb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAzNyBTYWx0ZWRfX8YW12Ma2P3Ly 4QZMFejusVRImkWhZWMggpsxelGhOyLTdpgIPBzF7M9hMWdygf9p7nWGLmsHXMm6ykZFjP2DtaL 5HR9v4CKiIik3I2omohjgUPr7i2LqJBvaegGzaAaeShuLn+LzXznZcWiQYMvVoPBiSrARxXXCqC
 L0HBcr6vkm0vEsh2Nu8JA6MS5QihUhXftxc40kZ7ZnSbPQ4aqZHdCvXybqSxZb60KUt29mXsNvC 7sgfk/ZQMmpprFre22qV2AJkkYls1+ZkVR0jcBZVKEfJWmlnIvLFzMWA4DdUfTZaxq2tfQrFicT aSzGrl9ns5mxFhEWRO6+PWst5vVuLbq8ffxubB6NTRSAoapfR3lg6gtye6fjTS3IfMkXarcb9R9
 SvUtlE2mK4uQEfFajDXhjJANqxXgGW2gSHo2KhJrYHbTSKVM1RRUB/Q9xsbld8IIVBlfdvcl
X-Proofpoint-GUID: dzARsTrLjYLQdWmkrNGpEj6kHHgNOtYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=920
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070037
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-07-03 at 08:58 +0200, Krzysztof Kozlowski wrote:
> On 03/07/2025 00:14, Haren Myneni wrote:
> > +static struct miscdevice papr_hvpipe_dev = {
> > +	.minor	=	MISC_DYNAMIC_MINOR,
> > +	.name	=	"papr-hvpipe",
> > +	.fops	=	&papr_hvpipe_ops,
> > +};
> > +
> > +static int __init papr_hvpipe_init(void)
> > +{
> > +	int ret;
> > +
> > +	if (!of_find_property(rtas.dev, "ibm,hypervisor-pipe-capable",
> 
> Where did you document the ABI? Anyway, so you just run it on x86 and
> every other arch? Why you cannot use proper devices and device driver
> matching/binding?

HVPIPE is a new feature and is docucmented in new version of PAPR.  
This feature is available only on powerpc and not applicable to other
archs. Following the same interfaces available in the existing misc
driver code for RTAS calls such as ibm,get/set-system-parameter (papr-
sysparm.c), ibm,get-indices, ibm,get-dynamic-sensor (papr-indices.c)
and etc. 

> 
> 
> > +		NULL))
> > +		return -ENODEV;
> 
> Totally odd wrapping.
> 
> > +
> > +	if (!rtas_function_implemented(RTAS_FN_IBM_SEND_HVPIPE_MSG) ||
> > +		!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_M
> > SG))
> 
> Odd alignment.

I did test with checkpatch and did not notices any issues. Also seeing
with proper tab spaces. Will check again.

Thanks for your comments.
Haren

> 
> > +		return -ENODEV;
> > +
> > +	ret = misc_register(&papr_hvpipe_dev);
> > +	if (ret) {
> > +		pr_err("misc-dev registration failed %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> Best regards,
> Krzysztof


