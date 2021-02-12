Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E5319822
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 02:59:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcGrQ1sWvzDwxT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 12:59:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dJtsM+oz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcGpj5tRSzDwg6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 12:57:33 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11C1VgM6115511; Thu, 11 Feb 2021 20:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=uQt06wHvOQrSmS8/kTsCEVHl0OCXE00ZjosONvWuENQ=;
 b=dJtsM+oz8PBlgKHWc9I6u7tB1tnk9fzYq9JG/7FB6YYz2hz3GMxWnfkl+CIU8GIQmpdv
 0wOpyeOK2Tb718DaqUeb/HJlioUtRvi+TcPJS7fukG1EDEgKNz7H/X6uULDl5Gw1pbsf
 JnUevV7AEWL1Ehw/NmYH+17/pO8oJK0I57dmUgRDKkZKlFLRMMB9x48f61kB6S2iEZnj
 QbJdpn5rAhs1bFIU5FXCCgCOWSL7M0vAeS2+MkYBqzFw0vhSfl7ZGuldh94bjuCvUTes
 uM9zPFQ4IT10PTBC8C877CwnHBjW8CZ2ogPfJycm9nEi3/QKyOVCwDKXqYHgoYCdJVxO Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36nft9ruj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 20:57:11 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11C1W83n117969;
 Thu, 11 Feb 2021 20:57:10 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36nft9rufw-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 20:57:10 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11C1ajOP007264;
 Fri, 12 Feb 2021 01:39:21 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 36hjra4bc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 01:39:21 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11C1dLvu42008886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 01:39:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1331112063;
 Fri, 12 Feb 2021 01:39:20 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0F12112064;
 Fri, 12 Feb 2021 01:39:13 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.204.73])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Feb 2021 01:39:13 +0000 (GMT)
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-3-nramas@linux.microsoft.com>
 <87k0reozwh.fsf@manicouagan.localdomain>
 <8a3aa3d2-2eba-549a-9970-a2b0fe3586c9@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup function
In-reply-to: <8a3aa3d2-2eba-549a-9970-a2b0fe3586c9@linux.microsoft.com>
Date: Thu, 11 Feb 2021 22:39:11 -0300
Message-ID: <87h7mioyio.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120002
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, robh@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> On 2/11/21 5:09 PM, Thiago Jung Bauermann wrote:
>> There's actually a complication that I just noticed and needs to be
>> addressed. More below.
>> 
>
> <...>
>
>>> +
>>> +/*
>>> + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
>>> + *
>>> + * @image:		kexec image being loaded.
>>> + * @initrd_load_addr:	Address where the next initrd will be loaded.
>>> + * @initrd_len:		Size of the next initrd, or 0 if there will be none.
>>> + * @cmdline:		Command line for the next kernel, or NULL if there will
>>> + *			be none.
>>> + *
>>> + * Return: fdt on success, or NULL errno on error.
>>> + */
>>> +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>>> +				   unsigned long initrd_load_addr,
>>> +				   unsigned long initrd_len,
>>> +				   const char *cmdline)
>>> +{
>>> +	void *fdt;
>>> +	int ret, chosen_node;
>>> +	const void *prop;
>>> +	unsigned long fdt_size;
>>> +
>>> +	fdt_size = fdt_totalsize(initial_boot_params) +
>>> +		   (cmdline ? strlen(cmdline) : 0) +
>>> +		   FDT_EXTRA_SPACE;
>> Just adding 4 KB to initial_boot_params won't be enough for crash
>> kernels on ppc64. The current powerpc code doubles the size of
>> initial_boot_params (which is normally larger than 4 KB) and even that
>> isn't enough. A patch was added to powerpc/next today which uses a more
>> precise (but arch-specific) formula:
>> https://lore.kernel.org/linuxppc-dev/161243826811.119001.14083048209224609814.stgit@hbathini/
>> So I believe we need a hook here where architectures can provide their
>> own specific calculation for the size of the fdt. Perhaps a weakly
>> defined function providing a default implementation which an
>> arch-specific file can override (a la arch_kexec_kernel_image_load())?
>> Then the powerpc specific hook would be the kexec_fdt_totalsize_ppc64()
>> function from the patch I linked above.
>> 
>
> Do you think it'd better to add "fdt_size" parameter to
> of_kexec_alloc_and_setup_fdt() so that the caller can provide the 
> desired FDT buffer size?

Yes, that is actually simpler and better than my idea. :-)

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
