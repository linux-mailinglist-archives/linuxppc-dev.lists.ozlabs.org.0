Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE0630D8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 09:51:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDnSK0h1vz3cJX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 19:51:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nkrj5c+8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nkrj5c+8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDnRM5lSzz3bjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 19:50:23 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AJ5EJDt018463;
	Sat, 19 Nov 2022 08:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ESCf78kXRHVtTaBHIT9tXgQjm5aQsmZ9auxZcdLdJb8=;
 b=Nkrj5c+8uRRBhCiLEgHa2+AEC/TP9pLYoeDrD5EQ9rOtD74Yr1bBr99KjkQiVWQUoI+F
 mBfYX5PomMKoxQZ1kWHOQjEdAhGTGglsiltvKCXJyxVznYGhTWCB5ESvR5WXrkrgxDl1
 u1c8aYYK32dSILeey6F6n9FUPLVm5MxgubFkRXfmxQ3PoZgAGELJojaNbhDguW4FoJoZ
 Z/SUs+C6jPUkdK7wzukJzCY7ITJkIQd8PTF6WjzM3+7ApLZE3IeluEFTcStW1nu4J3Vw
 fI7c/+9dKc6TpuoHdnpSwgSG9u0iaXvgrNU3jjqZrVUe8ZzYyhPvPvQypdIb6KT1i0Xc bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxrttark5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Nov 2022 08:50:03 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AJ8lFjD034897;
	Sat, 19 Nov 2022 08:50:03 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxrttarjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Nov 2022 08:50:03 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AJ8aGDW027908;
	Sat, 19 Nov 2022 08:50:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma05fra.de.ibm.com with ESMTP id 3kxps8g61c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Nov 2022 08:50:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AJ8nw4x60490072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Nov 2022 08:49:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B44A211C04A;
	Sat, 19 Nov 2022 08:49:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B372511C04C;
	Sat, 19 Nov 2022 08:49:55 +0000 (GMT)
Received: from li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com (unknown [9.43.27.135])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Sat, 19 Nov 2022 08:49:55 +0000 (GMT)
Date: Sat, 19 Nov 2022 14:19:52 +0530
From: Vishal Chourasia <vishalc@linux.vnet.ibm.com>
To: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/cpuidle: Set CPUIDLE_FLAG_POLLING for snooze
 state
Message-ID: <Y3iYsI8FFkwTFfPO@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
References: <20221114073154.30407-1-aboorvad@linux.vnet.ibm.com>
 <20221114145611.37669-1-aboorvad@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jb20sXGMcYKTqoab"
Content-Disposition: inline
In-Reply-To: <20221114145611.37669-1-aboorvad@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N-BxId7Zf06Vsw9bWrAoK7uIKsvmijoz
X-Proofpoint-ORIG-GUID: kAdo53F9_L0T-VYdBxZes0iqvTdRXaep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 clxscore=1011 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211190059
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
Cc: srikar@linux.vnet.ibm.com, rafael@kernel.org, linux-pm@vger.kernel.org, daniel.lezcano@linaro.org, vishalc@linux.vnet.ibm.com, npiggin@gmail.com, svaidy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Jb20sXGMcYKTqoab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 08:26:11PM +0530, Aboorva Devarajan wrote:
> During the comparative study of cpuidle governors, it is noticed that the
> menu governor does not select CEDE state in some scenarios even though wh=
en
> the sleep duration of the CPU exceeds the target residency of the CEDE id=
le
> state this is because the CPU exits the snooze "polling" state when snooze
> time limit is reached in the snooze_loop(), which is not a real wake up
> and it just means that the polling state selection was not adequate.
>=20
> cpuidle governors rely on CPUIDLE_FLAG_POLLING flag to be set for the
> polling states to handle the condition mentioned above.
>=20
> Hence, set the CPUIDLE_FLAG_POLLING flag for snooze state (polling state)
> in powerpc arch to make the cpuidle governor work as expected.
>=20
> Reference Commits:
>=20
> - Timeout enabled for snooze state:
>   commit 78eaa10f027c
>   ("cpuidle: powernv/pseries: Auto-promotion of snooze to deeper idle sta=
te")
>=20
> - commit dc2251bf98c6
>   ("cpuidle: Eliminate the CPUIDLE_DRIVER_STATE_START symbol")
>=20
> - Fix wakeup stats in governor for polling states
>   commit 5f26bdceb9c0
>   ("cpuidle: menu: Fix wakeup statistics updates for polling state")
>=20
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
> ---
>=20
> Changelog: (v1 -> v2)
>=20
> Added CPUIDLE_POLLING_FLAG to the correct cpuidle_state struct.
>=20
> Previous version of the patch is stale which was sent by mistake, this=20
> is the correct version which is tested on powernv, pseries (shared and=20
> dedicated partitions)
>=20
>  drivers/cpuidle/cpuidle-powernv.c | 5 ++++-
>  drivers/cpuidle/cpuidle-pseries.c | 8 ++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)

Thanks for the patch.
Tested it on top of v6.0-rc4
Against workload: https://github.com/gautshen/misc/tree/master/cpuidle-smt-=
performance

Reviewed-by: Vishal Chourasia <vishalc@linux.vnet.ibm.com>
Tested-by: Vishal Chourasia <vishalc@linux.vnet.ibm.com <mailto:vishalc@lin=
ux.vnet.ibm.com>>

|----------------+--------+-----------------------+----------------------|
| wake up period | state  | % time spent (before) | % time spent (after) |
|----------------+--------+-----------------------+----------------------|
| 110 us         | snooze | 95.40 %               | 1.17 %               |
|                | CEDE   | 0.03 %                | 92.67 %              |
|----------------+--------+-----------------------+----------------------|
| 120 us         | snooze | 96.37 %               | 1.18 %               |
|                | CEDE   | 0.05 %                | 94.57 %              |
|----------------+--------+-----------------------+----------------------|
| 130 us         | snooze | 17.12 %               | 1.21 %               |
|                | CEDE   | 78.16 %               | 94.71 %              |
|----------------+--------+-----------------------+----------------------|
| 230 us         | snooze | 95.38 %               | 0.64 %               |
|                | CEDE   | 2.55 %                | 97.06 %              |
|----------------+--------+-----------------------+----------------------|
| 240 us         | snooze | 96.86 %               | 0.62 %               |
|                | CEDE   | 1.14 %                | 97.17 %              |
|----------------+--------+-----------------------+----------------------|
| 250 us         | snooze | 1.38 %                | 0.59 %               |
|                | CEDE   | 96.46 %               | 97.28 %              |
|----------------+--------+-----------------------+----------------------|
| 350 us         | snooze | 62.91 %               | 0.42 %               |
|                | CEDE   | 35.56 %               | 98.04 %              |
|----------------+--------+-----------------------+----------------------|
| 360 us         | snooze | 11.93 %               | 0.34 %               |
|                | CEDE   | 86.56 %               | 98.18 %              |
|----------------+--------+-----------------------+----------------------|
| 370 us         | snooze | 6.21 %                | 0.40 %               |
|                | CEDE   | 92.31 %               | 98.16 %              |
|----------------+--------+-----------------------+----------------------|
| 470 us         | snooze | 42.06 %               | 0.31 %               |
|                | CEDE   | 56.74 %               | 98.54 %              |
|----------------+--------+-----------------------+----------------------|
| 480 us         | snooze | 64.67 %               | 0.30 %               |
|                | CEDE   | 34.14 %               | 98.56 %              |
|----------------+--------+-----------------------+----------------------|
| 490 us         | snooze | 0.57 %                | 0.30 %               |
|                | CEDE   | 98.31 %               | 98.60 %              |
|----------------+--------+-----------------------+----------------------|

Note: *before* and *after* (see table heading), simply mean before applying=
 the
patch and after applying the patch

-- vishal.c
--Jb20sXGMcYKTqoab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyetz6oh8pzQ87ZNz8y5vG2Pik+wFAmN4mLAACgkQ8y5vG2Pi
k+xfOgf8C+57XIH2TLBSQJcftFbncUHmgrOFQbig18/d7zy1u09fERXk1XolXwMO
MyiTpKjT3qKfvOHrxx4w/VN3nszziAK5G6MrC70flIGQxe6SjxQEsclJ4PIHczzO
jJvzKsZ6O9EhqyCXSkqwWuFtVHnICeQxEZipSE9sVyPMuLzwoffmcyegr/hW0U+u
rZMc2ttTWd+9A67jZUnimTeblzvYQywE7cP3Ku2JMq3vIr5mAEvjO8tEfg2Vx4bC
Ya2fGbs/c8jdertZo02tJerfok0VPYdudcD5ip3rQPT++u8BtEwlRc6+JMfDh+y+
4kiyZLPaQi1EnmZQyja6yAjjVdUjlw==
=G8O6
-----END PGP SIGNATURE-----

--Jb20sXGMcYKTqoab--

