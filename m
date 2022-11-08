Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE831620DCE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 11:53:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N64hB4tw7z3cKL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 21:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n+jZtLQL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n+jZtLQL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N64gG4b1Cz3cFZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 21:52:26 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8A1DXZ012224;
	Tue, 8 Nov 2022 10:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=29DC97z787wPkapq1htQHB3TtXXv0gqx1UTGhrEnxQI=;
 b=n+jZtLQLfIGrNSS1JVxWVYtJneLjlxYZQuhs57jYmop6M4CHq23Jz/zjq0fVHugVm1WP
 X2htzxB00akGAUM+aehxoF41uOXbopGygmZ9yRxyKOYcAJQB6Dm38DNSi/8G+4qqy2+v
 LpWsg4xiyOpolLaPOFwqIGOVi5AfgqmeugbSGUoYIrO/ahddEYuv81IL2HGW7ihNXS/u
 CFnlCZiP5IDZIw0V6VrY+7JVJIjvlpJZ4LToYj5Y4IonFFIXNqoW2rk6kB2Sl0LXRG4I
 oFxVXjcTtD3Bc8w0llTvlQSVcmXGhDAHDzuwbxCicrZy1qVdlOOd1dnRIKYi07gos3vp /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkjf44en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:52:17 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A88soq0017121;
	Tue, 8 Nov 2022 10:52:16 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkjf44e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:52:16 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A8ApgtI017933;
	Tue, 8 Nov 2022 10:52:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 3kngpstv7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:52:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A8AqnFW50987366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Nov 2022 10:52:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C131711C04C;
	Tue,  8 Nov 2022 10:52:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6016C11C04A;
	Tue,  8 Nov 2022 10:52:11 +0000 (GMT)
Received: from localhost (unknown [9.43.47.171])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  8 Nov 2022 10:52:11 +0000 (GMT)
Date: Tue, 08 Nov 2022 16:22:10 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/5] powerpc/kprobes: Setup consistent pt_regs across
 kprobes, optprobes and KPROBES_ON_FTRACE
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
	<npiggin@gmail.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
	<1d0cb183f48c4179646c0c5e183fd296da58f4ca.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
	<CO60QSLZNBQ0.3NK6WVSYR70FZ@bobo>
In-Reply-To: <CO60QSLZNBQ0.3NK6WVSYR70FZ@bobo>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1667904363.fa5sobmxot.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eSF_XLPRkIXl3MENdtYIwFQGTjsyTw-a
X-Proofpoint-GUID: rGtb3ZuPYr1MZfhDBkqJSfLs2fvv_kz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=898 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080057
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> On Fri Oct 21, 2022 at 3:29 AM AEST, Naveen N. Rao wrote:
>> Ensure a more consistent pt_regs across kprobes, optprobes and
>> KPROBES_ON_FTRACE:
>> - Drop setting trap to 0x700 under optprobes. This is not accurate and
>>   is unnecessary. Instead, zero it out for both optprobes and
>>   KPROBES_ON_FTRACE.
>=20
> Okay I think.
>=20
>> - Save irq soft mask in the ftrace handler, similar to what we do in
>>   optprobes and trap-based kprobes.
>=20
> This advertises the irqs status of regs correctly, whereas previously
> it was uninitialised.
>=20
>> - Drop setting orig_gpr3 and result to zero in optprobes. These are not
>>   relevant under kprobes and should not be used by the handlers.
>=20
> This is for CFAR, which we can't get anyway because we just branched
> here. I would rather zero it explicitly though.

Is there a strong reason to zero those out?

The reason I dropped zero'ing of orig_gpr3 and result is to make=20
optprobes consistent with KPROBES_ON_FTRACE. If we want to retain=20
zero'ing orig_gpr3/result for optprobes, I think we should then go ahead=20
and zero those out in ftrace_regs_caller too.

Thanks,
Naveen

