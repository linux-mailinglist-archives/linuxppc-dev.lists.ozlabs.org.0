Return-Path: <linuxppc-dev+bounces-13795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B591BC35B9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 13:57:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1lhW4lKWz3btC;
	Wed,  5 Nov 2025 23:56:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762347419;
	cv=none; b=Mcs7jN3ZrYMrht8LLqLq7Lvq33niuTpFgT4HP+qxCdqr2dtnP+zsM9lf5NbCtfQjYqvwgeCqa2rrK/zWKxh1bp+9iZJ+JK3hantTEUaX5APEydaROxqWncNNLgxYHZPHqAzO8RVfExb8nS/YtHdsvj1L9jyaEfSO8Cbvo2EwXJed+m+8h2wKAKolm8HnQqoPXgCqU8Cn+wX6anTQHkqxIcIS67tPAx2yICmQlGFBV4giS8iJR/5bRgUdy2x+JCl71O3dyWrVbI9oyM9YB9J7y7ZcYfU6rMosRvk+v5xWKJFt1kWdysZuhLuAbAceE5TL+cH4b4/xa1PjjzP4p7Ebhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762347419; c=relaxed/relaxed;
	bh=rfF8Lvdew6AeZgP1jAJDIjiNUY9T2rz41ibqR1SGGsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjZCRkm1cx00LvohqrFt1qZuF9Eg3201JJY+RT/s3HDw9Hm5TIfvUUGWy52b0wcLwB19GYLilCkPKkISBzV+V9NVGixCf5M0QRBv8HrAq+qnmxihYjMPVSq5lYn+ohU0oRPBPp6swvFF2ky7teW9dyNi34WheRAnfA4oTd/E47ezsGOmQFpKV6ON4uiSL7ziGf/qdvqV7Fk53ZTl2o9LjgGec7+925Zbo2dBJXYvaWpGNrmJghNfpnbU2CBrO665XSBTg/oEDdq0bMrpMLbyZOF3435ITu2LsJMW9rTvel1DSQgTwtOENXzSYpblTOR2Ms7cKFXy9XW1GmX13kqYGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n/UecF4j; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n/UecF4j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1lhV4kJ3z3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 23:56:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5BiENJ016813;
	Wed, 5 Nov 2025 12:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rfF8Lv
	dew6AeZgP1jAJDIjiNUY9T2rz41ibqR1SGGsA=; b=n/UecF4jgt2vk2eFDm3qsY
	wYY1yFriKk85PuujX6JeD3FbnDjBbmNvb11PX1lqmkRgxUXpETI637q2nYEuBypO
	jtd1/xk2PLuJiT/MtGMS6dqPXDK5fX2dM3773TUGD3AFWJtkUglfuEUsKoCP+3zK
	yAbVRO4Clq+Hq76VwuX2QcxPX4zIo7KqDLRrgfbm7EtastVllhGynTbA+7caimYf
	6IcBIAqmWvQ2zvFmFpu3Fr+sr+TF8KJLMgChqkrOfjFhjBs+fG8U8F+xDH/zcSRn
	PckdgVNsp3J6nanA8FyWYwTNtVCvEKiijp+F+e/6bpC2w5uwZZKQEhB7kGPzIggA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59v20vc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 12:56:48 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A5CqlAx010518;
	Wed, 5 Nov 2025 12:56:48 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59v20vc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 12:56:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5CW4Y4009822;
	Wed, 5 Nov 2025 12:56:47 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kg2ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 12:56:47 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A5Cul8t25231930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 12:56:47 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D6D358054;
	Wed,  5 Nov 2025 12:56:47 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2ABE5805D;
	Wed,  5 Nov 2025 12:56:43 +0000 (GMT)
Received: from [9.61.241.252] (unknown [9.61.241.252])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Nov 2025 12:56:43 +0000 (GMT)
Message-ID: <526693da-9947-4874-ac7b-3548403925d6@linux.ibm.com>
Date: Wed, 5 Nov 2025 18:26:41 +0530
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
Subject: Re: [linux-next20251103] Boot Fail on IBM Power Server
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <5fb6199f-7077-45a2-9a54-2ef731d8a606@linux.ibm.com>
 <87seet45z0.ritesh.list@gmail.com> <20251105144506.01ba08c8@canb.auug.org.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20251105144506.01ba08c8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u7uLKll4GlECw2gd8BssjgHiqV1KZIwG
X-Proofpoint-ORIG-GUID: 3SIj0pX1vDi5nSR6Nkwm-e39DCcT_lLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX0hzDNaCa8g7+
 OiYoTkz+MNtlvg8KpCkf90GXoGAY8uxpZtyA39c6rEBrpO4Zp7lF8z6cR+Q665udqgvL2II79Mk
 Zoma/ki6w0I553hgmq0GJOfwoYbKJXvi/lPJNi0v7GPWxd5U/OoX776rASkL8d/6RpiMD/Ewn8E
 yNWnIeh4ZD4e3cew6ix03h6JnyRMD3u4nX/Vn9ploTMu6BfKY7AcuZjiLlQEilljKMltGZ6sEq0
 McqstLt0XvZkCXZfLS80fdngr/yM9nGIGlTZzFGt0PcWuf708EYctYEZP+PSnvMppp/TJIaSaGY
 XlrsWEQtEGisrAn88k1NdXYSuMzFGBuSH1TQ8VHgPKUY9/KuEHMk7GlrIp5nDIXNB9P9F5bsdwN
 6HkY4En+8pyMDyHLdGd4NPaL80sp3Q==
X-Authority-Analysis: v=2.4 cv=H8HWAuYi c=1 sm=1 tr=0 ts=690b4990 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=p5uzZ3Qg-5NE2dxgmsoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 05/11/25 9:15 am, Stephen Rothwell wrote:
> Hi all,
>
> On Wed, 05 Nov 2025 07:04:59 +0530 Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:
>> Since you must have the previous linux-next tag which was working for
>> you - do you think you can git bisect to identify the problem patch
>> (which if reverted boots fine?)
> You are better off bisecting from Linus' tree (which was SHA
> 6146a0f1dfae for next-20251103) to the linux-next tag - assuming that
> Linus' tree is OK.
>
> Also, please cut down on what you quote in replies.


With next-20251105 kernel, this issue is not seen. I am able to boot to 
OS, with out this issue.


Regards,

Venkat.


