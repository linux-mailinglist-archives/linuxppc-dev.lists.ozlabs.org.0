Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1192D73C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 11:19:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csmx16zyzzDqvy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 21:19:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m7FzLYZn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Csmtn18V8zDqjR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 21:17:36 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BBAGwwF074214; Fri, 11 Dec 2020 05:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=cJo3FD1gxYOwY0LIyw6A5+s78o3OR4yDCSUXOBP1EbQ=;
 b=m7FzLYZnL6BCmhUTXnJCiqJCK6ppQ3w7JpVc3EPf3UEeAQen1M5rxEVFVFLgIJP8yQUt
 5Pcd4v7C9lU7WEg5hSXIidEazeReR5xSkhcW/5XWqJtRpSzSXPgtIbPSmSp2SVqEtCb5
 p7iBCNNOVQC2Y+NjNmougUvsgi8Yu2VKHiAkD7Gt9QlcAd76nrGoFKKJ4Btgp+IFEaeZ
 +aCOjAxG2B3sTSVMiYI74WxtQ1TNK2QovpZ9AHp92Qlx405VknxeY1HrgwOIMT3A71Vh
 DWr0MVxQmCestPHp28I6uIWod+ONb8GyKVuaXPdKFZL3Le/VV5ai3d5fejeed3bN4Ium vA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35c6vp00eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 05:17:27 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BBA8OGA012130;
 Fri, 11 Dec 2020 10:17:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 35958q2nak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 10:17:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BBAHNM227591092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 10:17:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A355A404D;
 Fri, 11 Dec 2020 10:17:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26AF0A4051;
 Fri, 11 Dec 2020 10:17:23 +0000 (GMT)
Received: from [9.199.49.30] (unknown [9.199.49.30])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Dec 2020 10:17:22 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: [powerpc/merge] System crash during cpu offline/online operation 
Message-Id: <F4809152-C7F5-4ED8-B071-85A9115BD29D@linux.vnet.ibm.com>
Date: Fri, 11 Dec 2020 15:47:21 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.17)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_01:2020-12-09,
 2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=894
 impostorscore=0 mlxscore=0 suspectscore=1 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110061
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I am observing system crash during a cpu offline/online operation
with latest merge branch code running in a PowerVM LPAR (P8 onwards)

# uname -r
5.10.0-rc7-01792-g244569c777ca
# ppc64_cpu --smt=3D1
[  244.205194] cpu 1 (hwid 1) Ready to die=E2=80=A6
=E2=80=A6=E2=80=A6=E2=80=A6
=E2=80=A6=E2=80=A6...
[  247.015113] cpu 30 (hwid 30) Ready to die...
[  247.104973] cpu 31 (hwid 31) Ready to die=E2=80=A6
# ppc64_cpu --smt=3D8

At this point the LPAR reboots instantly without any trace message.

IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM =
IBM IBM=20
=E2=80=A6=E2=80=A6=E2=80=A6..
=E2=80=A6=E2=80=A6=E2=80=A6..
IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM IBM =
IBM IBM=20

          1 =3D SMS Menu                          5 =3D Default Boot =
List
          8 =3D Open Firmware Prompt              6 =3D Stored Boot List
          9 =3D Restricted Open Firmware Prompt

=E2=80=A6=E2=80=A6.
=E2=80=A6=E2=80=A6.

merge commit 9acd775e45 (based on rc6) was good. Mainline 5.10.0-rc7 =
also does
not exhibit this problem.=20

Thanks
-Sachin
=20=
