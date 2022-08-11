Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE058FB90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 13:45:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Q3T1ZVpz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 21:45:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N2cM+DWh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N2cM+DWh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3Q2j2yqHz2xrj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:44:44 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BBfwei001906;
	Thu, 11 Aug 2022 11:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=k8OxMey6CLg0GXntxVvBFhpJY5/zsW848Xv+A0GjS6s=;
 b=N2cM+DWhRVUbq/fJTKxUHNeWzMwuC1VF/Cf5xLd72K5f8Q9BtYpEfpLiTzIaF1TgUmFH
 RlTLBf+ZXw42RwJuIbBbTnkTZy8P6iQz9Jlp6hf9JkshETUbhLy7LxkJO6AjYWoSHdv3
 1sv1bDBUmQJyGCE9J89dWKLQEvEv5X+8uwDK/xagkBF1R+ScrjGCjXuCa2Ml6uxytMdh
 FtXS5NCAjYiZWQGfcy4RxBLRKAk0SCgZinTPrtOWClqgGgoav4QKUC2fMLSXN3QqiOVD
 PLgRmuW1ZH0+ekScsN4b6Qy6dnfVwsc8xG+4FIvsd2rGnv+ZOHm0yeiWhQeRuc2M2TJM zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14dr1x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 11:44:41 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BBgJO3002450;
	Thu, 11 Aug 2022 11:44:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14dr1w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 11:44:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BBZTgm017387;
	Thu, 11 Aug 2022 11:44:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3huwvg1yra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 11:44:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27BBiahf26280314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Aug 2022 11:44:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7500B11C04A;
	Thu, 11 Aug 2022 11:44:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 823CD11C050;
	Thu, 11 Aug 2022 11:44:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.75.173])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 11 Aug 2022 11:44:35 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [5.19.0-next-20220811] Build failure drivers/vdpa
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <CAGxU2F5V-qxurLSZhugvNLWkiDOM83tgKQrEUFB_PLd7=kTH3Q@mail.gmail.com>
Date: Thu, 11 Aug 2022 17:14:34 +0530
Message-Id: <7137A7BC-1036-49A3-885B-FEBC7985871F@linux.ibm.com>
References: <A330513B-21C9-44D2-BA02-853327FC16CE@linux.ibm.com>
 <CAGxU2F5V-qxurLSZhugvNLWkiDOM83tgKQrEUFB_PLd7=kTH3Q@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qoq6gJZ-p24hQfcSx8c9YSWViWxLr7kO
X-Proofpoint-ORIG-GUID: vn0zB7nDtYDwZaBLZs4PbZ8c3O9kA7fe
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=843 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208110034
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11-Aug-2022, at 3:45 PM, Stefano Garzarella <sgarzare@redhat.com> wrot=
e:
>=20
>> Date:   Wed Aug 10 11:43:47 2022 +0200
>>    vdpa_sim_blk: add support for discard and write-zeroes
>>=20
>=20
> Thanks for the report, I already re-sent a new series with that patch fix=
ed:
> https://lore.kernel.org/virtualization/20220811083632.77525-1-sgarzare@re=
dhat.com/T/#t

Thanks. That patch works for me.

- Sachin

