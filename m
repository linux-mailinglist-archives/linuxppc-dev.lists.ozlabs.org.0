Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2914340BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 23:44:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYnM639VRz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 08:44:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WNeQzbh0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WNeQzbh0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYnLP6nsdz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 08:43:41 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JKL1eF024193; 
 Tue, 19 Oct 2021 17:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=T42hVe3dUb7v8yZEJlZDA2n9K+Z8kkG+cF8aEFAYY/E=;
 b=WNeQzbh0Ix4r8JLYeAYvdjF28GbSU+cZJKe2hJZZYa+nxKDlQj8zCoTsflw0A9dY67fn
 Q5D0I9/0D+YfKvUjbc3itXpcHoDUgRg3xcWASo3ssfMNTIf1u6812xQ0U99IawUdbZkA
 Zsj/B6O3osdkpUjXkHS4ax1vxv7evPuAdyrBTrNqb3KSuus/Q6inMk3s4EO/upilyBpU
 7plMC5QcN2+7VS4GBKafmQ6yKeh/Ng+j0AqeJtJuA3pI25XQX7D6HnONyOkBVCRk93PF
 Uy4BJjAurSK/+5oeecAveKa8v5sY9Y+sJCBCIbscT1gpClrX8POCTGmWQ07Kgzd7zANl qw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bt2stmvpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 17:43:35 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19JLRNjH000517;
 Tue, 19 Oct 2021 21:43:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3bqpcbfpgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 21:43:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19JLhXFe38470070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 21:43:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C80D2AC064;
 Tue, 19 Oct 2021 21:43:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97FDEAC065;
 Tue, 19 Oct 2021 21:43:33 +0000 (GMT)
Received: from localhost (unknown [9.211.47.38])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Oct 2021 21:43:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/mobility: ignore
 ibm,platform-facilities updates
In-Reply-To: <6f72adc9-d28c-beeb-e21f-4a468d2bf0e3@linux.ibm.com>
References: <20211018163424.2491472-1-nathanl@linux.ibm.com>
 <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
 <6f72adc9-d28c-beeb-e21f-4a468d2bf0e3@linux.ibm.com>
Date: Tue, 19 Oct 2021 16:43:33 -0500
Message-ID: <87wnm8y9kq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ht3QMpjglxJmJTzMl0ObBYq2CdO8ZHRQ
X-Proofpoint-ORIG-GUID: Ht3QMpjglxJmJTzMl0ObBYq2CdO8ZHRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190124
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
Cc: cheloha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Le 19/10/2021 =C3=A0 00:37, Tyrel Datwyler a =C3=A9crit=C2=A0:
>> On 10/18/21 9:34 AM, Nathan Lynch wrote:
>> The reality is that '/ibm,platform-facilities' and 'cache' nodes are the=
 only
>> LPM scoped device tree nodes that allow node delete/add. So, as a one-off
>> workaround to deal with what I consider a bad firmware approach I think =
this is
>> probably the best approach barring getting firmware to move to an update
>> properties approach.
>
> I do agree, this is probably the best option until the firmware is moving=
 to an=20
> update notification.

Just to be clear, my proposal is to carry this hack until *Linux* can
be changed to better support the current firmware behavior. There's
little point in trying to get firmware to change now.
