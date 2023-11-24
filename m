Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A93DC7F6F1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 10:07:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aHdqsr+K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc8Ht436lz3dWX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 20:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aHdqsr+K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc8H33RQsz2xVW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 20:06:22 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO7rKsb029749;
	Fri, 24 Nov 2023 09:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jg7Acu0qXCgdmZdYuWujUaPje8+3yKNJxdKXn/nRGZ4=;
 b=aHdqsr+KxrbcJfXs7vsbravmkD1E/QWxlX44+NgSaN7dziJPkUqUgSt4Ig0KOBdzmOq7
 ACt+j2nDOLCpArTTA09tJhPbcbxt6XxTsyuIa8FrzEWXVMnkX3GFZZKd0zRspGGmuHK4
 dpW1Ulc9RK+qJtwNYKPzvbWUL1+QUkF8S36xe74Al0FvYTeNgTbo1Y5RjMMLNmRQRE2a
 GEPyXKnaeZNP1bh6IZSoiGD2bJEFZHTAhqXzUBnTv/I8nGpL+egagSE0B1tbVjb5eQGY
 aZCWdHYamYRHIuEFL9UVLbdo1b97R86qRW926/IAcDOBnc4LdvKEhMuOpI2LWbq8pFQO tQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ujqtv9xcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 09:06:07 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO6Iw0v017522;
	Fri, 24 Nov 2023 09:06:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uf9tkv922-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 09:06:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AO965MR21365410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Nov 2023 09:06:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2816C20040;
	Fri, 24 Nov 2023 09:06:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 368742004B;
	Fri, 24 Nov 2023 09:06:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.42.177])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Nov 2023 09:06:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [powerpc] Lockups seen during/just after boot (bisected)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <d9631191-2805-d531-41a8-7152d9f72fa6@suse.cz>
Date: Fri, 24 Nov 2023 14:35:53 +0530
Message-Id: <0CF12B3F-CD7B-455A-BFC7-827F9392ECB5@linux.ibm.com>
References: <5F8DAEC7-E815-40A5-AD4A-B01296F5165F@linux.ibm.com>
 <8e000449-1e11-43be-87f5-f1826e296c39@bytedance.com>
 <d9631191-2805-d531-41a8-7152d9f72fa6@suse.cz>
To: Vlastimil Babka <vbabka@suse.cz>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zvBxB7iso_10vjb6uN_uhXV12MgrDjMo
X-Proofpoint-GUID: zvBxB7iso_10vjb6uN_uhXV12MgrDjMo
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=475 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240070
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Chengming Zhou <zhouchengming@bytedance.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 24-Nov-2023, at 2:25=E2=80=AFPM, Vlastimil Babka <vbabka@suse.cz> wrot=
e:
>=20
> On 11/23/23 15:35, Chengming Zhou wrote:
>> On 2023/11/23 19:27, Sachin Sant wrote:
>>> While booting recent -next kernel on IBM Power server, I have observed =
lockups
>>> either during boot or just after.
>>>=20
>>> [ 3631.015775] watchdog: CPU 3 self-detected hard LOCKUP @ __update_fre=
elist_slow+0x74/0x90
>>=20
>> Sorry, the bug can be fixed by this patch from Vlastimil Babka:
>>=20
>> https://lore.kernel.org/all/83ff4b9e-94f1-8b35-1233-3dd414ea4dfe@suse.cz/
>=20
> The current -next should be fixed, the fix was folded to the preparatory
> commit, which is now:
>=20

Thanks. Yes the problem is fixed with today=E2=80=99s next.

- Sachin
