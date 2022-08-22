Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C059B8BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 07:32:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MB1Fm4wLnz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 15:32:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ojpj/x5l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ojpj/x5l;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MB1F21kHZz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 15:31:33 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M4T2bX014811;
	Mon, 22 Aug 2022 05:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=4aFdHo4IlzPRiiEBma7/STre7Ba9vt44B9rQPqiywxI=;
 b=ojpj/x5l2efcDSSDmA1AxoSooocYM9jgVl4FQ2I+RyIDKbdWm2nd6yCcrkq2RB2PKBM0
 ZSzam/HblIDP4Onq/CAFQOyZyHYZd5UwivNoc2so843XmgoShHIGGAxUCvAByH31wyOh
 4ZludsXxtQiqNYzUf2i6wGw7sLJRFGpFxDFh9qyfV5uaRh+rt7gDG8xQ7wK1XMKt2P9+
 2xh0rZ0FB/hI2tonsO6KjZQi2uO1EueV91CARh6Ec82Z349IPsuRhOAt3keP/0Kf3por
 xeebhd174+a28HRhdQREjwc7M+zIR5t+7XTA+ixaCkTHpZ5oHbh6zE7S94MJ1BTrNgpJ 1g== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j42tk1p0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 05:31:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27M5LdPN025083;
	Mon, 22 Aug 2022 05:31:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3j2q88sx2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 05:31:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27M5VLAE17891704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Aug 2022 05:31:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48A8011C04C;
	Mon, 22 Aug 2022 05:31:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3239911C04A;
	Mon, 22 Aug 2022 05:31:20 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.11.86])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 22 Aug 2022 05:31:19 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [6.0-rc1] Kernel crash while running MCE tests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <f70dfa03-1f5b-d738-ea75-cad5f5f97a43@linux.ibm.com>
Date: Mon, 22 Aug 2022 11:01:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <800F795E-6E80-44D2-81DF-926BBF375F15@linux.ibm.com>
References: <2BF30341-AD39-4949-9489-86C75A6F4513@linux.ibm.com>
 <87wnb7v2b3.fsf@mpe.ellerman.id.au>
 <f70dfa03-1f5b-d738-ea75-cad5f5f97a43@linux.ibm.com>
To: Ganesh <ganeshgr@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 21s7HdRT202aSLbbQeB61YwDc4QbzPEC
X-Proofpoint-GUID: 21s7HdRT202aSLbbQeB61YwDc4QbzPEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=859
 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208220026
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 19-Aug-2022, at 10:12 AM, Ganesh <ganeshgr@linux.ibm.com> wrote
>>=20
>> We'll have to make sure everything get_pseries_errorlog() is either
>> forced inline, or marked noinstr.
>>=20
> Making the following functions always_inline and noinstr is fixing the =
issue.
> __always_inline pseries_errorlog_id()
> __always_inline pseries_errorlog_length()
> __always_inline do_enter_rtas()
> __always_inline srr_regs_clobbered()
> noinstr va_rtas_call_unlocked()
>=20
> Shall I post the patch?

Yes, thanks. I can help with testing.

- Sachin

