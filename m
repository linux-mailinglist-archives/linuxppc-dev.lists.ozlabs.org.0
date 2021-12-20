Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38247A441
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 06:18:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHSXk4Kmkz3c56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 16:18:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KIo2Mv1O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KIo2Mv1O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHSX10lDYz2xrD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 16:17:36 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK4gx5q023741; 
 Mon, 20 Dec 2021 05:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=+CYJqSqiYfNAP3QMr+5CRH+D4WzJnM8u+I9ZOmg7xrQ=;
 b=KIo2Mv1OcYw/IY1dGKcxe32JS07iOQcUVBRFqLM4waum4l6iaL/AUjj+6ERj2QxLdGa/
 6zk9K7ucGXZB4dc6WDcoh6xWOFkAILTPgEQcPhP233XUxYk2pEHKOOSm1ycFNHX/4tRh
 q8AV2cYLg0KQIb6YQZi13yH2ymM6LCIamYx8jCh5UXSI+tQxGQQeTZ4MHtOH599nffxh
 8R4KbV6b8J3pWxc9+gWotBduvpUqixLO3Q7+tWbnytPZeSqlKUnGp5xEsR3iGTgee7mU
 qVn+ZBu0NWZg8VMQDPzOdeNAViuZ9DnwGCWrHik4mJ3uEg1ETCyGnX9NjLfg/YavNTok Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1891075p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 05:17:23 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BK5F9GY025375;
 Mon, 20 Dec 2021 05:17:23 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1891075d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 05:17:23 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BK4di1P009171;
 Mon, 20 Dec 2021 05:17:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3d17990cv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 05:17:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BK5HHZ732833868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 05:17:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4688EAE04D;
 Mon, 20 Dec 2021 05:17:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3E08AE045;
 Mon, 20 Dec 2021 05:17:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.190.221])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 05:17:14 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] tpm: Fix kexec crash due to access to ops NULL pointer
 (powerpc)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20211212012804.1555661-1-stefanb@linux.ibm.com>
Date: Mon, 20 Dec 2021 10:47:13 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <B816AE7F-E224-4203-9B21-99310D49040D@linux.vnet.ibm.com>
References: <20211212012804.1555661-1-stefanb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T48F18qsbpGXA1jXdlhi-RC5TxT0JTH3
X-Proofpoint-ORIG-GUID: O6mN2UqEGCbQxCBoBu8e3G5WIxPmM_oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_02,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200028
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
Cc: Korrapati.Likhitha@ibm.com, pavrampu@in.ibm.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 jgg@ziepe.ca, jarkko@kernel.org, gcwilson@us.ibm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 12-Dec-2021, at 6:58 AM, Stefan Berger <stefanb@linux.ibm.com> =
wrote:
>=20
> Fix the following crash on kexec by checking chip->ops for a NULL =
pointer
> in tpm_chip_start() and returning an error code if this is the case.
>=20
> BUG: Kernel NULL pointer dereference on read at 0x00000060
> Faulting instruction address: 0xc00000000099a06c
> Oops: Kernel access of bad area, sig: 11 [#1]
> ...
> NIP [c00000000099a06c] tpm_chip_start+0x2c/0x140
> LR [c00000000099a808] tpm_chip_unregister+0x108/0x170
> Call Trace:
> [c0000000188bfa00] [c000000002b03930] fw_devlink_strict+0x0/0x8 =
(unreliable)
> [c0000000188bfa30] [c00000000099a808] tpm_chip_unregister+0x108/0x170
> [c0000000188bfa70] [c0000000009a3874] tpm_ibmvtpm_remove+0x34/0x130
> [c0000000188bfae0] [c000000000110dbc] vio_bus_remove+0x5c/0xb0
> [c0000000188bfb20] [c0000000009bc154] device_shutdown+0x1d4/0x3a8
> [c0000000188bfbc0] [c000000000196e14] kernel_restart_prepare+0x54/0x70
>=20
> The referenced patch below introduced a function to shut down the VIO =
bus.
> The bus shutdown now calls tpm_del_char_device (via =
tpm_chip_unregister)
> after a call to tpm_class_shutdown, which already set chip->ops to =
NULL.
> The crash occurrs when tpm_del_char_device calls tpm_chip_start with =
the
> chip->ops NULL pointer.
>=20
> Fixes: 39d0099f9439 ("powerpc/pseries: Add shutdown() to vio_driver =
and vio_bus")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---

With the patch applied, kexec with vTPM works as expected.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin=
