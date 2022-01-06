Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADF48604F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 06:30:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTw1C3bCSz306f
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 16:30:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s8m1nXXv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s8m1nXXv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTw0N6wBsz2yMk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 16:29:56 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20626hp1022296; 
 Thu, 6 Jan 2022 05:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=fgBdqyBuejtKOoN9LSKRr3yh/KzHyYH4AHqPmrPcvLg=;
 b=s8m1nXXvpKnwkyPpObBeeNrjJUZQQr+rgJGVRaKIaUlLQ03c5FbTvCrbbD8utwo6izdi
 +jCqBYDBiKGkg/X5otvwPlYeNo5BJLD/AxlIM+qlk/TFBfrAUXeJIqYSviSgJ0mz4tcq
 9Zl+cGPuZ0QO3KtcXvW7hUtrPaobhl5UhQeW1WcJp8MzUScjUf9Imh9xFS59Ly0PdXvr
 EBQTPPtn9dM5o8OqgpIFOHw+Um3SjOQCJRpgQnVXSXe/r6sgts2501ILnEKFeKVbI5Zt
 LWMmr+pv5h2IkkQ+uWNS28IAtY0IJ10lkp0CKQqTh7/iYXY6yBHfCE5QhlcGifP3p5Wt Qw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddn37mmcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 05:29:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2065OgjE024832;
 Thu, 6 Jan 2022 05:29:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3ddn4u1k5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 05:29:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2065Tl7U16712066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 05:29:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDA58AE04D;
 Thu,  6 Jan 2022 05:29:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EC55AE055;
 Thu,  6 Jan 2022 05:29:46 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.43.116])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 05:29:46 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH]powerpc/xmon: Dump XIVE information for online-only
 processors.
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <c28f88f4-c2f8-fc91-2a0f-eb9b96889274@kaod.org>
Date: Thu, 6 Jan 2022 10:59:45 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <C43C95B6-A198-4007-8E49-764535C0722A@linux.vnet.ibm.com>
References: <164139226833.12930.272224382183014664.sendpatchset@MacBook-Pro.local>
 <c28f88f4-c2f8-fc91-2a0f-eb9b96889274@kaod.org>
To: =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mZlxcIE3ulmiiMiJAfyiq0zgMS_mBazg
X-Proofpoint-ORIG-GUID: mZlxcIE3ulmiiMiJAfyiq0zgMS_mBazg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_01,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=824 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201060032
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 05-Jan-2022, at 8:09 PM, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>=20
> On 1/5/22 15:17, Sachin Sant wrote:
>> dxa command in XMON debugger iterates through all possible =
processors.
>> As a result, empty lines are printed even for processors which are =
not
>> online.
>> CPU 47:pp=3D00 CPPR=3Dff IPI=3D0x0040002f PQ=3D-- EQ idx=3D699 T=3D0 =
00000000 00000000
>> CPU 48:
>> CPU 49:
>> Restrict XIVE information(dxa) to be displayed for online processors =
only.
>> Signed-off-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>=20
> Looks good to me. We should do the same for :
>=20
>  /sys/kernel/debug/powerpc/xive/ipis

Thanks for the pointer. Will send a separate patch for this issue.

- Sachin

>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks,
>=20
> C.
>=20
