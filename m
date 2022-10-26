Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180B60DE67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 11:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4My3tj1M8Sz3cG9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 20:49:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sotq9X3v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sotq9X3v;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxzd61hfKz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 17:37:28 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q4QRpI012957;
	Wed, 26 Oct 2022 06:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=zjqpFk3QhBLhN2OLYfCxFIG8Rs3NeBpSFf4AMt/hDyQ=;
 b=sotq9X3vOiUkyNcBx1bzRLJkNeidAWQwz3KlDyhuMq9WPcKX9U/q/oscmAepPehfjcwm
 g7eBgBNg336qjO3iRY9DTnCUshQDHknQDbf2w2UlNHvGzQyTo6rrsHUMYstxlANi9Zs3
 V8vhU5R8Fh6EE+5ZTkAzFfiymz63yxxYIxQ2bpxrKWmjabb2FjRwgsHW/pPnWpJh4zIY
 Y5EfQcPj7TeWy+GxdofLI65qq57K8EYpU4e8QmVV3OIP6s4DNTJq81bE2qxSrCb2EvOh
 G7a/HMJ+vTYasLnybjbh0GhP44RF4zn8g2W0z/WkNXJfITgClhLtvPXXIDPKyjgQI3Ws Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kecrrvg9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Oct 2022 06:37:13 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29Q6bD6j025332;
	Wed, 26 Oct 2022 06:37:13 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kecrrvg88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Oct 2022 06:37:13 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29Q6aBEo014393;
	Wed, 26 Oct 2022 06:37:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04fra.de.ibm.com with ESMTP id 3kc859nqk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Oct 2022 06:37:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29Q6b7uW50856238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Oct 2022 06:37:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FAB75204F;
	Wed, 26 Oct 2022 06:37:07 +0000 (GMT)
Received: from li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com (unknown [9.43.83.232])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id BF73652051;
	Wed, 26 Oct 2022 06:37:04 +0000 (GMT)
Date: Wed, 26 Oct 2022 12:07:01 +0530
From: Vishal Chourasia <vishalc@linux.vnet.ibm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
References: <Y01UWQL2y2r69sBX@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y01kc4g9CVmoyOxj@hirez.programming.kicks-ass.net>
 <Y01sk3l8yCMvhvYm@kroah.com>
 <Y06B0pr8hpwzxEzI@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y06ISBWhJflnV+NI@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I2m5MahwrhQT1ZfY"
Content-Disposition: inline
In-Reply-To: <Y06ISBWhJflnV+NI@kroah.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i05jl_7bqzAhbNoG_v2njMD6cr85LGGT
X-Proofpoint-ORIG-GUID: h1h0AVWCZPZFMSJZLfCmn_frSss_BgXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_02,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260036
X-Mailman-Approved-At: Wed, 26 Oct 2022 20:48:46 +1100
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, Peter Zijlstra <peterz@infradead.org>, aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--I2m5MahwrhQT1ZfY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 01:04:40PM +0200, Greg Kroah-Hartman wrote:

> Why do you need to?  What tools require these debugfs files to be
> present?

We are not entirely sure what applications (if any) might be using this int=
erface.

> And if you only have 7-8 files per CPU, that does not seem like a lot of
> files overall (14000-16000)?  If you only offline 1 cpu, how is removing
> 7 or 8 files a bottleneck?  Do you really offline 1999 cpus for a 2k
> system?

It's 7-8 files per domain per cpu, so, in a system with approx 2k cpus and =
five
domains, the total file count goes above 70k-80k files. And, when we offlin=
e 1
CPU, the entire directory is rebuilt, resulting in creation of all the files
again.

Thanks

-- vishal.c=20


--I2m5MahwrhQT1ZfY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyetz6oh8pzQ87ZNz8y5vG2Pik+wFAmNY1Y0ACgkQ8y5vG2Pi
k+zzpAf/VpaRfD7CirnN6qZ6dlymniwiDt7AqbDneQ2GpIwCM9zoXPjc2SanAfBS
j3JBmfZVPGDgBecigPGlDv4SPKH58k+Ws3ca5nsMXxZ2vQGmHTAEfRiAcolT6HDh
J1EFP/HgT0cZsbyedIbRUdoF1BGwNMnFKm04Ud7nHqPlxCJPHrxVI5kEafvH4bQM
kS6jv2Q/KexruSHaG32/AZpDxjiJ6zr2LN7slTzg4jxeKYDru4g7hl3H9ECbuDvV
GF/ZEdVXai1LAegTdQNK1laJMxsXHAHnjBhiuqO5L3vc8ulTcmQTw6TKeC895p56
KeYnC6XuaetZEvuNF+VajhNuv7w+dw==
=+7+s
-----END PGP SIGNATURE-----

--I2m5MahwrhQT1ZfY--

