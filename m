Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0276252E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 05:56:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7md40ZJ8z3f3J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:56:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ekH8b1BI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ekH8b1BI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7mc36cmbz3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 15:55:30 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AB4iDjS017104;
	Fri, 11 Nov 2022 04:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=bSNMtQ7RRVXUezWBU6/StIY5X7qvabopkcZS0gH1A5I=;
 b=ekH8b1BI4JFY1y6qgJPMulGrsaDnwoy/yf8zss+ZdCH7enkiDrAwbcUupLG0XeuanxDh
 aFxR8bQ8LNXvFyL/SAkKkUAXO2WLI+jZvpTA+wlNbzusnudFSMkdmpG1xHdRQWEGSDz6
 RgkDSMDvaCqrEM+8Dls6gF2TclilbIZOY6foluG5UxkQtDA4P96wdJ5YZnJL37K5eUgC
 LhU5YB0Clc2DexxOcL1hBzHaY1/s1808YpOGB9MPQkKGN+BwxWKn9C5ADC5b3Ci57kir
 sBg38BVjMQe9uMTMvOPJHMb1tqYLOPvDc1NR8fXun6je15xVdxs6d3+KH7JtPM5sWV1U RA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ksfm9r6pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 04:55:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AB4oeHM006790;
	Fri, 11 Nov 2022 04:55:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqgg637-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 04:55:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AB4tCWR5898986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Nov 2022 04:55:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 456C452050;
	Fri, 11 Nov 2022 04:55:12 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.108.238])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 58B855204F;
	Fri, 11 Nov 2022 04:55:11 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [6.1.0-rc4-next-20221109] Boot time warning
 kernel/module/main.c:852
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <05a91775-e4fa-4d70-8303-898339c4ea01@acm.org>
Date: Fri, 11 Nov 2022 10:25:00 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <8C37C3E0-3F2E-4FF6-AD38-30BDCF48AB2C@linux.ibm.com>
References: <06C70AFA-75C5-49A7-9EB4-27AF20A80EBB@linux.ibm.com>
 <05a91775-e4fa-4d70-8303-898339c4ea01@acm.org>
To: Bart Van Assche <bvanassche@acm.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nJS8csZ4UwhBR6rMvZBRwxRDBHIOC29y
X-Proofpoint-GUID: nJS8csZ4UwhBR6rMvZBRwxRDBHIOC29y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 clxscore=1015 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211110028
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> [ 8.809079] [c000000007c37e10] [c00000000000cffc] =
ret_from_kernel_thread+0x5c/0x64
>> [ 8.809086] Instruction dump:
>> [ 8.809090] f821ffc1 41820034 395e03c0 7c0004ac 7d205028 2c090001 =
3929ffff 41c00010
>> [ 8.809101] 7d20512d
>> [ 8.809101] sd 1:0:0:1: [sdc] Preferred minimum I/O size 32768 bytes
>> [ 8.809102] 40c2ffec 7c0004ac 79290fe2 <0b090000> 60000000 38210040 =
ebc1fff0
>> [ 8.809115] ---[ end trace 0000000000000000 ]=E2=80=94
>> -next-20221108 was good. Git bisect points to following
>> commit 0b25e17e9018a0ea68a9f0b4787672e8c68fa8d5
>> Date:   Mon Oct 31 15:47:25 2022 -0700
>>     scsi: alua: Move a scsi_device_put() call out of alua_check_vpd()
>> Reverting this patch gets rid of the warning.
>=20
> Hi Sachin,
>=20
> Thanks for the detailed report. Does the patch below help?
>=20

Yup, thanks. With this change applied I do not see the warning.

- Sachin

> diff --git a/drivers/scsi/device_handler/scsi_dh_alua.c =
b/drivers/scsi/device_handler/scsi_dh_alua.c
> index 693cd827e138..d2cf15338724 100644
> --- a/drivers/scsi/device_handler/scsi_dh_alua.c
> +++ b/drivers/scsi/device_handler/scsi_dh_alua.c
> @@ -1025,7 +1025,7 @@ static bool __must_check alua_rtpg_queue(struct =
alua_port_group *pg,
> kref_put(&pg->kref, release_port_group);
> }
>=20
> - return true;
> + return sdev !=3D NULL;
> }
>=20
> /*
>=20

