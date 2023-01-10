Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04A664DF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 22:21:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns3f00gT3z3chQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 08:21:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ehaqqB4F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ehaqqB4F;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrxdr43QBz2yfg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 03:50:55 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30AGg45A014868;
	Tue, 10 Jan 2023 16:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=scEvZKJ8+etdO/S+WxLjaWfhxynbMyKs3LN9Cf6xB/c=;
 b=ehaqqB4FMP5iYtLgvIdNx8uS79AcDlp4XvWS3YWvYWhQJRQ5UHE08EKS7Q+bTL4nPxAk
 XkRQd6urxld9W/ELkBBYOMgwiZ3ZDHORC+LiUk1UVEOTrqZXHa8V23AR1zrxYNSfv09b
 U1v4xRH5dzMJ/Encim8EdfIn5S4NZAPZFkRu3aUK2BgzdLviNb9v5ibkQNdAl2Xnw49n
 pW9KAl5cNl+llCdBozJf++HmbO+qZBUQSe2aUt1A+keJt4Hj6EdIqR7vR3Ywjj0rrJXQ
 3KikegsGb+nX9CHmps/AwEGYhDmJiORqLVKuHY47ODHv1uZxQRpKUrLPdkFNl5uKIfSU 6w== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1brwr6ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 16:50:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ADvmXO027215;
	Tue, 10 Jan 2023 16:50:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3my0c6kqrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 16:50:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30AGobrq23659118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jan 2023 16:50:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB50720040;
	Tue, 10 Jan 2023 16:50:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB5942004B;
	Tue, 10 Jan 2023 16:50:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.82.183])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jan 2023 16:50:36 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Message-Id: <916647D5-FE41-4A71-935E-5D1D8F41FB5B@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AFC3659D-9543-47AB-9267-E6C682E54E45"
Subject: Re: [powerpc] Boot failure kernel BUG at mm/usercopy.c:102
Date: Tue, 10 Jan 2023 22:20:25 +0530
In-Reply-To: <2fb8749a-2a1a-8fdc-f5ad-e0632cd53d63@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <8C9D7E49-5A75-41BE-ACCB-44FDD8FBE4D0@linux.ibm.com>
 <2fb8749a-2a1a-8fdc-f5ad-e0632cd53d63@efficios.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tWhh6VVqhZ9fU7-q3wjjQ5eEDjBNSHmK
X-Proofpoint-GUID: tWhh6VVqhZ9fU7-q3wjjQ5eEDjBNSHmK
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_06,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100104
X-Mailman-Approved-At: Wed, 11 Jan 2023 08:20:41 +1100
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_AFC3659D-9543-47AB-9267-E6C682E54E45
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


>> [ 0.445046] Code: 392990f8 48000014 3d02ffe9 390827f0 7d074378 7d094378 =
7c661b78 3c62ffe7 f9610060 386319f0 4bca6935 60000000 <0fe00000> 00000000 0=
0000000 7c0802a6
>> [ 0.445061] ---[ end trace 0000000000000000 ]=E2=80=94
>> Git bisect points to following patch:
>> commit 317c8194e6aeb8b3b573ad139fc2a0635856498e
>>      rseq: Introduce feature size and alignment ELF auxiliary vector ent=
ries
>> Reverting the patch helps boot the kernel.
>=20
> Can you try with the following fix ?
>=20
> https://lore.kernel.org/r/20230104192054.34046-1-mathieu.desnoyers@effici=
os.com
> "rseq: Fix: Increase AT_VECTOR_SIZE_BASE to match rseq auxvec entries"
>=20

Thanks. Yes, this patch fixes the reported problem.

- Sachin=

--Apple-Mail=_AFC3659D-9543-47AB-9267-E6C682E54E45
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><blockquote type=3D"cite"><div><blockquote =
type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;">[ 0.445046] =
Code: 392990f8 48000014 3d02ffe9 390827f0 7d074378 7d094378 7c661b78 =
3c62ffe7 f9610060 386319f0 4bca6935 60000000 &lt;0fe00000&gt; 00000000 =
00000000 7c0802a6<br>[ 0.445061] ---[ end trace 0000000000000000 =
]=E2=80=94<br>Git bisect points to following patch:<br>commit =
317c8194e6aeb8b3b573ad139fc2a0635856498e<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
rseq: Introduce feature size and alignment ELF auxiliary vector =
entries<br>Reverting the patch helps boot the =
kernel.<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Can you =
try with the following fix ?</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><a =
href=3D"https://lore.kernel.org/r/20230104192054.34046-1-mathieu.desnoyers=
@efficios.com" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: =
0px;">https://lore.kernel.org/r/20230104192054.34046-1-mathieu.desnoyers@e=
fficios.com</a><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">"rseq: Fix: Increase =
AT_VECTOR_SIZE_BASE to match rseq auxvec entries"</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div>Thanks. Yes, this patch fixes =
the reported problem.</div><div><br></div><div>- =
Sachin</div></body></html>=

--Apple-Mail=_AFC3659D-9543-47AB-9267-E6C682E54E45--

