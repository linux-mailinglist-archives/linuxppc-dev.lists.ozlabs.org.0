Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC3634E08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 03:52:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH5JH6Fbmz3dvj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 13:52:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aaYuKc5Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aaYuKc5Q;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH5HL1BP0z3bjQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 13:51:25 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN2RJhO009901
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 02:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QELBcZ/o3wjy8YVPPAL/kwXiY3pSMp4Xs1aOacdQlTo=;
 b=aaYuKc5QDhYgbGSuPmXngSuNQGWmhQ1k4gUCMa1a+fSz7Ki07GBM251G4OhhfTa1ypDn
 wlEqz3mB1M9aOrIAZZpsjQ97A8Lo7D7L/jAF/Nve6aSN/BQuJ7JWJlBqIzdOwuyeDL/k
 MeBZlYA0ui9NyY9hdzQIwad2b26ZLAt9/+swNwMWP/8Z0ZEs2/sapPhCukYjQRE0F2+R
 GdFPsmygAbW3i2xF2xQo5cB7HmZ+Qbb737Qt0+8DmXPwcoRpw5RaCJyKngLRlA8DKNe+
 Ct7AQAaP+78WwfUtzvuDy1REMYs/Bz7ja40Ihf5PDigTAB0pDAexljql97kHQ5AoFSn9 AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w5eqm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 02:51:22 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AN2msLw024787
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 02:51:21 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w5eqkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 02:51:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AN2pKtC028358;
	Wed, 23 Nov 2022 02:51:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3kxps8w0np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 02:51:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AN2pHFh4194980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Nov 2022 02:51:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D03714C04A;
	Wed, 23 Nov 2022 02:51:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AD964C040;
	Wed, 23 Nov 2022 02:51:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 23 Nov 2022 02:51:17 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5DDC66005B;
	Wed, 23 Nov 2022 13:51:16 +1100 (AEDT)
Message-ID: <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 23 Nov 2022 13:51:06 +1100
In-Reply-To: <20221118150751.469393-11-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-11-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8GqmW1JEPdDVbmrpIeodZVpIqMXFBp61
X-Proofpoint-ORIG-GUID: 9MebyBSJTuLkcvGYCr2dxcfc7dQO10j4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=839 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230017
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> Convert rtas_token() to use a lockless binary search on the function
> table. Fall back to the old behavior for lookups against names that
> are not known to be RTAS functions, but issue a warning. rtas_token()
> is for function names; it is not a general facility for accessing
> arbitrary properties of the /rtas node. All known misuses of
> rtas_token() have been converted to more appropriate of_ APIs in
> preceding changes.

For in-kernel users, why not go all the way: make rtas_token() static
and use it purely for the userspace API, and switch kernel users over
to using rtas_function_index directly?

> +enum rtas_function_flags {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RTAS_FN_FLAG_BANNED_FOR_SYSCAL=
L_ON_LE =3D (1 << 0),
> +};

This seems to be new, what's the justification?

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
