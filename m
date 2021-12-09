Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1853846F4CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 21:22:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J956d0f5Rz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 07:22:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ajFQghNV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ajFQghNV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8cVK40ZXz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 12:52:25 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B917EF7040520; 
 Thu, 9 Dec 2021 01:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=bw1YDElraH5+vrLm0yKXSejXAX5s5cx7YkI2B5erNLI=;
 b=ajFQghNVxPoLsAvPigx0SfXTRPHuZwk82Z1PRpI9q6Ehjm0c7ZrIGRbUtt7rMoTGRgpY
 UwyNc6auxeSKe+ePEGG+LD7c7HPgxVRZfqiqQMfZCS9jv+/etx5OROuRL3E3Z0HGSSGz
 Sz8SVZlnnVZQ55Vs69PxY7a5WZan5dXtnrTnKT4eG0dya62WIDFDFFV4NzhY60YFywiz
 bdOJN6JyG74S3HJ6JZWuAukLrG8ddR++94CbslQmYTWf4EfJxejon7kB3Z4VXpVWBkHX
 nJsIcIU2U62EULKwDbaRVYB0i+Zzv+jaso6N6VdT0X2uUVZzUFJdcKMO+JKBdXSpkBmM Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu79ch6gp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 01:51:56 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B91n0Gb015844;
 Thu, 9 Dec 2021 01:51:55 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu79ch6gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 01:51:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B91mOxP017461;
 Thu, 9 Dec 2021 01:51:54 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3cqyy8pcec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 01:51:54 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B91ppQG59572724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 01:51:52 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6467C6059;
 Thu,  9 Dec 2021 01:51:51 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14F4BC6062;
 Thu,  9 Dec 2021 01:51:48 +0000 (GMT)
Received: from [9.211.91.166] (unknown [9.211.91.166])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 01:51:47 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------OViyyZNJyOrQAWKf10RG1MuY"
Message-ID: <c3c9c6e4-6371-2f5a-ac94-fa4389d5dbe5@linux.vnet.ibm.com>
Date: Wed, 8 Dec 2021 20:51:47 -0500
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
X-Proofpoint-ORIG-GUID: 1GUUnJK-993swjSlL5jR01H-KVG4C8IV
X-Proofpoint-GUID: 2sVq7CBAXVw3GFhVk1cUlv_Q0nTosQCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_01,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090006
X-Mailman-Approved-At: Fri, 10 Dec 2021 07:21:22 +1100
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
--------------OViyyZNJyOrQAWKf10RG1MuY
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

After manually applying the patch, the build is failing with the 
following error:

build failed with error "arch/powerpc/kexec/elf_64.o: In function 
`elf64_verify_sig':
/root/kernel/linus/linux/arch/powerpc/kexec/elf_64.c:160: undefined 
reference to `verify_appended_signature'"

I see it happened because I didn't have MODULE_SIG enabled. Enabling 
MODULE_SIG fixes it.

I wonder why not to add "depends on MODULE_SIG" rather than on 
MODULE_SIG_FORMAT.

Thanks & Regards,

      - Nayna

--------------OViyyZNJyOrQAWKf10RG1MuY
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
+	depends on KEXEC_FILE &amp;&amp; MODULE_SIG_FORMAT</pre>
    </blockquote>
    <p>After manually applying the patch, the build is failing with the
      following error:</p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">build failed with error
        "arch/powerpc/kexec/elf_64.o: In function `elf64_verify_sig':</span><br
        style="box-sizing: inherit; color: rgb(29, 28, 29); font-family:
        Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style:
        normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial;">
      <span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">/root/kernel/linus/linux/arch/powerpc/kexec/elf_64.c:160:
        undefined reference to `verify_appended_signature'"</span></p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">I see it happened because I didn't
        have MODULE_SIG enabled. Enabling MODULE_SIG fixes it.<br>
      </span></p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">I wonder why not to add "depends on
        MODULE_SIG" rather than on MODULE_SIG_FORMAT.</span></p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">Thanks &amp; Regards,</span></p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">     - Nayna<br>
      </span></p>
  </body>
</html>
--------------OViyyZNJyOrQAWKf10RG1MuY--

