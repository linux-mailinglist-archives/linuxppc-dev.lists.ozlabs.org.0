Return-Path: <linuxppc-dev+bounces-10152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1440AFC299
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 08:23:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbrf45Wvxz2yPd;
	Tue,  8 Jul 2025 16:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751955820;
	cv=none; b=kWmxKyEeJajc/reTe5QOYx+O15a5svWdRI1hKGf6fqwSIXNlZ3kBg8GJW6DYGbSYuJxz2GKdUX86kLgZEzt8htVYBqAPUbOO2ElXMqYKtZU2bSEmhV5Yb5UGoONguNgDwCXb0FBQCvFiKfNFK0ruGOpvMIdXjvJ88VAXoh2VFnOK3wV1V7HpIUFVFQb/4E90ouOvThKahJbkK5GNTT1uDv6g4OHoqOq9QKBx6lhRTSlqna24HNVDOMboe/UqqdSwdSP8Bt4AKj+jpYqzXM05eocuwavmHOxu2xMdxS+F9ESDEUShSucTXwABolKfRFvzBq6mlDepXQFt166Jzzy2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751955820; c=relaxed/relaxed;
	bh=27d2N2kcehk4w68RbhsVF/lLIwUBrQvFZx5hjOjAw8A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=PkJf1YnplSad3jhOGp426inwjyaunlt109I4ISyoNCruPeuQEYheOtmgSJ5oLyBrDE/DVJehdO1O1oTKGA0P3M5Fr3q9W+isynQoEi+lIFgvhhTOxzYbcEucLflRRcJYKJ3Ae7mepjehLCTjIGlKnXQtUOlsLBXgbNtg4qgsJ4mdt/Ei781tNjV01RE1MPdhA/fCQhIcYh5uF+M+b++CwSf1tFxYFSHmhe6yM9BYTJIwIYUk9Zr3oOHzZ2dP1r7lYu2Zy1K0p0u0Nr77NJrTb8jzGep5h7hLUzI7bmJhI69RKf1cGwYmz2CMw2mQeDKitBZVDttKleRA7olmoAQS+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lHXquLBF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lHXquLBF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbrf32Bclz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 16:23:38 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567Kfp0P021381;
	Tue, 8 Jul 2025 06:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=27d2N2
	kcehk4w68RbhsVF/lLIwUBrQvFZx5hjOjAw8A=; b=lHXquLBF0W7+pCQJEWswpw
	7wSS7xX1+lzJapoj8OWMi03UevqU7IgDE/9KxRiA7W4a1f1XcoMH1ArySzFFovrM
	RuXJBTH1MtyGmydsnFkJcIY+C5Frr31f4lnKrL9TgPID0iPB8JNLS79DlT2gvDYL
	ncPAm+R1pOiflA0ArNUEujRvp6WyAdgyHQaksnhaBxu4dhfKcMxm8qMdjSeY4kyx
	TPSSywXUkFGnLEK/6ZAw1Dqtg24GCcoAUawQkfTkR0L3YS6GxvMCHPjLj3dgLME8
	ZclK7wmwqm6ILD4Z4pQ5DbeZxVgiWlLPwjmldTR5UZid7y/FYNlVxBZAtJ907lLQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pusrx1u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:23:35 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5686HFto009812;
	Tue, 8 Jul 2025 06:23:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pusrx1u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:23:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5685iVYu010851;
	Tue, 8 Jul 2025 06:23:33 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qes01sb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:23:33 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5686NWEZ29622886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Jul 2025 06:23:32 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4953658054;
	Tue,  8 Jul 2025 06:23:32 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E6665805C;
	Tue,  8 Jul 2025 06:23:31 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.17.45])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Jul 2025 06:23:31 +0000 (GMT)
Message-ID: <3cdeef45acba94a1ab14e263cbb9764591343059.camel@linux.ibm.com>
Subject: Re: [PATCH RESEND 1/3] Documentation: ioctl-number: Fix
 linuxppc-dev mailto link
From: Haren Myneni <haren@linux.ibm.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
        Linux Documentation
 <linux-doc@vger.kernel.org>,
        Linux PowerPC
 <linuxppc-dev@lists.ozlabs.org>,
        Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Donnellan
 <ajd@linux.ibm.com>
Date: Mon, 07 Jul 2025 23:23:30 -0700
In-Reply-To: <20250708004334.15861-2-bagasdotme@gmail.com>
References: <20250708004334.15861-1-bagasdotme@gmail.com>
	 <20250708004334.15861-2-bagasdotme@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=Vaj3PEp9 c=1 sm=1 tr=0 ts=686cb967 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=zeAeT-1tAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8
 a=LQ58yYyHVLhGKTS_Ew4A:9 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: zCLNcR0GQMB_Subw2ZZKRoKqMPazPFPl
X-Proofpoint-ORIG-GUID: VBcFt9BMzW18KH4Die3Nbbq3iG168bCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0OSBTYWx0ZWRfXwvLmRWYrvP5e 5U70GhTRA4iZ7E9Gyau16t5bAiKVr4cD3Nttkh5lyXXeahQwkLbkd3YDaH65gj9VIuMZkHct3Mp E5jt4JV3qr1jC+4vKxPLVDXVVCDwdPfQh8DDwICHMMK8OWXmtZ4CpVjYwEVo8Ed28K194mrgzJV
 ICdYNO9sDZIcgJ5GCklIq/tiqDWI/wtMS3qoBbVfNoIHPO6lk6TSRwYorzoQc36u0PJprkqls/W t1DNrnJnfQhgXyfH2nHxWxH2SJd6fF0Hmrs9Vq+GEnKLRkpni1RF1Wz3hsY7BvW3PEDhwWB8Egb kZf2AcXDbp/g45h6GliTr1AV4JjoVIg6r2bbJdDCd0Ra3QGfq3OSs0SbpJs6n351VEh/BCM0p/a
 okABGQS4LNtJUqEL3g3jf70RwdaIpAs00uQzxNBRPQFr32cCPXc4cd7hDEQVKc5GgoVHgv6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080049
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-07-08 at 07:43 +0700, Bagas Sanjaya wrote:
> Spell out full Linux PPC mailing list address like other subsystem
> mailing lists listed in the table.
> 
> 
Please also add:
  Fixes: 514f6ff4369a ("powerpc/pseries: Add papr-vpd character driver
for VPD retrieval")
  Fixes: 905b9e48786e ("powerpc/pseries/papr-sysparm: Expose character
device to user space")

Reviewed-by: Haren Myneni <haren@linux.ibm.com>

> Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block
> for papr-indices ioctls")
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump
> character driver for dump retrieval")
> Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for
> physical-attestation RTAS")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst
> b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index bc91756bde733b..a4782e566392c7 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -362,15 +362,15 @@ Code  Seq#    Include
> File                                           Comments
>  0xB1  00-
> 1F                                                          PPPoX
>                                                                      
>  <mailto:mostrows@styx.uwaterloo.ca>
>  0xB2  00     arch/powerpc/include/uapi/asm/papr-
> vpd.h                powerpc/pseries VPD API
> -                                                                    
>  <mailto:linuxppc-dev>
> +                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB2  01-02  arch/powerpc/include/uapi/asm/papr-
> sysparm.h            powerpc/pseries system parameter API
> -                                                                    
>  <mailto:linuxppc-dev>
> +                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB2  03-05  arch/powerpc/include/uapi/asm/papr-
> indices.h            powerpc/pseries indices API
> -                                                                    
>  <mailto:linuxppc-dev>
> +                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-
> dump.h      powerpc/pseries Platform Dump API
> -                                                                    
>  <mailto:linuxppc-dev>
> +                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB2  08     powerpc/include/uapi/asm/papr-physical-
> attestation.h    powerpc/pseries Physical Attestation API
> -                                                                    
>  <mailto:linuxppc-dev>
> +                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB3  00     linux/mmc/ioctl.h
>  0xB4  00-
> 0F  linux/gpio.h                                            <mailto:
> linux-gpio@vger.kernel.org>
>  0xB5  00-
> 0F  uapi/linux/rpmsg.h                                      <mailto:
> linux-remoteproc@vger.kernel.org>


