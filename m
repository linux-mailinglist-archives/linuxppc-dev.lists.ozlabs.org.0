Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7688BA827
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 09:56:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rTsX1+O+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW35Z0ybnz3cYt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 17:56:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rTsX1+O+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW34r6RJmz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 17:55:24 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4437ZOLr001313;
	Fri, 3 May 2024 07:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ICDaggG/gXeTRB72xqxW3n+JXQUcDwKM9WB6+j4TVjQ=;
 b=rTsX1+O+VgpZCCWC5Sr/sdnxV8vBrEqHM2xD5c1UKbkXMD0+UljwPYK1La/Ya+WDLM14
 1kVdCTWWqA3vzo9pNY8fo4W5Ygk/hQSMucxlyWS4zxC1Wpj29s+AI5RNP3MiKeQFmoDs
 ScM61ZPNuYqHsFZrrh2Iv+MYoXVIFg+j8sdH/HyvoupHChqPrT84383TP6l9m72jvTgH
 6sKzJUmhh6AyUkv7fWFGy+lPrXCfQX2/nA1iioyF3a2QyaFI94BfrNt6hlNW2Zwny5Ue
 W09CmbPN6GZMkpoj9++6x5XO0ISwXI6kpSWj+HaoICR9rOfDELyGikm/QTr/fpXM0R8Y 5g== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xvuhy01nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 07:55:18 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4437H6B2011769;
	Fri, 3 May 2024 07:55:17 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsdwmm77w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 07:55:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4437tDxg17105334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 May 2024 07:55:15 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A72EA2004B;
	Fri,  3 May 2024 07:55:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D86F20043;
	Fri,  3 May 2024 07:55:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 May 2024 07:55:13 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.11.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 55F406109C;
	Fri,  3 May 2024 17:55:07 +1000 (AEST)
Message-ID: <2492716e18c515e21b855305c0bc760057dbcf7a.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Make cxl obsolete
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Date: Fri, 03 May 2024 17:55:03 +1000
In-Reply-To: <33cf08b4fe751af156b1a7c17f69a0ca37dc5eed.camel@linux.ibm.com>
References: <20240409031027.41587-1-ajd@linux.ibm.com>
	 <20240409031027.41587-2-ajd@linux.ibm.com> <87bk6jb17s.fsf@mail.lhotse>
	 <33cf08b4fe751af156b1a7c17f69a0ca37dc5eed.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O3ITnM5Exdb-zeuEU-fV7oRMwwQWOrP4
X-Proofpoint-GUID: O3ITnM5Exdb-zeuEU-fV7oRMwwQWOrP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_04,2024-05-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=876 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405030056
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
Cc: fbarrat@linux.ibm.com, ukrishn@linux.ibm.com, manoj@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2024-05-03 at 13:15 +1000, Andrew Donnellan wrote:
> This doesn't seem quite right to me, I don't think we can just
> redefine
> CONFIG_CXL as a bool, but I'll do something like this. Probably won't
> bother for CXLFLASH since they'll see it for CXL anyway, but I might
> add a warning message on probe to both drivers.

The more I look at how to do this, the more issues I see, though
perhaps because I personally use olddefconfig more than I use
oldconfig.

Without changing the default to n, running olddefconfig is liable to
switch CXL back on in configs where the user has disabled it.

Conversely, if the user has set CXL=3Dy rather than CXL=3Dm, I'm not sure
if there's any way to make it such that olddefconfig doesn't reset one
symbol or the other to the default m.

Honestly, I'm very tempted to be a little more aggressive and a) not
bother with trying to play games with symbols, b) change the default to
n in this release, c) add a warning printed on probe, and see whether
anyone complains.

We could also print a message during the build itself, though that kind
of noise is liable to break things in other ways?

It would be kind of nice if kbuild had some way to mark a symbol for
deprecation which could print a warning during configuration.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
