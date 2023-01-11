Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E68665BE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 13:58:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsSRC4B0Qz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 23:58:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=frrZ8y7c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=frrZ8y7c;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsFsY48Stz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 16:02:09 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30B3hhrB030575;
	Wed, 11 Jan 2023 05:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=p4xjEF6SuIEAwvoV0HFce3JRnroK51LIG4kFM95hF8k=;
 b=frrZ8y7c+1LuDqXJlJnCMhG+PguUQt3ZZZuyNcXTtaIpCEtLxF7AOAvkAImxe+R2sEpG
 KSt3dmCd4/+XStUO0w6L/YDrNftESQjlfticcNYjiwVRaY9TTjPVFY9ZOn+bGFAzPVVY
 iiuXH2OOjnzZkVPyzklZCabqutEu86U6FzhrLI0pY7dBAyk2dfDnKpno+0Yyxyshhy/u
 3Qr//vanPgcWwnoffZ7Stu7rWYjk/qFsCM1ZVkH4US8ELw/dAINIy6GVoN/FCyb6CbHl
 0FYx4YyXXEu8HQrp409mu1o59SRZRw4D346GEEJXPh5UcRcbf8S9Rmluop2zke8JzAL/ YA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1nf29a14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 05:02:00 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B1bXCI017912;
	Wed, 11 Jan 2023 05:01:58 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n1km684yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 05:01:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30B51tFl39453054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jan 2023 05:01:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA0720049;
	Wed, 11 Jan 2023 05:01:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A3C420040;
	Wed, 11 Jan 2023 05:01:55 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.16])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Jan 2023 05:01:55 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Message-Id: <82AE3E29-7DE5-4DC1-AC8C-B08D3C322DCD@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EDEEE55F-97D4-4518-9DA3-2D75EBCA27F8"
Subject: Re: [PATCH 2/2] powerpc/64s/radix: Fix RWX mapping with relocated
 kernel
Date: Wed, 11 Jan 2023 10:31:44 +0530
In-Reply-To: <20230110124753.1325426-2-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20230110124753.1325426-1-mpe@ellerman.id.au>
 <20230110124753.1325426-2-mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GS2eJqJsUvELrxqMQhHTE0moAQlvF6wE
X-Proofpoint-GUID: GS2eJqJsUvELrxqMQhHTE0moAQlvF6wE
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_01,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=818 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110034
X-Mailman-Approved-At: Wed, 11 Jan 2023 23:57:44 +1100
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_EDEEE55F-97D4-4518-9DA3-2D75EBCA27F8
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On 10-Jan-2023, at 6:17 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>=20
> If a relocatable kernel is loaded at a non-zero address and told not to
> relocate to zero (kdump or RELOCATABLE_TEST), the mapping of the
> interrupt code at zero is left with RWX permissions.
>=20
> That is a security weakness, and leads to a warning at boot if
> CONFIG_DEBUG_WX is enabled:
>=20
>  powerpc/mm: Found insecure W+X mapping at address 00000000056435bc/0xc00=
0000000000000
>  WARNING: CPU: 1 PID: 1 at arch/powerpc/mm/ptdump/ptdump.c:193 note_page+=
0x484/0x4c0
>  CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc1-00001-g8ae8e98aea82-=
dirty #175
>  Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf0=
00005 of:SLOF,git-dd0dca hv:linux,kvm pSeries
>  NIP:  c0000000004a1c34 LR: c0000000004a1c30 CTR: 0000000000000000
>  REGS: c000000003503770 TRAP: 0700   Not tainted  (6.2.0-rc1-00001-g8ae8e=
98aea82-dirty)
>  MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24000220  XER: 00=
000000
>  CFAR: c000000000545a58 IRQMASK: 0
>  ...
>  NIP note_page+0x484/0x4c0
>  LR  note_page+0x480/0x4c0
>  Call Trace:
>    note_page+0x480/0x4c0 (unreliable)
>    ptdump_pmd_entry+0xc8/0x100
>    walk_pgd_range+0x618/0xab0
>    walk_page_range_novma+0x74/0xc0
>    ptdump_walk_pgd+0x98/0x170
>    ptdump_check_wx+0x94/0x100
>    mark_rodata_ro+0x30/0x70
>    kernel_init+0x78/0x1a0
>    ret_from_kernel_thread+0x5c/0x64
>=20
> The fix has two parts. Firstly the pages from zero up to the end of
> interrupts need to be marked read-only, so that they are left with R-X
> permissions. Secondly the mapping logic needs to be taught to ensure
> there is a page boundary at the end of the interrupt region, so that the
> permission change only applies to the interrupt text, and not the region
> following it.
>=20
> Fixes: c55d7b5e6426 ("powerpc: Remove STRICT_KERNEL_RWX incompatibility w=
ith RELOCATABLE")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Thanks Michael. This fixes the problem reported earlier

https://lore.kernel.org/linuxppc-dev/48206911-FD3D-401A-A69D-1A79403E79E2@l=
inux.ibm.com/

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin=

--Apple-Mail=_EDEEE55F-97D4-4518-9DA3-2D75EBCA27F8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><br><blockquote type=3D"cite"><div>On =
10-Jan-2023, at 6:17 PM, Michael Ellerman &lt;mpe@ellerman.id.au&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><div>If a =
relocatable kernel is loaded at a non-zero address and told not =
to<br>relocate to zero (kdump or RELOCATABLE_TEST), the mapping of =
the<br>interrupt code at zero is left with RWX permissions.<br><br>That =
is a security weakness, and leads to a warning at boot =
if<br>CONFIG_DEBUG_WX is enabled:<br><br> &nbsp;powerpc/mm: Found =
insecure W+X mapping at address 00000000056435bc/0xc000000000000000<br> =
&nbsp;WARNING: CPU: 1 PID: 1 at arch/powerpc/mm/ptdump/ptdump.c:193 =
note_page+0x484/0x4c0<br> &nbsp;CPU: 1 PID: 1 Comm: swapper/0 Not =
tainted 6.2.0-rc1-00001-g8ae8e98aea82-dirty #175<br> &nbsp;Hardware =
name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 =
of:SLOF,git-dd0dca hv:linux,kvm pSeries<br> &nbsp;NIP: =
&nbsp;c0000000004a1c34 LR: c0000000004a1c30 CTR: 0000000000000000<br> =
&nbsp;REGS: c000000003503770 TRAP: 0700 &nbsp;&nbsp;Not tainted =
&nbsp;(6.2.0-rc1-00001-g8ae8e98aea82-dirty)<br> &nbsp;MSR: =
&nbsp;8000000002029033 &lt;SF,VEC,EE,ME,IR,DR,RI,LE&gt; &nbsp;CR: =
24000220 &nbsp;XER: 00000000<br> &nbsp;CFAR: c000000000545a58 IRQMASK: =
0<br> &nbsp;...<br> &nbsp;NIP note_page+0x484/0x4c0<br> &nbsp;LR =
&nbsp;note_page+0x480/0x4c0<br> &nbsp;Call Trace:<br> =
&nbsp;&nbsp;&nbsp;note_page+0x480/0x4c0 (unreliable)<br> =
&nbsp;&nbsp;&nbsp;ptdump_pmd_entry+0xc8/0x100<br> =
&nbsp;&nbsp;&nbsp;walk_pgd_range+0x618/0xab0<br> =
&nbsp;&nbsp;&nbsp;walk_page_range_novma+0x74/0xc0<br> =
&nbsp;&nbsp;&nbsp;ptdump_walk_pgd+0x98/0x170<br> =
&nbsp;&nbsp;&nbsp;ptdump_check_wx+0x94/0x100<br> =
&nbsp;&nbsp;&nbsp;mark_rodata_ro+0x30/0x70<br> =
&nbsp;&nbsp;&nbsp;kernel_init+0x78/0x1a0<br> =
&nbsp;&nbsp;&nbsp;ret_from_kernel_thread+0x5c/0x64<br><br>The fix has =
two parts. Firstly the pages from zero up to the end of<br>interrupts =
need to be marked read-only, so that they are left with =
R-X<br>permissions. Secondly the mapping logic needs to be taught to =
ensure<br>there is a page boundary at the end of the interrupt region, =
so that the<br>permission change only applies to the interrupt text, and =
not the region<br>following it.<br><br>Fixes: c55d7b5e6426 ("powerpc: =
Remove STRICT_KERNEL_RWX incompatibility with =
RELOCATABLE")<br>Signed-off-by: Michael Ellerman =
&lt;mpe@ellerman.id.au&gt;<br>---<br></div></div></blockquote><div><br></d=
iv>Thanks Michael. This fixes the problem reported =
earlier</div><div><br></div><div>https://lore.kernel.org/linuxppc-dev/4820=
6911-FD3D-401A-A69D-1A79403E79E2@linux.ibm.com/</div><div><br></div><div>R=
eported-by: Sachin Sant =
&lt;sachinp@linux.ibm.com&gt;</div><div>Tested-by:&nbsp;<span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Sachin Sant =
&lt;</span>sachinp@linux.ibm.com<span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);">&gt;</span></div><div><br></div><div><font =
color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0);">- =
Sachin</span></font></div></body></html>=

--Apple-Mail=_EDEEE55F-97D4-4518-9DA3-2D75EBCA27F8--

