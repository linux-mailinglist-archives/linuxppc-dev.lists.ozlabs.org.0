Return-Path: <linuxppc-dev+bounces-13732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D6C30B6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 12:24:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d15hf6931z3bfM;
	Tue,  4 Nov 2025 22:24:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762255490;
	cv=none; b=QJ26Kyr0KnVu1NyVkRXT0I3LAujhD22q1FmNB/Uftsybdk5DHXc/vdaz37cQV9Qir2jc9qgdBkGnlOSET3o6/er8JcFlV9maVt0OLIFFPoem+r3HI1OlDXMqfctLCK0CPseN7H4W2IJ9yBoxnqtYR+3z/NVnyvVEaIpesAS1OF34ZIiHBW4qaUikMwF+MlXLz6lySQdLe3J8q2t/veQ7aUaPH7KL9Ge+q6MgFDsuyHJCzWt5eJRwzIuvUry6naHDkB0eIw2MJA96ig+IOR2qtVoXC4pIVvO4raAtJsLkzeuB5LefF8iVPO9m/f8+PXIzY+YNZFuACkTaEtjHPTvFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762255490; c=relaxed/relaxed;
	bh=seaE6FhghR7fv2Dv8o+PZ8LTcSRYnVGDjIamqipTMTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hcFrijGfuvOHPBedpeGuXCaq2mmdSIkR73DR+6+P6RpLyRfNFR/3vS161Ux32hUExu3NCg9b8rfPb+3JSI1e01gaOH4CRTFmfjyDnWaHpNEJz3T4rLEGeaaGpVLZj8Q4BrNBWXm4t8atkqcVT/sI4pqLtqrsEaJnLmMGXAxbaYgO6MN5uSOSXmEhtt7r9AnlOVmlolSLihwEX1fsPCLKK00AteidLWXdsx6QCI9vzCldBOTeInNxmf7rrhCisNAkrFpFcnfu48cKbZVfmcsVGXPsXy1Dy6woGqoNdPK5tRksEBWIXYuCkbmA3s4TxjSPDLmg+sG0pV/zD7RJJNOs4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ec9AeCon; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ec9AeCon;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d15hd51Nvz304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 22:24:49 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A42bVfY000802;
	Tue, 4 Nov 2025 11:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=seaE6F
	hghR7fv2Dv8o+PZ8LTcSRYnVGDjIamqipTMTU=; b=ec9AeConec9k1b09w5amYU
	JFv6+Y/KWyE3/2HH+kadeQB/jZ6DFAcK/+3k1FE3IUhXPDovpCkNDTwmyNIdLHQr
	hRP8jrM7GYgu/BmREBWE5Cxx/yOZzXkL4IrnvbhLNepSWAaGNkGEWGws3/qs1m5Q
	VylpHW4bie0w2LNgFx3wk/Yy4V+DYwb0vg4HCWzrkXVWxHKWzTocartEIYYr31Tf
	gdW71dydRZhAvZPsCfhAGYkvYEPOFLOM+uys46phfPvraj0Rw1AEOjuqiYGivbz3
	+fo3ZlAwd1ER1etYcQCHPw7SUm4hsPgruVcXvD9BRH62JJ1HVilfVIWszz3N201g
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59q8umxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:24:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4B0Cc1009877;
	Tue, 4 Nov 2025 11:24:44 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kanjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:24:44 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A4BOhQ333686220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Nov 2025 11:24:43 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34CDF58058;
	Tue,  4 Nov 2025 11:24:43 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04ED558057;
	Tue,  4 Nov 2025 11:24:40 +0000 (GMT)
Received: from [9.61.241.11] (unknown [9.61.241.11])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Nov 2025 11:24:39 +0000 (GMT)
Message-ID: <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
Date: Tue, 4 Nov 2025 16:54:38 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mainline]Error while running make modules_install command
Content-Language: en-GB
To: Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, nathan@kernel.org,
        dimitri.ledkov@surgut.co.uk, stable@vger.kernel.org
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=StmdKfO0 c=1 sm=1 tr=0 ts=6909e27d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=WG_6xDmpAAAA:8 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=YERNkyx8TXSLzj1xzs0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=vnvZt3YqmSlbJLwVaSfU:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=poXaRoVlC6wW9_mwW8W4:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=HhbK4dLum7pmb74im6QT:22 a=p-dnK0njbqwfn1k4-x12:22 a=jjky5lfK57Ii_Ajn6BuG:22
X-Proofpoint-ORIG-GUID: f80xjLA0N57Pfk6qylBFyXiTekapi543
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAxOCBTYWx0ZWRfX3qiCJGBVDI3B
 QBgGAtYltJm5KqqnOtRyjE30vlexvfkyKV//p41ubAvqcXzXX6iQUnTGhrKr4gtv8Mj0ZR5jI25
 AQfC7Tte3d6aZ77we//tqFWr4tl2TvrNdTyeN830Z9Pghfj1wCkXfe2bGp/RpPRWroOYZRN+Cfu
 yM2kMTPR00stEkzHrCfPdp8fLW/egaIdANnhscvTW0DQleBPBnDSW0XcZRl+29Q2f1P+FmlMKNg
 HjUGhTeuw4WS+Na7IicitWfvDDmtXKGsqBs8of+o/fTvS+NRoTjuiG9te9YJjDWqv2qOP8GYX1r
 90/aQcq4qUJ3BMTeABVJkhOcGJPSKmjl1k2T4501VE7FifaudLTq12VExDTC6gIQ+KoHCoQBh6z
 ZwCbThTg3HVfACh7YAoCtPIgbstwFg==
X-Proofpoint-GUID: f80xjLA0N57Pfk6qylBFyXiTekapi543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 04/11/25 4:47 pm, Samir M wrote:
> Hello,
>
>
> I am observing below error while running the make modules_install 
> command on latest mainline kernel on IBM Power11 server.
>
>
> Error:
> DEPMOD  /lib/modules/6.18.0-rc4 depmod: ERROR: kmod_builtin_iter_next: 
> unexpected string without modname prefix
>

IBM CI has also reported this error.


Error:


depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname 
prefix
   INSTALL /boot
depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname 
prefix
depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname 
prefix


Git bisect is pointing to below commit as first bad commit.


d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
commit d50f21091358b2b29dc06c2061106cdb0f030d03
Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
Date:   Sun Oct 26 20:21:00 2025 +0000

     kbuild: align modinfo section for Secureboot Authenticode EDK2 compat

     Previously linker scripts would always generate vmlinuz that has 
sections
     aligned. And thus padded (correct Authenticode calculation) and 
unpadded
     calculation would be same. As in https://github.com/rhboot/pesign 
userspace
     tool would produce the same authenticode digest for both of the 
following
     commands:

         pesign --padding --hash --in ./arch/x86_64/boot/bzImage
         pesign --nopadding --hash --in ./arch/x86_64/boot/bzImage

     The commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
     vmlinux.unstripped") added .modinfo section of variable length. 
Depending
     on kernel configuration it may or may not be aligned.

     All userspace signing tooling correctly pads such section to 
calculation
     spec compliant authenticode digest.

     However, if bzImage is not further processed and is attempted to be 
loaded
     directly by EDK2 firmware, it calculates unpadded Authenticode 
digest and
     fails to correct accept/reject such kernel builds even when propoer
     Authenticode values are enrolled in db/dbx. One can say EDK2 requires
     aligned/padded kernels in Secureboot.

     Thus add ALIGN(8) to the .modinfo section, to esure kernels 
irrespective of
     modinfo contents can be loaded by all existing EDK2 firmware builds.

     Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in 
vmlinux.unstripped")
     Cc: stable@vger.kernel.org
     Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
     Link: 
https://patch.msgid.link/20251026202100.679989-1-dimitri.ledkov@surgut.co.uk
     Signed-off-by: Nathan Chancellor <nathan@kernel.org>

  include/asm-generic/vmlinux.lds.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)


Git Bisect log:


git bisect log
git bisect start
# status: waiting for both good and bad commits
# bad: [c9cfc122f03711a5124b4aafab3211cf4d35a2ac] Merge tag 
'for-6.18-rc4-tag' of 
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
git bisect bad c9cfc122f03711a5124b4aafab3211cf4d35a2ac
# status: waiting for good commit(s), bad commit known
# good: [dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa] Linux 6.18-rc3
git bisect good dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
# good: [3ad81aa52085a7e67edfa4bc8f518e5962196bb3] Merge tag 'v6.18-p4' 
of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
git bisect good 3ad81aa52085a7e67edfa4bc8f518e5962196bb3
# good: [f414f9fd68797182f8de4e1cd9855b6b28abde99] Merge tag 
'pci-v6.18-fixes-4' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
git bisect good f414f9fd68797182f8de4e1cd9855b6b28abde99
# good: [41dacb39fe79cd2fce42d31fa6658d926489a548] Merge tag 
'drm-xe-fixes-2025-10-30' of 
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
git bisect good 41dacb39fe79cd2fce42d31fa6658d926489a548
# bad: [f9bc8e0912b8f6b1d60608a715a1da575670e038] Merge tag 
'perf-urgent-2025-11-01' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad f9bc8e0912b8f6b1d60608a715a1da575670e038
# good: [c44b4b9eeb71f5b0b617abf6fd66d1ef0aab6200] objtool: Fix 
skip_alt_group() for non-alternative STAC/CLAC
git bisect good c44b4b9eeb71f5b0b617abf6fd66d1ef0aab6200
# bad: [cb7f9fc3725a11447a4af69dfe8d648e4320acdc] Merge tag 
'kbuild-fixes-6.18-2' of 
git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux
git bisect bad cb7f9fc3725a11447a4af69dfe8d648e4320acdc
# bad: [d50f21091358b2b29dc06c2061106cdb0f030d03] kbuild: align modinfo 
section for Secureboot Authenticode EDK2 compat
git bisect bad d50f21091358b2b29dc06c2061106cdb0f030d03
# good: [5ff90d427ef841fa48608d0c19a81c48d6126d46] kbuild: 
install-extmod-build: Fix when given dir outside the build dir
git bisect good 5ff90d427ef841fa48608d0c19a81c48d6126d46
# first bad commit: [d50f21091358b2b29dc06c2061106cdb0f030d03] kbuild: 
align modinfo section for Secureboot Authenticode EDK2 compat


Please add below tag as well, if you happen to fix this.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.

>
> If you happen to fix the above issue, then please add below tag.
> Reported-by: Samir M <samir@linux.ibm.com>
>
>
> Regards,
> Samir.
>
>

