Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ED358FA68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 12:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3MtG5JCHz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 20:07:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r20xWhj9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r20xWhj9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3MsY1QBQz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 20:06:40 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B9ln5v011149;
	Thu, 11 Aug 2022 10:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=/d6O5U8CQ4VJOlrp773Hu3pkXNdJbqiQRLM9WnEkGKE=;
 b=r20xWhj9BUQEHeo8zZYAl64nNKtowp2IAwnLI2K1KRl9owCg9XbL9ZxCLAGQcq76kfII
 cRZc2Nf/7hK6Al2G0i1Gmy7X1SwTxdIgbJkrxOsAXi54KCx1iSQgk2mbuo3Vfj/XX9OT
 oyaN/LHpR+rnNyxC4ciGKmo7aToojKBvKjLC0MFEsecWmGriMWUQS4H4gCRK7FtF3WkV
 qcsx48tlMBCAYlWFUCbGr9lsr/VrFsRTcLukT/GV5Z+XUq88LR5QnDfjgVK7P3kjZNsK
 8mMTPLNk2J2fADOvRfntZz1W+INgxVC+D3/iegFRUpFlft3VG+MdpqVBxQrXnL0ULtW1 bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvyf00kdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 10:06:37 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B9nU5w017848;
	Thu, 11 Aug 2022 10:06:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvyf00kc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 10:06:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B9pBRc017352;
	Thu, 11 Aug 2022 10:06:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3huwvg1vjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 10:06:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27BA6VcW25952606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Aug 2022 10:06:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D81F1AE04D;
	Thu, 11 Aug 2022 10:06:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 121D1AE045;
	Thu, 11 Aug 2022 10:06:31 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.240.215])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 11 Aug 2022 10:06:30 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [5.19.0-next-20220811] Build failure drivers/vdpa 
Message-Id: <A330513B-21C9-44D2-BA02-853327FC16CE@linux.ibm.com>
Date: Thu, 11 Aug 2022 15:36:30 +0530
To: kvm@vger.kernel.org, sgarzare@redhat.com
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k6TpS4gaUMv4iyoXGfndFIMP6gH9B-_W
X-Proofpoint-ORIG-GUID: y8eEZ27V6-_SIqFKHWxFisBC4Lkmd72O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 mlxlogscore=519 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110028
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

5.19.0-next-20220811 linux-next fails to build on IBM Power with=20
following error:

drivers/vdpa/vdpa_sim/vdpa_sim_blk.c: In function =
'vdpasim_blk_handle_req':
drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: a label can only be =
part of a statement and a declaration is not a statement
   struct virtio_blk_discard_write_zeroes range;
   ^~~~~~
drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:3: error: expected expression =
before 'u32'
   u32 num_sectors, flags;
   ^~~
drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:3: error: 'num_sectors' =
undeclared (first use in this function); did you mean 'bio_sectors'?
   num_sectors =3D vdpasim32_to_cpu(vdpasim, range.num_sectors);
   ^~~~~~~~~~~
   bio_sectors
drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:3: note: each undeclared =
identifier is reported only once for each function it appears in
drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:3: error: 'flags' undeclared =
(first use in this function); did you mean 'class'?
   flags =3D vdpasim32_to_cpu(vdpasim, range.flags);
   ^~~~~
   class
make[3]: *** [scripts/Makefile.build:250: =
drivers/vdpa/vdpa_sim/vdpa_sim_blk.o] Error 1
make[2]: *** [scripts/Makefile.build:525: drivers/vdpa/vdpa_sim] Error 2
make[1]: *** [scripts/Makefile.build:525: drivers/vdpa] Error 2
make[1]: *** Waiting for unfinished jobs=E2=80=A6.

Git bisect points to the following patch

commit d79b32c2e4a4e66d5678410cd45815c1c2375196
Date:   Wed Aug 10 11:43:47 2022 +0200
    vdpa_sim_blk: add support for discard and write-zeroes

Thanks
- Sachin=
