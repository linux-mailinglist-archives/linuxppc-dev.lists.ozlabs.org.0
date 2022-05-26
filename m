Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B7E534DA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 13:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L84kF2n2Lz3by8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 21:01:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PJKcfNeV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PJKcfNeV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L84jX2jSZz30BV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 21:00:47 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24QAtDUC016023;
	Thu, 26 May 2022 11:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=l8ymdFPKx9NxSBaBHmNxGdEPPBdO9GWM3Uxv/hg8+Qk=;
 b=PJKcfNeViCG0zC4CppH69vpjIXO0Kf5zZ4KSXIoneJcTYLPfvgfaYCwri7TCo3RIqmEC
 Gg5Ri9q3zU4Aysin8WKpVcxqNjreU5THuO1Dc1+ZeOiRGiaEUKd9KyIYCQbwPKZLwNKk
 ZwRUCFaF4MIzQQKMZ4rZ9aGALqbf1N90xx6NW6OTIvKy+b7fvkady7ad6YB9k3V7Mxsq
 QgGhpGykfS3hfXhMc4kZd61LSJBMohNlMm8awHBPcSZWcJYU5wMPKrt1aR8qaNyCL+RH
 i2boShNZIbOd6t8WCa9nBaoYBy4fSn+U7wWYmON3rSvdXI1KOPBT6nw39/VPvdfPAxfU Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ga87er24k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 11:00:30 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24QAv9lU026100;
	Thu, 26 May 2022 11:00:29 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ga87er23s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 11:00:29 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24QAqchF027501;
	Thu, 26 May 2022 11:00:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3g93uwag3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 11:00:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24QB0Pes47776178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 May 2022 11:00:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 108F54C04A;
	Thu, 26 May 2022 11:00:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47B034C046;
	Thu, 26 May 2022 11:00:24 +0000 (GMT)
Received: from localhost (unknown [9.43.88.34])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 26 May 2022 11:00:24 +0000 (GMT)
Date: Thu, 26 May 2022 16:30:22 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
To: Andrew Morton <akpm@linux-foundation.org>,
        "Eric W. Biederman"
	<ebiederm@xmission.com>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
	<87ee0q7b92.fsf@email.froward.int.ebiederm.org>
	<YoWySwbszfdZS9LU@MiWiFi-R3L-srv>
	<87bkvt4d56.fsf@email.froward.int.ebiederm.org>
	<20220520104641.GB194232@MiWiFi-R3L-srv>
	<877d6g0zxq.fsf@email.froward.int.ebiederm.org>
	<20220525125627.acf27b28bb67417a6683a1d9@linux-foundation.org>
In-Reply-To: <20220525125627.acf27b28bb67417a6683a1d9@linux-foundation.org>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1653562638.7zk3zmzd88.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MfXC3c06CYrObppP6N9usjnRovuCi-VE
X-Proofpoint-ORIG-GUID: XQr1JTPr7tfOQdpRu52eY4NCSM3eMPMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=982
 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260052
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
Cc: linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton wrote:
> On Fri, 20 May 2022 14:25:05 -0500 "Eric W. Biederman" <ebiederm@xmission=
.com> wrote:
>=20
>> > I am not strongly against taking off __weak, just wondering if there's
>> > chance to fix it in recordmcount, and the cost comparing with kernel f=
ix;
>> > except of this issue, any other weakness of __weak. Noticed Andrew has
>> > picked this patch, as a witness of this moment, raise a tiny concern.
>>=20
>> I just don't see what else we can realistically do.
>=20
> I think converting all of the kexec __weaks to use the ifdef approach
> makes sense, if only because kexec is now using two different styles.
>=20
> But for now, I'll send Naveen's v2 patch in to Linus to get us out of
> trouble.

Thanks!

>=20
> I'm thinking that we should add cc:stable to that patch as well, to
> reduce the amount of problems which people experience when using newer
> binutils on older kernels?

Yes, please. I missed tagging this for stable. It looks like this is=20
applicable all the way back to v4.9 (though I haven't tested if=20
recordmcount fails in the same manner with those older kernel levels). I=20
will post backports once this gets into linus' tree.


- Naveen
