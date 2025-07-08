Return-Path: <linuxppc-dev+bounces-10154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC05AFC2AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 08:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbrjf3Hjkz30Wg;
	Tue,  8 Jul 2025 16:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751956006;
	cv=none; b=R6uVIHKOXx2KjM/ph97FDQ5lfo+KyUELNF3BRNSFmolPX0tg+Vxxqd9wgJdoTv7mInz4U9k8XmIGtkcqFP8zQPszNpWbLRtZll59jv0lZiHnZqLQXpVe6KzXn3cdnoj5mjgP9DhbYHrvYnGjTG0TWoMat9Fkl7DW5U67jQSGsKZfvjrqENKEjjW33swoU7BOvVpccz0Nhgi7l56B5Ps4leisAG/A9DdBSANiXr35fpEoU99PZSQw1m7d/VdRCpTBn3iOKFzpao4WG74lR5/zhg4j2Wt4brr0dKWWBpqQ4O7r2ITfpXGXuVhOzMMGMb/X7GDe936kT3t5Mxz2qHpRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751956006; c=relaxed/relaxed;
	bh=95B6nmOZhs41YLJzGGh7gsDTK3Rq+wV3/J1ifgX3eGw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=ghQ++02AO1T/xeoROu4FDDusUzBrfSvUSQhEyBXtVRmp9Bzm2vnawiOqqa5zCUD4EFv8+pnfEMDCGlV/VoakRNhAEtW9XkLYgvkLGlrX3iDUj9qePA50bW2Dx7IOHqn2JM8eBPs0jepDYZ8qHryKMzP51GnyCxq/R/G4W+ishpsEqcNOsdoWmzZ2/NTBkmX5WWf9JICtkE0182QLH6XLThJcWETZyBgnq22fgBkzjQ7fymjvRfPQnisXOIqzNQfiKthWxoA9fiMDiAaQZlIKTj94iLT/o0rd8vlbcIF399rNunU32TBhffF1bbF6ncdwDGmkL8NKR+Ai0zf5hgnTWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ruwe0gLd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ruwe0gLd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbrjZ3YlJz30WX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 16:26:42 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567KuAg6019426;
	Tue, 8 Jul 2025 06:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=95B6nm
	OZhs41YLJzGGh7gsDTK3Rq+wV3/J1ifgX3eGw=; b=Ruwe0gLdfM2V/EncgOHWyr
	oIlCHRG6lyHYMRipOOWBBDFmhB6NTIfq0ZZZOoFU9TnKlaYw8KTgmahEOXgTs32A
	RpNLzyQyQ8YFrDqq9C9EtMQIcVeLiJOyZzfPPsWPRPXML2gkepFtxGmkw5ZPBDHt
	+VpZlbCIuUyAO8tv5lEUq2AHKUGPR0DiQpxNr/4g+iOiGoYz3JMPu9mw9mvGUX8i
	xcwBvxVPQ6eJoCF8m9zo7Ib0apBvoSSS1fM8FoD7DCrFWkvpyeFAgCokfVeKtJmW
	AlAHNjRwnirqPgjrSwKv3KQieBTLNQJOPWIsYi6cf2xpdG6HMyfHdhF6dRfwZfYA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6x0gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:26:39 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5686PRxG020729;
	Tue, 8 Jul 2025 06:26:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6x0gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:26:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 568666XW025642;
	Tue, 8 Jul 2025 06:26:37 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfcp1p2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:26:37 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5686QZOA17826494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Jul 2025 06:26:36 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D219858055;
	Tue,  8 Jul 2025 06:26:35 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 994E258059;
	Tue,  8 Jul 2025 06:26:34 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.17.45])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Jul 2025 06:26:34 +0000 (GMT)
Message-ID: <2e8c3947bc66ccaab0298fe7cffa50d4c56c480d.camel@linux.ibm.com>
Subject: Re: [PATCH RESEND 2/3] Documentation: ioctl-number: Extend "Include
 File" column width
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
Date: Mon, 07 Jul 2025 23:26:33 -0700
In-Reply-To: <20250708004334.15861-3-bagasdotme@gmail.com>
References: <20250708004334.15861-1-bagasdotme@gmail.com>
	 <20250708004334.15861-3-bagasdotme@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0OSBTYWx0ZWRfX4s3cm0Bk9MMt wVUvyzxRdn2UZgz9QjSmOkwWrhLehNQ/ly3f7toRcABv2OEMo6KVPSQUNA9JYMlJimC0TweFjoa GukSWY4VRkWBux15AScLIeM0vXmH2qEuUkLDSyoiLsoynY1MDWwYcDlYCWrnlw91f5S9UzrxDay
 dEm2N/BOS2Klp/HqgcUOauJSu8tiS0CI3t7Abn8qcTlVHaS/LunfQogJUZWUStAasM8XX24UAQA yNvWflbdneSGAiytyUybr0+133wdiukWzIT6T//Ca8fD2G0P/Q0GhZrIFIFPRU7nkQSQNQNnVFf oJSe0ZJhxZz0+DHqN9//nRpdMyCX74cxAWu1rccZYKfYy1S/RdtOWlP35lnAZ4tU8C7oz6J/YQA
 u41iP9K3sVwPKPzShbY1nuYdE7RJoSAJw8VLxa9Cg0UCqc2wNhiOvXkulE0RMUoGZNikQHhd
X-Proofpoint-GUID: PmK-S7frV0B8kU7erVnf-lfjzbpn10Rp
X-Proofpoint-ORIG-GUID: gb7inFMyiFrZJ0awZvIBmUGJovaMClYX
X-Authority-Analysis: v=2.4 cv=W/M4VQWk c=1 sm=1 tr=0 ts=686cba1f cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=FP58Ms26AAAA:8 a=VwQbUJbxAAAA:8 a=36Qj4kvwAAAA:8 a=xqzR1eaSAAAA:8 a=a4NEJbfMAAAA:8
 a=TkLiO6tdAAAA:8 a=NEAV23lmAAAA:8 a=wTc3cHO5AAAA:8 a=Ju1OUx4FAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=QyXUC8HyAAAA:8 a=6X-EevrwAAAA:8 a=YMHlrSWeAAAA:8 a=ag1SF4gXAAAA:8 a=br60VIFoAAAA:8 a=EF7ItLl7AAAA:8 a=59Bnr_R2AAAA:8 a=p-73RYD4AAAA:8 a=84BadPHTAAAA:8
 a=Tty9oNO6AAAA:8 a=zeAeT-1tAAAA:8 a=voM4FWlXAAAA:8 a=6rqHouBjAAAA:8 a=WgJYcGVQAAAA:8 a=7d_E57ReAAAA:8 a=zd2uoN0lAAAA:8 a=exuBxD9bwyyYef2Fa88A:9 a=QEXdDO2ut3YA:10 a=a8RXOGDryFMA:10 a=UklWUE76AaA7xuxiX2K1:22 a=dV6nhpJrT-yxOfsl7Uss:22
 a=j5HedEgV9xmj0QdrFjqv:22 a=baavZ0Ln-j307LZ-0_7C:22 a=w5lJx-D4kpZreUpx7M4u:22 a=57Y-CfXW99XzLu2jE1FU:22 a=PDd2vrKq2XUAlGmJVEUY:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HrzLPDwhB63SKwEyWadd:22 a=KzV_IjdM9kfMg8rc9Rf7:22 a=AGiTiUxUTAVOEnAwzyD-:22
 a=jXqu7Ew5HFkvi6pE3bB5:22 a=Bts-Es6F1CBXvF7u4C_G:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080049
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-07-08 at 07:43 +0700, Bagas Sanjaya wrote:
> Extend width of "Include File" column to fit full path to
> papr-physical-attestation.h in later commit.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Haren Myneni <haren@linux.ibm.com>

> ---
>  .../userspace-api/ioctl/ioctl-number.rst      | 516 +++++++++-------
> --
>  1 file changed, 258 insertions(+), 258 deletions(-)
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst
> b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index a4782e566392c7..b45f5d857a00b6 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -65,345 +65,345 @@ Following this convention is good because:
>  This table lists ioctls visible from userland, excluding ones from
>  drivers/staging/.
>  
> -====  =====  =======================================================
> ================================================================
> -Code  Seq#    Include
> File                                           Comments
> +====  =====  =======================================================
> == ================================================================
> +Code  Seq#    Include
> File                                             Comments
>        (hex)
> -====  =====  =======================================================
> ================================================================
> -0x00  00-
> 1F  linux/fs.h                                              conflict!
> -0x00  00-
> 1F  scsi/scsi_ioctl.h                                       conflict!
> -0x00  00-
> 1F  linux/fb.h                                              conflict!
> -0x00  00-
> 1F  linux/wavefront.h                                       conflict!
> +====  =====  =======================================================
> == ================================================================
> +0x00  00-
> 1F  linux/fs.h                                                conflic
> t!
> +0x00  00-
> 1F  scsi/scsi_ioctl.h                                         conflic
> t!
> +0x00  00-
> 1F  linux/fb.h                                                conflic
> t!
> +0x00  00-
> 1F  linux/wavefront.h                                         conflic
> t!
>  0x02  all    linux/fd.h
>  0x03  all    linux/hdreg.h
> -0x04  D2-
> DC  linux/umsdos_fs.h                                       Dead
> since 2.6.11, but don't reuse these.
> +0x04  D2-
> DC  linux/umsdos_fs.h                                         Dead
> since 2.6.11, but don't reuse these.
>  0x06  all    linux/lp.h
>  0x07  9F-D0  linux/vmw_vmci_defs.h, uapi/linux/vm_sockets.h
>  0x09  all    linux/raid/md_u.h
>  0x10  00-0F  drivers/char/s390/vmcp.h
>  0x10  10-1F  arch/s390/include/uapi/sclp_ctl.h
>  0x10  20-2F  arch/s390/include/uapi/asm/hypfs.h
> -0x12  all    linux/fs.h                                             
>  BLK* ioctls
> +0x12  all    linux/fs.h                                             
>    BLK* ioctls
>               linux/blkpg.h
>               linux/blkzoned.h
>               linux/blk-crypto.h
> -0x15  all    linux/fs.h                                             
>  FS_IOC_* ioctls
> -0x1b  all                                                           
>  InfiniBand Subsystem
> -                                                                    
>  <http://infiniband.sourceforge.net/>
> +0x15  all    linux/fs.h                                             
>    FS_IOC_* ioctls
> +0x1b  all                                                           
>    InfiniBand Subsystem
> +                                                                    
>    <http://infiniband.sourceforge.net/>
>  0x20  all    drivers/cdrom/cm206.h
>  0x22  all    scsi/sg.h
> -0x3E  00-
> 0F  linux/counter.h                                         <mailto:
> linux-iio@vger.kernel.org>
> +0x3E  00-
> 0F  linux/counter.h                                           <mailto
> :linux-iio@vger.kernel.org>
>  '!'   00-1F  uapi/linux/seccomp.h
> -'#'   00-
> 3F                                                          IEEE 1394
> Subsystem
> -                                                                    
>  Block for the entire subsystem
> +'#'   00-
> 3F                                                            IEEE
> 1394 Subsystem
> +                                                                    
>    Block for the entire subsystem
>  '$'   00-0F  linux/perf_counter.h, linux/perf_event.h
> -'%'   00-
> 0F  include/uapi/linux/stm.h                                System
> Trace Module subsystem
> -                                                                    
>  <mailto:alexander.shishkin@linux.intel.com>
> +'%'   00-
> 0F  include/uapi/linux/stm.h                                  System
> Trace Module subsystem
> +                                                                    
>    <mailto:alexander.shishkin@linux.intel.com>
>  '&'   00-07  drivers/firewire/nosy-user.h
> -'*'   00-
> 1F  uapi/linux/user_events.h                                User
> Events Subsystem
> -                                                                    
>  <mailto:linux-trace-kernel@vger.kernel.org>
> -'1'   00-
> 1F  linux/timepps.h                                         PPS kit
> from Ulrich Windl
> -                                                                    
>  <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
> +'*'   00-
> 1F  uapi/linux/user_events.h                                  User
> Events Subsystem
> +                                                                    
>    <mailto:linux-trace-kernel@vger.kernel.org>
> +'1'   00-
> 1F  linux/timepps.h                                           PPS kit
> from Ulrich Windl
> +                                                                    
>    <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
>  '2'   01-04  linux/i2o.h
> -'3'   00-
> 0F  drivers/s390/char/raw3270.h                             conflict!
> -'3'   00-
> 1F  linux/suspend_ioctls.h,                                 conflict!
> +'3'   00-
> 0F  drivers/s390/char/raw3270.h                               conflic
> t!
> +'3'   00-
> 1F  linux/suspend_ioctls.h,                                   conflic
> t!
>               kernel/power/user.c
> -'8'   all                                                           
>  SNP8023 advanced NIC card
> -                                                                    
>  <mailto:mcr@solidum.com>
> +'8'   all                                                           
>    SNP8023 advanced NIC card
> +                                                                    
>    <mailto:mcr@solidum.com>
>  ';'   64-7F  linux/vfio.h
>  ';'   80-FF  linux/iommufd.h
> -'='   00-
> 3f  uapi/linux/ptp_clock.h                                  <mailto:
> richardcochran@gmail.com>
> -'@'   00-
> 0F  linux/radeonfb.h                                        conflict!
> -'@'   00-
> 0F  drivers/video/aty/aty128fb.c                            conflict!
> -'A'   00-
> 1F  linux/apm_bios.h                                        conflict!
> -'A'   00-
> 0F  linux/agpgart.h,                                        conflict!
> +'='   00-
> 3f  uapi/linux/ptp_clock.h                                    <mailto
> :richardcochran@gmail.com>
> +'@'   00-
> 0F  linux/radeonfb.h                                          conflic
> t!
> +'@'   00-
> 0F  drivers/video/aty/aty128fb.c                              conflic
> t!
> +'A'   00-
> 1F  linux/apm_bios.h                                          conflic
> t!
> +'A'   00-
> 0F  linux/agpgart.h,                                          conflic
> t!
>               drivers/char/agp/compat_ioctl.h
> -'A'   00-
> 7F  sound/asound.h                                          conflict!
> -'B'   00-
> 1F  linux/cciss_ioctl.h                                     conflict!
> -'B'   00-
> 0F  include/linux/pmu.h                                     conflict!
> -'B'   C0-FF  advanced
> bbus                                           <mailto:
> maassen@uni-freiburg.de>
> -'B'   00-
> 0F  xen/xenbus_dev.h                                        conflict!
> -'C'   all    linux/soundcard.h                                      
>  conflict!
> -'C'   01-
> 2F  linux/capi.h                                            conflict!
> -'C'   F0-
> FF  drivers/net/wan/cosa.h                                  conflict!
> +'A'   00-
> 7F  sound/asound.h                                            conflic
> t!
> +'B'   00-
> 1F  linux/cciss_ioctl.h                                       conflic
> t!
> +'B'   00-
> 0F  include/linux/pmu.h                                       conflic
> t!
> +'B'   C0-FF  advanced
> bbus                                             <mailto:
> maassen@uni-freiburg.de>
> +'B'   00-
> 0F  xen/xenbus_dev.h                                          conflic
> t!
> +'C'   all    linux/soundcard.h                                      
>    conflict!
> +'C'   01-
> 2F  linux/capi.h                                              conflic
> t!
> +'C'   F0-
> FF  drivers/net/wan/cosa.h                                    conflic
> t!
>  'D'   all    arch/s390/include/asm/dasd.h
> -'D'   40-
> 5F  drivers/scsi/dpt/dtpi_ioctl.h                           Dead
> since 2022
> +'D'   40-
> 5F  drivers/scsi/dpt/dtpi_ioctl.h                             Dead
> since 2022
>  'D'   05     drivers/scsi/pmcraid.h
> -'E'   all    linux/input.h                                          
>  conflict!
> -'E'   00-
> 0F  xen/evtchn.h                                            conflict!
> -'F'   all    linux/fb.h                                             
>  conflict!
> -'F'   01-
> 02  drivers/scsi/pmcraid.h                                  conflict!
> -'F'   20     drivers/video/fsl-diu-
> fb.h                              conflict!
> -'F'   20     linux/ivtvfb.h                                         
>  conflict!
> -'F'   20     linux/matroxfb.h                                       
>  conflict!
> -'F'   20     drivers/video/aty/atyfb_base.c                         
>  conflict!
> -'F'   00-0F  video/da8xx-
> fb.h                                        conflict!
> -'F'   80-
> 8F  linux/arcfb.h                                           conflict!
> -'F'   DD     video/sstfb.h                                          
>  conflict!
> -'G'   00-3F  drivers/misc/sgi-
> gru/grulib.h                           conflict!
> -'G'   00-0F  xen/gntalloc.h,
> xen/gntdev.h                            conflict!
> -'H'   00-
> 7F  linux/hiddev.h                                          conflict!
> -'H'   00-
> 0F  linux/hidraw.h                                          conflict!
> -'H'   01     linux/mei.h                                            
>  conflict!
> -'H'   02     linux/mei.h                                            
>  conflict!
> -'H'   03     linux/mei.h                                            
>  conflict!
> -'H'   00-
> 0F  sound/asound.h                                          conflict!
> -'H'   20-
> 40  sound/asound_fm.h                                       conflict!
> -'H'   80-
> 8F  sound/sfnt_info.h                                       conflict!
> -'H'   10-
> 8F  sound/emu10k1.h                                         conflict!
> -'H'   10-
> 1F  sound/sb16_csp.h                                        conflict!
> -'H'   10-
> 1F  sound/hda_hwdep.h                                       conflict!
> -'H'   40-
> 4F  sound/hdspm.h                                           conflict!
> -'H'   40-
> 4F  sound/hdsp.h                                            conflict!
> +'E'   all    linux/input.h                                          
>    conflict!
> +'E'   00-
> 0F  xen/evtchn.h                                              conflic
> t!
> +'F'   all    linux/fb.h                                             
>    conflict!
> +'F'   01-
> 02  drivers/scsi/pmcraid.h                                    conflic
> t!
> +'F'   20     drivers/video/fsl-diu-
> fb.h                                conflict!
> +'F'   20     linux/ivtvfb.h                                         
>    conflict!
> +'F'   20     linux/matroxfb.h                                       
>    conflict!
> +'F'   20     drivers/video/aty/atyfb_base.c                         
>    conflict!
> +'F'   00-0F  video/da8xx-
> fb.h                                          conflict!
> +'F'   80-
> 8F  linux/arcfb.h                                             conflic
> t!
> +'F'   DD     video/sstfb.h                                          
>    conflict!
> +'G'   00-3F  drivers/misc/sgi-
> gru/grulib.h                             conflict!
> +'G'   00-0F  xen/gntalloc.h,
> xen/gntdev.h                              conflict!
> +'H'   00-
> 7F  linux/hiddev.h                                            conflic
> t!
> +'H'   00-
> 0F  linux/hidraw.h                                            conflic
> t!
> +'H'   01     linux/mei.h                                            
>    conflict!
> +'H'   02     linux/mei.h                                            
>    conflict!
> +'H'   03     linux/mei.h                                            
>    conflict!
> +'H'   00-
> 0F  sound/asound.h                                            conflic
> t!
> +'H'   20-
> 40  sound/asound_fm.h                                         conflic
> t!
> +'H'   80-
> 8F  sound/sfnt_info.h                                         conflic
> t!
> +'H'   10-
> 8F  sound/emu10k1.h                                           conflic
> t!
> +'H'   10-
> 1F  sound/sb16_csp.h                                          conflic
> t!
> +'H'   10-
> 1F  sound/hda_hwdep.h                                         conflic
> t!
> +'H'   40-
> 4F  sound/hdspm.h                                             conflic
> t!
> +'H'   40-
> 4F  sound/hdsp.h                                              conflic
> t!
>  'H'   90     sound/usb/usx2y/usb_stream.h
> -'H'   00-
> 0F  uapi/misc/habanalabs.h                                  conflict!
> +'H'   00-
> 0F  uapi/misc/habanalabs.h                                    conflic
> t!
>  'H'   A0     uapi/linux/usb/cdc-wdm.h
> -'H'   C0-
> F0  net/bluetooth/hci.h                                     conflict!
> -'H'   C0-
> DF  net/bluetooth/hidp/hidp.h                               conflict!
> -'H'   C0-
> DF  net/bluetooth/cmtp/cmtp.h                               conflict!
> -'H'   C0-
> DF  net/bluetooth/bnep/bnep.h                               conflict!
> -'H'   F1     linux/hid-
> roccat.h                                      <mailto:
> erazor_de@users.sourceforge.net>
> +'H'   C0-
> F0  net/bluetooth/hci.h                                       conflic
> t!
> +'H'   C0-
> DF  net/bluetooth/hidp/hidp.h                                 conflic
> t!
> +'H'   C0-
> DF  net/bluetooth/cmtp/cmtp.h                                 conflic
> t!
> +'H'   C0-
> DF  net/bluetooth/bnep/bnep.h                                 conflic
> t!
> +'H'   F1     linux/hid-
> roccat.h                                        <mailto:
> erazor_de@users.sourceforge.net>
>  'H'   F8-FA  sound/firewire.h
> -'I'   all    linux/isdn.h                                           
>  conflict!
> -'I'   00-
> 0F  drivers/isdn/divert/isdn_divert.h                       conflict!
> -'I'   40-
> 4F  linux/mISDNif.h                                         conflict!
> +'I'   all    linux/isdn.h                                           
>    conflict!
> +'I'   00-
> 0F  drivers/isdn/divert/isdn_divert.h                         conflic
> t!
> +'I'   40-
> 4F  linux/mISDNif.h                                           conflic
> t!
>  'K'   all    linux/kd.h
> -'L'   00-
> 1F  linux/loop.h                                            conflict!
> -'L'   10-
> 1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                      conflict!
> -'L'   E0-
> FF  linux/ppdd.h                                            encrypted
> disk device driver
> -                                                                    
>  <http://linux01.gwdg.de/~alatham/ppdd.html>
> -'M'   all    linux/soundcard.h                                      
>  conflict!
> -'M'   01-16  mtd/mtd-
> abi.h                                           conflict!
> +'L'   00-
> 1F  linux/loop.h                                              conflic
> t!
> +'L'   10-
> 1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                        conflic
> t!
> +'L'   E0-
> FF  linux/ppdd.h                                              encrypt
> ed disk device driver
> +                                                                    
>    <http://linux01.gwdg.de/~alatham/ppdd.html>
> +'M'   all    linux/soundcard.h                                      
>    conflict!
> +'M'   01-16  mtd/mtd-
> abi.h                                             conflict!
>        and    drivers/mtd/mtdchar.c
>  'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
> -'M'   00-0F  drivers/video/fsl-diu-
> fb.h                              conflict!
> +'M'   00-0F  drivers/video/fsl-diu-
> fb.h                                conflict!
>  'N'   00-1F  drivers/usb/scanner.h
>  'N'   40-7F  drivers/block/nvme.c
> -'N'   80-
> 8F  uapi/linux/ntsync.h                                     NT
> synchronization primitives
> -                                                                    
>  <mailto:wine-devel@winehq.org>
> -'O'   00-06  mtd/ubi-
> user.h                                          UBI
> -'P'   all    linux/soundcard.h                                      
>  conflict!
> -'P'   60-
> 6F  sound/sscape_ioctl.h                                    conflict!
> -'P'   00-
> 0F  drivers/usb/class/usblp.c                               conflict!
> -'P'   01-
> 09  drivers/misc/pci_endpoint_test.c                        conflict!
> -'P'   00-
> 0F  xen/privcmd.h                                           conflict!
> -'P'   00-
> 05  linux/tps6594_pfsm.h                                    conflict!
> +'N'   80-
> 8F  uapi/linux/ntsync.h                                       NT
> synchronization primitives
> +                                                                    
>    <mailto:wine-devel@winehq.org>
> +'O'   00-06  mtd/ubi-
> user.h                                            UBI
> +'P'   all    linux/soundcard.h                                      
>    conflict!
> +'P'   60-
> 6F  sound/sscape_ioctl.h                                      conflic
> t!
> +'P'   00-
> 0F  drivers/usb/class/usblp.c                                 conflic
> t!
> +'P'   01-
> 09  drivers/misc/pci_endpoint_test.c                          conflic
> t!
> +'P'   00-
> 0F  xen/privcmd.h                                             conflic
> t!
> +'P'   00-
> 05  linux/tps6594_pfsm.h                                      conflic
> t!
>  'Q'   all    linux/soundcard.h
> -'R'   00-
> 1F  linux/random.h                                          conflict!
> -'R'   01     linux/rfkill.h                                         
>  conflict!
> +'R'   00-
> 1F  linux/random.h                                            conflic
> t!
> +'R'   01     linux/rfkill.h                                         
>    conflict!
>  'R'   20-2F  linux/trace_mmap.h
>  'R'   C0-DF  net/bluetooth/rfcomm.h
>  'R'   E0     uapi/linux/fsl_mc.h
> -'S'   all    linux/cdrom.h                                          
>  conflict!
> -'S'   80-
> 81  scsi/scsi_ioctl.h                                       conflict!
> -'S'   82-
> FF  scsi/scsi.h                                             conflict!
> -'S'   00-
> 7F  sound/asequencer.h                                      conflict!
> -'T'   all    linux/soundcard.h                                      
>  conflict!
> -'T'   00-
> AF  sound/asound.h                                          conflict!
> -'T'   all    arch/x86/include/asm/ioctls.h                          
>  conflict!
> -'T'   C0-
> DF  linux/if_tun.h                                          conflict!
> -'U'   all    sound/asound.h                                         
>  conflict!
> -'U'   00-
> CF  linux/uinput.h                                          conflict!
> +'S'   all    linux/cdrom.h                                          
>    conflict!
> +'S'   80-
> 81  scsi/scsi_ioctl.h                                         conflic
> t!
> +'S'   82-
> FF  scsi/scsi.h                                               conflic
> t!
> +'S'   00-
> 7F  sound/asequencer.h                                        conflic
> t!
> +'T'   all    linux/soundcard.h                                      
>    conflict!
> +'T'   00-
> AF  sound/asound.h                                            conflic
> t!
> +'T'   all    arch/x86/include/asm/ioctls.h                          
>    conflict!
> +'T'   C0-
> DF  linux/if_tun.h                                            conflic
> t!
> +'U'   all    sound/asound.h                                         
>    conflict!
> +'U'   00-
> CF  linux/uinput.h                                            conflic
> t!
>  'U'   00-EF  linux/usbdevice_fs.h
>  'U'   C0-CF  drivers/bluetooth/hci_uart.h
> -'V'   all    linux/vt.h                                             
>  conflict!
> -'V'   all    linux/videodev2.h                                      
>  conflict!
> -'V'   C0     linux/ivtvfb.h                                         
>  conflict!
> -'V'   C0     linux/ivtv.h                                           
>  conflict!
> -'V'   C0     media/si4713.h                                         
>  conflict!
> -'W'   00-
> 1F  linux/watchdog.h                                        conflict!
> -'W'   00-
> 1F  linux/wanrouter.h                                       conflict!
> (pre 3.9)
> -'W'   00-
> 3F  sound/asound.h                                          conflict!
> +'V'   all    linux/vt.h                                             
>    conflict!
> +'V'   all    linux/videodev2.h                                      
>    conflict!
> +'V'   C0     linux/ivtvfb.h                                         
>    conflict!
> +'V'   C0     linux/ivtv.h                                           
>    conflict!
> +'V'   C0     media/si4713.h                                         
>    conflict!
> +'W'   00-
> 1F  linux/watchdog.h                                          conflic
> t!
> +'W'   00-
> 1F  linux/wanrouter.h                                         conflic
> t! (pre 3.9)
> +'W'   00-
> 3F  sound/asound.h                                            conflic
> t!
>  'W'   40-5F  drivers/pci/switch/switchtec.c
>  'W'   60-61  linux/watch_queue.h
> -'X'   all    fs/xfs/xfs_fs.h,                                       
>  conflict!
> +'X'   all    fs/xfs/xfs_fs.h,                                       
>    conflict!
>               fs/xfs/linux-2.6/xfs_ioctl32.h,
>               include/linux/falloc.h,
>               linux/fs.h,
> -'X'   all    fs/ocfs2/ocfs_fs.h                                     
>  conflict!
> -'X'   01     linux/pktcdvd.h                                        
>  conflict!
> +'X'   all    fs/ocfs2/ocfs_fs.h                                     
>    conflict!
> +'X'   01     linux/pktcdvd.h                                        
>    conflict!
>  'Z'   14-15  drivers/message/fusion/mptctl.h
> -'['   00-
> 3F  linux/usb/tmc.h                                         USB Test
> and Measurement Devices
> -                                                                    
>  <mailto:gregkh@linuxfoundation.org>
> -'a'   all    linux/atm*.h,
> linux/sonet.h                             ATM on linux
> -                                                                    
>  <http://lrcwww.epfl.ch/>
> -'a'   00-
> 0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          conflict!
> qat driver
> -'b'   00-
> FF                                                          conflict!
> bit3 vme host bridge
> -                                                                    
>  <mailto:natalia@nikhefk.nikhef.nl>
> -'b'   00-0F  linux/dma-
> buf.h                                         conflict!
> -'c'   00-
> 7F  linux/comstats.h                                        conflict!
> -'c'   00-
> 7F  linux/coda.h                                            conflict!
> -'c'   00-
> 1F  linux/chio.h                                            conflict!
> -'c'   80-
> 9F  arch/s390/include/asm/chsc.h                            conflict!
> +'['   00-
> 3F  linux/usb/tmc.h                                           USB
> Test and Measurement Devices
> +                                                                    
>    <mailto:gregkh@linuxfoundation.org>
> +'a'   all    linux/atm*.h,
> linux/sonet.h                               ATM on linux
> +                                                                    
>    <http://lrcwww.epfl.ch/>
> +'a'   00-
> 0F  drivers/crypto/qat/qat_common/adf_cfg_common.h            conflic
> t! qat driver
> +'b'   00-
> FF                                                            conflic
> t! bit3 vme host bridge
> +                                                                    
>    <mailto:natalia@nikhefk.nikhef.nl>
> +'b'   00-0F  linux/dma-
> buf.h                                           conflict!
> +'c'   00-
> 7F  linux/comstats.h                                          conflic
> t!
> +'c'   00-
> 7F  linux/coda.h                                              conflic
> t!
> +'c'   00-
> 1F  linux/chio.h                                              conflic
> t!
> +'c'   80-
> 9F  arch/s390/include/asm/chsc.h                              conflic
> t!
>  'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
> -'d'   00-
> FF  linux/char/drm/drm.h                                    conflict!
> -'d'   02-
> 40  pcmcia/ds.h                                             conflict!
> +'d'   00-
> FF  linux/char/drm/drm.h                                      conflic
> t!
> +'d'   02-
> 40  pcmcia/ds.h                                               conflic
> t!
>  'd'   F0-FF  linux/digi1.h
> -'e'   all    linux/digi1.h                                          
>  conflict!
> -'f'   00-
> 1F  linux/ext2_fs.h                                         conflict!
> -'f'   00-
> 1F  linux/ext3_fs.h                                         conflict!
> -'f'   00-
> 0F  fs/jfs/jfs_dinode.h                                     conflict!
> -'f'   00-
> 0F  fs/ext4/ext4.h                                          conflict!
> -'f'   00-
> 0F  linux/fs.h                                              conflict!
> -'f'   00-
> 0F  fs/ocfs2/ocfs2_fs.h                                     conflict!
> +'e'   all    linux/digi1.h                                          
>    conflict!
> +'f'   00-
> 1F  linux/ext2_fs.h                                           conflic
> t!
> +'f'   00-
> 1F  linux/ext3_fs.h                                           conflic
> t!
> +'f'   00-
> 0F  fs/jfs/jfs_dinode.h                                       conflic
> t!
> +'f'   00-
> 0F  fs/ext4/ext4.h                                            conflic
> t!
> +'f'   00-
> 0F  linux/fs.h                                                conflic
> t!
> +'f'   00-
> 0F  fs/ocfs2/ocfs2_fs.h                                       conflic
> t!
>  'f'   13-27  linux/fscrypt.h
>  'f'   81-8F  linux/fsverity.h
>  'g'   00-0F  linux/usb/gadgetfs.h
>  'g'   20-2F  linux/usb/g_printer.h
> -'h'   00-
> 7F                                                          conflict!
> Charon filesystem
> -                                                                    
>  <mailto:zapman@interlan.net>
> -'h'   00-
> 1F  linux/hpet.h                                            conflict!
> +'h'   00-
> 7F                                                            conflic
> t! Charon filesystem
> +                                                                    
>    <mailto:zapman@interlan.net>
> +'h'   00-
> 1F  linux/hpet.h                                              conflic
> t!
>  'h'   80-8F  fs/hfsplus/ioctl.c
> -'i'   00-3F  linux/i2o-
> dev.h                                         conflict!
> -'i'   0B-
> 1F  linux/ipmi.h                                            conflict!
> +'i'   00-3F  linux/i2o-
> dev.h                                           conflict!
> +'i'   0B-
> 1F  linux/ipmi.h                                              conflic
> t!
>  'i'   80-8F  linux/i8k.h
> -'i'   90-
> 9F  `linux/iio/*.h`                                         IIO
> +'i'   90-
> 9F  `linux/iio/*.h`                                           IIO
>  'j'   00-3F  linux/joystick.h
> -'k'   00-
> 0F  linux/spi/spidev.h                                      conflict!
> -'k'   00-
> 05  video/kyro.h                                            conflict!
> -'k'   10-
> 17  linux/hsi/hsi_char.h                                    HSI
> character device
> -'l'   00-
> 3F  linux/tcfs_fs.h                                         transpare
> nt cryptographic file system
> -                                                                    
>  <http://web.archive.org/web/%2A/http://mikonos.dia.unisa.it/tcfs>
> -'l'   40-
> 7F  linux/udf_fs_i.h                                        in
> development:
> -                                                                    
>  <https://github.com/pali/udftools>
> -'m'   00-
> 09  linux/mmtimer.h                                         conflict!
> -'m'   all    linux/mtio.h                                           
>  conflict!
> -'m'   all    linux/soundcard.h                                      
>  conflict!
> -'m'   all    linux/synclink.h                                       
>  conflict!
> -'m'   00-
> 19  drivers/message/fusion/mptctl.h                         conflict!
> -'m'   00     drivers/scsi/megaraid/megaraid_ioctl.h                 
>  conflict!
> +'k'   00-
> 0F  linux/spi/spidev.h                                        conflic
> t!
> +'k'   00-
> 05  video/kyro.h                                              conflic
> t!
> +'k'   10-
> 17  linux/hsi/hsi_char.h                                      HSI
> character device
> +'l'   00-
> 3F  linux/tcfs_fs.h                                           transpa
> rent cryptographic file system
> +                                                                    
>    <http://web.archive.org/web/%2A/http://mikonos.dia.unisa.it/tcfs>
> +'l'   40-
> 7F  linux/udf_fs_i.h                                          in
> development:
> +                                                                    
>    <https://github.com/pali/udftools>
> +'m'   00-
> 09  linux/mmtimer.h                                           conflic
> t!
> +'m'   all    linux/mtio.h                                           
>    conflict!
> +'m'   all    linux/soundcard.h                                      
>    conflict!
> +'m'   all    linux/synclink.h                                       
>    conflict!
> +'m'   00-
> 19  drivers/message/fusion/mptctl.h                           conflic
> t!
> +'m'   00     drivers/scsi/megaraid/megaraid_ioctl.h                 
>    conflict!
>  'n'   00-7F  linux/ncp_fs.h and fs/ncpfs/ioctl.c
> -'n'   80-
> 8F  uapi/linux/nilfs2_api.h                                 NILFS2
> -'n'   E0-
> FF  linux/matroxfb.h                                        matroxfb
> -'o'   00-
> 1F  fs/ocfs2/ocfs2_fs.h                                     OCFS2
> -'o'   00-03  mtd/ubi-
> user.h                                          conflict! (OCFS2 and
> UBI overlaps)
> -'o'   40-41  mtd/ubi-
> user.h                                          UBI
> -'o'   01-
> A1  `linux/dvb/*.h`                                         DVB
> -'p'   00-
> 0F  linux/phantom.h                                         conflict!
> (OpenHaptics needs this)
> -'p'   00-
> 1F  linux/rtc.h                                             conflict!
> +'n'   80-
> 8F  uapi/linux/nilfs2_api.h                                   NILFS2
> +'n'   E0-
> FF  linux/matroxfb.h                                          matroxf
> b
> +'o'   00-
> 1F  fs/ocfs2/ocfs2_fs.h                                       OCFS2
> +'o'   00-03  mtd/ubi-
> user.h                                            conflict! (OCFS2
> and UBI overlaps)
> +'o'   40-41  mtd/ubi-
> user.h                                            UBI
> +'o'   01-
> A1  `linux/dvb/*.h`                                           DVB
> +'p'   00-
> 0F  linux/phantom.h                                           conflic
> t! (OpenHaptics needs this)
> +'p'   00-
> 1F  linux/rtc.h                                               conflic
> t!
>  'p'   40-7F  linux/nvram.h
> -'p'   80-
> 9F  linux/ppdev.h                                           user-
> space parport
> -                                                                    
>  <mailto:tim@cyberelk.net>
> -'p'   A1-
> A5  linux/pps.h                                             LinuxPPS
> -'p'   B1-
> B3  linux/pps_gen.h                                         LinuxPPS
> -                                                                    
>  <mailto:giometti@linux.it>
> +'p'   80-
> 9F  linux/ppdev.h                                             user-
> space parport
> +                                                                    
>    <mailto:tim@cyberelk.net>
> +'p'   A1-
> A5  linux/pps.h                                               LinuxPP
> S
> +'p'   B1-
> B3  linux/pps_gen.h                                           LinuxPP
> S
> +                                                                    
>    <mailto:giometti@linux.it>
>  'q'   00-1F  linux/serio.h
> -'q'   80-
> FF  linux/telephony.h                                       Internet
> PhoneJACK, Internet LineJACK
> -             linux/ixjuser.h                                        
>  <http://web.archive.org/web/%2A/http://www.quicknet.net>
> +'q'   80-
> FF  linux/telephony.h                                         Interne
> t PhoneJACK, Internet LineJACK
> +             linux/ixjuser.h                                        
>    <http://web.archive.org/web/%2A/http://www.quicknet.net>
>  'r'   00-1F  linux/msdos_fs.h and fs/fat/dir.c
>  's'   all    linux/cdk.h
>  't'   00-7F  linux/ppp-ioctl.h
>  't'   80-8F  linux/isdn_ppp.h
> -'t'   90-
> 91  linux/toshiba.h                                         toshiba
> and toshiba_acpi SMM
> -'u'   00-
> 1F  linux/smb_fs.h                                          gone
> -'u'   00-
> 2F  linux/ublk_cmd.h                                        conflict!
> -'u'   20-
> 3F  linux/uvcvideo.h                                        USB video
> class host driver
> -'u'   40-
> 4f  linux/udmabuf.h                                         userspace
> dma-buf misc device
> -'v'   00-
> 1F  linux/ext2_fs.h                                         conflict!
> -'v'   00-
> 1F  linux/fs.h                                              conflict!
> -'v'   00-
> 0F  linux/sonypi.h                                          conflict!
> -'v'   00-0F  media/v4l2-
> subdev.h                                     conflict!
> -'v'   20-27  arch/powerpc/include/uapi/asm/vas-api.h		     VA
> S API
> -'v'   C0-
> FF  linux/meye.h                                            conflict!
> -'w'   all                                                           
>  CERN SCI driver
> -'y'   00-
> 1F                                                          packet
> based user level communications
> -                                                                    
>  <mailto:zapman@interlan.net>
> -'z'   00-
> 3F                                                          CAN bus
> card conflict!
> -                                                                    
>  <mailto:hdstich@connectu.ulm.circular.de>
> -'z'   40-
> 7F                                                          CAN bus
> card conflict!
> -                                                                    
>  <mailto:oe@port.de>
> -'z'   10-
> 4F  drivers/s390/crypto/zcrypt_api.h                        conflict!
> +'t'   90-
> 91  linux/toshiba.h                                           toshiba
> and toshiba_acpi SMM
> +'u'   00-
> 1F  linux/smb_fs.h                                            gone
> +'u'   00-
> 2F  linux/ublk_cmd.h                                          conflic
> t!
> +'u'   20-
> 3F  linux/uvcvideo.h                                          USB
> video class host driver
> +'u'   40-
> 4f  linux/udmabuf.h                                           userspa
> ce dma-buf misc device
> +'v'   00-
> 1F  linux/ext2_fs.h                                           conflic
> t!
> +'v'   00-
> 1F  linux/fs.h                                                conflic
> t!
> +'v'   00-
> 0F  linux/sonypi.h                                            conflic
> t!
> +'v'   00-0F  media/v4l2-
> subdev.h                                       conflict!
> +'v'   20-27  arch/powerpc/include/uapi/asm/vas-
> api.h                   VAS API
> +'v'   C0-
> FF  linux/meye.h                                              conflic
> t!
> +'w'   all                                                           
>    CERN SCI driver
> +'y'   00-
> 1F                                                            packet
> based user level communications
> +                                                                    
>    <mailto:zapman@interlan.net>
> +'z'   00-
> 3F                                                            CAN bus
> card conflict!
> +                                                                    
>    <mailto:hdstich@connectu.ulm.circular.de>
> +'z'   40-
> 7F                                                            CAN bus
> card conflict!
> +                                                                    
>    <mailto:oe@port.de>
> +'z'   10-
> 4F  drivers/s390/crypto/zcrypt_api.h                          conflic
> t!
>  '|'   00-7F  linux/media.h
> -'|'   80-
> 9F  samples/                                                Any
> sample and example drivers
> +'|'   80-
> 9F  samples/                                                  Any
> sample and example drivers
>  0x80  00-1F  linux/fb.h
>  0x81  00-1F  linux/vduse.h
>  0x89  00-06  arch/x86/include/asm/sockios.h
>  0x89  0B-DF  linux/sockios.h
> -0x89  E0-
> EF  linux/sockios.h                                         SIOCPROTO
> PRIVATE range
> -0x89  F0-
> FF  linux/sockios.h                                         SIOCDEVPR
> IVATE range
> +0x89  E0-
> EF  linux/sockios.h                                           SIOCPRO
> TOPRIVATE range
> +0x89  F0-
> FF  linux/sockios.h                                           SIOCDEV
> PRIVATE range
>  0x8A  00-1F  linux/eventpoll.h
>  0x8B  all    linux/wireless.h
> -0x8C  00-
> 3F                                                          WiNRADiO
> driver
> -                                                                    
>  <http://www.winradio.com.au/>
> +0x8C  00-
> 3F                                                            WiNRADi
> O driver
> +                                                                    
>    <http://www.winradio.com.au/>
>  0x90  00     drivers/cdrom/sbpcd.h
>  0x92  00-0F  drivers/usb/mon/mon_bin.c
>  0x93  60-7F  linux/auto_fs.h
> -0x94  all    fs/btrfs/ioctl.h                                       
>  Btrfs filesystem
> -             and
> linux/fs.h                                          some lifted to
> vfs/generic
> -0x97  00-
> 7F  fs/ceph/ioctl.h                                         Ceph file
> system
> -0x99  00-
> 0F                                                          537-
> Addinboard driver
> -                                                                    
>  <mailto:buk@buks.ipn.de>
> +0x94  all    fs/btrfs/ioctl.h                                       
>    Btrfs filesystem
> +             and
> linux/fs.h                                            some lifted to
> vfs/generic
> +0x97  00-
> 7F  fs/ceph/ioctl.h                                           Ceph
> file system
> +0x99  00-
> 0F                                                            537-
> Addinboard driver
> +                                                                    
>    <mailto:buk@buks.ipn.de>
>  0x9A  00-0F  include/uapi/fwctl/fwctl.h
> -0xA0  all    linux/sdp/sdp.h                                        
>  Industrial Device Project
> -                                                                    
>  <mailto:kenji@bitgate.com>
> -0xA1  0      linux/vtpm_proxy.h                                     
>  TPM Emulator Proxy Driver
> -0xA2  all    uapi/linux/acrn.h                                      
>  ACRN hypervisor
> -0xA3  80-
> 8F                                                          Port
> ACL  in development:
> -                                                                    
>  <mailto:tlewis@mindspring.com>
> +0xA0  all    linux/sdp/sdp.h                                        
>    Industrial Device Project
> +                                                                    
>    <mailto:kenji@bitgate.com>
> +0xA1  0      linux/vtpm_proxy.h                                     
>    TPM Emulator Proxy Driver
> +0xA2  all    uapi/linux/acrn.h                                      
>    ACRN hypervisor
> +0xA3  80-
> 8F                                                            Port
> ACL  in development:
> +                                                                    
>    <mailto:tlewis@mindspring.com>
>  0xA3  90-9F  linux/dtlk.h
> -0xA4  00-
> 1F  uapi/linux/tee.h                                        Generic
> TEE subsystem
> -0xA4  00-
> 1F  uapi/asm/sgx.h                                          <mailto:
> linux-sgx@vger.kernel.org>
> -0xA5  01-
> 05  linux/surface_aggregator/cdev.h                         Microsoft
> Surface Platform System Aggregator
> -                                                                    
>  <mailto:luzmaximilian@gmail.com>
> -0xA5  20-
> 2F  linux/surface_aggregator/dtx.h                          Microsoft
> Surface DTX driver
> -                                                                    
>  <mailto:luzmaximilian@gmail.com>
> +0xA4  00-
> 1F  uapi/linux/tee.h                                          Generic
> TEE subsystem
> +0xA4  00-
> 1F  uapi/asm/sgx.h                                            <mailto
> :linux-sgx@vger.kernel.org>
> +0xA5  01-
> 05  linux/surface_aggregator/cdev.h                           Microso
> ft Surface Platform System Aggregator
> +                                                                    
>    <mailto:luzmaximilian@gmail.com>
> +0xA5  20-
> 2F  linux/surface_aggregator/dtx.h                            Microso
> ft Surface DTX driver
> +                                                                    
>    <mailto:luzmaximilian@gmail.com>
>  0xAA  00-3F  linux/uapi/linux/userfaultfd.h
>  0xAB  00-1F  linux/nbd.h
>  0xAC  00-1F  linux/raw.h
> -0xAD  00                                                            
>  Netfilter device in development:
> -                                                                    
>  <mailto:rusty@rustcorp.com.au>
> -0xAE  00-
> 1F  linux/kvm.h                                             Kernel-
> based Virtual Machine
> -                                                                    
>  <mailto:kvm@vger.kernel.org>
> -0xAE  40-
> FF  linux/kvm.h                                             Kernel-
> based Virtual Machine
> -                                                                    
>  <mailto:kvm@vger.kernel.org>
> -0xAE  20-
> 3F  linux/nitro_enclaves.h                                  Nitro
> Enclaves
> -0xAF  00-
> 1F  linux/fsl_hypervisor.h                                  Freescale
> hypervisor
> -0xB0  all                                                           
>  RATIO devices in development:
> -                                                                    
>  <mailto:vgo@ratio.de>
> -0xB1  00-
> 1F                                                          PPPoX
> -                                                                    
>  <mailto:mostrows@styx.uwaterloo.ca>
> -0xB2  00     arch/powerpc/include/uapi/asm/papr-
> vpd.h                powerpc/pseries VPD API
> -                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
> -0xB2  01-02  arch/powerpc/include/uapi/asm/papr-
> sysparm.h            powerpc/pseries system parameter API
> -                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
> -0xB2  03-05  arch/powerpc/include/uapi/asm/papr-
> indices.h            powerpc/pseries indices API
> -                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
> -0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-
> dump.h      powerpc/pseries Platform Dump API
> -                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
> -0xB2  08     powerpc/include/uapi/asm/papr-physical-
> attestation.h    powerpc/pseries Physical Attestation API
> -                                                                    
>  <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xAD  00                                                            
>    Netfilter device in development:
> +                                                                    
>    <mailto:rusty@rustcorp.com.au>
> +0xAE  00-
> 1F  linux/kvm.h                                               Kernel-
> based Virtual Machine
> +                                                                    
>    <mailto:kvm@vger.kernel.org>
> +0xAE  40-
> FF  linux/kvm.h                                               Kernel-
> based Virtual Machine
> +                                                                    
>    <mailto:kvm@vger.kernel.org>
> +0xAE  20-
> 3F  linux/nitro_enclaves.h                                    Nitro
> Enclaves
> +0xAF  00-
> 1F  linux/fsl_hypervisor.h                                    Freesca
> le hypervisor
> +0xB0  all                                                           
>    RATIO devices in development:
> +                                                                    
>    <mailto:vgo@ratio.de>
> +0xB1  00-
> 1F                                                            PPPoX
> +                                                                    
>    <mailto:mostrows@styx.uwaterloo.ca>
> +0xB2  00     arch/powerpc/include/uapi/asm/papr-
> vpd.h                  powerpc/pseries VPD API
> +                                                                    
>    <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  01-02  arch/powerpc/include/uapi/asm/papr-
> sysparm.h              powerpc/pseries system parameter API
> +                                                                    
>    <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  03-05  arch/powerpc/include/uapi/asm/papr-
> indices.h              powerpc/pseries indices API
> +                                                                    
>    <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-
> dump.h        powerpc/pseries Platform Dump API
> +                                                                    
>    <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  08     powerpc/include/uapi/asm/papr-physical-
> attestation.h      powerpc/pseries Physical Attestation API
> +                                                                    
>    <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB3  00     linux/mmc/ioctl.h
> -0xB4  00-
> 0F  linux/gpio.h                                            <mailto:
> linux-gpio@vger.kernel.org>
> -0xB5  00-
> 0F  uapi/linux/rpmsg.h                                      <mailto:
> linux-remoteproc@vger.kernel.org>
> +0xB4  00-
> 0F  linux/gpio.h                                              <mailto
> :linux-gpio@vger.kernel.org>
> +0xB5  00-
> 0F  uapi/linux/rpmsg.h                                        <mailto
> :linux-remoteproc@vger.kernel.org>
>  0xB6  all    linux/fpga-dfl.h
> -0xB7  all    uapi/linux/remoteproc_cdev.h                           
>  <mailto:linux-remoteproc@vger.kernel.org>
> -0xB7  all    uapi/linux/nsfs.h                                      
>  <mailto:Andrei Vagin <avagin@openvz.org>>
> -0xB8  01-
> 02  uapi/misc/mrvl_cn10k_dpi.h                              Marvell
> CN10K DPI driver
> -0xB8  all    uapi/linux/mshv.h                                      
>  Microsoft Hyper-V /dev/mshv driver
> -                                                                    
>  <mailto:linux-hyperv@vger.kernel.org>
> +0xB7  all    uapi/linux/remoteproc_cdev.h                           
>    <mailto:linux-remoteproc@vger.kernel.org>
> +0xB7  all    uapi/linux/nsfs.h                                      
>    <mailto:Andrei Vagin <avagin@openvz.org>>
> +0xB8  01-
> 02  uapi/misc/mrvl_cn10k_dpi.h                                Marvell
> CN10K DPI driver
> +0xB8  all    uapi/linux/mshv.h                                      
>    Microsoft Hyper-V /dev/mshv driver
> +                                                                    
>    <mailto:linux-hyperv@vger.kernel.org>
>  0xC0  00-0F  linux/usb/iowarrior.h
> -0xCA  00-
> 0F  uapi/misc/cxl.h                                         Dead
> since 6.15
> +0xCA  00-
> 0F  uapi/misc/cxl.h                                           Dead
> since 6.15
>  0xCA  10-2F  uapi/misc/ocxl.h
> -0xCA  80-
> BF  uapi/scsi/cxlflash_ioctl.h                              Dead
> since 6.15
> -0xCB  00-
> 1F                                                          CBM
> serial IEC bus in development:
> -                                                                    
>  <mailto:michael.klein@puffin.lb.shuttle.de>
> -0xCC  00-
> 0F  drivers/misc/ibmvmc.h                                   pseries
> VMC driver
> -0xCD  01     linux/reiserfs_fs.h                                    
>  Dead since 6.13
> -0xCE  01-
> 02  uapi/linux/cxl_mem.h                                    Compute
> Express Link Memory Devices
> +0xCA  80-
> BF  uapi/scsi/cxlflash_ioctl.h                                Dead
> since 6.15
> +0xCB  00-
> 1F                                                            CBM
> serial IEC bus in development:
> +                                                                    
>    <mailto:michael.klein@puffin.lb.shuttle.de>
> +0xCC  00-
> 0F  drivers/misc/ibmvmc.h                                     pseries
> VMC driver
> +0xCD  01     linux/reiserfs_fs.h                                    
>    Dead since 6.13
> +0xCE  01-
> 02  uapi/linux/cxl_mem.h                                      Compute
> Express Link Memory Devices
>  0xCF  02     fs/smb/client/cifs_ioctl.h
>  0xDB  00-0F  drivers/char/mwave/mwavepub.h
> -0xDD  00-
> 3F                                                          ZFCP
> device driver see drivers/s390/scsi/
> -                                                                    
>  <mailto:aherrman@de.ibm.com>
> +0xDD  00-
> 3F                                                            ZFCP
> device driver see drivers/s390/scsi/
> +                                                                    
>    <mailto:aherrman@de.ibm.com>
>  0xE5  00-3F  linux/fuse.h
> -0xEC  00-
> 01  drivers/platform/chrome/cros_ec_dev.h                   ChromeOS
> EC driver
> -0xEE  00-
> 09  uapi/linux/pfrut.h                                      Platform
> Firmware Runtime Update and Telemetry
> -0xF3  00-
> 3F  drivers/usb/misc/sisusbvga/sisusb.h                     sisfb (in
> development)
> -                                                                    
>  <mailto:thomas@winischhofer.net>
> -0xF6  all                                                           
>  LTTng Linux Trace Toolkit Next Generation
> -                                                                    
>  <mailto:mathieu.desnoyers@efficios.com>
> -0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                   
>  AMD HSMP EPYC system management interface driver
> -                                                                    
>  <mailto:nchatrad@amd.com>
> -0xF9  00-0F  uapi/misc/amd-apml.h		                     AM
> D side band system management interface driver
> -                                                                    
>  <mailto:naveenkrishna.chatradhi@amd.com>
> +0xEC  00-
> 01  drivers/platform/chrome/cros_ec_dev.h                     ChromeO
> S EC driver
> +0xEE  00-
> 09  uapi/linux/pfrut.h                                        Platfor
> m Firmware Runtime Update and Telemetry
> +0xF3  00-
> 3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb
> (in development)
> +                                                                    
>    <mailto:thomas@winischhofer.net>
> +0xF6  all                                                           
>    LTTng Linux Trace Toolkit Next Generation
> +                                                                    
>    <mailto:mathieu.desnoyers@efficios.com>
> +0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                   
>    AMD HSMP EPYC system management interface driver
> +                                                                    
>    <mailto:nchatrad@amd.com>
> +0xF9  00-0F  uapi/misc/amd-apml.h		                       
> AMD side band system management interface driver
> +                                                                    
>    <mailto:naveenkrishna.chatradhi@amd.com>
>  0xFD  all    linux/dm-ioctl.h
>  0xFE  all    linux/isst_if.h
> -====  =====  =======================================================
> ================================================================
> +====  =====  =======================================================
> == ================================================================


