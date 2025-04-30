Return-Path: <linuxppc-dev+bounces-8183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17039AA4CB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 15:08:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZncvX385cz3blc;
	Wed, 30 Apr 2025 23:08:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746018536;
	cv=none; b=LseaVyuoAGyUQWuN9Kk0pUFShPg7Lxsvn/ax+adQ88UXYJo7EuK6NmHipQU/2nqAGLJTJ6PFtv9pt4/g+QvYCQKN4h7ujE03E4xNM32Yu9B3EJeQSFQnK+wpe3bcPMe54F1o+NBFRDdIt3aWg77O/MWwrWwkRS4jvBL/eX4MM0VEywd1eVOxdX9pOZP5RBsco8ZkAznr5f8kFgVIHEJabs7QWrv1pDHfZjV+kMSXPntgHyIXZ6HhNOBHEIqC39fGDKyPEmsewFMIWfJ69LVxI1RP9b0CPuJvH4SFJtf1ou6yb9wijTHbte3GTApf37f6gvSz4Xo/PhfzXFDaKxKtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746018536; c=relaxed/relaxed;
	bh=XboVezHAahpZsusAE6XVu9M9pVdJ4kW3iY7ZVTZZ4Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/9ddSRmTShl8VIo2OppWYppS3V2WxHqwbD9Y0Ppmor8cAmB3vvPvPDdOuBs82l+fJqocXByzOY8UVfePKoje4v4167Kl3CcOLQZcDeUlmDFExuPEOGthmJkAjw7VT1YjT4XIsY+WCZY+ms038WDTNwFqQfrrK7hkgwp1YdJSzXSKyelsS3FBw8gQwxIYvsAOd7vPLV2sCv93WjgazrWBLac+MTyOwfyDr+h350djSFmmqV0pqojSMxbPe5xD5pJ4MQP8c5LFwsLtVFDNT7x2t95hMg3venmcCXCeQh3e4ddViDkUNv0SSJfpXd2+pj2owbUe9ARKQOeDuwZsyDQHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pDEeXYWM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pDEeXYWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZncvV1yRzz2yrX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 23:08:53 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UAeijX010853;
	Wed, 30 Apr 2025 13:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XboVez
	HAahpZsusAE6XVu9M9pVdJ4kW3iY7ZVTZZ4Uk=; b=pDEeXYWMB+X7PYCnTBhJiK
	IJ9zRP7T7b0lH+DVN1EUnUyfCA+b0pJmyjCvuX+2RW1BTqsbnjgBR1xGrdt+qaEp
	V2oOmwVFEkqhgxPK+JXB6oAxDeZwhOwql2utkXMRaizF49cMsL07i+4S9AxOafMc
	zcTP17ogMvP6IUfbLFPthmRjaUZCYkoMhhYYFdI0c1vQDZlJ0sJg9WhjkVscJXuY
	CT9ilVzQ/2E7dOLJ7bOPRsZUGa8KrDTBLH188jEbBifjafMV9eQW0RIXKonu3u9o
	H46CKuU3Ts5kmtxttCtoRYXeFXdholRWMvPLlIG1XSLsg9ffqoTNgbICxS4w1paQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bjas0mjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:08:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53UD8a8c002985;
	Wed, 30 Apr 2025 13:08:36 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bjas0mj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:08:36 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCIxjD000700;
	Wed, 30 Apr 2025 13:08:35 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atpfxt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:08:35 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53UD8YWX18678058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:08:34 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E256458058;
	Wed, 30 Apr 2025 13:08:33 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B02DB5805B;
	Wed, 30 Apr 2025 13:08:28 +0000 (GMT)
Received: from [9.61.255.15] (unknown [9.61.255.15])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 13:08:28 +0000 (GMT)
Message-ID: <66e4a803-05bd-4fbe-96bf-84415eefe412@linux.ibm.com>
Date: Wed, 30 Apr 2025 18:38:27 +0530
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
Subject: Re: [PATCH] Documentation: ioctl-number: Extend "Include File" column
 width
Content-Language: en-GB
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Richard Cochran <richardcochran@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Haren Myneni
 <haren@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Vamsi Attunuru
 <vattunuru@marvell.com>,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>, Alyssa Ross <hi@alyssa.is>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250429130524.33587-2-bagasdotme@gmail.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250429130524.33587-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sJGboLIQtZtgK6bX9F95McBttcEggUy1
X-Proofpoint-ORIG-GUID: XB_uOn3BY7BHVttiCyg22YlYXYY_pyk0
X-Authority-Analysis: v=2.4 cv=LKNmQIW9 c=1 sm=1 tr=0 ts=681220d4 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=FP58Ms26AAAA:8 a=36Qj4kvwAAAA:8 a=xqzR1eaSAAAA:8
 a=a4NEJbfMAAAA:8 a=TkLiO6tdAAAA:8 a=NEAV23lmAAAA:8 a=wTc3cHO5AAAA:8 a=Ju1OUx4FAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=6X-EevrwAAAA:8 a=YMHlrSWeAAAA:8 a=ag1SF4gXAAAA:8 a=br60VIFoAAAA:8 a=EF7ItLl7AAAA:8 a=59Bnr_R2AAAA:8 a=p-73RYD4AAAA:8 a=84BadPHTAAAA:8
 a=Tty9oNO6AAAA:8 a=zeAeT-1tAAAA:8 a=voM4FWlXAAAA:8 a=6rqHouBjAAAA:8 a=VnNF1IyMAAAA:8 a=WgJYcGVQAAAA:8 a=7d_E57ReAAAA:8 a=zd2uoN0lAAAA:8 a=iYBMvFur5cj1qlw62OQA:9 a=QEXdDO2ut3YA:10 a=a8RXOGDryFMA:10 a=MP9ZtiD8KjrkvI0BhSjB:22 a=UklWUE76AaA7xuxiX2K1:22
 a=dV6nhpJrT-yxOfsl7Uss:22 a=j5HedEgV9xmj0QdrFjqv:22 a=baavZ0Ln-j307LZ-0_7C:22 a=w5lJx-D4kpZreUpx7M4u:22 a=57Y-CfXW99XzLu2jE1FU:22 a=PDd2vrKq2XUAlGmJVEUY:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HrzLPDwhB63SKwEyWadd:22 a=KzV_IjdM9kfMg8rc9Rf7:22
 a=AGiTiUxUTAVOEnAwzyD-:22 a=jXqu7Ew5HFkvi6pE3bB5:22 a=Bts-Es6F1CBXvF7u4C_G:22 a=Ry2eTNIdGMwtTGQdmMb7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NCBTYWx0ZWRfX/RYFW/AtHQ4y vVsgLtDa0SlYpXp19hj2qjxzAPPS1FC9qDVWuBhU+8EH9g4KFlQbIygPld5pCo0AKI4XyiUDSZL 9Mq9LvzWLrNXMe5oaPf/UISe9qVEo/RfKP6/BYIwlQOcOjJtIy1xQy37RgSV6ydyuL/ER8uoJEg
 TVYuM3xY3//pGqqghs3TilUlr9J7ihSzO4dooBmLYrtD4xm761akZE0Hep6Stb3kDPgd/GuWRRM tVaPfar9/D8J1NHtW/7Sf7KFQol5sWdQ0P2NbGADQVSnAe8d0k/Den15DWkRLbPwUHaKlZlJtqm zzh3glRMNboE4Cdfu/z9481d/XU2Ve5U+IpxvxioAFofP7eGwc+X5Ed45bRC1Gqdn7q/kCZvMOf
 Wdu7ZlCvH/J9m9nBzibmXgBsAflwNXRCLJw3MIxm2Hubbwb5nQp/TAXP2M6Og07x16oBonse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300094
X-Spam-Status: No, score=-1.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 29/04/25 6:35 pm, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warning when merging powerpc tree for
> linux-next:
>
> Documentation/userspace-api/ioctl/ioctl-number.rst:369: ERROR: Malformed table.
> Text in column margin in table line 301.
>
> ====  =====  ======================================================= ================================================================
> Code  Seq#    Include File                                           Comments
>        (hex)
> ====  =====  ======================================================= ================================================================
> 	.
> 	.
> 	.
> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
>                                                                       <mailto:linuxppc-dev>
> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
>                                                                       <mailto:linuxppc-dev>
> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
>                                                                       <mailto:linuxppc-dev>
> 	.
> 	.
> 	.
> ====  =====  ======================================================= ================================================================ [docutils]
>
> That's because arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> now occupies the widest "Include File" column entry in ioctl number
> table. In addition, the other papr-*.h entries in the same column aren't
> sufficiently padded to align to the rest of column. As such, the table
> is skipped in resulting htmldocs output.
>
> Fix the warning by extending "Include File" column so that the
> widest entry can fit, and by aligning the other papr-*.h entries. While
> at it, also fix mailto: links to linuxppc-dev mailing list.
>
> Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
> Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250429181707.7848912b@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>   .../userspace-api/ioctl/ioctl-number.rst      | 512 +++++++++---------
>   1 file changed, 256 insertions(+), 256 deletions(-)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 017a23aeadc329..b725186670a1d8 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -66,343 +66,343 @@ This table lists ioctls visible from user land for Linux/x86.  It contains
>   most drivers up to 2.6.31, but I know I am missing some.  There has been
>   no attempt to list non-X86 architectures or ioctls from drivers/staging/.
>   
> -====  =====  ======================================================= ================================================================
> -Code  Seq#    Include File                                           Comments
> +====  =====  =========================================================  ================================================================
> +Code  Seq#    Include File                                              Comments
>         (hex)
> -====  =====  ======================================================= ================================================================
> -0x00  00-1F  linux/fs.h                                              conflict!
> -0x00  00-1F  scsi/scsi_ioctl.h                                       conflict!
> -0x00  00-1F  linux/fb.h                                              conflict!
> -0x00  00-1F  linux/wavefront.h                                       conflict!
> +====  =====  =========================================================  ================================================================
> +0x00  00-1F  linux/fs.h                                                 conflict!
> +0x00  00-1F  scsi/scsi_ioctl.h                                          conflict!
> +0x00  00-1F  linux/fb.h                                                 conflict!
> +0x00  00-1F  linux/wavefront.h                                          conflict!
>   0x02  all    linux/fd.h
>   0x03  all    linux/hdreg.h
> -0x04  D2-DC  linux/umsdos_fs.h                                       Dead since 2.6.11, but don't reuse these.
> +0x04  D2-DC  linux/umsdos_fs.h                                          Dead since 2.6.11, but don't reuse these.
>   0x06  all    linux/lp.h
>   0x07  9F-D0  linux/vmw_vmci_defs.h, uapi/linux/vm_sockets.h
>   0x09  all    linux/raid/md_u.h
>   0x10  00-0F  drivers/char/s390/vmcp.h
>   0x10  10-1F  arch/s390/include/uapi/sclp_ctl.h
>   0x10  20-2F  arch/s390/include/uapi/asm/hypfs.h
> -0x12  all    linux/fs.h                                              BLK* ioctls
> +0x12  all    linux/fs.h                                                 BLK* ioctls
>                linux/blkpg.h
>                linux/blkzoned.h
>                linux/blk-crypto.h
> -0x15  all    linux/fs.h                                              FS_IOC_* ioctls
> -0x1b  all                                                            InfiniBand Subsystem
> -                                                                     <http://infiniband.sourceforge.net/>
> +0x15  all    linux/fs.h                                                 FS_IOC_* ioctls
> +0x1b  all                                                               InfiniBand Subsystem
> +                                                                        <http://infiniband.sourceforge.net/>
>   0x20  all    drivers/cdrom/cm206.h
>   0x22  all    scsi/sg.h
> -0x3E  00-0F  linux/counter.h                                         <mailto:linux-iio@vger.kernel.org>
> +0x3E  00-0F  linux/counter.h                                            <mailto:linux-iio@vger.kernel.org>
>   '!'   00-1F  uapi/linux/seccomp.h
> -'#'   00-3F                                                          IEEE 1394 Subsystem
> -                                                                     Block for the entire subsystem
> +'#'   00-3F                                                             IEEE 1394 Subsystem
> +                                                                        Block for the entire subsystem
>   '$'   00-0F  linux/perf_counter.h, linux/perf_event.h
> -'%'   00-0F  include/uapi/linux/stm.h                                System Trace Module subsystem
> -                                                                     <mailto:alexander.shishkin@linux.intel.com>
> +'%'   00-0F  include/uapi/linux/stm.h                                   System Trace Module subsystem
> +                                                                        <mailto:alexander.shishkin@linux.intel.com>
>   '&'   00-07  drivers/firewire/nosy-user.h
> -'*'   00-1F  uapi/linux/user_events.h                                User Events Subsystem
> -                                                                     <mailto:linux-trace-kernel@vger.kernel.org>
> -'1'   00-1F  linux/timepps.h                                         PPS kit from Ulrich Windl
> -                                                                     <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
> +'*'   00-1F  uapi/linux/user_events.h                                   User Events Subsystem
> +                                                                        <mailto:linux-trace-kernel@vger.kernel.org>
> +'1'   00-1F  linux/timepps.h                                            PPS kit from Ulrich Windl
> +                                                                        <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
>   '2'   01-04  linux/i2o.h
> -'3'   00-0F  drivers/s390/char/raw3270.h                             conflict!
> -'3'   00-1F  linux/suspend_ioctls.h,                                 conflict!
> +'3'   00-0F  drivers/s390/char/raw3270.h                                conflict!
> +'3'   00-1F  linux/suspend_ioctls.h,                                    conflict!
>                kernel/power/user.c
> -'8'   all                                                            SNP8023 advanced NIC card
> -                                                                     <mailto:mcr@solidum.com>
> +'8'   all                                                               SNP8023 advanced NIC card
> +                                                                        <mailto:mcr@solidum.com>
>   ';'   64-7F  linux/vfio.h
>   ';'   80-FF  linux/iommufd.h
> -'='   00-3f  uapi/linux/ptp_clock.h                                  <mailto:richardcochran@gmail.com>
> -'@'   00-0F  linux/radeonfb.h                                        conflict!
> -'@'   00-0F  drivers/video/aty/aty128fb.c                            conflict!
> -'A'   00-1F  linux/apm_bios.h                                        conflict!
> -'A'   00-0F  linux/agpgart.h,                                        conflict!
> +'='   00-3f  uapi/linux/ptp_clock.h                                     <mailto:richardcochran@gmail.com>
> +'@'   00-0F  linux/radeonfb.h                                           conflict!
> +'@'   00-0F  drivers/video/aty/aty128fb.c                               conflict!
> +'A'   00-1F  linux/apm_bios.h                                           conflict!
> +'A'   00-0F  linux/agpgart.h,                                           conflict!
>                drivers/char/agp/compat_ioctl.h
> -'A'   00-7F  sound/asound.h                                          conflict!
> -'B'   00-1F  linux/cciss_ioctl.h                                     conflict!
> -'B'   00-0F  include/linux/pmu.h                                     conflict!
> -'B'   C0-FF  advanced bbus                                           <mailto:maassen@uni-freiburg.de>
> -'B'   00-0F  xen/xenbus_dev.h                                        conflict!
> -'C'   all    linux/soundcard.h                                       conflict!
> -'C'   01-2F  linux/capi.h                                            conflict!
> -'C'   F0-FF  drivers/net/wan/cosa.h                                  conflict!
> +'A'   00-7F  sound/asound.h                                             conflict!
> +'B'   00-1F  linux/cciss_ioctl.h                                        conflict!
> +'B'   00-0F  include/linux/pmu.h                                        conflict!
> +'B'   C0-FF  advanced bbus                                              <mailto:maassen@uni-freiburg.de>
> +'B'   00-0F  xen/xenbus_dev.h                                           conflict!
> +'C'   all    linux/soundcard.h                                          conflict!
> +'C'   01-2F  linux/capi.h                                               conflict!
> +'C'   F0-FF  drivers/net/wan/cosa.h                                     conflict!
>   'D'   all    arch/s390/include/asm/dasd.h
> -'D'   40-5F  drivers/scsi/dpt/dtpi_ioctl.h                           Dead since 2022
> +'D'   40-5F  drivers/scsi/dpt/dtpi_ioctl.h                              Dead since 2022
>   'D'   05     drivers/scsi/pmcraid.h
> -'E'   all    linux/input.h                                           conflict!
> -'E'   00-0F  xen/evtchn.h                                            conflict!
> -'F'   all    linux/fb.h                                              conflict!
> -'F'   01-02  drivers/scsi/pmcraid.h                                  conflict!
> -'F'   20     drivers/video/fsl-diu-fb.h                              conflict!
> -'F'   20     linux/ivtvfb.h                                          conflict!
> -'F'   20     linux/matroxfb.h                                        conflict!
> -'F'   20     drivers/video/aty/atyfb_base.c                          conflict!
> -'F'   00-0F  video/da8xx-fb.h                                        conflict!
> -'F'   80-8F  linux/arcfb.h                                           conflict!
> -'F'   DD     video/sstfb.h                                           conflict!
> -'G'   00-3F  drivers/misc/sgi-gru/grulib.h                           conflict!
> -'G'   00-0F  xen/gntalloc.h, xen/gntdev.h                            conflict!
> -'H'   00-7F  linux/hiddev.h                                          conflict!
> -'H'   00-0F  linux/hidraw.h                                          conflict!
> -'H'   01     linux/mei.h                                             conflict!
> -'H'   02     linux/mei.h                                             conflict!
> -'H'   03     linux/mei.h                                             conflict!
> -'H'   00-0F  sound/asound.h                                          conflict!
> -'H'   20-40  sound/asound_fm.h                                       conflict!
> -'H'   80-8F  sound/sfnt_info.h                                       conflict!
> -'H'   10-8F  sound/emu10k1.h                                         conflict!
> -'H'   10-1F  sound/sb16_csp.h                                        conflict!
> -'H'   10-1F  sound/hda_hwdep.h                                       conflict!
> -'H'   40-4F  sound/hdspm.h                                           conflict!
> -'H'   40-4F  sound/hdsp.h                                            conflict!
> +'E'   all    linux/input.h                                              conflict!
> +'E'   00-0F  xen/evtchn.h                                               conflict!
> +'F'   all    linux/fb.h                                                 conflict!
> +'F'   01-02  drivers/scsi/pmcraid.h                                     conflict!
> +'F'   20     drivers/video/fsl-diu-fb.h                                 conflict!
> +'F'   20     linux/ivtvfb.h                                             conflict!
> +'F'   20     linux/matroxfb.h                                           conflict!
> +'F'   20     drivers/video/aty/atyfb_base.c                             conflict!
> +'F'   00-0F  video/da8xx-fb.h                                           conflict!
> +'F'   80-8F  linux/arcfb.h                                              conflict!
> +'F'   DD     video/sstfb.h                                              conflict!
> +'G'   00-3F  drivers/misc/sgi-gru/grulib.h                              conflict!
> +'G'   00-0F  xen/gntalloc.h, xen/gntdev.h                               conflict!
> +'H'   00-7F  linux/hiddev.h                                             conflict!
> +'H'   00-0F  linux/hidraw.h                                             conflict!
> +'H'   01     linux/mei.h                                                conflict!
> +'H'   02     linux/mei.h                                                conflict!
> +'H'   03     linux/mei.h                                                conflict!
> +'H'   00-0F  sound/asound.h                                             conflict!
> +'H'   20-40  sound/asound_fm.h                                          conflict!
> +'H'   80-8F  sound/sfnt_info.h                                          conflict!
> +'H'   10-8F  sound/emu10k1.h                                            conflict!
> +'H'   10-1F  sound/sb16_csp.h                                           conflict!
> +'H'   10-1F  sound/hda_hwdep.h                                          conflict!
> +'H'   40-4F  sound/hdspm.h                                              conflict!
> +'H'   40-4F  sound/hdsp.h                                               conflict!
>   'H'   90     sound/usb/usx2y/usb_stream.h
> -'H'   00-0F  uapi/misc/habanalabs.h                                  conflict!
> +'H'   00-0F  uapi/misc/habanalabs.h                                     conflict!
>   'H'   A0     uapi/linux/usb/cdc-wdm.h
> -'H'   C0-F0  net/bluetooth/hci.h                                     conflict!
> -'H'   C0-DF  net/bluetooth/hidp/hidp.h                               conflict!
> -'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                               conflict!
> -'H'   C0-DF  net/bluetooth/bnep/bnep.h                               conflict!
> -'H'   F1     linux/hid-roccat.h                                      <mailto:erazor_de@users.sourceforge.net>
> +'H'   C0-F0  net/bluetooth/hci.h                                        conflict!
> +'H'   C0-DF  net/bluetooth/hidp/hidp.h                                  conflict!
> +'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                                  conflict!
> +'H'   C0-DF  net/bluetooth/bnep/bnep.h                                  conflict!
> +'H'   F1     linux/hid-roccat.h                                         <mailto:erazor_de@users.sourceforge.net>
>   'H'   F8-FA  sound/firewire.h
> -'I'   all    linux/isdn.h                                            conflict!
> -'I'   00-0F  drivers/isdn/divert/isdn_divert.h                       conflict!
> -'I'   40-4F  linux/mISDNif.h                                         conflict!
> +'I'   all    linux/isdn.h                                               conflict!
> +'I'   00-0F  drivers/isdn/divert/isdn_divert.h                          conflict!
> +'I'   40-4F  linux/mISDNif.h                                            conflict!
>   'K'   all    linux/kd.h
> -'L'   00-1F  linux/loop.h                                            conflict!
> -'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                      conflict!
> -'L'   E0-FF  linux/ppdd.h                                            encrypted disk device driver
> -                                                                     <http://linux01.gwdg.de/~alatham/ppdd.html>
> -'M'   all    linux/soundcard.h                                       conflict!
> -'M'   01-16  mtd/mtd-abi.h                                           conflict!
> +'L'   00-1F  linux/loop.h                                               conflict!
> +'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                         conflict!
> +'L'   E0-FF  linux/ppdd.h                                               encrypted disk device driver
> +                                                                        <http://linux01.gwdg.de/~alatham/ppdd.html>
> +'M'   all    linux/soundcard.h                                          conflict!
> +'M'   01-16  mtd/mtd-abi.h                                              conflict!
>         and    drivers/mtd/mtdchar.c
>   'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
> -'M'   00-0F  drivers/video/fsl-diu-fb.h                              conflict!
> +'M'   00-0F  drivers/video/fsl-diu-fb.h                                 conflict!
>   'N'   00-1F  drivers/usb/scanner.h
>   'N'   40-7F  drivers/block/nvme.c
> -'N'   80-8F  uapi/linux/ntsync.h                                     NT synchronization primitives
> -                                                                     <mailto:wine-devel@winehq.org>
> -'O'   00-06  mtd/ubi-user.h                                          UBI
> -'P'   all    linux/soundcard.h                                       conflict!
> -'P'   60-6F  sound/sscape_ioctl.h                                    conflict!
> -'P'   00-0F  drivers/usb/class/usblp.c                               conflict!
> -'P'   01-09  drivers/misc/pci_endpoint_test.c                        conflict!
> -'P'   00-0F  xen/privcmd.h                                           conflict!
> -'P'   00-05  linux/tps6594_pfsm.h                                    conflict!
> +'N'   80-8F  uapi/linux/ntsync.h                                        NT synchronization primitives
> +                                                                        <mailto:wine-devel@winehq.org>
> +'O'   00-06  mtd/ubi-user.h                                             UBI
> +'P'   all    linux/soundcard.h                                          conflict!
> +'P'   60-6F  sound/sscape_ioctl.h                                       conflict!
> +'P'   00-0F  drivers/usb/class/usblp.c                                  conflict!
> +'P'   01-09  drivers/misc/pci_endpoint_test.c                           conflict!
> +'P'   00-0F  xen/privcmd.h                                              conflict!
> +'P'   00-05  linux/tps6594_pfsm.h                                       conflict!
>   'Q'   all    linux/soundcard.h
> -'R'   00-1F  linux/random.h                                          conflict!
> -'R'   01     linux/rfkill.h                                          conflict!
> +'R'   00-1F  linux/random.h                                             conflict!
> +'R'   01     linux/rfkill.h                                             conflict!
>   'R'   20-2F  linux/trace_mmap.h
>   'R'   C0-DF  net/bluetooth/rfcomm.h
>   'R'   E0     uapi/linux/fsl_mc.h
> -'S'   all    linux/cdrom.h                                           conflict!
> -'S'   80-81  scsi/scsi_ioctl.h                                       conflict!
> -'S'   82-FF  scsi/scsi.h                                             conflict!
> -'S'   00-7F  sound/asequencer.h                                      conflict!
> -'T'   all    linux/soundcard.h                                       conflict!
> -'T'   00-AF  sound/asound.h                                          conflict!
> -'T'   all    arch/x86/include/asm/ioctls.h                           conflict!
> -'T'   C0-DF  linux/if_tun.h                                          conflict!
> -'U'   all    sound/asound.h                                          conflict!
> -'U'   00-CF  linux/uinput.h                                          conflict!
> +'S'   all    linux/cdrom.h                                              conflict!
> +'S'   80-81  scsi/scsi_ioctl.h                                          conflict!
> +'S'   82-FF  scsi/scsi.h                                                conflict!
> +'S'   00-7F  sound/asequencer.h                                         conflict!
> +'T'   all    linux/soundcard.h                                          conflict!
> +'T'   00-AF  sound/asound.h                                             conflict!
> +'T'   all    arch/x86/include/asm/ioctls.h                              conflict!
> +'T'   C0-DF  linux/if_tun.h                                             conflict!
> +'U'   all    sound/asound.h                                             conflict!
> +'U'   00-CF  linux/uinput.h                                             conflict!
>   'U'   00-EF  linux/usbdevice_fs.h
>   'U'   C0-CF  drivers/bluetooth/hci_uart.h
> -'V'   all    linux/vt.h                                              conflict!
> -'V'   all    linux/videodev2.h                                       conflict!
> -'V'   C0     linux/ivtvfb.h                                          conflict!
> -'V'   C0     linux/ivtv.h                                            conflict!
> -'V'   C0     media/si4713.h                                          conflict!
> -'W'   00-1F  linux/watchdog.h                                        conflict!
> -'W'   00-1F  linux/wanrouter.h                                       conflict! (pre 3.9)
> -'W'   00-3F  sound/asound.h                                          conflict!
> +'V'   all    linux/vt.h                                                 conflict!
> +'V'   all    linux/videodev2.h                                          conflict!
> +'V'   C0     linux/ivtvfb.h                                             conflict!
> +'V'   C0     linux/ivtv.h                                               conflict!
> +'V'   C0     media/si4713.h                                             conflict!
> +'W'   00-1F  linux/watchdog.h                                           conflict!
> +'W'   00-1F  linux/wanrouter.h                                          conflict! (pre 3.9)
> +'W'   00-3F  sound/asound.h                                             conflict!
>   'W'   40-5F  drivers/pci/switch/switchtec.c
>   'W'   60-61  linux/watch_queue.h
> -'X'   all    fs/xfs/xfs_fs.h,                                        conflict!
> +'X'   all    fs/xfs/xfs_fs.h,                                           conflict!
>                fs/xfs/linux-2.6/xfs_ioctl32.h,
>                include/linux/falloc.h,
>                linux/fs.h,
> -'X'   all    fs/ocfs2/ocfs_fs.h                                      conflict!
> -'X'   01     linux/pktcdvd.h                                         conflict!
> +'X'   all    fs/ocfs2/ocfs_fs.h                                         conflict!
> +'X'   01     linux/pktcdvd.h                                            conflict!
>   'Z'   14-15  drivers/message/fusion/mptctl.h
> -'['   00-3F  linux/usb/tmc.h                                         USB Test and Measurement Devices
> -                                                                     <mailto:gregkh@linuxfoundation.org>
> -'a'   all    linux/atm*.h, linux/sonet.h                             ATM on linux
> -                                                                     <http://lrcwww.epfl.ch/>
> -'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          conflict! qat driver
> -'b'   00-FF                                                          conflict! bit3 vme host bridge
> -                                                                     <mailto:natalia@nikhefk.nikhef.nl>
> -'b'   00-0F  linux/dma-buf.h                                         conflict!
> -'c'   00-7F  linux/comstats.h                                        conflict!
> -'c'   00-7F  linux/coda.h                                            conflict!
> -'c'   00-1F  linux/chio.h                                            conflict!
> -'c'   80-9F  arch/s390/include/asm/chsc.h                            conflict!
> +'['   00-3F  linux/usb/tmc.h                                            USB Test and Measurement Devices
> +                                                                        <mailto:gregkh@linuxfoundation.org>
> +'a'   all    linux/atm*.h, linux/sonet.h                                ATM on linux
> +                                                                        <http://lrcwww.epfl.ch/>
> +'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h             conflict! qat driver
> +'b'   00-FF                                                             conflict! bit3 vme host bridge
> +                                                                        <mailto:natalia@nikhefk.nikhef.nl>
> +'b'   00-0F  linux/dma-buf.h                                            conflict!
> +'c'   00-7F  linux/comstats.h                                           conflict!
> +'c'   00-7F  linux/coda.h                                               conflict!
> +'c'   00-1F  linux/chio.h                                               conflict!
> +'c'   80-9F  arch/s390/include/asm/chsc.h                               conflict!
>   'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
> -'d'   00-FF  linux/char/drm/drm.h                                    conflict!
> -'d'   02-40  pcmcia/ds.h                                             conflict!
> +'d'   00-FF  linux/char/drm/drm.h                                       conflict!
> +'d'   02-40  pcmcia/ds.h                                                conflict!
>   'd'   F0-FF  linux/digi1.h
> -'e'   all    linux/digi1.h                                           conflict!
> -'f'   00-1F  linux/ext2_fs.h                                         conflict!
> -'f'   00-1F  linux/ext3_fs.h                                         conflict!
> -'f'   00-0F  fs/jfs/jfs_dinode.h                                     conflict!
> -'f'   00-0F  fs/ext4/ext4.h                                          conflict!
> -'f'   00-0F  linux/fs.h                                              conflict!
> -'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     conflict!
> +'e'   all    linux/digi1.h                                              conflict!
> +'f'   00-1F  linux/ext2_fs.h                                            conflict!
> +'f'   00-1F  linux/ext3_fs.h                                            conflict!
> +'f'   00-0F  fs/jfs/jfs_dinode.h                                        conflict!
> +'f'   00-0F  fs/ext4/ext4.h                                             conflict!
> +'f'   00-0F  linux/fs.h                                                 conflict!
> +'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                        conflict!
>   'f'   13-27  linux/fscrypt.h
>   'f'   81-8F  linux/fsverity.h
>   'g'   00-0F  linux/usb/gadgetfs.h
>   'g'   20-2F  linux/usb/g_printer.h
> -'h'   00-7F                                                          conflict! Charon filesystem
> -                                                                     <mailto:zapman@interlan.net>
> -'h'   00-1F  linux/hpet.h                                            conflict!
> +'h'   00-7F                                                             conflict! Charon filesystem
> +                                                                        <mailto:zapman@interlan.net>
> +'h'   00-1F  linux/hpet.h                                               conflict!
>   'h'   80-8F  fs/hfsplus/ioctl.c
> -'i'   00-3F  linux/i2o-dev.h                                         conflict!
> -'i'   0B-1F  linux/ipmi.h                                            conflict!
> +'i'   00-3F  linux/i2o-dev.h                                            conflict!
> +'i'   0B-1F  linux/ipmi.h                                               conflict!
>   'i'   80-8F  linux/i8k.h
> -'i'   90-9F  `linux/iio/*.h`                                         IIO
> +'i'   90-9F  `linux/iio/*.h`                                            IIO
>   'j'   00-3F  linux/joystick.h
> -'k'   00-0F  linux/spi/spidev.h                                      conflict!
> -'k'   00-05  video/kyro.h                                            conflict!
> -'k'   10-17  linux/hsi/hsi_char.h                                    HSI character device
> -'l'   00-3F  linux/tcfs_fs.h                                         transparent cryptographic file system
> -                                                                     <http://web.archive.org/web/%2A/http://mikonos.dia.unisa.it/tcfs>
> -'l'   40-7F  linux/udf_fs_i.h                                        in development:
> -                                                                     <https://github.com/pali/udftools>
> -'m'   00-09  linux/mmtimer.h                                         conflict!
> -'m'   all    linux/mtio.h                                            conflict!
> -'m'   all    linux/soundcard.h                                       conflict!
> -'m'   all    linux/synclink.h                                        conflict!
> -'m'   00-19  drivers/message/fusion/mptctl.h                         conflict!
> -'m'   00     drivers/scsi/megaraid/megaraid_ioctl.h                  conflict!
> +'k'   00-0F  linux/spi/spidev.h                                         conflict!
> +'k'   00-05  video/kyro.h                                               conflict!
> +'k'   10-17  linux/hsi/hsi_char.h                                       HSI character device
> +'l'   00-3F  linux/tcfs_fs.h                                            transparent cryptographic file system
> +                                                                        <http://web.archive.org/web/%2A/http://mikonos.dia.unisa.it/tcfs>
> +'l'   40-7F  linux/udf_fs_i.h                                           in development:
> +                                                                        <https://github.com/pali/udftools>
> +'m'   00-09  linux/mmtimer.h                                            conflict!
> +'m'   all    linux/mtio.h                                               conflict!
> +'m'   all    linux/soundcard.h                                          conflict!
> +'m'   all    linux/synclink.h                                           conflict!
> +'m'   00-19  drivers/message/fusion/mptctl.h                            conflict!
> +'m'   00     drivers/scsi/megaraid/megaraid_ioctl.h                     conflict!
>   'n'   00-7F  linux/ncp_fs.h and fs/ncpfs/ioctl.c
> -'n'   80-8F  uapi/linux/nilfs2_api.h                                 NILFS2
> -'n'   E0-FF  linux/matroxfb.h                                        matroxfb
> -'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                     OCFS2
> -'o'   00-03  mtd/ubi-user.h                                          conflict! (OCFS2 and UBI overlaps)
> -'o'   40-41  mtd/ubi-user.h                                          UBI
> -'o'   01-A1  `linux/dvb/*.h`                                         DVB
> -'p'   00-0F  linux/phantom.h                                         conflict! (OpenHaptics needs this)
> -'p'   00-1F  linux/rtc.h                                             conflict!
> +'n'   80-8F  uapi/linux/nilfs2_api.h                                    NILFS2
> +'n'   E0-FF  linux/matroxfb.h                                           matroxfb
> +'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                        OCFS2
> +'o'   00-03  mtd/ubi-user.h                                             conflict! (OCFS2 and UBI overlaps)
> +'o'   40-41  mtd/ubi-user.h                                             UBI
> +'o'   01-A1  `linux/dvb/*.h`                                            DVB
> +'p'   00-0F  linux/phantom.h                                            conflict! (OpenHaptics needs this)
> +'p'   00-1F  linux/rtc.h                                                conflict!
>   'p'   40-7F  linux/nvram.h
> -'p'   80-9F  linux/ppdev.h                                           user-space parport
> -                                                                     <mailto:tim@cyberelk.net>
> -'p'   A1-A5  linux/pps.h                                             LinuxPPS
> -'p'   B1-B3  linux/pps_gen.h                                         LinuxPPS
> -                                                                     <mailto:giometti@linux.it>
> +'p'   80-9F  linux/ppdev.h                                              user-space parport
> +                                                                        <mailto:tim@cyberelk.net>
> +'p'   A1-A5  linux/pps.h                                                LinuxPPS
> +'p'   B1-B3  linux/pps_gen.h                                            LinuxPPS
> +                                                                        <mailto:giometti@linux.it>
>   'q'   00-1F  linux/serio.h
> -'q'   80-FF  linux/telephony.h                                       Internet PhoneJACK, Internet LineJACK
> -             linux/ixjuser.h                                         <http://web.archive.org/web/%2A/http://www.quicknet.net>
> +'q'   80-FF  linux/telephony.h                                          Internet PhoneJACK, Internet LineJACK
> +             linux/ixjuser.h                                            <http://web.archive.org/web/%2A/http://www.quicknet.net>
>   'r'   00-1F  linux/msdos_fs.h and fs/fat/dir.c
>   's'   all    linux/cdk.h
>   't'   00-7F  linux/ppp-ioctl.h
>   't'   80-8F  linux/isdn_ppp.h
> -'t'   90-91  linux/toshiba.h                                         toshiba and toshiba_acpi SMM
> -'u'   00-1F  linux/smb_fs.h                                          gone
> -'u'   00-2F  linux/ublk_cmd.h                                        conflict!
> -'u'   20-3F  linux/uvcvideo.h                                        USB video class host driver
> -'u'   40-4f  linux/udmabuf.h                                         userspace dma-buf misc device
> -'v'   00-1F  linux/ext2_fs.h                                         conflict!
> -'v'   00-1F  linux/fs.h                                              conflict!
> -'v'   00-0F  linux/sonypi.h                                          conflict!
> -'v'   00-0F  media/v4l2-subdev.h                                     conflict!
> -'v'   20-27  arch/powerpc/include/uapi/asm/vas-api.h		     VAS API
> -'v'   C0-FF  linux/meye.h                                            conflict!
> -'w'   all                                                            CERN SCI driver
> -'y'   00-1F                                                          packet based user level communications
> -                                                                     <mailto:zapman@interlan.net>
> -'z'   00-3F                                                          CAN bus card conflict!
> -                                                                     <mailto:hdstich@connectu.ulm.circular.de>
> -'z'   40-7F                                                          CAN bus card conflict!
> -                                                                     <mailto:oe@port.de>
> -'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                        conflict!
> +'t'   90-91  linux/toshiba.h                                            toshiba and toshiba_acpi SMM
> +'u'   00-1F  linux/smb_fs.h                                             gone
> +'u'   00-2F  linux/ublk_cmd.h                                           conflict!
> +'u'   20-3F  linux/uvcvideo.h                                           USB video class host driver
> +'u'   40-4f  linux/udmabuf.h                                            userspace dma-buf misc device
> +'v'   00-1F  linux/ext2_fs.h                                            conflict!
> +'v'   00-1F  linux/fs.h                                                 conflict!
> +'v'   00-0F  linux/sonypi.h                                             conflict!
> +'v'   00-0F  media/v4l2-subdev.h                                        conflict!
> +'v'   20-27  arch/powerpc/include/uapi/asm/vas-api.h		        VAS API
> +'v'   C0-FF  linux/meye.h                                               conflict!
> +'w'   all                                                               CERN SCI driver
> +'y'   00-1F                                                             packet based user level communications
> +                                                                        <mailto:zapman@interlan.net>
> +'z'   00-3F                                                             CAN bus card conflict!
> +                                                                        <mailto:hdstich@connectu.ulm.circular.de>
> +'z'   40-7F                                                             CAN bus card conflict!
> +                                                                        <mailto:oe@port.de>
> +'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                           conflict!
>   '|'   00-7F  linux/media.h
> -'|'   80-9F  samples/                                                Any sample and example drivers
> +'|'   80-9F  samples/                                                   Any sample and example drivers
>   0x80  00-1F  linux/fb.h
>   0x81  00-1F  linux/vduse.h
>   0x89  00-06  arch/x86/include/asm/sockios.h
>   0x89  0B-DF  linux/sockios.h
> -0x89  E0-EF  linux/sockios.h                                         SIOCPROTOPRIVATE range
> -0x89  F0-FF  linux/sockios.h                                         SIOCDEVPRIVATE range
> +0x89  E0-EF  linux/sockios.h                                            SIOCPROTOPRIVATE range
> +0x89  F0-FF  linux/sockios.h                                            SIOCDEVPRIVATE range
>   0x8A  00-1F  linux/eventpoll.h
>   0x8B  all    linux/wireless.h
> -0x8C  00-3F                                                          WiNRADiO driver
> -                                                                     <http://www.winradio.com.au/>
> +0x8C  00-3F                                                             WiNRADiO driver
> +                                                                        <http://www.winradio.com.au/>
>   0x90  00     drivers/cdrom/sbpcd.h
>   0x92  00-0F  drivers/usb/mon/mon_bin.c
>   0x93  60-7F  linux/auto_fs.h
> -0x94  all    fs/btrfs/ioctl.h                                        Btrfs filesystem
> -             and linux/fs.h                                          some lifted to vfs/generic
> -0x97  00-7F  fs/ceph/ioctl.h                                         Ceph file system
> -0x99  00-0F                                                          537-Addinboard driver
> -                                                                     <mailto:buk@buks.ipn.de>
> +0x94  all    fs/btrfs/ioctl.h                                           Btrfs filesystem
> +             and linux/fs.h                                             some lifted to vfs/generic
> +0x97  00-7F  fs/ceph/ioctl.h                                            Ceph file system
> +0x99  00-0F                                                             537-Addinboard driver
> +                                                                        <mailto:buk@buks.ipn.de>
>   0x9A  00-0F  include/uapi/fwctl/fwctl.h
> -0xA0  all    linux/sdp/sdp.h                                         Industrial Device Project
> -                                                                     <mailto:kenji@bitgate.com>
> -0xA1  0      linux/vtpm_proxy.h                                      TPM Emulator Proxy Driver
> -0xA2  all    uapi/linux/acrn.h                                       ACRN hypervisor
> -0xA3  80-8F                                                          Port ACL  in development:
> -                                                                     <mailto:tlewis@mindspring.com>
> +0xA0  all    linux/sdp/sdp.h                                            Industrial Device Project
> +                                                                        <mailto:kenji@bitgate.com>
> +0xA1  0      linux/vtpm_proxy.h                                         TPM Emulator Proxy Driver
> +0xA2  all    uapi/linux/acrn.h                                          ACRN hypervisor
> +0xA3  80-8F                                                             Port ACL  in development:
> +                                                                        <mailto:tlewis@mindspring.com>
>   0xA3  90-9F  linux/dtlk.h
> -0xA4  00-1F  uapi/linux/tee.h                                        Generic TEE subsystem
> -0xA4  00-1F  uapi/asm/sgx.h                                          <mailto:linux-sgx@vger.kernel.org>
> -0xA5  01-05  linux/surface_aggregator/cdev.h                         Microsoft Surface Platform System Aggregator
> -                                                                     <mailto:luzmaximilian@gmail.com>
> -0xA5  20-2F  linux/surface_aggregator/dtx.h                          Microsoft Surface DTX driver
> -                                                                     <mailto:luzmaximilian@gmail.com>
> +0xA4  00-1F  uapi/linux/tee.h                                           Generic TEE subsystem
> +0xA4  00-1F  uapi/asm/sgx.h                                             <mailto:linux-sgx@vger.kernel.org>
> +0xA5  01-05  linux/surface_aggregator/cdev.h                            Microsoft Surface Platform System Aggregator
> +                                                                        <mailto:luzmaximilian@gmail.com>
> +0xA5  20-2F  linux/surface_aggregator/dtx.h                             Microsoft Surface DTX driver
> +                                                                        <mailto:luzmaximilian@gmail.com>
>   0xAA  00-3F  linux/uapi/linux/userfaultfd.h
>   0xAB  00-1F  linux/nbd.h
>   0xAC  00-1F  linux/raw.h
> -0xAD  00                                                             Netfilter device in development:
> -                                                                     <mailto:rusty@rustcorp.com.au>
> -0xAE  00-1F  linux/kvm.h                                             Kernel-based Virtual Machine
> -                                                                     <mailto:kvm@vger.kernel.org>
> -0xAE  40-FF  linux/kvm.h                                             Kernel-based Virtual Machine
> -                                                                     <mailto:kvm@vger.kernel.org>
> -0xAE  20-3F  linux/nitro_enclaves.h                                  Nitro Enclaves
> -0xAF  00-1F  linux/fsl_hypervisor.h                                  Freescale hypervisor
> -0xB0  all                                                            RATIO devices in development:
> -                                                                     <mailto:vgo@ratio.de>
> -0xB1  00-1F                                                          PPPoX
> -                                                                     <mailto:mostrows@styx.uwaterloo.ca>
> -0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
> -                                                                     <mailto:linuxppc-dev>
> -0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
> -                                                                     <mailto:linuxppc-dev>
> -0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
> -                                                                     <mailto:linuxppc-dev>
> -0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
> -                                                                     <mailto:linuxppc-dev>
> -0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
> -                                                                     <mailto:linuxppc-dev>
> +0xAD  00                                                                Netfilter device in development:
> +                                                                        <mailto:rusty@rustcorp.com.au>
> +0xAE  00-1F  linux/kvm.h                                                Kernel-based Virtual Machine
> +                                                                        <mailto:kvm@vger.kernel.org>
> +0xAE  40-FF  linux/kvm.h                                                Kernel-based Virtual Machine
> +                                                                        <mailto:kvm@vger.kernel.org>
> +0xAE  20-3F  linux/nitro_enclaves.h                                     Nitro Enclaves
> +0xAF  00-1F  linux/fsl_hypervisor.h                                     Freescale hypervisor
> +0xB0  all                                                               RATIO devices in development:
> +                                                                        <mailto:vgo@ratio.de>
> +0xB1  00-1F                                                             PPPoX
> +                                                                        <mailto:mostrows@styx.uwaterloo.ca>
> +0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                   powerpc/pseries VPD API
> +                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h               powerpc/pseries system parameter API
> +                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h               powerpc/pseries indices API
> +                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h         powerpc/pseries Platform Dump API
> +                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
> +0xB2  08     arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
> +                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
>   0xB3  00     linux/mmc/ioctl.h
> -0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
> -0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
> +0xB4  00-0F  linux/gpio.h                                               <mailto:linux-gpio@vger.kernel.org>
> +0xB5  00-0F  uapi/linux/rpmsg.h                                         <mailto:linux-remoteproc@vger.kernel.org>
>   0xB6  all    linux/fpga-dfl.h
> -0xB7  all    uapi/linux/remoteproc_cdev.h                            <mailto:linux-remoteproc@vger.kernel.org>
> -0xB7  all    uapi/linux/nsfs.h                                       <mailto:Andrei Vagin <avagin@openvz.org>>
> -0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                              Marvell CN10K DPI driver
> -0xB8  all    uapi/linux/mshv.h                                       Microsoft Hyper-V /dev/mshv driver
> -                                                                     <mailto:linux-hyperv@vger.kernel.org>
> +0xB7  all    uapi/linux/remoteproc_cdev.h                               <mailto:linux-remoteproc@vger.kernel.org>
> +0xB7  all    uapi/linux/nsfs.h                                          <mailto:Andrei Vagin <avagin@openvz.org>>
> +0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                                 Marvell CN10K DPI driver
> +0xB8  all    uapi/linux/mshv.h                                          Microsoft Hyper-V /dev/mshv driver
> +                                                                        <mailto:linux-hyperv@vger.kernel.org>
>   0xC0  00-0F  linux/usb/iowarrior.h
> -0xCA  00-0F  uapi/misc/cxl.h                                         Dead since 6.15
> +0xCA  00-0F  uapi/misc/cxl.h                                            Dead since 6.15
>   0xCA  10-2F  uapi/misc/ocxl.h
> -0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                              Dead since 6.15
> -0xCB  00-1F                                                          CBM serial IEC bus in development:
> -                                                                     <mailto:michael.klein@puffin.lb.shuttle.de>
> -0xCC  00-0F  drivers/misc/ibmvmc.h                                   pseries VMC driver
> -0xCD  01     linux/reiserfs_fs.h                                     Dead since 6.13
> -0xCE  01-02  uapi/linux/cxl_mem.h                                    Compute Express Link Memory Devices
> +0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                                 Dead since 6.15
> +0xCB  00-1F                                                             CBM serial IEC bus in development:
> +                                                                        <mailto:michael.klein@puffin.lb.shuttle.de>
> +0xCC  00-0F  drivers/misc/ibmvmc.h                                      pseries VMC driver
> +0xCD  01     linux/reiserfs_fs.h                                        Dead since 6.13
> +0xCE  01-02  uapi/linux/cxl_mem.h                                       Compute Express Link Memory Devices
>   0xCF  02     fs/smb/client/cifs_ioctl.h
>   0xDB  00-0F  drivers/char/mwave/mwavepub.h
> -0xDD  00-3F                                                          ZFCP device driver see drivers/s390/scsi/
> -                                                                     <mailto:aherrman@de.ibm.com>
> +0xDD  00-3F                                                             ZFCP device driver see drivers/s390/scsi/
> +                                                                        <mailto:aherrman@de.ibm.com>
>   0xE5  00-3F  linux/fuse.h
> -0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                   ChromeOS EC driver
> -0xEE  00-09  uapi/linux/pfrut.h                                      Platform Firmware Runtime Update and Telemetry
> -0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                     sisfb (in development)
> -                                                                     <mailto:thomas@winischhofer.net>
> -0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
> -                                                                     <mailto:mathieu.desnoyers@efficios.com>
> -0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
> -                                                                     <mailto:nchatrad@amd.com>
> +0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                      ChromeOS EC driver
> +0xEE  00-09  uapi/linux/pfrut.h                                         Platform Firmware Runtime Update and Telemetry
> +0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                        sisfb (in development)
> +                                                                        <mailto:thomas@winischhofer.net>
> +0xF6  all                                                               LTTng Linux Trace Toolkit Next Generation
> +                                                                        <mailto:mathieu.desnoyers@efficios.com>
> +0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                       AMD HSMP EPYC system management interface driver
> +                                                                        <mailto:nchatrad@amd.com>
>   0xFD  all    linux/dm-ioctl.h
>   0xFE  all    linux/isst_if.h
> -====  =====  ======================================================= ================================================================
> +====  =====  =========================================================  ================================================================
>
> base-commit: 86900ab620a42396a749b506d4a187820fc3fabe


Tested this patch by applying on top of next-20250429, and this patch 
also fixes the reported issue. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Note: There is other patch [1] 
<https://lore.kernel.org/linuxppc-dev/aBHodTu4IjqzZeXb@archie.me/T/#m013297a6731d3ca3dc1e0f23d161774850d6b41c> 
which has a different approach to fix the reported issue.


Regards,

Venkat.


