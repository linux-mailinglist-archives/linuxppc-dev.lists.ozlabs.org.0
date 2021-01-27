Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1069C30636A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 19:33:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQsgH3MTgzDr3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 05:33:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pMY3qJP1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQsdG6T55zDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 05:31:46 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RIIFMQ127397; Wed, 27 Jan 2021 13:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0LKHr5v3hROqaK5l4fkaEuF6NRO7FgoKzNFbFlIsLZQ=;
 b=pMY3qJP1iMK0+3+1HdvDBFHeiqQBupsm/gi+FpadnqjCOQL+Z4lg4sVzUDEoocY/kaw0
 qBlx6BixfHTxDOt83FVF9ZSdx15R9kyXFrH7Dh7BQdyJgcvwxX4E9K5fmUQ8jkoRSB34
 nrYKHIfBXsxFBtPeNJStqOh7vLjJr4ixFw8T7CkdH8G6j7rfgvib+QjSmXOwgoOdn3Cc
 lJVCbctwT2OQ8vI4qLC+D3F6yhfleJmfTOeqL0UUZKbY5B9zes5XPtpgXrqP8ydn0JPA
 MX6UPzMS8Avsm7DFgoPRxbmyErvw2iFy7ZNOvGt+7n5IomJWH8SbJtLHG5F20AphPXJo Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b4cr28y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 13:31:14 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10RIJogT134457;
 Wed, 27 Jan 2021 13:31:14 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b4cr28ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 13:31:13 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RIKLJ1011340;
 Wed, 27 Jan 2021 18:31:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 368b2ha44r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 18:31:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RIV8iF46006614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 18:31:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9781A42047;
 Wed, 27 Jan 2021 18:31:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D820942041;
 Wed, 27 Jan 2021 18:31:02 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.15.120])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 18:31:02 +0000 (GMT)
Message-ID: <6343ab2eec390ab7582beea04f8006af095850c8.camel@linux.ibm.com>
Subject: Re: [PATCH v15 10/10] arm64: Add IMA log information in kimage used
 for kexec
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Will Deacon
 <will@kernel.org>
Date: Wed, 27 Jan 2021 13:31:02 -0500
In-Reply-To: <8a573f84-732a-3591-8751-f7b08edaa01d@linux.microsoft.com>
References: <20210115173017.30617-1-nramas@linux.microsoft.com>
 <20210115173017.30617-11-nramas@linux.microsoft.com>
 <20210127165424.GB358@willie-the-truck>
 <dec23eb8-0b27-3227-d1ef-f759338a7f9f@linux.microsoft.com>
 <20210127180230.GA593@willie-the-truck>
 <8a573f84-732a-3591-8751-f7b08edaa01d@linux.microsoft.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_06:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270090
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, robh@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, prsriva@linux.microsoft.com, hsinyi@chromium.org,
 allison@lohutok.net, christophe.leroy@c-s.fr, mbrugger@suse.com,
 balajib@linux.microsoft.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, dmitry.kasatkin@gmail.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-01-27 at 10:24 -0800, Lakshmi Ramasubramanian wrote:
> On 1/27/21 10:02 AM, Will Deacon wrote:
> > On Wed, Jan 27, 2021 at 09:56:53AM -0800, Lakshmi Ramasubramanian wrote:
> >> On 1/27/21 8:54 AM, Will Deacon wrote:
> >>> On Fri, Jan 15, 2021 at 09:30:17AM -0800, Lakshmi Ramasubramanian wrote:
> >>>> Address and size of the buffer containing the IMA measurement log need
> >>>> to be passed from the current kernel to the next kernel on kexec.
> >>>>
> >>>> Add address and size fields to "struct kimage_arch" for ARM64 platform
> >>>> to hold the address and size of the IMA measurement log buffer.
> >>>>
> >>>> Update CONFIG_KEXEC_FILE to select CONFIG_HAVE_IMA_KEXEC, if CONFIG_IMA
> >>>> is enabled, to indicate that the IMA measurement log information is
> >>>> present in the device tree for ARM64.
> >>>>
> >>>> Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> >>>> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> >>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> >>>> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> >>>> ---
> >>>>    arch/arm64/Kconfig             | 1 +
> >>>>    arch/arm64/include/asm/kexec.h | 5 +++++
> >>>>    2 files changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >>>> index 1d466addb078..ea7f7fe3dccd 100644
> >>>> --- a/arch/arm64/Kconfig
> >>>> +++ b/arch/arm64/Kconfig
> >>>> @@ -1094,6 +1094,7 @@ config KEXEC
> >>>>    config KEXEC_FILE
> >>>>    	bool "kexec file based system call"
> >>>>    	select KEXEC_CORE
> >>>> +	select HAVE_IMA_KEXEC if IMA
> >>>>    	help
> >>>>    	  This is new version of kexec system call. This system call is
> >>>>    	  file based and takes file descriptors as system call argument
> >>>> diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
> >>>> index d24b527e8c00..2bd19ccb6c43 100644
> >>>> --- a/arch/arm64/include/asm/kexec.h
> >>>> +++ b/arch/arm64/include/asm/kexec.h
> >>>> @@ -100,6 +100,11 @@ struct kimage_arch {
> >>>>    	void *elf_headers;
> >>>>    	unsigned long elf_headers_mem;
> >>>>    	unsigned long elf_headers_sz;
> >>>> +
> >>>> +#ifdef CONFIG_IMA_KEXEC
> >>>> +	phys_addr_t ima_buffer_addr;
> >>>> +	size_t ima_buffer_size;
> >>>> +#endif
> >>>
> >>> Why do these need to be in the arch structure instead of 'struct kimage'?
> >>>
> >>
> >> Currently, only powerpc and, with this patch set, arm64 have support for
> >> carrying forward IMA measurement list across kexec system call. The above
> >> fields are used for tracking IMA measurement list.
> >>
> >> Do you see a reason to move these fields to "struct kimage"?
> > 
> > If they're gated on CONFIG_IMA_KEXEC, then it seems harmless for them to
> > be added to the shared structure. Or are you saying that there are
> > architectures which have CONFIG_IMA_KEXEC but do not want these fields?
> > 
> 
> As far as I know, there are no other architectures that define 
> CONFIG_IMA_KEXEC, but do not use these fields.

Yes, CONFIG_IMA_KEXEC enables "carrying the IMA measurement list across
a soft boot".   The only arch that currently carries the IMA
measurement across kexec is powerpc.

Mimi

