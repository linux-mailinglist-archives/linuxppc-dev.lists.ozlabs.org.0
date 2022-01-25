Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F249BCD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 21:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjymr31Qxz3c7f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 07:16:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hiazood1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=hiazood1; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjym73j3Rz30Q8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 07:16:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IbFB6DTJJ4iMyawf6GaaHr11tjdCfEphnSRzGKo+FKs=; b=hiazood1qkVjV1i29ykJOnWMCG
 pdtGgjfRr96hOK0waryYHqV7CuQ/60g6frDloZA/2zMXXtSSQKnuSTghjdm71KfQj+e/sDTIZCFy3
 9J4RUJMLlw0WDKwiygF+M5IkUWO7f/G+k5Xdcb5vVJlyxSzHEWqFhleKyd5OJsv4RoQMiLKGVuufL
 bCa6XqV+LdXruqudaZhXBJCpikPUHa0HuJfLOSqtAj0qqKnz5Xr7nQGgFiNC+u1JgvdPXuR5lqruO
 Cz9ifdazAA6u/1kbSK6EbkCepDMfDq0vsfcCDZbup3nuIOB8WuAbcvUtjGhMHuzBNhACRfOpBdfOw
 qOUzk6lQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nCSEO-009T8k-2u; Tue, 25 Jan 2022 20:15:56 +0000
Date: Tue, 25 Jan 2022 12:15:56 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>,
	David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v5 3/6] kexec_file: Don't opencode appended signature
 verification.
Message-ID: <YfBafIXgnLzf0QMb@bombadil.infradead.org>
References: <cover.1641900831.git.msuchanek@suse.de>
 <7834eb187ef67cd88fc67f10e831130e3717d776.1641900831.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7834eb187ef67cd88fc67f10e831130e3717d776.1641900831.git.msuchanek@suse.de>
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
 Sven Schnelle <svens@linux.ibm.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
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

On Tue, Jan 11, 2022 at 12:37:45PM +0100, Michal Suchanek wrote:
> diff --git a/include/linux/verification.h b/include/linux/verification.h
> index a655923335ae..32db9287a7b0 100644
> --- a/include/linux/verification.h
> +++ b/include/linux/verification.h
> @@ -60,5 +60,8 @@ extern int verify_pefile_signature(const void *pebuf, unsigned pelen,
>  				   enum key_being_used_for usage);
>  #endif
>  
> +int verify_appended_signature(const void *data, unsigned long *len,
> +			      struct key *trusted_keys, const char *what);
> +

Looks very non-module specific.

> diff --git a/kernel/module_signing.c b/kernel/module_signing.c
> index 8723ae70ea1f..30149969f21f 100644
> --- a/kernel/module_signing.c
> +++ b/kernel/module_signing.c
> @@ -14,32 +14,38 @@
>  #include <crypto/public_key.h>
>  #include "module-internal.h"
>  
> -/*
> - * Verify the signature on a module.
> +/**
> + * verify_appended_signature - Verify the signature on a module with the
> + * signature marker stripped.
> + * @data: The data to be verified
> + * @len: Size of @data.
> + * @trusted_keys: Keyring to use for verification
> + * @what: Informational string for log messages
>   */
> -int mod_verify_sig(const void *mod, struct load_info *info)
> +int verify_appended_signature(const void *data, unsigned long *len,
> +			      struct key *trusted_keys, const char *what)
>  {
> -	struct module_signature ms;
> -	size_t sig_len, modlen = info->len;
> +	struct module_signature *ms;

There goes the abstraction, so why not make this clear where we re-use
the struct module_signature for various things and call it as it is,
verify_mod_appended_signature() or some such?

David? Any preference?

Other than that:

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
