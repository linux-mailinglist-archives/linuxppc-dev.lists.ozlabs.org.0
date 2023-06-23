Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D04B973AECD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 04:53:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sw7IO5Yr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnMHn5ZNQz3bpC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 12:53:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sw7IO5Yr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnMGs3yJwz3020
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 12:52:37 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35N2lgCc006723;
	Fri, 23 Jun 2023 02:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=RVm125GpA+1HVQbzGy//ia9dU0l+5tLkVFavKaQYjzw=;
 b=sw7IO5Yr5ooD7hVnf1f+5UcLFKHQpGeUj6942kPhFdBBj3i7J0Dx2EppuOUQKCVbHOl8
 mkIm3VVuDoK4TCiaqoc2zTDTLmJedbn1y4KFf7SlIMaRSkZ0ZzNdmx/TVyg7e84m5oAT
 wYikFR/BLFuYgiajKYp7+QK5rONto6Vhn8wJW5doRAC9WLPmKNzRunV0b/8TKRWpyU6B
 yBxFO/dQSaC06PgOsGLLXk4e1AdlQ9woRlgNXIYgd6HhysLE0e6miUub9jSOjfcRO8S4
 hSPcwYSC7nCsEvxVSlpBTlAdYma9Tzb8uJS0kF0GXSWeNv/BkaVquSXdg6mDE/MtOMQ6 sg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rd2wv01kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 02:52:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35N0KUfT027259;
	Fri, 23 Jun 2023 02:52:19 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e3vy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 02:52:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35N2qGMs58720550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jun 2023 02:52:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD1DB20040;
	Fri, 23 Jun 2023 02:52:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4312F20043;
	Fri, 23 Jun 2023 02:52:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.65.200])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jun 2023 02:52:15 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
Date: Fri, 23 Jun 2023 08:22:04 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <425CE5FE-FE54-493D-A74E-7EBC812544BB@linux.ibm.com>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse> <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fzee60I0I2G4wkal38UFV33R3U9zVDls
X-Proofpoint-GUID: Fzee60I0I2G4wkal38UFV33R3U9zVDls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_18,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230020
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, jarkko@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 22-Jun-2023, at 8:08 PM, Limonciello, Mario =
<Mario.Limonciello@amd.com> wrote:
>=20
>=20
> On 6/22/2023 7:36 AM, Michael Ellerman wrote:
>> "Linux regression tracking (Thorsten Leemhuis)" =
<regressions@leemhuis.info> writes:
>>> Hi, Thorsten here, the Linux kernel's regression tracker. =
Top-posting
>>> for once, to make this easily accessible to everyone.
>>>=20
>>> As Linus will likely release 6.4 on this or the following Sunday a =
quick
>>> question: is there any hope this regression might be fixed any time
>>> soon?
>> No.
>>=20
>> I have added the author of the commit to Cc, maybe they can help?
>>=20
>> The immediate question is, is it expected for chip->ops to be NULL in
>> this path? Obviously on actual AMD systems that isn't the case,
>> otherwise the code would crash there. But is the fact that chip->ops =
is
>> NULL a bug in the ibmvtpm driver, or a possibility that has been
>> overlooked by the checking code.
>>=20
>> cheers
>=20
> All that code assumes that the TPM is still functional which
> seems not to be the case for your TPM.
>=20
> This should fix it:

Yes, with this change kexec works correctly.

Since Aneesh first reported this problem including reported by credit =
for him

Reported-by: Aneesh Kumar K. V <aneesh.kumar@linux.ibm.com>
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>

-Sachin=
