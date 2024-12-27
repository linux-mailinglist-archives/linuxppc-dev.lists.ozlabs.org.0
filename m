Return-Path: <linuxppc-dev+bounces-4491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 591219FD322
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 11:49:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKMgh5sFqz2ynj;
	Fri, 27 Dec 2024 21:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735296560;
	cv=none; b=Z3/B9K6GBsPWXPFYN0cxpXmETiZhEu2RzC9lC5rPhMxJ63a+recEuwp2uoDG2sHJdNFtZR3cCD8wJDGhCWkxEyg4p109zkPLv/Iz+L3oOH9TPPzpZ958qED2OO9ltNpyx3PDdRANGR0Pr70XwkhTFO1aqUijbZNC7kP23lWE5bsLkCKVlpAS+JVkEOp2SWy8zMoLAi310LCzXBvM4s3dsd7Hq9eYRcDiXgejKEMdsnyQ3tF/0mS8AnVGaoAoMQOmPywT1yp2TkhoGakzikCa4gnC73MMty9/G26Rousg1YxJnPnHT+eVWEEmlbdH4FNjYgz/UK3GVzPcvGyQh1R03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735296560; c=relaxed/relaxed;
	bh=wwixQH47C1FRBQ3ODY6xJRX4lnffuu9a+otQiE1oX9Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=T5JKGy/6JpaaXqVZAsz5n4SteEAjzy8krFSHhFQ+4n1JY0oaUA2UonwzWn2yLA/dgthrE1LOjHlmfe+9xsVkieVZ+TIkydO33kvm56F+i7D1NrVHF99J9mI/oKVKyRbMFPC2NQQ7Hl1W3EwKpFJY8GRmV0n/Ozv25xj3p/7u5oecsRsa43Oxe2mj2Kkz7hj6d+mHdT/M/kYfIoE0S2WgFXSqMIGQX8MgPLg8PwoU0aIXKgvmPr4bJ9qqVPoPqMAr+/zgovHOqpAfGhUZDoG9d+8STSxbHERl1FG3AX7v6j71d5ggl+jNG+H0gb8G4Q0hrdiHNXBhXn3LfKlUcHNaVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HqUPQvyk; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HqUPQvyk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKMgg5CHyz2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 21:49:19 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR85eDl003611;
	Fri, 27 Dec 2024 10:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wwixQH
	47C1FRBQ3ODY6xJRX4lnffuu9a+otQiE1oX9Q=; b=HqUPQvyknywAifcpK0yUcv
	EEOLjd90gaNszbO4T4MboPfDbccjmjOTyHwxYMR+XdLNmOgOtq/M+t7QVsSgaZmm
	a6MIwlREwijSNn2pTDHmfUm3BztNvTvXoUTbXMaL6XvUWukBbckmK4as+PRU2afe
	fAe2WG3d/Is0tddWT/Z3wRwdpYhuH+u+Wn46u/AUZkM8E7LmmZJxmWheDHXyX2j/
	rIdiDWSgdPUPzLZBmzKrMkkc8+jGd7sklI79zgrfnZkOTEyU8yp/A+ElMqe19GRV
	dTqEnfDT+nYS33eVo1eqaR3ACh3wk0dusu27mzOkQtPTVEUubQpwMobHEYP1K9Xg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43sre2gg7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:49:14 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BRAnESO001168;
	Fri, 27 Dec 2024 10:49:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43sre2gg7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:49:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR80qI6010617;
	Fri, 27 Dec 2024 10:49:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p90ndj6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:49:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BRAn9ON55902510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Dec 2024 10:49:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B1B620049;
	Fri, 27 Dec 2024 10:49:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94E9820040;
	Fri, 27 Dec 2024 10:49:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.185])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Dec 2024 10:49:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf: Fix return code for lock_contention_prepare
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20241223135655.8042-1-atrajeev@linux.vnet.ibm.com>
Date: Fri, 27 Dec 2024 16:18:53 +0530
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB87FEA4-4F00-497A-85F8-6E05E92C52E9@linux.vnet.ibm.com>
References: <20241223135655.8042-1-atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nndw5PRxUOLtd80qVPCL2xNnE3O_tN4E
X-Proofpoint-GUID: wFcuXOAdu0r7wRwVdwjZbjaaPQ6BX7-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 23 Dec 2024, at 7:26=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> perf lock contention returns zero exit value even if the lock =
contention
> BPF setup failed.
>=20
>   # ./perf lock con -b true
>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>   libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>   libbpf: failed to find valid kernel BTF
>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>   libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>   libbpf: failed to find valid kernel BTF
>   libbpf: Error loading vmlinux BTF: -ESRCH
>   libbpf: failed to load object 'lock_contention_bpf'
>   libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
>   Failed to load lock-contention BPF skeleton
>   lock contention BPF setup failed
>   # echo $?
>    0
>=20
> Fix this by saving the return code for lock_contention_prepare
> so that command exits with proper return code
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Hi,

Looking for review comments on this

Athira

> ---
> tools/perf/builtin-lock.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
> index 208c482daa56..2226c7dd4ae6 100644
> --- a/tools/perf/builtin-lock.c
> +++ b/tools/perf/builtin-lock.c
> @@ -2049,7 +2049,8 @@ static int __cmd_contention(int argc, const char =
**argv)
> goto out_delete;
> }
>=20
> - if (lock_contention_prepare(&con) < 0) {
> + err =3D lock_contention_prepare(&con);
> + if (err < 0) {
> pr_err("lock contention BPF setup failed\n");
> goto out_delete;
> }
> --=20
> 2.43.5
>=20


