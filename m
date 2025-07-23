Return-Path: <linuxppc-dev+bounces-10380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4620B0F18D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 13:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnC7G3BSQz3bkT;
	Wed, 23 Jul 2025 21:47:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753271274;
	cv=none; b=RP/WALQ+rViWXnhqL4VAz9RJ9tLLBONu9Sck7kSNZWoNrszSS61rQTNQdgsr+NkaTzEYxvA7vwcsqXvo6cqYqvukba0BjpEfIEbbzdOBbasOEHCot0p0SWPfO3gKWrBBZL2zbpJWGqmsK7WzUpALk5qI9XTlRwxbgw1oIky6LcplEYDftnTQxANbS9b51Jhki+p766t84QWmIfivliB+i5Mv+cqwydJFftR4rz/woc5+3MNx0Hh0RaoaDwIOvCC8IUm5MqhpULCeF3LwEE0JHp6svAbOm8XXEEQLEAT/4eAmn/4VbzOy/L83m0hxaIWgVlOxi0jkJug0SqJHPpSFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753271274; c=relaxed/relaxed;
	bh=eIyEAdZRh36EldcukgS6BUyXF96IrPz4zaXg8TxPe9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZ/ji8sEImh/a2o8hwUJwhU1Ix/4ScCOKE9kFxLDmW5W4f0Kte6OZNrJ2w4FSZJX3o155WFeJNnZLIVbaRXDA4dLls6T5nEziOUf2MlHlVnqLSK5k3EW8uEppav/J3haHsZ8DofUy8B+4dzJzYA9MSYvwNGP+U7X887LkEQoIXJPegQalSpX43Li2CPjPZRdCTuJulxy/pzYCJ402rVbf4kAg6f/WYCq3aKKarPknrxudp162J8ErupjhQjWDcbr3U0XVt3kDr5cisDmuY+ii4SI53Ioj+lUWq0vCoKtsZloV4d6gxaC+ZZqnfq/LdsTYuvucIOahTqwjI84lk2Ckw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TBLBrCjX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TBLBrCjX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnC7F2xTjz3bjG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 21:47:53 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N5Smoo004873;
	Wed, 23 Jul 2025 11:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eIyEAd
	ZRh36EldcukgS6BUyXF96IrPz4zaXg8TxPe9k=; b=TBLBrCjXSL601Us6jMrKLQ
	tkXqSSeex4myfsBzQaepkc9vjgOxZE6uuuje7hF/NE5rmL8rTouRcqmNOR1mAEdK
	lkwzGUQPRIs2l2LDbuwEGRVTjcNkQDaG+o50JCCxwlmE5INL3DwkGee9UINKMHAs
	AL/uy7P7q97pLe/xczsOybsbn8vnf1sQXIyQg32pS3p+PXbTb+jZe74N5Ybvay2G
	ggFq4HKTIPfcLm5Gc5xxgdE7NwM49MopLVrTjmJ6GYjgUZeMwOe5rhSoe/grPKGz
	cyeDpI8E9feMVDy3Z40sgRhrXU/ZR3V58ayfBbO3Qds7pQugNY6q2KgDhpIShSjg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff4vesm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 11:47:33 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56NBiCRK017838;
	Wed, 23 Jul 2025 11:47:33 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff4vesf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 11:47:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56N7NWqo025138;
	Wed, 23 Jul 2025 11:47:31 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 480nptqtck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 11:47:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56NBlU5w48562432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Jul 2025 11:47:30 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 330C220043;
	Wed, 23 Jul 2025 11:47:30 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F89220040;
	Wed, 23 Jul 2025 11:47:27 +0000 (GMT)
Received: from [9.111.21.101] (unknown [9.111.21.101])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Jul 2025 11:47:26 +0000 (GMT)
Message-ID: <4193678b-6da2-4a26-99d4-f983cccfbfd1@linux.ibm.com>
Date: Wed, 23 Jul 2025 17:17:25 +0530
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
Subject: Re: [PATCH v3 0/6] PowerNV PCIe Hotplug Driver Fixes
To: Timothy Pearson <tpearson@raptorengineering.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        christophe leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Shawn Anastasio <sanastasio@raptorengineering.com>
References: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GrPG7rWcnqgOFLFjMarm7Ds_J6CS3TMf
X-Proofpoint-ORIG-GUID: h4VW4sHEgTYpZiTYtC7FIzCHqBTQx7RE
X-Authority-Analysis: v=2.4 cv=Ae2xH2XG c=1 sm=1 tr=0 ts=6880cbd5 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=OMBMyebMs2Y3HpCz7_AA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5OSBTYWx0ZWRfX/dY45bIcYssF
 g373SHNhGIoOpywHkjY+ZjPyJ5rat9WVtCeER24D07vu9/Sm/ni2CyCQn/6UEbuz0MjW9Gk5e6D
 d7uYU0VUm32YU2QER4LYMK3OSaVgAuXN14Zis7u3EE3Dqha/qW9gxJafjePE64q5v+ZZhng6dDK
 HFtSEgFQmb0OJxvl4RYPt0bi8K41xbo/vvTSoMmyrAvpGqaHQvpb1SjI0fpsGNec5XrFu7RsHwN
 b4aXhH+HWSczEhs6u6X0K0e8hjs3xdBzTrbNdrjsAC/F034o/qW65gMDz2omwjroiqXzzcn0rZ5
 Q/Zeh48m5Z5TeTqXdk/Fuaarp/lrsQZ6WC9GucB1W7NTSiNTOrj1szY0TOjqPKIWWuC+MkFcNBI
 pw2/LzvB7nRaK/y3dda7EXT0TcpjIpa3lbUWnYjJgZu5O0itwzKEN7lQev5txGQJW1AK1CT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=952 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 7/16/25 3:01 AM, Timothy Pearson wrote:
> Hello all,
> 
> This series includes several fixes for bugs in the PowerNV PCIe hotplug
> driver that were discovered in testing with a Microsemi Switchtec PM8533
> PFX 48xG3 PCIe switch on a PowerNV system, as well as one workaround for
> PCIe switches that don't correctly implement slot presence detection
> such as the aforementioned one. Without the workaround, the switch works
> and downstream devices can be hot-unplugged, but the devices never come
> back online after being plugged in again until the system is rebooted.
> Other hotplug drivers (like pciehp_hpc) use a similar workaround.
> 
> Also included are fixes for the EEH driver to make it hotplug safe,
> and a small patch to enable all three attention indicator states per
> the PCIe specification.
> 
> Thanks,
> 
> Shawn Anastasio (2):
>    PCI: pnv_php: Properly clean up allocated IRQs on unplug
>    PCI: pnv_php: Work around switches with broken presence detection
> 
> Timothy Pearson (4):
>    powerpc/eeh: Export eeh_unfreeze_pe()
>    powerpc/eeh: Make EEH driver device hotplug safe
>    PCI: pnv_php: Fix surprise plug detection and recovery
>    PCI: pnv_php: Enable third attention indicator state
> 
>   arch/powerpc/kernel/eeh.c         |   1 +
>   arch/powerpc/kernel/eeh_driver.c  |  48 ++++--
>   arch/powerpc/kernel/eeh_pe.c      |  10 +-
>   arch/powerpc/kernel/pci-hotplug.c |   3 +
>   drivers/pci/hotplug/pnv_php.c     | 244 +++++++++++++++++++++++++++---
>   5 files changed, 263 insertions(+), 43 deletions(-)
> 
Tested the patch series for EEH and hotplug on powernv, recovery is 
working as expected, EEH changes looks good to me.
Tested-by: Ganesh Goudar <ganeshgr@linux.ibm.com>

Thanks
Ganesh

