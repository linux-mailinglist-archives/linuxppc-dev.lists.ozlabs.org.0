Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE265471E85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 00:03:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Xz62q9z3f4j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 10:02:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ETF9jKtG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ETF9jKtG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBPNh0Wlcz2xsZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 10:38:43 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BBNE0GQ005429; 
 Sat, 11 Dec 2021 23:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=8bc2M3gNYRDx+CctIv/D//nNdeJiOUba1qesd6QPvtU=;
 b=ETF9jKtGtXPS0DhMEvxl4INvmp88CjH01oCvWPMDshlDcDv0GdPhHg7ULnelPZNZq8Iw
 AwUNM9PXFVNiR6lzwZflCDqBnkvuBcRy9EphxYQG4/cJrG8U4pFjIrGnI8iXnjJiDQ8h
 cunDW+p400uRXWFuilGy+/mx/JpCNz47QRPnuRT7Z81VZT9NDJHvEaAU7GiZ5cSGBlsf
 xR5uxGxorwMbqEXPs4sCtqzbOEHKOdz+KvH3cPDfr7BfbbJvxvW52FdCMMtI9CQq+Edc
 IFwuGdEzjLhZQ2V6n8Yn0ZtMeMXGh5gcqVkhfz8uKk8T3Ou68TtzG22mb7ZB2k5YptFT aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cw5fu871v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Dec 2021 23:38:06 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BBNc5Z8000340;
 Sat, 11 Dec 2021 23:38:05 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cw5fu871m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Dec 2021 23:38:05 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BBNWWqw031051;
 Sat, 11 Dec 2021 23:38:04 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3cvkm8ug22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Dec 2021 23:38:04 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BBNc2qe25428360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 11 Dec 2021 23:38:02 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FFEDB2066;
 Sat, 11 Dec 2021 23:38:02 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD2E7B2067;
 Sat, 11 Dec 2021 23:37:57 +0000 (GMT)
Received: from [9.211.63.5] (unknown [9.211.63.5])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 11 Dec 2021 23:37:57 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------BkCI85ljeBxCSg0XgT0RrAju"
Message-ID: <bd7e0273-375c-2d67-72b4-d157bac76b42@linux.vnet.ibm.com>
Date: Sat, 11 Dec 2021 18:37:57 -0500
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
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yyEMWk4V3Y6kTSKaP0866gPjTPm_aGjD
X-Proofpoint-GUID: pVjzNIUh4HQqp1FjvEc7J_NfGtrUkl4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-11_10,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112110136
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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

This is a multi-part message in MIME format.
--------------BkCI85ljeBxCSg0XgT0RrAju
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/25/21 13:02, Michal Suchanek wrote:
> Copy the code from s390x
>
> Signed-off-by: Michal Suchanek<msuchanek@suse.de>
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

Since powerpc also supports IMA_ARCH_POLICY for kernel image signature 
verification, please include the following:

"An alternative implementation for the powerpc arch is 
IMA_ARCH_POLICY. It verifies the appended kernel image signature and 
additionally includes both the signed and unsigned file hashes in the 
IMA measurement list, extends the IMA PCR in the TPM, and prevents 
blacklisted binary kernel images from being kexec'd"

Thanks & Regards,

     - Nayna

--------------BkCI85ljeBxCSg0XgT0RrAju
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/25/21 13:02, Michal Suchanek
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:8b30a3c6a4e845eb77f276298424811897efdebf.1637862358.git.msuchanek@suse.de">
      <pre class="moz-quote-pre" wrap="">Copy the code from s390x

Signed-off-by: Michal Suchanek <a class="moz-txt-link-rfc2396E" href="mailto:msuchanek@suse.de">&lt;msuchanek@suse.de&gt;</a>
---
 arch/powerpc/Kconfig        | 11 +++++++++++
 arch/powerpc/kexec/elf_64.c | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ac0c515552fd..ecc1227a77f1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -561,6 +561,17 @@ config KEXEC_FILE
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE

+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on KEXEC_FILE &amp;&amp; MODULE_SIG_FORMAT
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+</pre>
    </blockquote>
    <p>Since powerpc also supports IMA_ARCH_POLICY for kernel image
      signature verification, please include the following:<br>
    </p>
    <p>"<span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">An alternative implementation for the
        powerpc arch is IMA_ARCH_POLICY. It verifies the appended kernel
        image signature and additionally includes both the signed and
        unsigned file hashes in the IMA measurement list, extends the
        IMA PCR in the TPM, and prevents blacklisted binary kernel
        images from being kexec'd"</span></p>
    <p>Thanks &amp; Regards,</p>
    <p>    - Nayna<br>
    </p>
  </body>
</html>
--------------BkCI85ljeBxCSg0XgT0RrAju--

