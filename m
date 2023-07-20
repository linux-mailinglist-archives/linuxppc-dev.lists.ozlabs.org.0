Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA575A978
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 10:41:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P2GNK895;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R65kQ57hNz3c3v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 18:41:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P2GNK895;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R65hb6tyhz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:39:27 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36K8aamG002477;
	Thu, 20 Jul 2023 08:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XyE0wZeAGqKmCYZo60RlVS/hpDrPyB7u8SJPnbo3YV0=;
 b=P2GNK895ekwmYkKoS9IIPxTA5dYzKn5pPO4hE4ggG6ngpFsyowryOU7UoeThI5mXeFFj
 CQfic85uWy0gTJN+0ya3QW17YcCsjBCj+Xm6OWyf2rcgbr8/qx+h2Hac6rng2DaMTvRP
 oNB3nlWyNbeXrBa2O/gx0j9VHk1yCSRKTQATMXHovE2R2B6zWL4srkbcDGj4DGO0WgDd
 IF+QoXfJM9cr0VkA76c3lBVz3Ee40O1e89vhGjNW52NMTnbKh16QrWA4Lxf8OivD8gwA
 /Kr+t9Wst77HX+r7wvZcpGdedmok5awF/kUJSIZKddXzU5QMbwL3FbYYmCRKKsHr4+Xq Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ry0fhhpgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:39:21 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36K8b7pW005944;
	Thu, 20 Jul 2023 08:39:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ry0fhhpfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:39:21 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36K81YEa004510;
	Thu, 20 Jul 2023 08:39:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv80jbfp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:39:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36K8dHV223003890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jul 2023 08:39:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1659D20040;
	Thu, 20 Jul 2023 08:39:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD5A02004B;
	Thu, 20 Jul 2023 08:39:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.238])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Jul 2023 08:39:15 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: Kernel Crash Dump (kdump) broken with 6.5
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc@umt35y2hmslm>
Date: Thu, 20 Jul 2023 14:09:04 +0530
Message-Id: <517DCD2F-33AA-454F-B3FE-CC4B3AD83C99@linux.ibm.com>
References: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
 <udbe6orsg6jpzkwppupzekfwxjvn7e5q3rlzyqvm4xl3k44w7t@e7m2zjjwmh5c>
 <87wmyxich0.fsf@mail.lhotse>
 <2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc@umt35y2hmslm>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, ajd@linux.ibm.com
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PY86CmQrfF7QP5CMtuFWUKOBOVElt_es
X-Proofpoint-ORIG-GUID: SESfGy4APLScVRa7ht5CAFnTrdyZ5SlR
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_02,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200070
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 19-Jul-2023, at 11:33 PM, Mahesh J Salgaonkar <mahesh@linux.ibm.com> w=
rote:
>=20
> On 2023-07-18 23:19:23 Tue, Michael Ellerman wrote:
>> Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:
>>> On 2023-07-17 20:15:53 Mon, Sachin Sant wrote:
>>>> Kdump seems to be broken with 6.5 for ppc64le.
>>>>=20
>>>> [ 14.200412] systemd[1]: Starting dracut pre-pivot and cleanup hook...
>>>> [[0;32m OK [0m] Started dracut pre-pivot and cleanup hook.
>>>> Starting Kdump Vmcore Save Service...
>>>> [ 14.231669] systemd[1]: Started dracut pre-pivot and cleanup hook.
>>>> [ 14.231801] systemd[1]: Starting Kdump Vmcore Save Service...
>>>> [ 14.341035] kdump.sh[297]: kdump: saving to /sysroot//var/crash//127.=
0.0.1-2023-07-14-13:32:34/
>>>> [ 14.350053] EXT4-fs (sda2): re-mounted e971a335-1ef8-4295-ab4e-3940f2=
8e53fc r/w. Quota mode: none.
>>>> [ 14.345979] kdump.sh[297]: kdump: saving vmcore-dmesg.txt to /sysroot=
//var/crash//127.0.0.1-2023-07-14-13:32:34/
>>>> [ 14.348742] kdump.sh[331]: Cannot open /proc/vmcore: No such file or =
directory
>>>> [ 14.348845] kdump.sh[297]: kdump: saving vmcore-dmesg.txt failed
>>>> [ 14.349014] kdump.sh[297]: kdump: saving vmcore
>>>> [ 14.443422] kdump.sh[332]: open_dump_memory: Can't open the dump memo=
ry(/proc/vmcore). No such file or directory
>>>> [ 14.456413] kdump.sh[332]: makedumpfile Failed.
>>>> [ 14.456662] kdump.sh[297]: kdump: saving vmcore failed, _exitcode:1
>>>> [ 14.456822] kdump.sh[297]: kdump: saving the /run/initramfs/kexec-dme=
sg.log to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
>>>> [ 14.487002] kdump.sh[297]: kdump: saving vmcore failed
>>>> [[0;1;31mFAILED[0m] Failed to start Kdump Vmcore Save Service.
>>>=20
>>> Thanks Sachin for catching this.
>>>=20
>>>>=20
>>>> 6.4 was good. Git bisect points to following patch
>>>>=20
>>>> commit 606787fed7268feb256957872586370b56af697a
>>>>    powerpc/64s: Remove support for ELFv1 little endian userspace
>>>>=20
>>>> Reverting this patch allows a successful capture of vmcore.
>>>>=20
>>>> Does this change require any corresponding change to kdump
>>>> and/or kexec tools?
>>>=20
>>> Need to investigate that. It looks like vmcore_elf64_check_arch(&ehdr)
>>> check from fs/proc/vmcore.c is failing after above commit.
>>>=20
>>> static int __init parse_crash_elf64_headers(void)
>>> {
>>> [...]
>>>=20
>>>        /* Do some basic Verification. */
>>>        if (memcmp(ehdr.e_ident, ELFMAG, SELFMAG) !=3D 0 ||
>>>                (ehdr.e_type !=3D ET_CORE) ||
>>>                !vmcore_elf64_check_arch(&ehdr) ||
>>> [...]
>>=20
>> Where vmcore_elf64_check_arch() calls elf_check_arch(), which was
>> modified by the commit, so that makes sense.
>>=20
>>> It looks like ehdr->e_flags are not set properly while generating vmcore
>>> ELF header. I see that in kexec_file_load, ehdr->e_flags left set to 0
>>> irrespective of IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) is true or false.
>>=20
>> Does initialising it in crash_prepare_elf64_headers() fix the issue?
>=20
> Yes, the bellow change fixes the issue. Can't use
> IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2)i check in common code. I see that
> fs/proc/kcore.c uses ELF_CORE_EFLAGS to set e_flags. Will send out
> formal patch.
>=20
> From 2d12fe7dff5dfe9035a75b1fe8d7da7da3000b90 Mon Sep 17 00:00:00 2001
> From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Date: Wed, 19 Jul 2023 20:36:37 +0530
> Subject: [PATCH] kdump fix
>=20
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---

Thanks Mahesh for the fix. With this patch applied I am able to capture kdu=
mp.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

I also see that Andrew has posted a patch [0] to revert commit 606787fed726

If the said commit is reverted, do we still need this change?

- Sachin

[0] https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-July/260928.html

