Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9FC5C02C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXjg12BxPz3c8q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 01:55:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iqvMjAi7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iqvMjAi7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXjfL5mvsz300l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 01:54:50 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LFcQOh015951;
	Wed, 21 Sep 2022 15:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=fajwiUjbAI7Yyw66jcdiyuzDm8qqrDkSkqbXcsd3PWs=;
 b=iqvMjAi75nBfIkBSlxurOP0xWAYJohBIc3foDrbvCYp5Jk/4h4a+Aowjg+cWbEAXwhGk
 4MyhpKtfIHTnHDd+ncfF2hYsD0Th8ZzdGLyF03jPlL06lGy8YGEsa1ai+P1YK9pZ7HTz
 n2NtvvWBoxuzXMklRkOfngcjyzxhPeSM1zw2dyy8TXh8Y0XjI+MGCY3xdylVgl3sDAfY
 HtcrAAnlOAZV5ICs0cwogdCCh1vrp6XuVk5yn3sNoQy3u0ejebg3KkVa8Z5SGqyEYsXe
 VcKuhDxFQ6qEPeKZyD2XexmtievpkMxxTpG+NZewgYWvivWbVnHkQyxfaYFC/VVhGtmP 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jr3djnckc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:54:44 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28LFcRw3015977;
	Wed, 21 Sep 2022 15:54:43 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jr3djncju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:54:43 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28LFp9OZ000628;
	Wed, 21 Sep 2022 15:54:43 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 3jn5v9sm2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:54:42 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28LFsefT25494108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 15:54:40 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F41558061;
	Wed, 21 Sep 2022 15:54:41 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65B2A58059;
	Wed, 21 Sep 2022 15:54:41 +0000 (GMT)
Received: from localhost (unknown [9.163.93.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 15:54:41 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>,
        Leonardo =?utf-8?Q?Br=C3=A1s?=
 <leobras.c@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
In-Reply-To: <CN0XB6PRTPP7.W10Z5R1QNLZC@bobo>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
 <CMXFROL4N1OT.4DV7ZOHOP954@bobo> <87h717t24d.fsf@linux.ibm.com>
 <87illjqxpn.fsf@linux.ibm.com> <CN0XB6PRTPP7.W10Z5R1QNLZC@bobo>
Date: Wed, 21 Sep 2022 10:54:41 -0500
Message-ID: <87fsgkrada.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bm8kZBvEkqx2ZDlWfVfBvQ-1GgHvx_vf
X-Proofpoint-GUID: _YEcEJip4PCCY-JifQ7M4ADo5nRMTXU4
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_09,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=610 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209210103
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:

> On Mon Sep 19, 2022 at 11:51 PM AEST, Nathan Lynch wrote:
>> > I wonder - would it be worth making the panic path use a separate
>> > "emergency" rtas_args buffer as well? If a CPU is actually "stuck" in
>> > RTAS at panic time, then leaving rtas.args untouched might make the
>> > ibm,int-off, ibm,set-xive, ibm,os-term, and any other RTAS calls we
>> > incur on the panic path more likely to succeed.
>
> Yeah I think that's probably not a bad idea. Not sure if you've got the
> bandwidth to take on doing the patch but be my guest if you do :)
> Otherwise we can file it in github issues.

Not sure I'll be able to work it soon. I filed
https://github.com/linuxppc/issues/issues/435
