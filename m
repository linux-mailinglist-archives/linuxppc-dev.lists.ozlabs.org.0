Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA86EE420
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 16:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5PqF6tSsz3ch6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 00:42:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TY5CX6U1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TY5CX6U1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5PpK41Ncz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 00:41:45 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PEdIE3019450;
	Tue, 25 Apr 2023 14:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=vRPRtK8KjcRKyKQy/fRSw1fzRpw6Z/d8aTjxblAzL1E=;
 b=TY5CX6U1C2wytU3HZzFkrRifHR8Jy/mAbJlzPU28yYhikDTb4QYGrsgaTekuYXUuC3fn
 Kcw5BDtpbOwWhQpSVstty9/LiW9n2z86rKpduEkgf6sceH6XxTncywzMlU+BYX6vG/8g
 roUoR6h/kRK/SuUJ9kTxyT/WVpJpjMSvSz18Iu9P1azR1pTA6SpPaQU+pAgCacgyWWYm
 p3n1mQJF2YGdTgtzJYoItlehcV5lqua4C3KteFGnYBotg4VQ5OYXYbIWqXiSQCkZFL2q
 8iObFtXwhDHE5XdQE/5jV4oC8fL0eseIm2KDJF29M3o64qDJTgXrpI5lSewkoWxzqLi6 0A== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6gdr1e57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 14:41:17 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33P9WuU1030934;
	Tue, 25 Apr 2023 14:36:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3q47771gf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 14:36:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33PEaCMp20120284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Apr 2023 14:36:12 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A8B220040;
	Tue, 25 Apr 2023 14:36:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D443920043;
	Tue, 25 Apr 2023 14:36:11 +0000 (GMT)
Received: from localhost (unknown [9.43.63.166])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Apr 2023 14:36:11 +0000 (GMT)
Date: Tue, 25 Apr 2023 20:06:09 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/bpf: populate extable entries only during the
 last pass
To: bpf@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>
References: <20230425065829.18189-1-hbathini@linux.ibm.com>
In-Reply-To: <20230425065829.18189-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1682433035.4gm2n74mmz.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rNAs5dQ3hLvbVosu1utqWW6RXjlOPqBL
X-Proofpoint-GUID: rNAs5dQ3hLvbVosu1utqWW6RXjlOPqBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_07,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=962 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250127
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, stable@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini wrote:
> Since commit 85e031154c7c ("powerpc/bpf: Perform complete extra passes
> to update addresses"), two additional passes are performed to avoid
> space and CPU time wastage on powerpc. But these extra passes led to
> WARN_ON_ONCE() hits in bpf_add_extable_entry() as extable entries are
> populated again, during the extra pass, without resetting the index.
> Fix it by resetting entry index before repopulating extable entries,
> if and when there is an additional pass.
>=20
> Fixes: 85e031154c7c ("powerpc/bpf: Perform complete extra passes to updat=
e addresses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/net/bpf_jit_comp.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

>=20
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index e93aefcfb83f..37043dfc1add 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -101,6 +101,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>  		bpf_hdr =3D jit_data->header;
>  		proglen =3D jit_data->proglen;
>  		extra_pass =3D true;
> +		/* During extra pass, ensure index is reset before repopulating extabl=
e entries */
> +		cgctx.exentry_idx =3D 0;
>  		goto skip_init_ctx;
>  	}
> =20
> --=20
> 2.40.0
>=20
>=20
