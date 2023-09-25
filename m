Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E48A7ACF6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 07:22:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cje0lSUB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvB8w6qRsz3cbL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 15:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cje0lSUB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvB7q64gtz3c5L;
	Mon, 25 Sep 2023 15:21:59 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P5A97N005437;
	Mon, 25 Sep 2023 05:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=/jtVC0k5MCOK3Jc655nEGBvrUPKGxaDn/Mkymzm5ZIw=;
 b=cje0lSUBpmy2rfg5+WRsLT1NvQtfNb5qBbgQA7GNVDOKflovl+oG88xpqRQr+qlyDeS9
 aBxXAnY4H000Lhq9YjKQUrpeHoVGdbpW5L+ohc+162xu+ccbtNi0vc+jV7MbNqqaGe8p
 IMKCWgOgZttokvd9GmG0J8eHljDvaSwY7h1KYrFxurU2ToyHezOAc2X1qZJsZYUUYjmq
 H3+dgQTYxMI59IsT8jvzMV+3/1gYJFvUWb3HJG900gvhryCWsyFj6mNDb89Y3LzDsWhn
 eb55yif/gccrfoUJT3TdT8HzJKpiuEu6pc7m+LIgvX9eEt4lsYl5K/dFKi0T809Su6Qf 6A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta5yu99sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:21:55 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38P4ceHf008456;
	Mon, 25 Sep 2023 05:21:54 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3taabs82mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:21:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38P5LpX522610470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 05:21:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 832AA20043;
	Mon, 25 Sep 2023 05:21:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31D7520040;
	Mon, 25 Sep 2023 05:21:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.214.47])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 25 Sep 2023 05:21:50 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 1/3] core/device: Add function to return child node using
 name at substring "@"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ca53fb3c-3ce7-463d-b59c-205e07aa5765@arbab-laptop>
Date: Mon, 25 Sep 2023 10:51:42 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BAF78DB4-552F-4145-8295-FA9D4DDACC18@linux.vnet.ibm.com>
References: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
 <ca53fb3c-3ce7-463d-b59c-205e07aa5765@arbab-laptop>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wF3KfncNvoTnrEDy9XE-fBKCBmp5GZB5
X-Proofpoint-GUID: wF3KfncNvoTnrEDy9XE-fBKCBmp5GZB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_02,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250034
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, Kajol Jain <kjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, skiboot@lists.ozlabs.org, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Sep-2023, at 7:42 PM, Reza Arbab <arbab@linux.ibm.com> wrote:
>=20
> On Thu, Sep 14, 2023 at 10:02:04PM +0530, Athira Rajeev wrote:
>> Add a function dt_find_by_name_before_addr() that returns the child =
node if
>> it matches till first occurrence at "@" of a given name, otherwise =
NULL.
>> This is helpful for cases with node name like: "name@addr". In
>> scenarios where nodes are added with "name@addr" format and if the
>> value of "addr" is not known, that node can't be matched with node
>> name or addr. Hence matching with substring as node name will return
>> the expected result. Patch adds dt_find_by_name_before_addr() =
function
>> and testcase for the same in core/test/run-device.c
>=20
> Series applied to skiboot master with the fixup we discussed.
>=20
> --=20
> Reza Arbab

Thanks Reza for picking up the patchset

Athira

