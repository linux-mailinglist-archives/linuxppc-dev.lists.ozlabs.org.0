Return-Path: <linuxppc-dev+bounces-8675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E171ABC6D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 20:07:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1QdX680Vz2yk3;
	Tue, 20 May 2025 04:07:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747678064;
	cv=none; b=jKjFU2NRk6YANdpSrKQRYDhKckk5rZQKdzUANsgh18bL9AsEf3KCzXPzKeVH79kq+6syraZLK3/rUl6usZTAxJn8/hYV0pwHhqzGbVCm38O/w2RyCHLQbYW8c+aRadTAjwLB8SgdKy9UGuCWJUXa1zjnnNKJGQOgHDgDUwsbw32K7i2SVoqadcyDMbmOAuHcVn9A8+JFH56c5RYAOB4rnOpLBLkCKrkp9/KXlkJU9pQcUNnAtQJrNXUsUd+HXg2H5Yny4qf3S3b4OuRWib2cTZOjB8PKsD70Ftv62baoFbgy/eHrkbMuCvi5aCZL6CyuOtmmClOWlrwo84mt/qtB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747678064; c=relaxed/relaxed;
	bh=ynTozMTkisgWm7nLVFPVfSuICeiaDry/u5m5nFTRhCQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=WsTb+ohveIBs+cIddaJZwhIrKrGbOPXDA2U1Pia+/JyvoRvxXSTJvP6ZqpXD3JkOBMCgHqtP+AU0wW2LX3DqxOqPlyH9cZo5SkSkgr07mVb4mf4xRs/XmSbehJhJDcv2vOwYZpETV8dhjTqCgzsrRO3+bvcQcplhOf6L8SC4CNCRsCWEhXg/Kznqt2PMjNxZ94tVbL2yhdvuMTgFud+2/6Jkmeaoe5Zd8v84+QwwoRT/t9L7To0Ci6zYhla7tZQUas0NCaTXw+evCr/vfRJsuqw015Xt89n8A2CwnsOXKJS4oOPSMImMdm2n3Y7OuUBNnLO50Pf7hO/Jc43DH+owSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hse0VHlA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hse0VHlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1QdS1WWNz2ydv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 04:07:39 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JFQ9vj031505;
	Mon, 19 May 2025 18:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ynTozM
	TkisgWm7nLVFPVfSuICeiaDry/u5m5nFTRhCQ=; b=hse0VHlAxrCKal/Re3pBAL
	fGX8SVKxGOvJJeoYmqzR+U9C7FU4NVHRFV9YhLzvGRAdlf5W+E9ESXRXxPbHMNBg
	fFSQvF0ghDD6paDP+h3NPIS6FvWzTABC+PwATUidobKKkiCWPHDXwex98k99SgsC
	m1yDQ0SrwPxT+hjBf4UzIxdDfpDeQjyqvwoKWmbf8ZqpI/LvurFrA4wTjh+vdSU6
	MB8JdEkaZu/uQ04pD/7KV4nXRGZ+GNozdzGv2NGPbfDyW4061/nMXo3S0BEaTY8k
	oYYXT7D9UDo2OgP27KAWG+jsuy1dIl2/gRU23bfgU6aUXq3oTH3p205udLl06NJA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46qn68na0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 18:07:18 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54JHxlmK008758;
	Mon, 19 May 2025 18:07:17 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46qn68na09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 18:07:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54JHBDZj030098;
	Mon, 19 May 2025 18:07:16 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q55yr334-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 18:07:16 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54JI7F0T20841104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 18:07:15 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D25A58055;
	Mon, 19 May 2025 18:07:15 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45AF558043;
	Mon, 19 May 2025 18:07:14 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 May 2025 18:07:14 +0000 (GMT)
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
Date: Mon, 19 May 2025 23:37:13 +0530
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Ritesh Harjani <riteshh@linux.ibm.com>, yosry.ahmed@linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG][powerpc] OOPs: Kernel access of bad area during zram swap
 write - kswapd0 crash
In-Reply-To: <6r6hex7p53bsbaje4u7so7tfsz6jemazerzujzraibiah7eq4b@m5vgjaff2cdz>
References: <89bfdedb74416156423d36d28c5b92e9@linux.ibm.com>
 <87ldrujhr5.fsf@gmail.com> <3374b7cf6a68364c389a260d7ec9067f@linux.ibm.com>
 <6r6hex7p53bsbaje4u7so7tfsz6jemazerzujzraibiah7eq4b@m5vgjaff2cdz>
Message-ID: <29cec5ca090a1b833c6a68d103ef9e15@linux.ibm.com>
X-Sender: misanjum@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _fj80Oq0bAsyCG92_EMOzTZw27KKKfMK
X-Proofpoint-GUID: 6tsfe39TkC4xcpBIw-_ajd4QhVuq24I7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2MyBTYWx0ZWRfX9Cs51r9TPd0d nksTwKvgORZ7YCfcoEDvqeI6EImOm0pshn79iq7bqdeYeb8MbHh23469hQT++X9YK3jB75eVX37 j1x4v03fK1hXutqI+YVVdouU0N2QIHHY5/R1ZVIK7XwPJ7eNrRmwK89A9EGXdK7tbUts254L+X5
 zJazLoL6vVz6PZ//4dwV9VKy+a34AT5sLIq37mKwvjM3S9rJdlMGR0nAxXoyJ1q4lkJ3M1E+Bl4 rYC11ZaKNnGpP5IJA5xcTBrcbhyMuDVrYSMM13A5hMTX37xernd92PFKBu/2nducXp+3BdxkQdZ x7qnRlOhICzRKibqbMd3G3x8DRu8DwCHV8LyGFKH9jIlk2TcQ/MERV/+YmjDJZoMyigoX/afY0R
 uaZuxnwhW+G9C79vvp0QaioI3Cc5BbtlMqDhjDOEDJWp2DNUIIbPtqRd2lf9owIP7Br8yZMa
X-Authority-Analysis: v=2.4 cv=CN4qXQrD c=1 sm=1 tr=0 ts=682b7356 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=JK2cp3ES9FE06y1yGSoA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190163
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-07 06:03, Sergey Senozhatsky wrote:
> Hi,
> 
> On (25/05/06 11:09), Misbah Anjum N wrote:
>> I am facing this issue even with the latest kernel: 
>> 6.15.0-rc4-g5721cf0b9352
>> The suspecting commit is: 44f76413496ec343da0d8292ceecdcabe3e6ec16. 
>> The
>> commit introduces zs_obj_write() function.
>> Link: 
>> https://github.com/torvalds/linux/commit/44f76413496ec343da0d8292ceecdcabe3e6ec16
> 
> Can you try the following fix
> https://lore.kernel.org/linux-mm/20250504110650.2783619-1-senozhatsky@chromium.org

Hi,

Thank you for the patch. I can confirm that it resolves the issue. After 
applying it, the kernel panic no longer occurs during memory reclaim 
with in my KVM guest testing environment. The Avocado-VT functional 
tests now complete successfully.

Patch:
Author: Sergey Senozhatsky <senozhatsky@chromium.org>
Date:   Sun May 4 20:00:22 2025 +0900
     zsmalloc: don't underflow size calculation in zs_obj_write()

Thank You,
Misbah Anjum N

