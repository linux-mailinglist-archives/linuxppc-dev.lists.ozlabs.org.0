Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A485DFE08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:40:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnLr0ZZlzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:40:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tZyx03SPzDqBV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 18:52:02 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U8kjMT094316
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:51:59 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s6h75vvvj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:51:59 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 30 Apr 2019 09:51:57 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 09:51:53 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U8pr9B55771312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 08:51:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD23CA405B;
 Tue, 30 Apr 2019 08:51:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF886A4054;
 Tue, 30 Apr 2019 08:51:51 +0000 (GMT)
Received: from [9.109.244.72] (unknown [9.109.244.72])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 08:51:51 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_24AB09EE-9C9E-4967-A38B-5570EE7B40A4"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH] powerpc/mm/radix: Fix kernel crash when running subpage
 protect test
Date: Tue, 30 Apr 2019 14:21:50 +0530
In-Reply-To: <20190430075907.7701-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20190430075907.7701-1-aneesh.kumar@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.8)
X-TM-AS-GCONF: 00
x-cbid: 19043008-0028-0000-0000-00000368C7A6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043008-0029-0000-0000-000024282BBB
Message-Id: <A8F367E6-D3A7-4D7A-B39D-51EEF4FF3CA7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300059
X-Mailman-Approved-At: Wed, 01 May 2019 02:38:35 +1000
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_24AB09EE-9C9E-4967-A38B-5570EE7B40A4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 30-Apr-2019, at 1:29 PM, Aneesh Kumar K.V =
<aneesh.kumar@linux.ibm.com> wrote:
>=20
> This patch fixes the below crash by making sure we touch the subpage =
protection
> related structures only if we know they are allocated on the platform. =
With
> radix translation we don't allocate hash context at all and trying to =
access
> subpage_prot_table results in
>=20
> Faulting instruction address: 0xc00000000008bdb4
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
PowerNV
> ....
> NIP [c00000000008bdb4] sys_subpage_prot+0x74/0x590
> LR [c00000000000b688] system_call+0x5c/0x70
> Call Trace:
> [c00020002c6b7d30] [c00020002c6b7d90] 0xc00020002c6b7d90 (unreliable)
> [c00020002c6b7e20] [c00000000000b688] system_call+0x5c/0x70
> Instruction dump:
> fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f821ff11 e92d1178 =
f9210068
> 39200000 e92d0968 ebe90630 e93f03e8 <eb891038> 60000000 3860fffe =
e9410068
>=20
> We also move the subpage_prot_table with mmp_sem held to avoid racec
> between two parallel subpage_prot syscall.
>=20
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> =E2=80=94

Thanks for the patch. Fixes the kernel crash.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com =
<mailto:sachinp@linux.vnet.ibm.com>>

Thanks
-Sachin=

--Apple-Mail=_24AB09EE-9C9E-4967-A38B-5570EE7B40A4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 30-Apr-2019, at 1:29 PM, Aneesh Kumar K.V &lt;<a =
href=3D"mailto:aneesh.kumar@linux.ibm.com" =
class=3D"">aneesh.kumar@linux.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">This =
patch fixes the below crash by making sure we touch the subpage =
protection<br class=3D"">related structures only if we know they are =
allocated on the platform. With<br class=3D"">radix translation we don't =
allocate hash context at all and trying to access<br =
class=3D"">subpage_prot_table results in<br class=3D""><br class=3D""> =
Faulting instruction address: 0xc00000000008bdb4<br class=3D""> Oops: =
Kernel access of bad area, sig: 11 [#1]<br class=3D""> LE PAGE_SIZE=3D64K =
MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D2048 NUMA PowerNV<br class=3D""> =
....<br class=3D""> NIP [c00000000008bdb4] =
sys_subpage_prot+0x74/0x590<br class=3D""> LR [c00000000000b688] =
system_call+0x5c/0x70<br class=3D""> Call Trace:<br class=3D""> =
[c00020002c6b7d30] [c00020002c6b7d90] 0xc00020002c6b7d90 (unreliable)<br =
class=3D""> [c00020002c6b7e20] [c00000000000b688] =
system_call+0x5c/0x70<br class=3D""> Instruction dump:<br class=3D""> =
fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f821ff11 e92d1178 =
f9210068<br class=3D""> 39200000 e92d0968 ebe90630 e93f03e8 =
&lt;eb891038&gt; 60000000 3860fffe e9410068<br class=3D""><br =
class=3D"">We also move the subpage_prot_table with mmp_sem held to =
avoid racec<br class=3D"">between two parallel subpage_prot syscall.<br =
class=3D""><br class=3D"">Reported-by: Sachin Sant &lt;<a =
href=3D"mailto:sachinp@linux.vnet.ibm.com" =
class=3D"">sachinp@linux.vnet.ibm.com</a>&gt;<br class=3D"">Signed-off-by:=
 Aneesh Kumar K.V &lt;<a href=3D"mailto:aneesh.kumar@linux.ibm.com" =
class=3D"">aneesh.kumar@linux.ibm.com</a>&gt;<br =
class=3D"">=E2=80=94</div></div></blockquote><div><br =
class=3D""></div>Thanks for the patch. Fixes the kernel =
crash.</div><div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D""><br class=3D""></span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Tested-by: Sachin Sant &lt;</span><a =
href=3D"mailto:sachinp@linux.vnet.ibm.com" =
class=3D"">sachinp@linux.vnet.ibm.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">&gt;</span></div><br =
class=3D""><div class=3D"">Thanks</div><div =
class=3D"">-Sachin</div></body></html>=

--Apple-Mail=_24AB09EE-9C9E-4967-A38B-5570EE7B40A4--

