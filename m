Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C289CDDB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 23:53:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TaZRQf+j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VD2sS34nMz3vYF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 07:53:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TaZRQf+j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nrb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCv1J2dfNz3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 01:59:48 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 438F8Pev018942;
	Mon, 8 Apr 2024 15:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : content-transfer-encoding : in-reply-to : references : cc :
 to : from : subject : message-id : date; s=pp1;
 bh=gMyg3iRzwsrqxD4gnz5p97UU1sOuMFlKeUsGBUqa9es=;
 b=TaZRQf+jibLZ6EiYMk0sVCDHf8OUyPUdMv1tUtp5NXnWT1f6SNBW0uL9Dv43GRjQKpd9
 9vr8Pr1nMqcdG9PUC2gthPFnlwvl/4kOrZkQDNx+3vRZOQ35v9J5kfYhoKsbi4wUY8Z8
 cGzq54cSUHjaeJkO8okocKGXKvXUjdDlyV9Yt2aAp4jfflGqza3tkhMx0Vut/ntpQi6W
 LDTOytW0hu4vCwYpcyNb6SmKR5KVVWvWByuJyKZaLw9dfLjtzFbNFsGjPp9wcZMiJ3b/
 +Lfef+SZN9hMLAe4iCx5NRetGj82KT+78k1dz3ShlplAN/U1nYNHD7oH1YB+ltUoW9tX CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcjy48402-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 15:59:36 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 438FxaNa004376;
	Mon, 8 Apr 2024 15:59:36 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcjy483yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 15:59:36 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 438FJfEA022583;
	Mon, 8 Apr 2024 15:59:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xbhqnrxu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 15:59:35 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 438FxVO036110746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Apr 2024 15:59:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FBAA2005A;
	Mon,  8 Apr 2024 15:59:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4565320043;
	Mon,  8 Apr 2024 15:59:31 +0000 (GMT)
Received: from t14-nrb (unknown [9.171.39.74])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Apr 2024 15:59:31 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240405083539.374995-4-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com> <20240405083539.374995-4-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>
From: Nico Boehr <nrb@linux.ibm.com>
Subject: Re: [kvm-unit-tests PATCH v8 03/35] migration: Add a migrate_skip command
Message-ID: <171259197029.48513.5232971921641010684@t14-nrb>
User-Agent: alot/0.8.1
Date: Mon, 08 Apr 2024 17:59:30 +0200
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 98QI-zxA2rnf9VI7nbpRFgVLyX95RH2a
X-Proofpoint-ORIG-GUID: XsDWpyUKaXljY6cuZUXtAKEZZ0Bc1tiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_13,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=863
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404080122
X-Mailman-Approved-At: Tue, 09 Apr 2024 07:52:16 +1000
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Nicholas Piggin (2024-04-05 10:35:04)
[...]
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 39419d4e2..4a1aab48d 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
[...]
> @@ -179,8 +189,11 @@ run_migration ()
>                 # Wait for test exit or further migration messages.
>                 if ! seen_migrate_msg ${src_out} ;  then
>                         sleep 0.1
> -               else
> +               elif grep -q "Now migrate the VM" < ${src_out} ; then
>                         do_migration || return $?
> +               elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM mig=
ration" < ${src_out} ; then
> +                       echo > ${src_infifo} # Resume src and carry on.
> +                       break;

If I understand the code correctly, this simply makes the test PASS when
migration is skipped, am I wrong?

If so, can we set ret=3D77 here so we get a nice SKIP?
