Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB83D9C8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 06:22:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZy6l6XLnz3cQK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 14:22:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GJzzg3zw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GJzzg3zw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZy6D5Z0zz3029
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 14:21:56 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16T4FEtZ182812; Thu, 29 Jul 2021 00:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lhTVW3t0lTF5kza0RELN9IffV7THs5vCoJtihBxvY3w=;
 b=GJzzg3zwiEa86QHC6SaV8sCDIKmHuyJntUFheqCQd74yNm+fsSZR/BWlUhDB+cUo762t
 GtNvpdTtxsnrgJOvyG0ZXWtim0ub84I3gz1cto8zKp+BhlhQ06tiTty3f62/N7MND2du
 e2RYiTdRV5hVbCwLKCj0gwtxoK04kgXvX/8di0wlf9M8kZ0N2UlymFDyvMo7gFflGjwG
 h6ZthjWZoWP6SxypOGh2A7R6GtgntNemWim28v1WN87cKKnWEBUPZE8gIhgLyTvrfOcS
 bJCUZNzGOC131DlyDGY87vEFWmlqyr2odiemd4bhyK6W4Z2rWp53fcnSQQ5cK+2etZRY Bg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a3n4y8483-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 00:21:45 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16T4D5kg007046;
 Thu, 29 Jul 2021 04:21:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3a235khen5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 04:21:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16T4LffY25559496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 04:21:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 029BEA405B;
 Thu, 29 Jul 2021 04:21:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22762A4062;
 Thu, 29 Jul 2021 04:21:38 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.126.126])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Jul 2021 04:21:37 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
Date: Thu, 29 Jul 2021 09:51:36 +0530
Message-Id: <63F21E55-B11E-4B30-B436-C063C405D9C5@linux.vnet.ibm.com>
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
 <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TmBeoEqtp6gufjRfjgGV6pBLwHd7ZQEp
X-Proofpoint-ORIG-GUID: TmBeoEqtp6gufjRfjgGV6pBLwHd7ZQEp
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-29_03:2021-07-27,
 2021-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1011 mlxlogscore=768 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290024
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, linux-next@vger.kernel.org,
 Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28-Jul-2021, at 11:05 PM, Nathan Chancellor <nathan@kernel.org> wrote:
>=20
> On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
>> linux-next fails to boot on Power server (POWER8/POWER9). Following trac=
es
>> are seen during boot
>>=20
>> [    0.010799] software IO TLB: tearing down default memory pool
>> [    0.010805] ------------[ cut here ]------------
>> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>> [    0.010812] Oops: Exception in kernel mode, sig: 5 [#1]
=E2=80=A6=E2=80=A6.
>=20
> I noticed this with OpenSUSE's ppc64le config [1] and my bisect landed on
> commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). That

Indeed. Thanks Nathan.
Bisect points to this commit.  Reverting the commit allows the kernel to bo=
ot.

Thanks
-Sachin

> series just keeps on giving... Adding some people from that thread to
> this one. Original thread:
> https://lore.kernel.org/r/1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet=
.ibm.com/
>=20
> [1]: https://github.com/openSUSE/kernel-source/raw/master/config/ppc64le/=
default
>=20
> Cheers,
> Nathan

