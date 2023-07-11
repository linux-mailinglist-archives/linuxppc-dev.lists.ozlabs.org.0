Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAEF74E5D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:27:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j8dL+Ink;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0SWR5vJFz3bWy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:26:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j8dL+Ink;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0SVP2Kh7z3c0X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:26:05 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4Ga3k021893;
	Tue, 11 Jul 2023 04:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Q0hpPzwVxZ41g+J5RuLFNLVMcXoQxCk/OBS0MCzz+Yw=;
 b=j8dL+InkzM8cwKTTdG/b7pxuWg7OlGi7zLroR+QocjW05S1zTyry1Xy7Kdw+0udDFq/Q
 0c6CW2t7egTyGdQIP/aN8h4Jg594sEedDwzsMM7EZPvvAEtQTw9I7q6iOFqVJMsW/T6b
 JWWMHb//RKRQL8YpXxIXQ58eYGV7QMNl3cXq2rh96FixY3qxy4urDAoFWh3cVUUh+sX4
 sVxeObbPVZ6C5Esrt9y1cqPKDH2oBQ44z/NcA5Pd+dK4lQReUd+zRco02YopE7q6jTG9
 B/aoM1Lo6nchQsKToWUAkUeZMpXvnkcwGK0e4f7KcalXF4d0I+AbhmcW0evGAgf5T0q4 RA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrywrg4fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:25:44 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4HfPJ023740;
	Tue, 11 Jul 2023 04:25:44 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrywrg4fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:25:44 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B3lW61017128;
	Tue, 11 Jul 2023 04:25:43 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3rpye6vayp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:25:43 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4Pf3E64684410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:25:41 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F29558060;
	Tue, 11 Jul 2023 04:25:41 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 696E55803F;
	Tue, 11 Jul 2023 04:25:36 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.86.43])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:25:36 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/13] mm/vmemmap: Improve vmemmap_can_optimize and
 allow architectures to override
In-Reply-To: <baba8fee-07dc-251e-3e26-a860d67c26a9@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-4-aneesh.kumar@linux.ibm.com>
 <baba8fee-07dc-251e-3e26-a860d67c26a9@csgroup.eu>
Date: Tue, 11 Jul 2023 09:55:34 +0530
Message-ID: <87jzv7oz0h.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y9vMKLwt33qRL7NkaI5Nazf0tySI8zud
X-Proofpoint-GUID: tLhkmpiI1MHPHnV-NJYuPlmn7hd7DB53
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_01,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=594 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307110036
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 10/07/2023 =C3=A0 18:08, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> dax vmemmap optimization requires a minimum of 2 PAGE_SIZE area within
>> vmemmap such that tail page mapping can point to the second PAGE_SIZE ar=
ea.
>> Enforce that in vmemmap_can_optimize() function.
>>=20
>> Architectures like powerpc also want to enable vmemmap optimization
>> conditionally (only with radix MMU translation). Hence allow architecture
>> override.
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Why renaming vmemmap_can_optimize() to __vmemmap_can_optimize() and keep=
=20
> it when vmemmap_can_optimize() has been override ? Is that because you=20
> expect overriding version of vmemmap_can_optimize() to call=20
> __vmemmap_can_optimize() ?
>

Yes, __vmemap_can_optimize will be used in patch 11
https://lore.kernel.org/linuxppc-dev/20230710160842.56300-12-aneesh.kumar@l=
inux.ibm.com

-aneesh

