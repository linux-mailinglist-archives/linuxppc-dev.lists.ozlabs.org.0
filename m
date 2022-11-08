Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D77620CD9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 11:07:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N63gg5pkDz3dtp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 21:07:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LeEQ2D2W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LeEQ2D2W;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N63fk3jWwz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 21:06:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A88SnFE025547;
	Tue, 8 Nov 2022 10:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=MUFr/hrfes5qAZ7q2wLE0TyzJZOwhXIH1pWzPOieses=;
 b=LeEQ2D2WKjR3FUlDQAErcnUxRmobq5TPp3AGikBc7RwFHI5XVDxP3jvtn/mI/X2dsjYK
 0OESr0oisf8gb28SJMADGDxjoFiovwdVGWBsm/zDfo9Jf4O4pV3EpiQh5RNXXYwf2gT6
 DeRzttXSTroMOKj27zn+R4zeXnTavfetKAmM8wKMdxOUzftbGuGyZ7PK73yWgutN4kZ1
 x5F+565SBd1PLuGwubiBFOUOKloLgmemB5y5+/KMwzdfDzBto4/QKXrXmXqxcSgUaCrg
 7aDWkVoo3sbZjSul8tJSGAf9AXq7Lbxw3wVKKXNRHYfkcafNKQXZf+XN4bzpbaJcSaVz RA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkmx2qx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:06:37 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A89KK9R030410;
	Tue, 8 Nov 2022 10:06:36 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkmx2qw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:06:36 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A8A67fr015082;
	Tue, 8 Nov 2022 10:06:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma05fra.de.ibm.com with ESMTP id 3kngpsttdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:06:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A8A6WCX45285646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Nov 2022 10:06:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B7D5AE04D;
	Tue,  8 Nov 2022 10:06:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F265AAE045;
	Tue,  8 Nov 2022 10:06:31 +0000 (GMT)
Received: from localhost (unknown [9.43.47.171])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  8 Nov 2022 10:06:31 +0000 (GMT)
Date: Tue, 08 Nov 2022 15:36:30 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/5] powerpc/kprobes: Remove unnecessary headers from
 kprobes
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman
	<mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
	<bf3c70d498a24a0c466657f396291f2298744ef8.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
	<9747a449-a790-707a-e4f5-174f4bf52007@csgroup.eu>
In-Reply-To: <9747a449-a790-707a-e4f5-174f4bf52007@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1667901397.uwblu29kpn.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4OtUKZX7HhgH_6m3DDCFfon40GvXJFGc
X-Proofpoint-ORIG-GUID: OTa_w6S378ASLqjwX9Sol_698qn9BEJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=881
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080054
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
Cc: Jordan Niethe <jniethe5@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 20/10/2022 =C3=A0 19:29, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Many of these headers are not necessary since those are included
>> indirectly, or the code using those headers has been removed.
>=20
> It is usually not a good idea to not include headers because they are=20
> already included indirectly. If one day for some reason de indirect link=20
> gets removed, then your file doesn't build anymore.

I agree with that in general.

The motivation for this patch was to remove <linux/preempt.h> from=20
kprobes-ftrace.c since we got rid of explicit preempt disable/enable=20
calls in the past. We have also removed explicit irq disable from this=20
path. <linux/kprobes.h> includes <linux/ftrace.h> and <asm/kprobes.h>=20
includes <linux/ptrace.h> so those could go too.

I don't expect those header dependencies to change, so I think this=20
patch is ok.


- Naveen
