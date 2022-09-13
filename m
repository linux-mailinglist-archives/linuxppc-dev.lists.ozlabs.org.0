Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C65B6627
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 05:32:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRTYx0QX9z3bVB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 13:32:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pGE3LxMm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pGE3LxMm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRTYB5K8Rz2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 13:32:13 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D2i85M009321
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jQlmI7NDNF8kFnZlKkj0JsU0tt6/p0UnLmp27XAhloU=;
 b=pGE3LxMmmnkFm8qZx0t0wSSi9d8H7dgZd16Ag3gyyVQ8UDV9vc7yC7f0a0tuReBxCKF6
 92xz1YeVx6Lpb22RFAeCSq+DVJAKVXXPR1i/F1C53YlExwxAFx35SCKe77aWLNDQxiem
 3Gz72kzhJR08r+99eVs8m6S5s2QK15qcVw4mtlE2Ketf0aWVZjhULg9UPnhVDr44611N
 TcRumGoKe4T8sC2oetY43DE8+hL8kPT786uJ1E8Ldb67ehbLjJy6JxYcZz6tA6K66QQZ
 cQEjbGNg3jQqjfduUZF9L+qZUWqLOidsSrGM1EhFO4rFS/jZYMJO+ett2mD6XsurX1P8 EA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjhbd0w55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:10 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D3OfbX016277
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma02fra.de.ibm.com with ESMTP id 3jgj792b52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D3W6r840501588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21164A4053
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0538A404D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 03:32:05 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 508A960129
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 13:31:58 +1000 (AEST)
Message-ID: <4f6d5fe841a6b92d3e0a6759e49a099342d9e486.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 0/4] Out-of-line static calls for powerpc64 ELF V2
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Tue, 13 Sep 2022 13:31:57 +1000
In-Reply-To: <20220901055823.152983-1-bgray@linux.ibm.com>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KprAI_VlYyA7B2tY6NIgjMxlC6T-E4Eu
X-Proofpoint-ORIG-GUID: KprAI_VlYyA7B2tY6NIgjMxlC6T-E4Eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_16,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=735 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209130013
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-01 at 15:58 +1000, Benjamin Gray wrote:
> =C2=A0=C2=A0=C2=A0 So not having a local entry point implies not using a =
TOC
> pointer, which
> =C2=A0=C2=A0=C2=A0 implies r2 is volatile if the trampoline does not guar=
antee that
> it preserves
> =C2=A0=C2=A0=C2=A0 r2. However experimenting with such a trampoline showe=
d the
> caller still did
> =C2=A0=C2=A0=C2=A0 not preserve its TOC when necessary, even when the tra=
mpoline
> used instructions
> =C2=A0=C2=A0=C2=A0 that wrote to r2. Possibly there's an attribute that c=
an be used
> to mark the
> =C2=A0=C2=A0=C2=A0 necessary info, but I could not find one.

The `.localentry` directive is more general than just specifying where
the local entry is: it can be used to set the relevant ELF bits
directly. So the solution here is setting `.localentry NAME, 1` on the
SC trampoline.

It's not an optimal solution, as it inserts another trampoline to save
r2 before calling the SC trampoline, but it would allow a correct
implementation without the work needed in the other choices.
