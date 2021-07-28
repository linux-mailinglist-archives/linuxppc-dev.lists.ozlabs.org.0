Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13A3D9D3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 07:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb04g03Pqz3cKh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 15:50:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jW1BDWTJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=murp@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jW1BDWTJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZbhk1rXBz306R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 00:32:05 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SETmB8034937; Wed, 28 Jul 2021 10:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=W4uj4+5+0n30KqGeVoDtxpFv11p0XVjd8o988Y+SeEM=;
 b=jW1BDWTJImIM6FuFsuRNiYe6/euA5O0lAWF+M8UbGHj4m9iL6bd1Sih/fOGCy094J6v9
 h6iW7KyvevFWV3nc9K2Pvf6ZyhsTPXgXflSTlUN03Wx9ueU8pp+vbkrvuNGWS/RiwcFx
 J8G1gF6M41B22HmDkk0fnrf5rkWlRtyV4zxx1/KXEItf158G1BKgRoo7YIPsKnnWLW3v
 +MmIOPMXru+eaihOwHmU9MuAvHWQSyuYmbBqUvpWXSC+4S6QOpNIEjXOSXuhNaPl+7m1
 Q0MQrSFIs9aE/jl/y3GY6/t33+vs1CTqE0kGl25UPs2hiOoKKhHd61Bn0UyC51ZukQcp zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a38mjgxy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 10:31:50 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16SEU8Lb041039;
 Wed, 28 Jul 2021 10:31:49 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a38mjgxx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 10:31:49 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16SEIf57029231;
 Wed, 28 Jul 2021 14:31:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3a2363e24k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 14:31:48 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16SEVle950856352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 14:31:47 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F8086E059;
 Wed, 28 Jul 2021 14:31:47 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67C236E054;
 Wed, 28 Jul 2021 14:31:47 +0000 (GMT)
Received: from mww0152.dal12m.mail.ibm.com (unknown [9.208.70.78])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 28 Jul 2021 14:31:47 +0000 (GMT)
In-Reply-To: <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>
From: "Paul Murphy" <murp@ibm.com>
To: pmenzel@molgen.mpg.de
Date: Wed, 28 Jul 2021 14:31:45 +0000
Message-ID: <OF44F7146F.67A4C1C2-ON00258720.004DBF64-00258720.004FCFCC@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
MIME-Version: 1.0
References: <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>,
 <a273c619-9258-e29a-24c3-ea47a13c4817@molgen.mpg.de>
 <3661999754da1a5e5c810fa669654cc7db95b059.camel@kernel.crashing.org>
 <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
 <878s1q1udj.fsf@mpe.ellerman.id.au>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0152/03/M/IBM at 07/28/2021 14:31:45,
 Serialize complete at 07/28/2021 14:31:45
X-KeepSent: 44F7146F:67A4C1C2-00258720:004DBF64; name=$KeepSent; type=4
X-Disclaimed: 40291
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 08fd8W4bjrv1P2Re4SwCQlIuEJft-j2q
X-Proofpoint-ORIG-GUID: NqVeso3ttKmqCSWhY-XW3ZZcssUyqROL
Subject: RE: Possible regression by ab037dd87a2f (powerpc/vdso: Switch VDSO to
 generic C implementation.)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_08:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 mlxlogscore=954 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280079
X-Mailman-Approved-At: Thu, 29 Jul 2021 15:50:19 +1000
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
Cc: parkerderek86@gmail.com, laboger@linux.vnet.ibm.com, xaionaro@gmail.com,
 paulus@samba.org, murphyp@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >(My apologies for however IBM's email client munges this)=
</div>
<div dir=3D"ltr" ><br><font size=3D"2" face=3D"Default Monospace,Courier Ne=
w,Courier,monospace" >&gt; I heard it is going to be in Go 1.16.7, but I do=
 not know much about Go.<br>&gt; Maybe the folks in Cc can chime in.</font>=
</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >We have backports primed and ready for the next point rel=
ease. They are waiting on the release manager to cherrypick them.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I think we were aware that our VDSO usage may have exploi=
ted some peculiarities in how the ppc64 version was constructed (i.e hand w=
ritten assembly which just didn't happen to clobber R30). Go up to this poi=
nt has only used the vdso function =5F=5Fkernel=5Fclock=5Fgettime; it is th=
e only entry point which would need to explicitly avoid R30 for Go's sake.<=
/div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Paul M.</div>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
<BR>
