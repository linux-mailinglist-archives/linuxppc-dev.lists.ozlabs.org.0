Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8649BC7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 20:51:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjyCv4w7jz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 06:51:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VELGeg2h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=VELGeg2h; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjyC63kBKz30N9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 06:50:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XnOpHOntQOg5wjymzDOHXiPanYFDFvY26sbX++O0fnA=; b=VELGeg2hS4JKT8txctMPaShzdT
 ZaTFITxIlYbm2Uj12Qxez0OYx7e1MYq2UoZXodMrCxvGeygRgn7gKfoteE1diO3iyBZJ8KUdAXnkd
 eVAkqTeoOFrGj3sLsiX9+iWSotgN5NABPqUvVZLsX7KpOqjNgZ/+r6lfu3muAyMmARu6UsZ4kKGJk
 IUwfX9k2+58not7Pl+Jj6UBm1ZuLWYel2TbXXc/qQqvVDrr1tJEXuVK2i/LQlI0eoA+KQtMZLL+rc
 82XvPYvLKUvHncE/yTFMR8MgTBVyT8p5PPrgBmYj2GxjTIvZFopD3jmNjkMNdUZk2hHBKLycT/68x
 dZlX6Vag==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nCRpw-009QFo-M3; Tue, 25 Jan 2022 19:50:40 +0000
Date: Tue, 25 Jan 2022 11:50:40 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v4 1/6] s390/kexec_file: Don't opencode appended
 signature check.
Message-ID: <YfBUkIlvQc0U0ylo@bombadil.infradead.org>
References: <cover.1641822505.git.msuchanek@suse.de>
 <940cd6a0e88793060cdf5ddb7880c03564b38bdd.1641822505.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <940cd6a0e88793060cdf5ddb7880c03564b38bdd.1641822505.git.msuchanek@suse.de>
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
 Sven Schnelle <svens@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 10, 2022 at 02:49:53PM +0100, Michal Suchanek wrote:
> Module verification already implements appeded signature check.
> 
> Reuse it for kexec_file.
> 
> The kexec_file implementation uses EKEYREJECTED error in some cases when
> there is no key and the common implementation uses ENOPKG or EBADMSG
> instead.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> ---
> v3: Philipp Rudo <prudo@redhat.com>: Update the commit with note about
> change of return value
> ---
>  arch/s390/kernel/machine_kexec_file.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
> index 8f43575a4dd3..c944d71316c7 100644
> --- a/arch/s390/kernel/machine_kexec_file.c
> +++ b/arch/s390/kernel/machine_kexec_file.c
> @@ -31,6 +31,7 @@ int s390_verify_sig(const char *kernel, unsigned long kernel_len)
>  	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
>  	struct module_signature *ms;
>  	unsigned long sig_len;
> +	int ret;
>  
>  	/* Skip signature verification when not secure IPLed. */
>  	if (!ipl_secure_flag)
> @@ -45,25 +46,12 @@ int s390_verify_sig(const char *kernel, unsigned long kernel_len)
>  	kernel_len -= marker_len;
>  
>  	ms = (void *)kernel + kernel_len - sizeof(*ms);
> -	kernel_len -= sizeof(*ms);
> +	ret = mod_check_sig(ms, kernel_len, "kexec");
> +	if (ret)
> +		return ret;
>  
>  	sig_len = be32_to_cpu(ms->sig_len);
> -	if (sig_len >= kernel_len)
> -		return -EKEYREJECTED;

There is a small minor fix here, where by using mod_check_sig() now
decreased the kernel_len by the sizeof(*ms). It is minor though.

> -	kernel_len -= sig_len;
> -
> -	if (ms->id_type != PKEY_ID_PKCS7)
> -		return -EKEYREJECTED;

More importantly is the return value used here changes but given the
Ack by Heiko I suspect this if fine and does not break old userspace,
the only change here is the possible error value returned by the
kexec_file_load() system call.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

   Luis
