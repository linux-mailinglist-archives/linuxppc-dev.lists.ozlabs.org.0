Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C896961710E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 23:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2j5351VVz3cLg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:59:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A9YoGhWO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A9YoGhWO;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2j480KVbz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 09:58:47 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2Lr9nw005513;
	Wed, 2 Nov 2022 22:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6TIhlgK952bnNOv+wmOl0tAaVwJxHgvFKb8rcTIePvA=;
 b=A9YoGhWOpUaPt3sEH60xeAlbstKEOTrOI4WXeo2efbjgXI1uyIQWjCUFRD3NEk2ttrB3
 BDqQHLIdO1cGDzhDg2+QmCxbH9apCspoxc8zYI4/W2Y6JawQAXQZU1s32oGJ9E4Kp0KD
 B3bre7fTE1N/sie8KbTabed2FM2pVWm75EhFq/oJ1iN1I/Gz9D4mWiMTv6hhVx+Zs1Do
 0hVMjt7vtlzJjYt9oEXBfhNikFVLrC/AJvP+tlw0h446N4g8TZ0UQC1j6cJCRWBPPKFI
 r1OGDlq1XC+aLTfd9VpIIUhd+h7SVzuDZ1pPTUoEhWiv6nnyxKcRvEoX2Y6JWFg3G7qn 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km0v09kn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:58:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2Mwagd011452;
	Wed, 2 Nov 2022 22:58:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km0v09kms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:58:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2MqDfZ024669;
	Wed, 2 Nov 2022 22:58:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kgut8yqc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:58:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A2Mr1KO14352836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:53:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59E98A405B;
	Wed,  2 Nov 2022 22:58:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03B10A4054;
	Wed,  2 Nov 2022 22:58:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  2 Nov 2022 22:58:31 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 874716010C;
	Thu,  3 Nov 2022 09:58:28 +1100 (AEDT)
Message-ID: <b2c86cdb980d96cb10a558baafdb5e94062852cf.camel@linux.ibm.com>
Subject: Re: [PATCH v9 4/7] powerpc/code-patching: Verify instruction patch
 succeeded
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 03 Nov 2022 09:58:28 +1100
In-Reply-To: <83e63455-95d8-88bf-82b2-c72bfe288fab@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
	 <20221025044409.448755-5-bgray@linux.ibm.com>
	 <83e63455-95d8-88bf-82b2-c72bfe288fab@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iiy3XRjqrP3_GI4nf5QlrZgiT8bevc56
X-Proofpoint-ORIG-GUID: iOHMwV7oaJ0BUcuqLyAyMdDFLTNTXRPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=881 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020149
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-02 at 09:43 +0000, Christophe Leroy wrote:
> Le 25/10/2022 =C3=A0 06:44, Benjamin Gray a =C3=A9crit=C2=A0:
> > Verifies that if the instruction patching did not return an error
> > then
> > the value stored at the given address to patch is now equal to the
> > instruction we patched it to.
>=20
> Why do we need that verification ? Until now it wasn't necessary, can
> you describe a failure that occurs because we don't have this=20
> verification ? Or is that until now it was reliable but the new
> method=20
> you are adding will not be as reliable as before ?
>=20
> What worries me with that new verification is that you are reading a=20
> memory address with is mostly only used for code execution. That
> means:
> - You will almost always take a DATA TLB Miss, hence performance
> impact.
> - If one day we want Exec-only text mappings, it will become
> problematic.
>=20
> So really the question is, is that patch really required ?

It's required as much as any sanity check in the kernel. I agree
running it all the time is not great though, I would prefer to make it
a debug-only check. I've seen VM_WARN_ON be used for this purpose I
think? It's especially useful now with churn on the code-patching code.
I don't expect the new method to be unreliable=E2=80=94I wouldn't be submit=
ting
it if I did=E2=80=94but I'd much prefer to have an obvious tell if it does =
turn
out so.

But the above is all moot because we allow parallel patching, so the
check is just plain incorrect.
