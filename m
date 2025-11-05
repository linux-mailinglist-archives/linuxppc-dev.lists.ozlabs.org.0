Return-Path: <linuxppc-dev+bounces-13787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B7C34C5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 10:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1fx435Jnz30Qk;
	Wed,  5 Nov 2025 20:22:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762334552;
	cv=none; b=eh/GqRgB8dDi2NCZ1aln5WaEgrxcoliwDVjaffpaMRVbF9YY+7S6nC4GP08sWUxcb/TrjgdGNtAImMXbtT3AFhqjbax2lZKjFxcZ0GhC1zJiiAr1mjk7RXr3S7jDMuJPMDPeccKFndvQY/pP4GhVa0var/awSW/aA2du1mb4JddX1UEwSWGXvcrPKNXJMWopDu3Xrods4zM80tpnpJMYzVC82Rti+b3atunaFrePYYBqelXOIeZPXTUpcCGj28YECLDcldKRDKmSQrfxQQjQLPsfYgi9jMWmGe+g+bqE0Mx1x1AWZIzIaQO57nYklZ76n6ZV8+CTpD/LhDp56jTx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762334552; c=relaxed/relaxed;
	bh=oCaa744/yx6Gsm/RozBFAn6s5R65rM23DqxrRNPJW44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGT0R0YM47Wm+a9F/hIcs+7peyGfBczGbqIO5fT5bmkKV7YlKU7Q0BY0UDColGrdWswHT6On5GzlxSbAHAWjRRtBKM/2P6JVKFnjR5NfYhQScJYRfEBXM6Tv6lXPDBPHhUkfxsRJVZWe3ovgPqReRk/6caz4MSUK5qiyhDdSOhUmBAtVdVwRFL1Lr5UVGcVcKuNQJr9B+W3EhE8GIdNG0B+zJuXkRhKs/WwWqov2ekt6NnYX6BcJpgNc/e9ZQMBG/qFJvLdf5X7TAkydFfkgU1tIQ6nQozB6FrWHfeHzJ5N6UV3W83VAiI3GoQ++bd2Mw3RVyjmDs6JSCyIxSLtEAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eRH98J6F; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eRH98J6F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1fx31RWQz2yjp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 20:22:30 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A55udU4007542;
	Wed, 5 Nov 2025 09:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oCaa74
	4/yx6Gsm/RozBFAn6s5R65rM23DqxrRNPJW44=; b=eRH98J6FH91A4UZTTLgcPV
	WvAtl+xZp6NDo6wrxaVOB3jSxqwF7KroIzhlfuFQRovDNlp2WOVH5480nZlCUQ73
	ilygzTTL3hSo1sFDIsIA3DSaG/QWqKf2PYq9aceO6aMfhbppKJnM7bYxlMjbLfB5
	GKIsXV4gJrqEFKPcb094QeHi7Ro3FiwUJ0knt3AUnVpQG3/IWlrWAu8DxAgzokGQ
	ieECzr7AwZOkxGynvqMWByzv7WeL+Ri5dUt+miqOPYLwqAfvSCB3Y2SeF6d7jF/D
	h8FBg4B/PHsqt7W0Fb0MDn/Boq/Gv2IPAiU/4PNpoKMF5mxkAc/Ovcrd8EyDm/oQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vugcmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 09:22:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A599D0r012923;
	Wed, 5 Nov 2025 09:22:25 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y81y1md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 09:22:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A59M9XO30016136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 09:22:10 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B9D658059;
	Wed,  5 Nov 2025 09:22:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90A5D58055;
	Wed,  5 Nov 2025 09:22:19 +0000 (GMT)
Received: from [9.98.109.80] (unknown [9.98.109.80])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Nov 2025 09:22:19 +0000 (GMT)
Message-ID: <2ab4297c-b4b5-4eb2-8389-cd9fe29d7bc3@linux.ibm.com>
Date: Wed, 5 Nov 2025 14:52:18 +0530
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
To: Nathan Chancellor <nathan@kernel.org>, Omar Sandoval <osandov@osandov.com>
Cc: Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, dimitri.ledkov@surgut.co.uk,
        stable@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
        Alexey Gladkov <legion@kernel.org>, linux-debuggers@vger.kernel.org
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <20251105005603.GA769905@ax162>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20251105005603.GA769905@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ya8hwmud08LkMknuqq7GXmfR9YS6A8zH
X-Proofpoint-GUID: ya8hwmud08LkMknuqq7GXmfR9YS6A8zH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX6CR4MZ02sUer
 1aMpOY+rDbjWAsp6mrqRyT1PA8iB9yf0U0FnlwHJTI3D5/cuqU2sRjXHhKQzDTgEAhoPmIIOor9
 9jx5Yz2a9CJAcEBfklG5csj+5SfUA5PO/S3EPueuP44a1rA51YDtRprp9vBK9z1d3NE4tgPKtT9
 5E6JIIIPPQPvjIH94TvteBCNq27cW50JWBqCuW+RrGQ6wTM43CyxVZniu3Qfzx7xA3ZSaEmrFtT
 dNdZnVymY7aXQbm/PFHEuJFS3Nuq/HzhUE7l3QcmQFqCWt/RlckYwvA56ymMu2mmJYc/s93eTzw
 mnthn+kAwgjGF2fpi6w11/Os26xa6qUxoF94xYtdxwvverDCSY2ejYxeaX1+nTrs4kHuC3PAAVw
 FUMK1/AM5A68U2gUtOxinxOiBTKW+w==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=690b1752 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=WG_6xDmpAAAA:8 a=s5HezVcRJVFevGRlhjIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vnvZt3YqmSlbJLwVaSfU:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 05/11/25 6:26 am, Nathan Chancellor wrote:
> + Nicolas and Alexey, just as an FYI.
>
> Top of thread is:
>
> https://lore.kernel.org/7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com/
>
> On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
>> IBM CI has also reported this error.
>>
>>
>> Error:
>>
>>
>> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
>> prefix
>>    INSTALL /boot
>> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
>> prefix
>> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
>> prefix
>>
>>
>> Git bisect is pointing to below commit as first bad commit.
>>
>>
>> d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
>> commit d50f21091358b2b29dc06c2061106cdb0f030d03
>> Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
>> Date:   Sun Oct 26 20:21:00 2025 +0000
>>
>>      kbuild: align modinfo section for Secureboot Authenticode EDK2 compat
> Thank you for the bisect. I can reproduce this with at least kmod 29.1,
> which is the version I can see failing in drgn's CI from Ubuntu Jammy
> (but I did not see it with kmod 34, which is the latest version in Arch
> Linux at the moment).
>
> Could you and Omar verify if the following diff resolves the error for
> you? I think this would allow us to keep Dimitri's fix for the
> Authenticode EDK2 calculation (i.e., the alignment) while keeping kmod
> happy. builtin.modules.modinfo is the same after this diff as it was
> before Dimitri's change for me.
>
> Cheers,
> Nathan
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index ced4379550d7..c3f135350d7e 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -102,11 +102,23 @@ vmlinux: vmlinux.unstripped FORCE
>   # modules.builtin.modinfo
>   # ---------------------------------------------------------------------------
>   
> +# .modinfo in vmlinux is aligned to 8 bytes for compatibility with tools that
> +# expect sufficiently aligned sections but the additional NULL bytes used for
> +# padding to satisfy this requirement break certain versions of kmod with
> +#
> +#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
> +#
> +# Strip the trailing padding bytes after extracting the .modinfo sections to
> +# comply with what kmod expects to parse.
> +quiet_cmd_modules_builtin_modinfo = GEN     $@
> +      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> +                                    sed -i 's/\x00\+$$/\x00/g' $@
> +
>   OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
>   
>   targets += modules.builtin.modinfo
>   modules.builtin.modinfo: vmlinux.unstripped FORCE
> -	$(call if_changed,objcopy)
> +	$(call if_changed,modules_builtin_modinfo)
>   
>   # modules.builtin
>   # ---------------------------------------------------------------------------
>

This change fixes the reported issue. You can add below tag as well, 
while sending a patch.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



