Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E184046C064
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 17:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7lhS59jFz3cbd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 03:13:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IqOO63c+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IQrTlaEU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=prudo@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=IqOO63c+; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IQrTlaEU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7lgm3H2kz3cT4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 03:12:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638893553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q14zqMaClWT6A6pjsZ9r/kKotJ2Nm5bDx7Gi7LWBtyI=;
 b=IqOO63c+UeBs4n9CIPOc0XJTSyjWi29q0t62rcSerIRryeybwoUW9pms+FwA0EKqcxEeSo
 XofFK9oxlaBeJHrpDaz4T7QHMKCvH7SmsvIfLkENhiPkaJ/BBuNVQPzBTm1ezDk3M8fiyl
 92U9mLeg66DizquDJV88c6JFUDAXHS8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638893554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q14zqMaClWT6A6pjsZ9r/kKotJ2Nm5bDx7Gi7LWBtyI=;
 b=IQrTlaEUGK7u059C12mSvvd0rYaPT0XWdHuBNGoBkTUfoQbZ/yU7qEB/lzAiMbVXwC4xgt
 /nkEta6jQQxZb6GA0yEZvMmI3fs2uh+9quDFh+l6P1T6QDC/w6ZVPZ+tYcRZvvlqlNX1KC
 iUfJczXYt2bTkZlWmSduCPLVl/QTm0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-BdX3DYBpO-KAjRBFDzmJRA-1; Tue, 07 Dec 2021 11:11:25 -0500
X-MC-Unique: BdX3DYBpO-KAjRBFDzmJRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 106B31006AA2;
 Tue,  7 Dec 2021 16:11:21 +0000 (UTC)
Received: from rhtmp (unknown [10.39.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0F241972E;
 Tue,  7 Dec 2021 16:11:14 +0000 (UTC)
Date: Tue, 7 Dec 2021 17:11:12 +0100
From: Philipp Rudo <prudo@redhat.com>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH v2 4/6] module: strip the signature marker in the
 verification function.
Message-ID: <20211207171112.03850036@rhtmp>
In-Reply-To: <0f9bbbc4800d5329485b6bdabbbe1ef3b2169b02.1637862358.git.msuchanek@suse.de>
References: <cover.1637862358.git.msuchanek@suse.de>
 <0f9bbbc4800d5329485b6bdabbbe1ef3b2169b02.1637862358.git.msuchanek@suse.de>
Organization: Red Hat inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-crypto@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Frank van der Linden <fllinden@amazon.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, linux-security-module@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Thu, 25 Nov 2021 19:02:42 +0100
Michal Suchanek <msuchanek@suse.de> wrote:

> It is stripped by each caller separately.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/kexec/elf_64.c           |  9 ---------
>  arch/s390/kernel/machine_kexec_file.c |  9 ---------
>  kernel/module.c                       |  7 +------
>  kernel/module_signing.c               | 12 ++++++++++--

kernel/module_signing.c is only compiled with MODULE_SIG enabled but
KEXEC_SIG only selects MODULE_SIG_FORMAT. In the unlikely case that
KEXEC_SIG is enabled but MODULE_SIG isn't this causes a build breakage.
So you need to update KEXEC_SIG to select MODULE_SIG instead of
MODULE_SIG_FORMAT for s390 and ppc.

Thanks
Philipp

>  4 files changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 266cb26d3ca0..63634c95265d 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -156,15 +156,6 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  int elf64_verify_sig(const char *kernel, unsigned long length)
>  {
>  	size_t kernel_len = length;
> -	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
> -
> -	if (marker_len > kernel_len)
> -		return -EKEYREJECTED;
> -
> -	if (memcmp(kernel + kernel_len - marker_len, MODULE_SIG_STRING,
> -		   marker_len))
> -		return -EKEYREJECTED;
> -	kernel_len -= marker_len;
>  
>  	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
>  					"kexec_file");
> diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
> index 432797249db3..c4632c1a1b59 100644
> --- a/arch/s390/kernel/machine_kexec_file.c
> +++ b/arch/s390/kernel/machine_kexec_file.c
> @@ -27,20 +27,11 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
>  int s390_verify_sig(const char *kernel, unsigned long length)
>  {
>  	size_t kernel_len = length;
> -	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
>  
>  	/* Skip signature verification when not secure IPLed. */
>  	if (!ipl_secure_flag)
>  		return 0;
>  
> -	if (marker_len > kernel_len)
> -		return -EKEYREJECTED;
> -
> -	if (memcmp(kernel + kernel_len - marker_len, MODULE_SIG_STRING,
> -		   marker_len))
> -		return -EKEYREJECTED;
> -	kernel_len -= marker_len;
> -
>  	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
>  					"kexec_file");
>  }
> diff --git a/kernel/module.c b/kernel/module.c
> index 8481933dfa92..d91ca0f93a40 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2882,7 +2882,6 @@ static inline void kmemleak_load_module(const struct module *mod,
>  static int module_sig_check(struct load_info *info, int flags)
>  {
>  	int err = -ENODATA;
> -	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
>  	const char *reason;
>  	const void *mod = info->hdr;
>  
> @@ -2890,11 +2889,7 @@ static int module_sig_check(struct load_info *info, int flags)
>  	 * Require flags == 0, as a module with version information
>  	 * removed is no longer the module that was signed
>  	 */
> -	if (flags == 0 &&
> -	    info->len > markerlen &&
> -	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) == 0) {
> -		/* We truncate the module to discard the signature */
> -		info->len -= markerlen;
> +	if (flags == 0) {
>  		err = verify_appended_signature(mod, &info->len,
>  						VERIFY_USE_SECONDARY_KEYRING, "module");
>  		if (!err) {
> diff --git a/kernel/module_signing.c b/kernel/module_signing.c
> index f492e410564d..4c28cb55275f 100644
> --- a/kernel/module_signing.c
> +++ b/kernel/module_signing.c
> @@ -15,8 +15,7 @@
>  #include "module-internal.h"
>  
>  /**
> - * verify_appended_signature - Verify the signature on a module with the
> - * signature marker stripped.
> + * verify_appended_signature - Verify the signature on a module
>   * @data: The data to be verified
>   * @len: Size of @data.
>   * @trusted_keys: Keyring to use for verification
> @@ -25,12 +24,21 @@
>  int verify_appended_signature(const void *data, size_t *len,
>  			      struct key *trusted_keys, const char *what)
>  {
> +	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
>  	struct module_signature ms;
>  	size_t sig_len, modlen = *len;
>  	int ret;
>  
>  	pr_devel("==>%s(,%zu)\n", __func__, modlen);  
>  
> +	if (markerlen > modlen)
> +		return -ENODATA;
> +
> +	if (memcmp(data + modlen - markerlen, MODULE_SIG_STRING,
> +		   markerlen))
> +		return -ENODATA;
> +	modlen -= markerlen;
> +
>  	if (modlen <= sizeof(ms))
>  		return -EBADMSG;
>  

