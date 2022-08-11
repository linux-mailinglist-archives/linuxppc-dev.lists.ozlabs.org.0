Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C846158F59C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 03:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M38j66j60z3c2W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 11:43:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rY3FLNCL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rY3FLNCL;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M38hS0Rfrz2xG8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 11:43:03 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B0d5ZX003970;
	Thu, 11 Aug 2022 01:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=YifLhT4y6GWtpg5tz3UQtMVZWzjWhjMTPWnIMThuVXo=;
 b=rY3FLNCLc3kHg2zHFOlVZZQIFaCeJg1vLj8iOKGwnPT9b2VSD3kgK+UBy2L6HeHb1t4G
 wA8tEdKIlysJlDu0KLCRfu9Kg+JVbuuW+MC1rLheFO9PS+WcfjKQ0eb6gni5V8Vd2PuH
 ctTFf5oSQ4mRT0tOry2gTLDJk9RddnN0YJj4Ox9JIWvhXWDN5JjZtHRB6NtMDlXYgdE4
 HpVmsPdCftGNJHA2K4+YyCQ9VJiejVOzU4Y2T0uTw5S8w+BWSLJctp/a7JC6k6/X3bi8
 mMOTMfO81zWlmm2s9OUkwLdYGw6Yy4mF33InI93xpgVAhnCBOxyih32h9FfI0QsG4cJ1 pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvq40a9q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 01:42:58 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B1KbXi026796;
	Thu, 11 Aug 2022 01:42:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvq40a9pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 01:42:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B1KlUh019445;
	Thu, 11 Aug 2022 01:42:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3huww2hdea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 01:42:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27B1grVY31457766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Aug 2022 01:42:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86A7552051;
	Thu, 11 Aug 2022 01:42:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2FFCE5204E;
	Thu, 11 Aug 2022 01:42:53 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC460600E5;
	Thu, 11 Aug 2022 11:42:51 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 13/14] powerpc/64s: Fix comment on interrupt handler
 prologue
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <34233718-8fae-d18d-cb48-bf695a1f102e@csgroup.eu>
Date: Thu, 11 Aug 2022 11:42:49 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <573D17EC-ED8A-463E-A032-6D6CF92B0260@linux.ibm.com>
References: <20220725063156.121292-1-rmclure@linux.ibm.com>
 <34233718-8fae-d18d-cb48-bf695a1f102e@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dxkW9v3aVJ4HHXN7At1uV7SkqyS4kkL2
X-Proofpoint-GUID: vt-OBaq2IT3O06U-PF4QlNMrQ8dFAnH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_16,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110002
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Maybe it would be interesting to know from which patch the error =
comes.

It=E2=80=99s hard to attribute this to a single commit, but the distance =
between r10=E2=80=99s save
location and r11-r12=E2=80=99s save location has definitely grown over =
time. The comment is
introduced in commit 7180e3e636de
("[POWERPC] force 64bit mode in fwnmi handlers to workaround firmware =
bugs=E2=80=9D) way back in 2006.

In v3 will insert another comment to better signal where r11-r12 are =
saved.=
