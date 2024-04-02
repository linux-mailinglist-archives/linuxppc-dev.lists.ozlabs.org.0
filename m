Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC508949D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 05:06:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dQ9yjcRH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7t7N5SjHz3dXh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 14:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dQ9yjcRH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7t6f48GPz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 14:05:30 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4322pAve001216;
	Tue, 2 Apr 2024 03:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iQwzyM3YuPSqsRjXfGIgPKdaOi+Dw2asit+BiGT5wIQ=;
 b=dQ9yjcRHLw1deKP1zuA5qKSiGRobaUtAWmhCnVcADROMAEUfPamNlRDIU9l4PpKo0CIM
 +J7Nt8StNDTUbyDXWYCKBM6qU5BA7Qh2suFzZJkl0TXgagiDKtrRbhEcIpvin4L7vz3v
 w1vl5cYTC1YzLuWbzBo3gI400mxh+YJuunCRmDM3NtXKcDyyiLTX/W022k70ZlrutHUx
 JJMDbqslb+ZbMUyZZB9OBGCLUlHzFxox10JiraGI9ezRDaHw4sMm+mASUUEqI24GCYWV
 U7axd0HhptCR2TT/CGPj3PZxKESxjsBTVDcdvfGMfBIjx2mZN1ZOKtNIJVMUAZgROEGV rQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x898ag1n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 03:05:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4322a37X008477;
	Tue, 2 Apr 2024 03:00:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6w2tv924-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 03:00:59 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43230usK47120648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 03:00:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E48FC2004D;
	Tue,  2 Apr 2024 03:00:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C86C20040;
	Tue,  2 Apr 2024 03:00:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 03:00:55 +0000 (GMT)
Received: from [9.69.91.168] (unknown [9.69.91.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CE3BA6009D;
	Tue,  2 Apr 2024 14:00:46 +1100 (AEDT)
Message-ID: <f774bbfc766966a0ec7742c5b0c4e60e6ea42f94.camel@linux.ibm.com>
Subject: Re: [PATCH v11 00/11] Support page table check PowerPC
From: Rohan McLure <rmclure@linux.ibm.com>
To: Ingo Molnar <mingo@kernel.org>
Date: Tue, 02 Apr 2024 14:00:42 +1100
In-Reply-To: <ZgU4LoWBXDeJY8VS@gmail.com>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
	 <ZgU4LoWBXDeJY8VS@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kSmGIbO-lEBXnvbtf7A196zFBtw95S1S
X-Proofpoint-GUID: kSmGIbO-lEBXnvbtf7A196zFBtw95S1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=943 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020021
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
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2024-03-28 at 10:28 +0100, Ingo Molnar wrote:
>=20
> * Rohan McLure <rmclure@linux.ibm.com> wrote:
>=20
> > Rohan McLure (11):
> > =C2=A0 Revert "mm/page_table_check: remove unused parameter in
> > [__]page_table_check_pud_set"
> > =C2=A0 Revert "mm/page_table_check: remove unused parameter in
> > [__]page_table_check_pmd_set"
> > =C2=A0 Revert "mm/page_table_check: remove unused parameter in
> > [__]page_table_check_pud_clear"
> > =C2=A0 Revert "mm/page_table_check: remove unused parameter in
> > [__]page_table_check_pmd_clear"
> > =C2=A0 Revert "mm/page_table_check: remove unused parameter in
> > [__]page_table_check_pte_clear"
>=20
> Just a process request: please give these commits proper titles, they
> are not really 'reverts' in the classical sense, and this title hides
> what is being done in the commit. The typical use of reverts is to=20
> revert a bad change because it broke something. Here the goal is to=20
> reintroduce functionality.
>=20
> So please name these 5 patches accordingly, to shed light on what is=20
> being reintroduced. You can mention it at the end of the changelog
> that=20
> it's a functional revert of commit XYZ, but that's not the primary=20
> purpose of the commit.

Thanks for your email, I'll do just that.

>=20
> Thanks,
>=20
> 	Ingo

Cheers,
Rohan

