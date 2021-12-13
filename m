Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E756A471F0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 01:48:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC2tg5xj0z3c7l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 11:48:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F8/JJF/C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F8/JJF/C; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC2sq4wNyz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 11:47:42 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BCLvUvs016229; 
 Mon, 13 Dec 2021 00:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zOt3Vw1U7V5T99tnwjAB0hqFcNcT+qcheJmHQjaOsDc=;
 b=F8/JJF/CMQkwYdXH2gOkspH9BGznTIlmEjk2tbDT3cNiGruZxPmgEZscKF4w97q2zlVS
 /iOWD8O48zgbDaTfQlAXVBOTmN6PffuB72Cd592G3Xs/tJNjARJIsLnWGpTQkt3ifdr9
 0qbdA3btRtclEt+RGPuEpfGFhbhMOuImS7Jz8/32qQnP0g2arS52oD97X1ML2/+bDGCI
 uqj4AKPrGwlwBNwJt7NDpIgwuv8PtKv5d+9/sktwcP4ZTcQV0XY9rfguTnrhc2eV5Lm7
 2sB/XNmMJiQu3O2mrxoN9jlk4lcx9Qu3GD/wRICTU2STJiO0rn2TfFstVmlEsuMlct4l 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cwsf0sxxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 00:47:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BD0h65K010409;
 Mon, 13 Dec 2021 00:47:02 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cwsf0sxx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 00:47:01 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BD0hleo005625;
 Mon, 13 Dec 2021 00:47:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 3cvkm9rffq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 00:47:00 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BD0kwtg25887224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 00:46:58 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1EDE124054;
 Mon, 13 Dec 2021 00:46:57 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14392124055;
 Mon, 13 Dec 2021 00:46:54 +0000 (GMT)
Received: from [9.211.121.29] (unknown [9.211.121.29])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Dec 2021 00:46:53 +0000 (GMT)
Message-ID: <17153a1c-86c6-6ffd-35d6-5329829661df@linux.vnet.ibm.com>
Date: Sun, 12 Dec 2021 19:46:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
Content-Language: en-US
To: Michal Suchanek <msuchanek@suse.de>, keyrings@vger.kernel.org
References: <cover.1637862358.git.msuchanek@suse.de>
 <8b30a3c6a4e845eb77f276298424811897efdebf.1637862358.git.msuchanek@suse.de>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <8b30a3c6a4e845eb77f276298424811897efdebf.1637862358.git.msuchanek@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YD7rJlLgYd2Udqtt5LalPdJn3WE0YgaV
X-Proofpoint-ORIG-GUID: gG1gdafl-3bV4bqCZbyCCQ71PQZVX-ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-12_10,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112130001
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
Cc: Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 linux-crypto@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/25/21 13:02, Michal Suchanek wrote:
> Copy the code from s390x
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>   arch/powerpc/Kconfig        | 11 +++++++++++
>   arch/powerpc/kexec/elf_64.c | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 47 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index ac0c515552fd..ecc1227a77f1 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -561,6 +561,17 @@ config KEXEC_FILE
>   config ARCH_HAS_KEXEC_PURGATORY
>   	def_bool KEXEC_FILE
>
> +config KEXEC_SIG
> +	bool "Verify kernel signature during kexec_file_load() syscall"
> +	depends on KEXEC_FILE && MODULE_SIG_FORMAT
> +	help
> +	  This option makes kernel signature verification mandatory for
> +	  the kexec_file_load() syscall.
> +

Resending my last response as looks like it didn't go through mailing 
list because of some wrong formatting. My apologies to those who are 
receiving it twice.

Since powerpc also supports IMA_ARCH_POLICY for kernel image signature 
verification, please include the following:

"An alternative implementation for the powerpc arch is IMA_ARCH_POLICY. 
It verifies the appended kernel image signature and additionally 
includes both the signed and unsigned file hashes in the IMA measurement 
list, extends the IMA PCR in the TPM, and prevents blacklisted binary 
kernel images from being kexec'd."

Thanks & Regards,

     - Nayna

