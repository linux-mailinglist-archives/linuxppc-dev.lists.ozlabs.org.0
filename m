Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D1687436
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 05:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6lT24JH8z3cdx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 15:01:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zl9+NRwO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zl9+NRwO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6lS34yLqz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 15:00:19 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3122fx5x010895;
	Thu, 2 Feb 2023 04:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cnq32jgL1iTnU+b5PhgmuZwLYztH/uMhm8ilniFoqL0=;
 b=Zl9+NRwOib+Lysd9Ln4lyxFjTn9aInLHrtcufLtcoqGgOROCXKk0SJixQoZujutvtgp4
 9oJ8cvaWypryFV1LrZCuyYKWholT7k0BvSNyIsuFF5Fcs9iauV/kmoyzgEov/qBQhLwm
 ZBC9ODMswanLmnJg1/GRQcq8qcpQsXJjdlT0jEIyOzs9wssHQt1TB7LPfjLRoLQgnWPU
 jZnPfZaD9rW9MvcoTiL3IavJ/2GvuqZhzx096RtQMVq3Uii7KmZMigNu+AIaC4J/oxTn
 szbKb4NHZ/3HwP9SZF2Sc3O+fLEVXKrXa7NYdsewW8VTCMoahlRluPxLgkvyzleb7rmr HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng4bk1sm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 04:00:14 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3123UDa8023888;
	Thu, 2 Feb 2023 04:00:13 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng4bk1sk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 04:00:13 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3123lcRg013346;
	Thu, 2 Feb 2023 04:00:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshc1uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 04:00:11 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312409v725166428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 04:00:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 472572005A;
	Thu,  2 Feb 2023 04:00:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C696C2004B;
	Thu,  2 Feb 2023 04:00:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 04:00:08 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C1C9960112;
	Thu,  2 Feb 2023 15:00:06 +1100 (AEDT)
Message-ID: <537386efca0bc6230276eedca00856051d93f4d9.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc/rtas: make all exports GPL
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 02 Feb 2023 15:00:06 +1100
In-Reply-To: <20230124140448.45938-3-nathanl@linux.ibm.com>
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
	 <20230124140448.45938-3-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X5X3jrTDuIDtSClIzE18qoPo0NfeB5i1
X-Proofpoint-GUID: kgvYZ_jg63bCHXxd9ZoVPbx0Gf-MC8Hc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=969
 adultscore=0 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020031
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
Cc: ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-01-24 at 08:04 -0600, Nathan Lynch wrote:
> The first symbol exports of RTAS functions and data came with the
> (now
> removed) scanlog driver in 2003:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?=
id=3Df92e361842d5251e50562b09664082dcbd0548bb
>=20
> At the time this was applied, EXPORT_SYMBOL_GPL() was very new, and
> the exports of rtas_call() etc have remained non-GPL. As new APIs
> have
> been added to the RTAS subsystem, their symbol exports have followed
> the convention set by existing code.
>=20
> However, the historical evidence is that RTAS function exports have
> been added over time only to satisfy the needs of in-kernel users,
> and
> these clients must have fairly intimate knowledge of how the APIs
> work
> to use them safely. No out of tree users are known, and future ones
> seem unlikely.
>=20
> Arguably the default for RTAS symbols should have become
> EXPORT_SYMBOL_GPL once it was available. Let's make it so now, and
> exceptions can be evaluated as needed.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Agreed.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
