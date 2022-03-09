Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11D4D3A9E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:50:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDN8V2LYfz3bWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 06:50:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ki2adnoC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ki2adnoC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDN7p0Nh3z2xm1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 06:49:41 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229HxuYC000354; 
 Wed, 9 Mar 2022 19:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=PUls9GvFqrg30SUzlCxrpGZS+8tFoB/C3hGEZtVCvaY=;
 b=ki2adnoCUzGSCHVwTfQ4/qzUcc/3NoMycyeqFDkeXmpafGHtSmt9BPWRSdJWNlhxf0U5
 5N85Y0tCenynJYUJaTPXwaPQj5XKoNCLbeZy16OQQ2PODhwGwWnWYVWswLYGY4aVcAJq
 fPVSmEyey3z5mNebM3aj2Y4mUhe2SbCwauXe1Yf7bzeFqH6e2ryoRA27zMtLN0XQxO1D
 Nt9IPJKBUdwrj6HEK8viewgsAO4PL1KQYuS+48+soPvPmctd2ZvnbwZbjWH3ZBfyf4GM
 r+GDRwzFwUHP+W7pnOhxBPerm+539D66OJnO4dp6ejLikGivroyAwF8RXKTTe/ldjOu7 QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enu2t8ha1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 19:49:35 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 229JKqBp018136;
 Wed, 9 Mar 2022 19:49:34 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enu2t8h9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 19:49:34 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 229JRtVk018425;
 Wed, 9 Mar 2022 19:49:33 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3ekyg9ee06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 19:49:33 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 229JnX0J5243808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Mar 2022 19:49:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E5B3AC05E;
 Wed,  9 Mar 2022 19:49:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F25C8AC059;
 Wed,  9 Mar 2022 19:49:31 +0000 (GMT)
Received: from localhost (unknown [9.211.59.35])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  9 Mar 2022 19:49:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] KVM: PPC: Book3S HV Nested: L2 LPCR should inherit
 L1 LPES setting
In-Reply-To: <20220303053315.1056880-7-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
 <20220303053315.1056880-7-npiggin@gmail.com>
Date: Wed, 09 Mar 2022 16:49:28 -0300
Message-ID: <871qzac3ef.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S8YgsbptDdO1jb5-OWNzXh6mUGDUUFN4
X-Proofpoint-GUID: 2fI2TUHJWB7JQykTL-T8yjuSKbns9W7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_07,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=702
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203090104
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The L1 should not be able to adjust LPES mode for the L2. Setting LPES
> if the L0 needs it clear would cause external interrupts to be sent to
> L2 and missed by the L0.
>
> Clearing LPES when it may be set, as typically happens with XIVE enabled
> could cause a performance issue despite having no native XIVE support in
> the guest, because it will cause mediated interrupts for the L2 to be
> taken in HV mode, which then have to be injected.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
