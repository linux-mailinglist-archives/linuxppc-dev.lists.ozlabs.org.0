Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 230EF4B3FE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:01:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxprt5DVjz3cCs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:01:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FzKxvrVo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FzKxvrVo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxpr74qYWz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 14:00:39 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E0vod3020461; 
 Mon, 14 Feb 2022 03:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=r2BbXLjMEKqcO4K44sN1Gmq3mSVYuMaEX6htwmCbwKQ=;
 b=FzKxvrVo46Ic+1oTo5O0LSnJjNmNU0anGwK+OMeJ1iEzzkPFa+YW0QOE8SClW4lEUJSp
 POSCD6HCPICxpVYs1j5UZ4B3eGBoGzqilCIK2iOUze42ldsF1TR08AVWt9qCPj4eXO94
 FxoTEnZlI9/tcJDHIVawFxBXtm7wai8rsnl4uW8V3t4df3o2OMbr0gGsdRbLP1tmPbm0
 9lbZ7xkx4ATcPsrdIdrZ7k4j77VcFHpQ7B0/alMJbSva87yapUruIQnGQlDBmYLA+9Rw
 2zn78xgEg6InGWPeSSbBTqCLlLnZrPwai+kzoJizV6Dzn6Lw0/1x/TF/OHV2aqM+WtqJ kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7d0j9q6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 03:00:12 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21E2wX4s031336;
 Mon, 14 Feb 2022 03:00:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7d0j9q5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 03:00:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E2vhO9001974;
 Mon, 14 Feb 2022 03:00:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645j8y3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 03:00:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21E302P326870176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 03:00:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D167AAE055;
 Mon, 14 Feb 2022 03:00:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 598F6AE045;
 Mon, 14 Feb 2022 02:59:58 +0000 (GMT)
Received: from sig-9-65-82-84.ibm.com (unknown [9.65.82.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 02:59:58 +0000 (GMT)
Message-ID: <cff97dbe262919ff709a5ad2c4af6a702cc72a95.camel@linux.ibm.com>
Subject: Re: [PATCH v5 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Sun, 13 Feb 2022 21:59:57 -0500
In-Reply-To: <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
References: <cover.1641900831.git.msuchanek@suse.de>
 <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4jFqhY0qCIvizxCmPiEO2fRRpmUYxZuY
X-Proofpoint-GUID: dsEowZUA2zzhFinigDUJkPWd12uW6-s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=946
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140016
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Tue, 2022-01-11 at 12:37 +0100, Michal Suchanek wrote:
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index dea74d7717c0..1cde9b6c5987 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -560,6 +560,22 @@ config KEXEC_FILE
>  config ARCH_HAS_KEXEC_PURGATORY
>         def_bool KEXEC_FILE
>  
> +config KEXEC_SIG
> +       bool "Verify kernel signature during kexec_file_load() syscall"
> +       depends on KEXEC_FILE && MODULE_SIG_FORMAT
> +       help
> +         This option makes kernel signature verification mandatory for
> +         the kexec_file_load() syscall.

When KEXEC_SIG is enabled on other architectures, IMA does not define a
kexec 'appraise' policy rule.  Refer to the policy rules in
security/ima/ima_efi.c.  Similarly the kexec 'appraise' policy rule in
arch/powerpc/kernel/ima_policy.c should not be defined.

-- 
thanks,

Mimi

