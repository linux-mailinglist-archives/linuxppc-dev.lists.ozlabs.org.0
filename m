Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D860467A9CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 06:00:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1s9d4qwKz3cdH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 16:00:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NIzaON1r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NIzaON1r;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1s8k56tQz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 16:00:06 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30P30UBC017648;
	Wed, 25 Jan 2023 05:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XXBl+mjWjGJrBLouZ4ypQLcju70QCIvKfSYc0Wb7Deo=;
 b=NIzaON1r+zh97vSZZlJvREsfBsVhpQv8aoQGHG2eeZw3beOYlU/JZXRpblg7ZJjq+SAU
 l5lI6GlevNZLcHIdJzqmCiaosWPVZkQv+hzoqZ+8+cJnOa2G/ceXOM4SWM4qjzNj8j5w
 WBThJi5ZYLOrWdMXAf5+KbdRYou7Oh+1U0VBfz8os4QLUjIeqB1NCs08YmQ4IQ03xgwp
 JqwlAza03/Uxk4AzoD8oY9V8p46fTPBWR2OjspphhB5m1gJY3Q+RcTxd/yIue+/9dh1c
 +xfiqKRDJ01QDZBxdccDLgk1aFhr20cgvEbhDiI+ZVmMesu3sTZn5sJwRUMRtxj50nfo NA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naaruuy0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 05:00:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OFtSbM015305;
	Wed, 25 Jan 2023 05:00:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n87p6ba0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 05:00:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30P4xxvD24576498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 04:59:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F1F020043;
	Wed, 25 Jan 2023 04:59:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0327B2004B;
	Wed, 25 Jan 2023 04:59:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 04:59:58 +0000 (GMT)
Received: from [9.192.255.228] (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C2E5B600D5;
	Wed, 25 Jan 2023 15:59:56 +1100 (AEDT)
Message-ID: <24204e329b6c625ef75db05422edc5c5a30c65d6.camel@linux.ibm.com>
Subject: Re: [PATCH v3 4/7] selftests/powerpc: Add read/write debugfs file,
 int
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 25 Jan 2023 15:59:56 +1100
In-Reply-To: <20221128041948.58339-5-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
	 <20221128041948.58339-5-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bkQSX8RJYszfABdSmt8eUIwvR4AAt88E
X-Proofpoint-ORIG-GUID: bkQSX8RJYszfABdSmt8eUIwvR4AAt88E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_01,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250039
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-11-28 at 15:19 +1100, Benjamin Gray wrote:
> Debugfs files are not always integers, so make *_file return/write a
> byte buffer, and *_int deal with int values specifically. This
> increases
> consistency with the other file read/write helpers.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

This seems like a sensible idea.

Nitpick below, otherwise it looks like you have changed over all 21
call sites and the new helpers look better.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> -int read_debugfs_file(char *debugfs_file, int *result)
> +int read_debugfs_int(const char *debugfs_file, int *result)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int err;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char path[PATH_MAX];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char value[16] =3D {0};
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strcpy(path, "/sys/kernel/debu=
g/");
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strncat(path, debugfs_file, PA=
TH_MAX - strlen(path) - 1);
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((err =3D read_file(path, v=
alue, sizeof(value) - 1, NULL)))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((err =3D read_debugfs_file=
(debugfs_file, value,
> sizeof(value) - 1)))

Per my comments on the previous patch, separate the function call from
the error check

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
