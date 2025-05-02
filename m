Return-Path: <linuxppc-dev+bounces-8254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1149AA6F7C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 12:23:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpn7k529mz30Sx;
	Fri,  2 May 2025 20:23:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746181410;
	cv=none; b=DSrTKXHLY49j25qyROh+JedBtKJa4btGy5+0cYifEh1aYl5+/gXrRBaXwSdMnzQXDCO90LXvmlS9QaSlRg/jBjpQKMxEx14+YdTl+HI5H1yvVurHawWWhtcPkZCENZLQsgBroq+ARm0K5+zgAy4t8pEVvogb3Rq96HolHF9tE/n2JtkXz870hjwRToGzpjl76dSZ5HHiloBMKwmLml1hahjGMBmh7p5MltY7qGR3M9pvSM+ZEPrhX7vKfqYonIat0j5X0GrDnMA4dHTfXQ3wNa4PkfJhAnGXXVdEcjtsj++BMINfAQQSapc33DrtsFUM3/QdEoZO1tIJKjXgUM6Vzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746181410; c=relaxed/relaxed;
	bh=SvHt+Gs5+EwOXc1jmESNukrEKZoiBJPCUSYST4ZNA+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=flQsWvdNwk2QJhxubls1miyZUor9S3Vas05GKqQiMIt/8fuHpPAGiHST+zB6I7vKY9rI1K5oW56rpnph2bIhsl+0Stp55YlGbPU+4edxT9I7bnsrKNrAGm1rSI/9E0AWvBFrEAhBOfM8WadFkMzi3E1I+kKfn/7NaJDvkEDiyzmwTKp1cVvUtgbFF6R+9sqyM3dlv+iPsB3uKSF7gWK01Wv3jm/Po/R75Awlc05JSGfwrbtc8WQWfMKe+inKYGguwIRhuT3e0d/BdPIr1ilUwO2HJIO7amLi7FDJHECikH1H6B3iT077LxiOVfTuludRndvhOOxBvRTR8a0qOZW7Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FsgsEPmO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FsgsEPmO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zpn7j2BGTz2yr1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 20:23:28 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542A48uI029952
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 May 2025 10:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SvHt+G
	s5+EwOXc1jmESNukrEKZoiBJPCUSYST4ZNA+Y=; b=FsgsEPmOpipiFTyJY7vTHa
	H4bvH1IzMkrqJEHRe6XZkqpagy0v4hjFdx7wgDWgGQXXIicjg/vdmGQ5GZ8/XJR5
	ELOOALTfcuD3zPEYe+/jj8ZaMg2U72qw9+8DGCjg8XeiAKEaCz73wBx2ry4pmMY0
	x2aYc8cR68142ufZsQV7fHKO8PNNzgSFCtM9b61Mnd/iyABcobQP6O8IJb8l0yOG
	DoW3ZvUlgJKArBR4H8WIsNF5YM6QPcDHLOD0USVBx6O7keuu7y9Pn95LQx22q81b
	ZPWoDjcDXcg3SR62FT7Z6MHKMZ+ATDgwwmqK1S2mOkNEw0cwsNzyO6lXaVQ9rO9w
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46cuyk826j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 10:23:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54289SiH024679
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 May 2025 10:23:25 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1mh4w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 10:23:25 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 542ANOJj22479270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 10:23:24 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2347E58055;
	Fri,  2 May 2025 10:23:24 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A77915804B;
	Fri,  2 May 2025 10:23:22 +0000 (GMT)
Received: from [9.67.80.176] (unknown [9.67.80.176])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 10:23:22 +0000 (GMT)
Message-ID: <2f1f7944-2ae7-442c-8f13-bfff8e9537ea@linux.ibm.com>
Date: Fri, 2 May 2025 15:53:20 +0530
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
Subject: Re: [PATCH] powerpc/iommu: Memory leak in TCE table userspace view
To: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com
References: <20250425170806.28987-1-gbatra@linux.ibm.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20250425170806.28987-1-gbatra@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3wnvWlas9RXv6FE_1PZ1jeHgXpKLWJoK
X-Proofpoint-ORIG-GUID: 3wnvWlas9RXv6FE_1PZ1jeHgXpKLWJoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3OSBTYWx0ZWRfX3jrq6tSE4LMw eiGh+AjJKYNwKxgSRM0MhjMfFkA0m17qCG9VVSSeEYmspb0Yu15AmSTWOJYnClywxpSL5kjOnU4 aPrw1rXEgo5KM/3iSIhUFgKws4CO1ZmMhNoz9FPUhcApth48b/k/YgSngQSRvnsvcqo7W4UC+br
 B87rbBb/R9e7qRsyyje5lN4W5NW2siNoAR4XV0Fp4Y4ny2ABceA4BJy1ogkSDYG/c4+3re7UV5L 29kRTkU5gUFD6EIqNW9TXz1N4Ff6K0XiCIYjssLdIQeByCI1OI0L8cp2Q3MSAkBY2zwb6EV2Aim HPsUR3+m4TfWQVUjK8y5bYiolOFwlGLZHcCqukelpuQzoUWGdW4a9eXkbJsb2gDHSpIDb18UDyV
 Y6TRH1P8rL/+Z1BhKSGIS6jMCXWlKL5DLC10Ajkise+bTIjM84g00cgHTf+cgdUVQgpdgoDJ
X-Authority-Analysis: v=2.4 cv=KYTSsRYD c=1 sm=1 tr=0 ts=68149d1e cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=Ah8gUyinYM48IxedlHcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=740 spamscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/25/25 10:38 PM, Gaurav Batra wrote:
> When a device is opened by a userspace driver, via VFIO interface, DMA
> window is created. This DMA window has TCE Table and a corresponding
> data for userview of
> TCE table.

nitpick: Please consider folding the above line into the previous one.
Otherwise, changes look good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>


