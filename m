Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61F438F3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 08:16:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd4Tm6QMXz2yPW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 17:16:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Whxysw9B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Whxysw9B; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd4T40Nj9z2xYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 17:15:51 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P2g9RS029185; 
 Mon, 25 Oct 2021 02:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=v5gSGXfj5/YdFpW/xxDwXzuFg5yfHNmwdjm+62+2R8o=;
 b=Whxysw9B1rYWBgzHTUWmhWUD5ewOKdE4thmSy1w0vbuSju1jUVl4trtfZidg0kTJ3UOK
 BmXKLOttTQlbEF+Ba9woPmwvd3k467tHqhKSGg/mdyV8mWRKmfF0e7Pe8uBCQOvkMi6p
 mxDNzkPpEY99zcjev40H65OTf3HBx3UDcXvduDxr4SC+VbMVJVUvIE4rj1XGS8UDmngK
 LebowtRANZVVz0F80cf+Izhl2vH6W1Jr3WJAHq4l0tECsCS/Sj/fNPMwOkc/mIj6yvMg
 Br+1qqGgN9JoQTw/CViB/SC2F+TNceQMm6JxoMyZx7jj6381EqTR+Sa71NEuUuBoBbCM 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bvyuysn5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 02:15:30 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19P5xCpY017848;
 Mon, 25 Oct 2021 02:15:29 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bvyuysn57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 02:15:29 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19P62lbu025259;
 Mon, 25 Oct 2021 06:15:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3bva1aj7ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 06:15:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19P69NlK61735378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 06:09:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA10B52051;
 Mon, 25 Oct 2021 06:15:24 +0000 (GMT)
Received: from localhost (unknown [9.43.123.71])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8FAFD5204E;
 Mon, 25 Oct 2021 06:15:24 +0000 (GMT)
Date: Mon, 25 Oct 2021 11:45:23 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/bpf: fix write protecting JIT code
To: ast@kernel.org, christophe.leroy@csgroup.eu, daniel@iogearbox.net,
 Hari Bathini <hbathini@linux.ibm.com>, jniethe5@gmail.com,
 mpe@ellerman.id.au
References: <20211025055649.114728-1-hbathini@linux.ibm.com>
In-Reply-To: <20211025055649.114728-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1635142354.46h6w5c2rx.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JiJwZNW4RvKRhX36cpqy_TIpKAwNyFfk
X-Proofpoint-ORIG-GUID: Z8DX6AV7MXC8oswD3dxL3yYJ05Nsuehg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_01,2021-10-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250034
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 kpsingh@kernel.org, stable@vger.kernel.org, andrii@kernel.org,
 paulus@samba.org, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini wrote:
> Running program with bpf-to-bpf function calls results in data access
> exception (0x300) with the below call trace:
>=20
>     [c000000000113f28] bpf_int_jit_compile+0x238/0x750 (unreliable)
>     [c00000000037d2f8] bpf_check+0x2008/0x2710
>     [c000000000360050] bpf_prog_load+0xb00/0x13a0
>     [c000000000361d94] __sys_bpf+0x6f4/0x27c0
>     [c000000000363f0c] sys_bpf+0x2c/0x40
>     [c000000000032434] system_call_exception+0x164/0x330
>     [c00000000000c1e8] system_call_vectored_common+0xe8/0x278
>=20
> as bpf_int_jit_compile() tries writing to write protected JIT code
> location during the extra pass.
>=20
> Fix it by holding off write protection of JIT code until the extra
> pass, where branch target addresses fixup happens.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 62e3d4210ac9 ("powerpc/bpf: Write protect JIT code")
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/net/bpf_jit_comp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the fix!

Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

